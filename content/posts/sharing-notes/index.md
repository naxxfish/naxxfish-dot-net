---
title: 🗒 Sharing notes between Joplin users
author: naxxfish
type: posts
date: 2019-11-17T18:00:45+00:00
url: /sharing-notes-joplin
categories:
  - Personal
  - Technology
tags:
  - joplin

---

As I mentioned in a [previous post](/note-taking-apps-for-engineers-2019), I've decided to move to [Joplin](https://www.joplinapp.org/) for my note taking needs. One of the last features I was missing was the ability for me to share a note with other people - as I do with Google Keep at the moment. 

I'm not the only one missing this feature, [there's a thread on the forum](https://discourse.joplinapp.org/t/sharing-notes-or-notebooks/67/38) requesting this that's been open for a long time, and has a *lot* of views. So I decided to try and help develop it. 

<!--more-->

# 💬 The Requirement

A good place to start is by defining exactly what you want. Fundementally, I think the user-story goes something along the lines of:

> As a user of Joplin, I need to share the contents of a note with another user of Joplin, so that I can collaborate with them. 

And as a concrete use case:

> I have written down our excellent recipe for chilli con carne. I want to share it with my partner, so that they can add the ingredients to the shopping list easily. 

Another useful thing to call out is what's **not** in scope, that may come to mind. In this case, the following things are **not** in scope:

* Two-way sync
* Realtime collaboration

# 🔨 The Brute-force Solution

The least complex way of solving this is simple: email the note to each other. It works, but has some drawbacks...

* May be **unencrypted**
* It requires awkward **copy pasting**
* Some email clients may **mangle the Markdown syntax** with rich-text formatting
* **Updating** the document requires you to send it again. 

Another 'simple' solution might be to [use a pastebin](https://discourse.joplinapp.org/t/sharing-notes-or-notebooks/67/27). However...

* They're often **not encrypted**
* They not always be **accessible**
* It requires yet more **copy pasting**
* You are forced to **trust** the administrators with your data

There must be a better way.

# ⚙️ The Technical Context

Joplin's notes are stored in a local [SQLite](https://www.sqlite.org/index.html) database in each device. In order to sync this database with other devices, it exports this data (and settings) to files, which are uploaded to a central location (for example a [Nextcloud](https://nextcloud.com/) instance or [Dropbox](https://www.dropbox.com/)). On another device, these files are downloaded and then imported into it's own local SQLite database.  

Those sync files (residing on the central storage) can be optionally encrypted by enabling [End-to-End Encryption](https://joplinapp.org/e2ee/), so that they are encrypted in transit (between the device and central storage) and at rest (when on central storage). The data is generally *not* encrypted in the local SQLite database. When synchonisation begins, the contents of the database is exported to the sync files and encrypted at that point. 

Therefore, sending the sync files to another user is no good - unless they have the same Master Key as you, and want to share all of your settings too.  So, how does one share the notes? 

# 🔏 End-to-End-to-End Encryption

We would like the note to be encrypted on it's journey from the sender to the recipient, and we need to be able to send the recipient a key we don't mind them having (so, probably not our Master Key).  

```
                                                       
           Encrypt                   Decrypt           
        (sharing key)   ┌───────┐ (sharing key)        
              ┌────────▶│  ???  │────────┐             
              │         └───────┘        │             
              │                          ▼             
       ┌────────────┐             ┌────────────┐       
       │   Sender   │             │  Reciever  │       
       │   Joplin   │             │   Joplin   │       
       └────────────┘             └────────────┘       
  Decrypt     ▲                          │   Encrypt   
(master key   │                          │ (master key 
     A)       │                          │      B)     
              │                          ▼             
          ┌───────┐                  ┌───────┐         
          │ Sync  │                  │ Sync  │         
          │Backend│                  │Backend│         
          └───────┘                  └───────┘         
```

At the client, we've already decrypted the note (in order to view it). So we could encrypt it with a new key, then send the note to the recipient (with the new 'sharing' key), who can decrypt it, and place it in their own notebook.  

# 🚚 Sending the (encrypted) note to the recipient

Now we've encrypted it, we need to convey the note to the recipient in a way that's straightforward and honors the decentralised ethos of Joplin.  

Truly decentralised networks are, on the whole, non-existant on the public Internet.  Even Peer-to-Peer protocols need a prior knowledge of a central point to discover the rest of their peers (for example a [BitTorrent Tracker](https://en.wikipedia.org/wiki/BitTorrent_tracker) or a node in the [DHT](https://en.wikipedia.org/wiki/Mainline_DHT), or even [DNS](https://en.wikipedia.org/wiki/Domain_Name_System) entries). 

So there needs to be some location, accessible by both sender and recipient, that can store-and-forward an encrypted message. An easily deployable web-service might do the trick: thus, why I started [joplin-share-server](https://github.com/naxxfish/joplin-share-server).  It's got an endpoint to `POST` encrypted notes to, and one to `GET` them from. It doesn't store the encryption keys at all.  

The client side implementation would look something like this:

1. Encrypt the note with a key (for example, `abc123`). 
2. Make a request to `POST /note` to the web service with a JSON object containing the encrypted note, and the server issues it with a Note ID (say, `def456`).
3. Construct a URL using the Note ID, and append the key to the end using the anchor section (e.g. `http://share.joplinapp.org/note/def456#abc123`)
4. Send that URL to the recipient (via email, IM, etc.)
5. The recipient requests `GET /note/def456` to obtain the encrypted note.
6. The recipient then uses the key in the anchor section of the URL to decrypt the note.
7. The decrypted note is then stored in the recipient's notebook. 

In order for these URLs to open opened by Joplin instead of your browser, you'd need to register a protocol handler on the device. Joplin for desktop OSes is made using [Electron](https://electronjs.org/), and there is [a way of registering custom protocols with electron](https://glebbahmutov.com/blog/electron-app-with-custom-protocol/). The mobile apps are made with [React-Native](https://facebook.github.io/react-native/), and [there's a way of registering protocol schemes](https://www.npmjs.com/package/react-native-deep-link) there as well. 

# 🎚 Configuration

When you send a note, you would need to know the location of a share server to send the encrypted note to.  Recieving notes, you don't need any additional config as the location is the URL. 

So for senders, there would need to be a new configuration parameter called 'Share Server' to enter the location of a working share server.  

# 🖊 Updates

What if the sender makes a change to the note - how do we replicate those changes to the recipient? 

In the simple one-way sync case (remember, two-way sync is out of scope for the moment), the sender could `POST` new content to the same endpoint using the same Note ID, incrementing the version number.  The recipient could then poll the share server when they synchronise, and update their note if the version increments. 

Or, they could make a request to a [Server Sent Events](https://jasonbutz.info/2018/08/server-sent-events-with-node/) endpoint on the share server and wait for a notification that an update has been made to a note they are interested in. 

Two way sync is significantly more complex, as you need to handle situations one party makes conflicting edits to the other. The [Conclave project](https://conclave-team.github.io/conclave-site/) documentation demonstrates the complexity of this very well. 

# 🏗 The Server Architecture

Aside from making a HTTP REST API server, there are a few architectural considerations that are required. 

## 📦 Deployment
[joplin-share-server](https://github.com/naxxfish/joplin-share-server) is a [Node.JS](https://nodejs.org/en/) app, which uses express to serve a HTTP API. It has, for the moment, two methods - `POST` and `GET`. One lets you post a note, the other lets you get one. You can run it using the [joplin-share-server Docker image 🐳](https://hub.docker.com/repository/docker/naxxfish/joplin-share-server), so it should be easy for people to host on their own servers, but you can deploy it to services like [Heroku](https://www.heroku.com/) or [Firebase Cloud Run](https://firebase.google.com/docs/hosting/cloud-run) just as easily. 

## 🗄 Database Backend
It currently has a [PostgreSQL](https://www.postgresql.org/) backend, which is probably perfectly fine for the vast majority of users (NoSQL doesn't solve any problems that this app is likely to have...). 

## 🔐 Security
Given a service which will write stuff to a database for any anonymous user, this is kind of important.  Input is structure and format is validated before being commmitted to the database. Fields that are expected to be base64 encoded are verified that they are. The encrypted note data, however, is opaque to the server, so there's not a lot we can do with that. 

How do you prevent other people from updating your notes, if they get access to the note?  One way is to issue tokens for each note, which you need to use in order to access it. The sender is provided with these tokens when they create the note, but they are never transmitted again after that point. The sender is responsible for keeping those tokens with the note they are sharing, so that they retain the ability to make updates to the note later. If they loose them, they'll have to share the note again. 

The main risk is a [DoS](https://en.wikipedia.org/wiki/Denial-of-service_attack) attack where a malicious user simply creates thousands of (valid) notes, filling up the database. You can limit the risk of this by implementing [rate limiting](https://www.npmjs.com/package/express-rate-limit), and potentially block clients which generate an excessive number of requests temporarily - for example by using [express-blacklist](https://www.npmjs.com/package/express-blacklist) and [express-defend](https://www.npmjs.com/package/express-defend).  

And, of course, you will need to somehow ensure that notes eventually expire and are deleted when they are no longer needed.  That could be as simple as resetting a Time to Live field every time the note is accessed, so that notes that are still being used are retained, whilst ones which are not are not. 

# ❔ Conclusion

Quite a lot of stuff to do and consider, but worth doing to make a differentiating feature in an already awesome app!
