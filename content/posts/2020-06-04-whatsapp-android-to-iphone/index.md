---
title: "Pwnage While-U-Wait: Migrating WhatsApp messages between Android and iOS"
author: naxxfish
type: posts
date: 2020-06-04T22:21:09+00:00
url: /whatsapp-android-to-iphone
categories:
  - Technology
draft: false
---

Recently, I made the (somewhat contraversial) decision to move from Android to iOS.  And whilst for the most part this process has been polished to a high sheen by Apple, desperate to make the transition frictionless, there are a few notable gaps. 

One of those, is WhatsApp message history - which is not possible to port between OSes.  This missing feature has unintentionally spawned a plethora of questionable third party software solutions, and some even more questionable marketing techniques. 

In this post, I'm going to explore why the problem exists, why it's not easily solved, and the "opportunity" that these software providers are exploiting, and perhaps the people too.  

<!--more-->
# The Problem

On the whole, the process of migrating between OSes is fairly straightforward - your photos, contacts, email accounts, calendars can all be copied to your new device easily.  However, due to the way in which certain apps store their data on your device, and how they back it up - sometimes you may find that it's not possible to copy the data between devices easily. 

The general process of migrating data is in two steps: backup the old device, and restore to the new.  Lets have a look at how the two platforms handle backups.

## How WhatsApp handles backups on Android

WhatsApp on Android stores it's chat history in [app-specific data](https://developer.android.com/training/data-storage/app-specific) on the device - which is probably in `/data/app/com.whatsapp/` (exact path varies by OS version).  As app-specific data, it is only accessible to the WhatsApp app on that device.  This means that no other app on the Android device - not even one designed to migrate data betweren devices - should be able to access it.  Before version 2.11.431, it was possible to enable USB debugging and take a backup of these directories using the `adb` tool - but that ability has since been restricted in subsequent versions. 

Not being able to back up and restore your messages is inconvenient, and I suspect a very heavily requested feature.  Fortunately, Google has provided with apps on Android several methods to allow their app-specific data to be backed up to a user's Google account - the first being the [Android Backup Service](https://developer.android.com/guide/topics/data/keyvaluebackup), which can automatically perform this duty for you - you just have ensure that [allowBackup is set to true](https://developer.android.com/guide/topics/data/autobackup#EnablingAutoBackup) in your app's Mainfest.xml file, and a [BackupAgent](https://developer.android.com/reference/android/app/backup/BackupAgent), which collects the data to back backed up, before it hands it off to the Android Backup Service which does the rest - encrypting and uploading your data.  You can also choose to use [Auto Backup for apps](https://developer.android.com/guide/topics/data/autobackup) which lets you synchronise all of your app specific files with Google Drive without requiring any custom code in your app whatsoever.

However, these methods only allows you back up a small amount of data (5MB for Android Backup Service or 25MB for Auto Backup) of data per user - so pretty useless for backing up chat histories and images, videos and so on. For that purpose, WhatsApp uses [Google Drive API Application Specific Data](https://developers.google.com/drive/api/v3/appdata).  This allows an app to upload data to a user's Google Drive account in a special application specific folder - and use all of the storage space they have been allocated (most users have several GB available).  To do this, it needs to authenticate against your Google Drive account and Drive with a specific OAuth2 scope, `drive.appdata`, and using the installed app's signature, and the Android device's ID - authenticates itself to grant access to this special folder. This special application-specific folder which is hidden from the user in their Google Drive account. Only that specific app can access the files in that folder - not even the user who's account it is - unless they can obtain the relevant app signature and device ID! 

If a user wants to restore this data to a new device (i.e. and Android to Android migration), all that's required is to authorize the appropriate Google account on the new phone, and the app can then download the data again and restore it to the new device.  

## How WhatsApp handles backups on iOS

If enabled, [Backup on iOS](https://developer.apple.com/icloud/documentation/data-storage/index.html) backs up the entirity of an app's home directory to iCloud, automatically, every day over Wi-Fi.  As an app developer, you don't need to do anything to make this happen - it just does. There are a few folders which are excluded from this process - for example temporary files.  This will happen for all of the apps on the device, if it's enabled.  However, a user might not want to enable this across the board, and also iCloud only provides 5GB for free - you can [buy more space on iCloud](https://support.apple.com/en-gb/HT201318) - but many users may not want to do that.

So WhatsApp also provides the ability to backup to iCloud Drive individually by integrating their app with the [iCloud Drive](https://developer.apple.com/icloud/) service on iOS, without relying on the iOS Backup feature.  This is implemented by an [app creating an iCloud Container](https://developer.apple.com/library/archive/documentation/General/Conceptual/iCloudDesignGuide/Chapters/iCloudFundametals.html) which iOS then keeps synchronised with the iCloud servers (and other devices) on behalf of the app. 

After WhatsApp version 2.16.17, these backups are encrypted by WhatsApp by centrally generating an encryption key combining the Apple ID and phone number (and then sending this verification key to the device) - and [iCloud encrypts data at rest and in transit](https://support.apple.com/en-gb/HT202303).  Prior to this version, though, the backup files themselves in iCloud were not encrypted.

This is quite similar to the approach taken by the Android edition with the app, except using iCloud Drive instead of Google Drive. 

## Database format between platforms

The [WhatsApp database files](https://www.group-ib.com/blog/whatsapp_forensic_artifacts) being backed up, whilst both being SQLite databases on iOS and Android, don't have the same strucutre. In fact, they are wildly different.  And, indeed, why shouldn't they be? The clients on iOS and Android were likely developed entirely independently - the only part where cooperation is required is to ensure that they can exchange information correctly. What each client does with that information is up to them. 

This means that any method of transferring data between platforms is never going to be as simple as copying the database file over, or restoring from a backup made on another platform.  An [Extract, Transform and Load](https://en.wikipedia.org/wiki/Extract,_transform,_load) process would need to be performed on the data, to produce a database which works on the other platform.  This process would only ever happen when a user is moving between platforms. Backup and restore to the same platform wouldn't have this requirement (unless the database structure changed massively between versions - hopefully an infrequent occurrance).

## In summary, why can't it be done?

In order to backup data from an Android device, and restore it to an iOS device - you need to implement some new functionality within the WhatsApp client on iOS and Android:

 * Give each client the ability to export it's data in an encrypted, but platform agnostic, common format
 * Give each client the ability to import and decrypt these platform agnotic exports
 * Find a way of sharing this sensitive data between the two platforms.

Whilst it isn't technically impossible, it's sufficiently complex and benefits such a small number of users, it's hard for WhatsApp prioritise developing this. And, having been part of many projects where a data migration between two slightly different systems are involved, I can vouch for the fact finding common ground is a painful and draining process. 

Most users stick to their platform of choice (as an Android user of 12 years, I certainly have!). Realistically, how many users transition between Android and iOS on a weekly basis? A few hundred? A few thousand? Compared the the several billion active users, it's so small it's practically non-existant. 

## Where there's a will 

**There is no simple, user friendly way of migrating WhatsApp chat history from Android to iPhone, or the other way around** - using either OS, or WhatsApp itself.  

But, if you were to google "restore WhatsApp chat history from Android to iPhone" you will not doubt find many, many pages claiming to have the solution!  Many videos on YouTube claim to provide the solution to this very problem.  All for the low low price of $29.99 (or similar), to purchase a third party software utility. 

Are they for real? Quite possibly.

Are they legit? Perhaps ...

A tiny proportion of WhatsApp's user base encounters this problem.  But WhatsApp has over a billion users, and even if only 0.001% of them switch platforms in a month, that's still several thousand users with a problem - and a problem they are motivated to solve.  For an enterprising software maker, if you are able to solve that problem and then charge a few dollars for each user, you have a pretty decent revenue stream.  Providing your overheads are low, it's potentially quite profitable. 

Fundementally, the data you're interested in moving is mostly the same stuff, it's just in different places and called different things.  You just need to figure out how to shift it from one location to another. Unfortunately, all of the security on both platforms are trying to prevent you from being able access the data in the first place, or put the data where it needs to go. After all, you wouldn't just want anyone to have access to all your data, right?

In that case, we will need to circumvent that security. We need to undertake an attack on the user's source device to first recover the data from WhatsApp - decrypt it - then mangle the data into the format of the other platform - re-encrypt it - and then perform another attack on the target device to write the data back and fool the app into restoring it successfully.

Is this making you feel a bit nervous? Yeeaahhh...

## ~~Attack~~ Migration Vectors, Android to iPhone

For a local attack on your Android device, things are made much easier by enabling **USB debugging**. Android tries to make it difficult for non-developers to do this, but a motivated user who can follow instructions can quite easily manage it. Plug the device into a PC or Mac and we're away. This will allow you to make a backup of the app specific data container for WhatsApp.  After version 2.11.431 of WhatsApp `adb` backups exclude any user data. No problem - install a version prior to 2.11.431 first - it will use the same app-specific data folder - then do the backup. Sorted.  This is what this: [WhatsAppKeyDBExtract.sh](https://github.com/EliteAndroidApps/WhatsApp-Key-DB-Extractor/blob/master/WhatsAppKeyDBExtract.sh) script does (and some other stuff... don't run it if you don't understand it).  It even re-installs the original version back again afterwards! *(quality work and cleans up after themselves - ⭐️⭐️⭐️⭐️⭐️ on TrustPilot)*

If a local attack didn't work, you could also perform a similar attack on the Google Drive backup - although in this case you will need to obtain the device ID and app signature in order to gain access - it may also be nessecary to obtain a decryption key as well (although I can't verify this).  Most of the required data can be gathered via `adb` from the ~~victim's~~ user's device. Whilst you're at it you could authenticate yourself against their Google account too, just so you don't have to worry them with logging in. (Hm. I might just keep this auth token actually... might be useful).

Assuming you've managed to recover the data somehow, now you need to convert it and then insert it into the recieving device to make the app restore it. For Android, you could place the backup files in the relevant location and reinstall the app and hope that it restores the backup automatically. On iOS, you could auth against their iCloud account and pretend to be WhatsApp, and stash the database backup in it's iCloud container and again, hope that the app dutifully restores it. 


Lets be clear about what this means: the third party app has access to *all of the user's WhatsApp data, in plaintext*, as well as potentially *an authentication token to their iCloud and/or Google Drive accounts*.  

Not only that, we've got debugging enabled on the devices to perform this process, we could even sneakily install a couple rootkit apps and get remote control over the devices too.  Maybe something that randomly turns the camera on once every now and then and uploads a picture to our cloud server.  We're debugging the device, so we should be able to grant the permissions automatically without the user's knowlege. 


## Oh. Right. 
Yeah. 

It's not possible for this process to work, without massively compromising your OS's privacy controls, and granting access to the most sensitive of your sensitive data to unknown third parties you may not trust. In the same way you wouldn't hire a team of burglears to help you move house, using a third party app that exploits your devices to migrate your sensitive data is probably not the best idea.  

The solution certainly *looks* the part.  In fact I'd say that, at a glance, their UX might be better than some much more legit products on the market. Their websites are shiny and modern looking.  The trouble is - **being a good designer doesn't make you a good person**.  I know having perfectly kerned body text is aesthetically pleasing, but it's not an effective way of judging a companies' character. Or, at least, not that kind of character - *facepalm*

## #Content #NotSponsored #DefinitelySponsored

If you search YouTube - it seems like everyone is talking about these apps. Search for "whatsapp android to iphone" and you'll get a stream of videos that propose to solve the problem - as if they had come up with the solution themselves and are providing an "instructional video" showing users how to carry out the process. The titles are fairly formulaic - often in the format: "$N ways to Transfer Whatsapp Messages from Android to iPhone". 

No doubt, the YouTubers making these videos are either being paid to do them directly, or are hoping to use their affiliate links to sell software for users desperate for a solution to the problem. 

Some of these videos have a lot of views - one I found had over a million. How many of them are authentic is a question in of itself, but regardless, people are definitely seeing these videos.

Look at the comments and you'll see the same themes come up over and over. 

> this app isn't free. 1 hour of my time trying this, and just before transfer data to iphone it wants me to pay. Crap

> The software IS NOT free! This should be stated in the video.

> Bro it's not free it's asking for subscription of 36$

And so on.  These are *not* reputable vendors, and their marketing techniques are questionable at best. I wouldn't trust them with my sensitive data. 

## Eh, so they're a bit shady. But it gets the job done, right?

Well, maybe.

The exploits they run on your device won't always work.  In fact, I suspect several of them have been patched since each of these magic pieces of software have been released.  WhatsApp might change it's database schema, or how it issues encryption keys. Android might change how the backup service works, or the Google Drive integration in Play Store Services. 

There are any number of things that might cause these third party tools to stop working.  They are in an inherent state of instability - relying on 'functionality' that may at any moment be whipped out from underneath them and render them useless.  But at that point, they have your money so there's little incentive to fix their software for your benefit.  They might eventually fix it, if it gets so bad they can't sell any more copies. It's a game of cat and mouse they they only have limited motivation to win.

## But, how do I migrate my data if I can't use one of these third party solutions?

Unfortunately, as a user of this app, we must accept that it is **technically unfeasible** to solve this problem, unless the developer (Facebook) chooses to solve it.

I know this is unpopular - people have a belief that with technology anything is possible. But in this case, the risks massively outweigh the benefits.  

Whilst, yes, a team of burglears might well successfully move all your belongings from your old house to your new one - they may well have cut a copy of the front door key, fitted locks that they are able to remotely open, and installed survielance cameras in your shower - and you would never know, until it's too late.

Modern mobile OSes are designed to be secure.  They (should) only grant permissions to software that are required to be granted.  By using one of these tools, you are effectively giving an unknown third party full, unrestricted access to both your old device (and all of the data it contains), and your new device.  In fact, you're giving them with more access than *you yourself* would normally have. It would be easy for them to permenantly compromise your device, opening you up to identity theft, fraud, blackmail and many many other crimes in the future.  And the best part is that you *paid* them for the privilege. 

To be clear, I am not suggesting any specific software vendor which has published a tool like this *are* criminals - what I'm saying is that given the power you are granting them, you need to *REALLY* trust them. 

# Fine. What do you suggest then?

The absolute best you can do, is to archive your chat history to plain text files.  These cannot be imported back into WhatsApp, but at least you have a record to review at a later date if required.  

[WhatsApp has a FAQ on how to export chats](https://faq.whatsapp.com/android/chats/how-to-save-your-chat-history/) which is straightforward to follow. It's also possible to [export your chat history on WhatsApp iOS](https://faq.whatsapp.com/iphone/chats/how-to-back-up-to-icloud) (see "Export chat history"). You have to do this for every contact and group.  

I'll be honest, it's tedious - especially if you have a lot of contacts.  But once you've done this, you can share those chats (and associated media files) to the cloud storage provider of your choice (Dropbox, Google Drive, iCloud) or email it to yourself, save them on your device, whatever you want.  You'll have a plain text file containing the chat, with each line containing the timestamp, the sender and the message.  If you chose to, you will also have the media files from the chat sitting along side it - which will be mentioned in the text file by name.

It's not ideal, but at least you have your data.  

# How could this situation have been avoided?

The reason this cottage industry has sprung up is due to a user demand for a feature that the developer wasn't catering to. If WhatsApp implemented the functionality to migrate between platforms, this would have never happened. But committing to this functionality would have meant prioritising this development over other features that affects far more of it's users - like improvements to their privacy and security model. 

It's a difficult situation, and there's no obvious answer. 
