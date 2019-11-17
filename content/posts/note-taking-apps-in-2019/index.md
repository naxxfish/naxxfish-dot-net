---
title: Note-taking apps for Engineers in 2019
author: naxxfish
type: posts
date: 2019-11-17T17:30:45+00:00
url: /note-taking-apps-for-engineers-2019
categories:
  - Personal
  - Technology

---
Up until now, notes that I make for work and personal purposes are scattered across a bunch of different places in an un-searchable, un-maintainable, mess. I decided enough was enough and I should do something about it. 

I've been looking at what options are available for cross-platform notes, preferably that support [Markdown](https://www.markdownguide.org/) and are open-source.

<!--more-->

Currently my notes are spread around a bunch of places, for example:

 * macOS [Notes.app](https://support.apple.com/en-gb/guide/notes/welcome/mac), on both personal and work laptops
 * [Google Keep](https://www.google.com/keep/) notes on my phone
 * Miscelaneous [Trello](https://trello.com/) boards
 * [Dropbox Paper](https://www.dropbox.com/en_GB/paper)
 * Various [GitHub](github.com) repos
 * Emails to myself (*ugh, yes, I know...*)

Looking for a replacement, there were a lot of possibilities, and many geared towards developers/engineers. I suppose building a note-taking app is pretty well defined and something that pretty much anyone can make an effort on - the question is, who's taken the time to do it especially well? 

I'll go into a bit of detail about each one I've considered, and which I've decided to stick with (at least for now!).

## [Notable](https://notable.md/)

{{< figure src="notable.png" position="center" caption="Notable">}}

An app who's tagline is ...

> The Markdown-based note-taking app that doesn't suck.

... has got to be worth a go

It's got a nice UI, and is quite pleasant to use. It is a little light on features - and unfortunately there's no mobile app, which means I'd need to find an alternative for editing notes on my mobile.

Synchronisation has to be done outside of the app (for example synchronising the data directory or checking it into a git repository). The files are standard Markdown files. 

It looks promising - but not quite there for me just yet. 

## [Typora](https://www.typora.io/)

{{< figure src="typora.png" position="center" caption="Typora" >}}

Typora is an *extremely* minimal note taking app, with a very snazzy WYSIWYG editor that gives you a live preview of your text as you type it, in a feature they call 'live-preview'.

Again, there's [no mobile app](http://support.typora.io/Sync/) as of yet and sync happens outside of the app. 

Very polished looking, but not for me! 

## [Joplin](https://joplinapp.org/)

{{< figure style="background-color:#ffffff; padding:2em"  src="JoplinAllClients.jpg" position="center" caption="Joplin Note taking app">}}

From the website:

> Joplin is a free, open source note taking and to-do application, which can handle a large number of notes organised into notebooks. The notes are searchable, can be copied, tagged and modified either from the applications directly or from your own text editor. The notes are in Markdown format.

It ticks quite a lot of boxes almost immediately. Like many other applications I've looked at, and certainly the other two mentioned above, it doesn't handle sync on it's own and relies on another service to handle it for it.  However in this case, it directly supports [Nextcloud](https://nextcloud.com/), which is my choice of self-hosted file storage. 

The notes are in Markdown format - although the files it generates are not.  Each device has it's own database, and the synchronised file backend is used as a way to sync those databases. Which does mean, you cannot simply open the files it stores with an editor and expect to edit Markedown as usual - it has to be done through the app. 

Also, there's [mobile apps](https://joplinapp.org/#mobile-applications) (hurrah!) so I can access my notes and todos and search them in the same way on both the desktop and mobile.  

My main gripe is that it's rather tricky to share notes with another person - there's [a feature request for that](https://discourse.joplinapp.org/t/sharing-notes-or-notebooks/67) in the forums, though. 

## Conclusion

You may not be surprised that I've gone for [Joplin](https://joplinapp.org/) for my main note taking app.  It's using my [Nextcloud](https://nextcloud.com/) instance for sync between my [Macbook](https://support.apple.com/kb/sp715?locale=en_GB) and [Pixel 2](https://en.wikipedia.org/wiki/Pixel_2). 

I'm also hoping to help develop the sharing feature which allows two Joplin users to share notes with each other, and ideally edit them collaboratively - that feature would mean I have no reason to use another note-taking app. 

