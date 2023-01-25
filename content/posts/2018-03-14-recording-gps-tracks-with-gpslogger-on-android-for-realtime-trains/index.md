---
title: 🗺️ Recording GPS Tracks with GPSlogger on Android for Realtime Trains 🚆
author: naxxfish
type: posts
date: 2018-03-14T22:04:24+00:00
url: /2018/03/14/recording-gps-tracks-with-gpslogger-on-android-for-realtime-trains/
tags:
  - railways
  - opendata

---
{{< figure src="20170918_171158.jpg" caption="A Class 800 test train set spotted at Paddington shortly before the launch of the Intercity 125 replacements in October 2017, operated by GWR and Virgin East Coast" >}}


As a long time user of [Realtimetrains.co.uk][2] (which is where you should go for all your real time train tracking needs in the UK), and someone with an appreciation of Open Rail Data (having [used it myself][3]), I jumped at the chance of helping their development.  They've put out an appeal to [record GPS tracks][4] of train services that you travel on with the link to the service on the application.

> A lot of the work behind the scenes performed by a small team involves maintaining data relating to train positioning and comparing this with the signalling system outputs we use. This is an entirely manual task involving one of us going out with a radio controlled watch and monitoring the passage of trains through stations and junctions. An area of recent interest for us has been attempting to compute this automatically using other known bits of information.
> 
> In order to validate this effort, we either have to do the manual task with a watch or collect a large dataset of GPS traces to compare against our dataset. The more data we have will allow us to improve the end product.

Which is awesome.  I wanted to contribute. I found a suitable app for Android called [GPSlogger][5] which seemed to fit the bill.  It has quite a few settings, so I thought I'd write a quick guide on what I've used to successfully generate a working track for a service.
<!--more-->
Wanting to make sure the data I produced was as useful and error free as possible, I asked [@Realtimetrains][6] for some guidance

<blockquote class="twitter-tweet" data-width="550" data-dnt="true">
  <p lang="en" dir="ltr">
    It does two checks, relating to distances between points. First is that the median distance between point in your file is less than 250m apart, second is that the 90% percentile point is less than 250m. Some of the stuff we're checking against them requires a fair whack of points
  </p>
  
  <p>
    &mdash; Realtime Trains (@realtimetrains) <a href="https://twitter.com/realtimetrains/status/973913998209974272?ref_src=twsrc%5Etfw">March 14, 2018</a>
  </p>
</blockquote>


<blockquote class="twitter-tweet" data-width="550" data-dnt="true">
  <p lang="en" dir="ltr">
    When we've been taking the logs we've been going for as frequently as we can. The main thing we need is temporal data (or we'd use OSM, etc!) as this is where our interest is focusing, obviously the more points the better. We're trying to avoid recommending any particular app 1/2
  </p>
  
  <p>
    &mdash; Realtime Trains (@realtimetrains) <a href="https://twitter.com/realtimetrains/status/973957543331553280?ref_src=twsrc%5Etfw">March 14, 2018</a>
  </p>
</blockquote>

<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


I have put together some settings that should help achieve these goals using GPSlogger.



One of the main things is to make sure that we are recording the data frequently &ndash; **which isn't necessarily great for battery life, so be wary of this on long journeys! **

{{< figure src="Screenshot_20180314-205353.png" >}}

First of all, hit the hamburger menu (stack?), and go into &#8230;

## Logging Settings

Tick **Log to GPX**

Set **New file creation** to **Custom file**

Set the **Custom file name** to &#8220;_%YEAR%MONTH%DAY-&#8221; **&ndash; **_this will mean when you create your GPX files, you can append the service ID and uniquely identify the service with the ID and the date.

Tick **Ask for a file name on every start, **so you have the chance to put the WTT schedule UID into the filename when you start a track.

Untick **Allow custom file name to change dynamically** to prevent multiple files from being created (you can merge them later, but it's an extra step that's not really needed!)

Next, go back and navigate to ..

## **Performance (Timings, filters and listeners)**

In **Location Providers**, have:

<ul style="list-style: none;">
  <li>
    ✔ GPS enabled
  </li>
  <li>
    ❌ Network disabled
  </li>
  <li>
    ❌ Passive disabled
  </li>
</ul>

(this prevents your location from being sourced from the cell network or wifi/bluetooth beacons, which can throw off the accuracy)

Set the **Logging interval** to 0 (zero) (as frequently as possible).  You'll need this to ensure your GPX file contains enough points!

{{< figure src="Screenshot_20180314-205427.png" >}}

Set **Distance Filter** to 0 (in order to log new points even when you are stationary), and ensure that **Don't log if I'm not moving** is turned **OFF** (the fact you are not moving at a particular time is useful information!)

Set **Accuracy Filter** to 60 (so that points that are wildly inaccurate are not recorded)

<span style="text-decoration: underline;">Optional</span>: You might want to tick **Keep GPS on between fixes**, which will increase the accuracy and frequency of the measurements (as it won't have to wait to get a lock between each measurement).  **However** , it will drain your battery a _lot_ faster when combined with the **Logging interval** set to 0 as above!

You're pretty much set now&#8230;

## Creating a Track

First, find your service using the [Realtime trains][2] website.  Click the <span style="text-decoration: underline;">More detail</span> link, and find the _WTT schedule UID_ (which might be something like W07729).

Go into **GPSlogger** &ndash; once the train is at the platform, press Start Logging. If you've set it up as I describe above, it'll prompt your for a filename.  Paste the WTT schedule UID at the end of the filename &ndash; so &#8220;_%YEAR%MONTH%DAY-W07729&#8243; _in our example).  This will result in a filename like 20180314-W07729.gpx , which uniquely identifies the service.

The logger will begin recording data points.  Keep your phone out with visibility of the sky to give it the best chance of getting accurate fixes.  When you reach your destination, press stop.

Now hit the share button bottom left, pick the GPX file you just created and [email it with a link to the service][4] to Realtime Trains for them to include in their dataset ! Or do whatever else you like with the file (there is integrations for various cloud storage platforms, SFTP, FTP etc).

 [1]: https://en.wikipedia.org/wiki/British_Rail_Class_800
 [2]: http://www.realtimetrains.co.uk/
 [3]: https://github.com/naxxfish/nrod-funnel
 [4]: http://www.realtimetrains.co.uk/tracks/
 [5]: https://play.google.com/store/apps/details?id=com.mendhak.gpslogger
 [6]: https://twitter.com/realtimetrains