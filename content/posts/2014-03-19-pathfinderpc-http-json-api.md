---
title: PathfinderPC HTTP JSON API
author: naxxfish
type: posts
date: 2014-03-19T00:30:45+00:00
url: /2014/03/19/pathfinderpc-http-json-api/
featured_image: /wp-content/uploads/2014/03/axia_xnodes_press.jpg
categories:
  - Technology
tags:
  - AoIP
  - broadcast
  - networking

---
I've been helping with the installation of a brand new Axia Livewire network at [CSR FM][1]. We've been using [PathfinderPC][2] to do all of the routing control.

It's all pretty clever stuff &mdash; but we wanted to be able to extract information from Pathfinder so that we could do handy things like find out which studio is on air, and use that information to show the right webcam on the website, or use it to add further information to our Now Playing data.  Pathfinder has a way of doing this &mdash; using Protocol Translators.  Basically, it's a TCP listener (or client, or Serial Port) which accepts and sends commands to a remote device.  The protocol is very well documented in the [manual][3], and is very flexible in what it lets you do.

But, it's a bit of a pain to connect to from, lets say, PHP &mdash; which isn't really well suited to doing socket operations.  Also, you'd want to cache the results somehow, lest poor Pathfinder get inundated by people looking at the webcam!

So I decided to make a little thingy that sits in between Pathfinder and the potentially unruly web apps on the other end.

Thus, [PFInterfaceWeb][4].  It exposes various data sources over HTTP &mdash; like a list of all source, destinations and current routes.  Also &mdash; and particularly usefully &mdash; memory slots!  This lets us query our Stack Event logic and work out who's on air, what mics are live&#8230;. etc etc.

Oh, also, it optionally can send messages to a STOMP compatible Message Queue server whenever a memory slot, or route, changes, or custom Protocol Translator commands are sent.

At some point, I'll make it monitor GPIO, and also Silence Detect events.

Hopefully, this will prove handy!

 [1]: http://www.csrfm.com/
 [2]: http://www.pathfinderpc.com
 [3]: http://www.pathfinderpc.com/PathFinderPCHelp.pdf
 [4]: https://www.npmjs.org/package/pfinterfaceweb