---
title: "Is everyone going to build the Metaverse?"
author: naxxfish
type: posts
date: 2021-12-05T14:20:00+00:00
categories:
  - Technology
draft: false
---

Ever since [Meta](https://about.facebook.com/) (*nee Facebook*) announced their intention of building "the Metaverse" in their [Facebook Connect conference keynote in 2021](https://www.facebookconnect.com/en-gb/session/70f2a060-08ef-4aba-a500-3c0495e5519a/), changing their name in the process - the world has been simultaneously enthrealled, amused and terrified by the idea of spending more of their time in a virtual world rather than the real one.

Maybe it's because they remember the dystopian setting of [Ready Player One](https://www.imdb.com/title/tt1677720/?ref_=nv_sr_srsg_0), where people live in towering stacks of containers because their cities have become uninhabitable due to overcrowding and energy shortages are commonplace - and the only way to escape is through the OASIS "metaverse" - leading them to neglect to fix the problems with physical society in preference to enjoying a virtual one instead.

Regardless of whether you think this is a good idea or not, one concept from Ready Player One which seems to have transferred into the discussion for is the idea that "the metaverse" is controlled and operated by one entity - in the case of the novel, Gregarious Games.  But, in the case of the novel, this is partly in order to provide a drive for the narrative - the primary story arc is following a quest to take ownership of the OASIS after the original creator dies - for that to make sense, the OASIS needed to belong to the creator in the first place to allow it to bequeathed.

Ever since the keynote, the word "metaverse" became the hot word in tech journalism.

Several new articles have loftily touted "X is building a metaverse"

{{< figure src="niantic-metaverse.jpg" position="center" >}}

{{< figure src="other-metaverses.jpg" position="center" >}}

{{< figure src="seoul-metaverse.jpg" position="center" >}}

You'd be forgiven for thinking that [The Zuck](https://en.wikipedia.org/wiki/Zuck) himself had personally coined this term in October 2021. But it's been around far longer than that - in fiction as far back as 1993 in Neal Stephenson's *Snowcrash* - and as the concept being a real possibility (rather than purely fiction), the [wikipedia article for "metaverse"](https://en.wikipedia.org/w/index.php?title=Metaverse&offset=&limit=500&action=history) has edits going back to 2005.  The original definition given in that article was as such:

> The 'metaverse' (a portmanteau of "Meta|meta-" and "universe") is a hypothesized iteration of the internet, supporting persistent online 3-D virtual environments

And the citation was this article from the [EGVE Proceedings of the workshop on Virtual environments 2003](https://dl.acm.org/doi/10.1145/769953.769967). Virtual Reality was a fad that became unpopular in the late 90's - and what we were mostly talking about then was 3D worlds on a flat screen.  But, importantly, interconnected and persistent worlds where many real people could come together to communicate.  

# The early 2000's Metaverse

The poster child of the metaverse in 2003 was [Second Life](https://secondlife.com/) (although not without it's [scandals](https://www.theguardian.com/technology/2007/may/09/secondlife.web20)). It enabled users to log into a shared persistent space where they could wear any avatar they liked, fly through various worlds and interact with whoever they liked in a 3D space. Linden Labs - the creators - owned all of the physical computing power required to offer this service, as well as building the client application to connect to it for various operating systems.

On a technical level, proponents of the current generation of the World Wide Web (which this "metaverse" was set to replace) noted that this example of a centralised model was diametrically opposed to the decentralised model that the Web operated upon (and that "the metaverse" should be an improvement of).  In parallel, standards like [VRML](https://en.wikipedia.org/wiki/VRML) and later [X3D](https://en.wikipedia.org/wiki/X3D) were already being developed as a way of rendering these 3D environments within Web browsers - with the idea that the existing infrastructure of the Web could be used and extended to support a decentralised "metaverse".

But somehow that vision of a 3D World Wide Web never quite came to be - despite rapidly improving technology, the investment in browser based 3D engines was dwarfed by that of native apps (primarily, games) - and browsers even in themselves were rapidly increasing the functionality they could provide traditional websites and 2D web applications(which could be readily exploited commercially and at scale.

# The late 2010's Metaverse

Fast forward, and some standards for 3D applications and virtual reality through the web browser have been further developed (for example [WebGL](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API), [WebVR](https://developer.mozilla.org/en-US/docs/Web/API/WebVR_API) and later [WebXR](https://www.w3.org/TR/webxr/)). Virtual Reality has made a big comeback thanks to in no small part mobile phone technology improving over time, display technology getting ever better, and headsets being developed that are more practical and comfortable ([Oculus](https://en.wikipedia.org/wiki/Oculus_(brand)) developing the [Rift](https://en.wikipedia.org/wiki/Oculus_Rift) and later the GearVR being a key milestone in this regard).

By far and away the most popular implementations of "the metaverse" have been centralised applications, controlled primarily by one company. For example, that of [VRChat](https://hello.vrchat.com/), developed by [VRChat Inc](https://en.wikipedia.org/wiki/VRChat). The company owns the infrastructure (at least at the application level), including authentication, communications and directory services. However, the content within it is mostly provided by it's users. Content authoring is a fairly involved process - which involves building assets using the [Unity game engine](https://unity.com/) and exporting them to the VRchat servers to be loaded by clients. There are few limitations on what you can build this way, and you have (almost) the full power of the Unity engine to develop both environments and avatars.

If you try to make an awkward analogy with VRchat and the earlier days of the Web - the Unity engine is Internet Explorer, and VRChat is your favourite web host (which for me, in the early 2000's, was [Brinkster](https://web.archive.org/web/20010201150300/http://brinkster.com/), and for most everyone else [Geocities](https://web.archive.org/web/20040306102459/http://geocities.com/)).  

But - unlike the early web - the VRChat client application can only access content held on VRChat's servers. That'd be like needing a different web browser for every website you visited (although that was [almost a thing for a while](https://en.wikipedia.org/wiki/Browser_wars)). Hopefully, we can agree that one of the affordances that enabled the web to become so pervasive was the ability to effortlessly jump between content without friction. This meant that it wasn't up to one company to create a compelling reason to install a web browser in the first place: once you were set up you could go anywhere you liked.

The Web as a whole has managed to succeed in part due to the work of organisations like the [W3C](https://www.w3.org/) in promoting standards and gaining consensus across the industry.

# ⛴️ Tyranny and Utopia of the Platform

As the web matured, a successful business model emerged - content platforms. A content platform makes upfront investment in their application to serve content of others - solving common problems like navigation, distribution and reliability. They can invest in infrastructure that scales to huge amounts of daily traffic across the world - and the producers of the content would never have to pay for server bills or worry about being [slashdotted](https://en.wikipedia.org/wiki/Slashdot_effect) and their web presence being temporarily erased. In exchange, the platforms get eyeball time which they can turn into revenue through advertising.

The underlying infrastructure for these platforms remain common to that of the Web as a whole. Most clients them use HTTP servers to communicate, and all of them use IP. Even extensions like realtime media transport is standardised - [RTSP](https://en.wikipedia.org/wiki/Real_Time_Streaming_Protocol), for example, being a common way of conveying audio and video between clients.

So today - as consumers and creators - we benefit from the upfront investment of the platforms in building a reliable base and ability to connect creators with an audience: for creators this is possible without needing to set up their own (expensive) infrastructure or solve complex (but common) technical challenges every time we do so; for consumers, they get a reliable and consistent experience accessing whatever content the platform can provide.

For creators, the cost of this is the loss of control over how that content is presented to the audience and how it is monetized. For some creators, this is a big deal - so much that they've attempted to [create their own platforms](https://www.floatplane.com/discover) to avoid that problem. Incumbents in the media world initially resisted distributing their content on these platforms for exactly this reason - some of them are big enough to become a platform in their own right, but most just cannot compete with the audience that a dedicated platform provides them. As of today (29th November 2021), 10 million more people subscribe to [PewDiePie](https://www.youtube.com/user/PewDiePie) on YouTube than [read The Guardian (either print or online)](https://www.statista.com/statistics/380687/the-guardian-the-observer-monthly-reach-by-demographic-uk/).

And now one of those platforms has amassed so much wealth that it can afford to direct it's efforts to that once forgotten next "iteration" of the web - the "metaverse".

# 👈 Who's fault is it?

The position of the social platforms has always been "we just let people communicate: what they communicate isn't our problem". This is fairly reasonable, coming from the age of the telephone. Generally, most states don't place the blame for a telephone call with illegal activities onto the telephone company - it's the participants that are to blame.  But social platforms aren't like a telephone network any more - they are more like broadcasters - who definitely *are* held responsible for the content that they broadcast, even if they didn't make the content themselves.

In broadcast, it's someone's responsibility to ensure that anything transmitted is compliant with all relevant laws - and this can be quite complicated sometimes, especially since it's legal to broadcast some content at some times but not others (for example [close to elections](https://www.ofcom.org.uk/tv-radio-and-on-demand/broadcast-codes/broadcast-code/section-six-elections-referendums)). But, since there are so many hours in a day to broadcast content, the scale of this task follows the number of channels you broadcast on. For social media, the volume of content that might be on the platform any given day could be vast - and having someone sign off on all of it would be completely infeasible. And that's why they try to defer responsibility for their content.

In some cases, technology has been developed to help solve these problems of trying to moderate the wave of content that the platform distributes. But, that takes time to develop and for it to be effective - so their leaders are treading water until the technology can save them.

In the metaverse - if it's owned by a single entity - the owners would similarly be pinned with the same expectation of responsibility for everything that happens within it. And given the breadth of interactivity that it could provide, there's a whole slew of illegal and immoral activity that *could* and probably *will* happen there. It's not the fault of the technology - the same as it's not the fault of the construction company who built a car park if someone decides to use the building to deal drugs. The Dark Web uses HTML just the same as anywhere else, but that doesn't make the W3C responsible for it's content ...

# 🌌 My Metaverse or yours?

[The Zuck's](https://en.wikipedia.org/wiki/Zuck) announcement that Facebook was to become Meta, and that the focus of their business was to become "a metaverse company" raises a question - given the use of the definitive article, who's metaverse is this?

{{< figure src="made-by-all-of-us.jpg" position="center" >}}

The simple assumption might be that given the track record of the company, "the Metaverse" would be as to Ready Player One's OASIS as Meta is to Gregarious Games - capturing all of the revenue through all the same mechanisms as before - advertising to an even more captive market (now literally as well as metaphorically) than before.

But perhaps the reality will be more nuanced. What if "the metaverse" (rather than "our metaverse") is more like "the Web"? Perhaps, like the Web, there is a way to build an infrastructure on top of which platforms could build their empires upon - which will require a lot of effort to build, but for a company with an excessive amount of cash and long timescales may be a worthwhile investment.

As a content platform, the reason your users come to you (and generate your revenue) isn't because you have great infrastructure - it's because you have the content they want. But, platforms invest into standardisation like web standards - because it enables them to deliver content that their users want more easily. HTML5 has enabled platforms to stream video much more reliably than ever before to more people, thanks to robust cross-browser support - but it took time to be realised - and with coordination across multiple organisations.

You could point to Meta's [Horizon Worlds](https://www.oculus.com/facebook-horizon/) and say "look, hey're building a metaverse already!" But, I personally doubt that is the end game in of itself. It might be a vehicle to get there - and perhaps even will become a strong platform in future - but if you genuinely want to get [1 billion people in VR](https://www.bbc.co.uk/news/technology-41590202), you may have to concede that maybe they don't all want to be on that one specific social platform. Horizon Worlds is a [walled garden](https://en.wikipedia.org/wiki/Closed_platform) - and a great place to experiment to find out what kinds of content and interaction is important.

# 🏗️ What are they building right now?

Facebook has already been investing in the Oculus ecosystem - consisting of a multi-platform app store and the Android based operating system for their standalone headsets like the Quest - which give developers (of all kinds of content) access to a large proportion of the hardware capabilities of their VR devices, with comprehensive integrations with popular game engines like Unity and Unreal Engine. This developer friendly environment will outlive the brand which created it by a long margin - and already Meta is able to subsidise the cost of their VR hardware by offsetting it against their Oculus store revenue - made possible by the studios developing content to purchase through it.

Meta isn't [investing in 10,000 new jobs within the EU](https://about.fb.com/news/2021/10/creating-jobs-europe-metaverse/) for Horizon Worlds - that would be quite underwhelming. They'll be investing in people to build the infrastructure on top of which spaces like Horizon Worlds - among others - can exist.

By infrastructure I don't mean physical servers and networking hardware. Those already exist - and realistically most of the servers on which the Internet runs on now exist in a datacenter owned by Amazon, Google or Microsoft. The days of buying your own server to run your website are long gone for most people - and owning physical infrastructure is of little importance in the age of The Cloud.

Rather, the infrastructure required is more to do with the software. How do you enable people to jump into any world they like - and make it as easy as pointing a browser to a website or opening an app? And, now that you have a presence in the world, how do you allow people to represent themselves in those worlds - you don't necessarily want to have a different avatar per world (which is currently the case), and would prefer to take avatars you own anywhere - but how do you make avatars compatible with any world so that they can interact with them consistently?

Someone has to come up with and formalise the standards around these new entities like 3D Avatars and Worlds and Objects.

VRChat has already done this - to some extent. It has SDKs for it's Avatars and Worlds that you must use in order to publish content to their servers. But they only need to be internally consistent within their own environment: for example, VRChat Avatars only have to interact with VRChat worlds - not Horizon Worlds worlds. Since they have full control over the whole product they can make some assumptions based on how the content is going to be viewed and used; some of which may not make sense in other contexts.

But if you want to really open it up, you've got to build standards (or at least conventions) that allow worlds and avatars and objects to be described and rendered in a very general way - that is platform agnostic. If you don't, the only people who can enter your metaverse are people who you personally have sold headsets to. The Quest 2 is a well sold product, but it's not the only VR headset out there, and if you want the metaverse to be as ubiquitous as the web, you have to support them in a consistent way.

# So, what will Meta do?

Predicting what a tech giant is going to do in the next 10 years is something that not even someone who works for them is really able to do with any degree of accuracy. The best laid plans can go awry with a change of management or some external factor that nobody saw coming.

But, if I had to guess at the intention it would be this: build out proof of concepts for metaverse applications in all kinds of areas - social, commercial, business, entertainment. Find the parts that are hard, and the parts that deliver value, and find and test solutions. Over time, they will start bringing together an open platform and make it accessible for people to experiment with.

This may or may not be centralised. It may be that Meta (or a subsidiary) act as a design authority for the content standards, and one big player provides a platform that almost everyone uses to distribute their content (solving the infrastructure problem as they already do for traditional web applications) whilst letting anyone consume content without restrictions. Or, it might be that they allow anyone to run such a platform (the same way anyone can run a web server), and the standards they develop allow you to jump between platforms easily.

As the technology develops, they'll invest more in profitable products that use it - which they'll be able to deploy quickly and respond to market demands faster thanks to the investment they made in the underlying technology earlier on. There will be other competitors in this space - just the same as a many studios can build games for the same games console - but they're betting on the effect of competition will drive value, and the free choice will draw consumers into the market who they might have otherwise missed.

Maybe 🤷. It's really hard to even make an educated guess at this point. Imagine predicting eBay in 1990, or TikTok in 2001.

# Aside: NFTs blockchains are the answer?

Any time there's been a difficult problem in tech in the last few years - someone has said that "blockchain" will solve the problem. Sometimes they're right, but most often they have misunderstood the purpose of a blockchain or the problem they solve.

If you need to share some kind of data which you later wish to prove existed at a particular point in time - a blockchain is a way of achieving that. In the case of cryptocurrencies - the data you share is generally the current owner of a particular piece of currency at any given time. By sharing this information, peers can later verify that you are authorised to transfer ownership of some of your currency to another party, through a cryptographic signature.

You can store whatever data you like in a blockchain. But, the key aspect of a blockchain is that it must be downloaded in full to all peers taking part in the network to verify it's integrity. This is not hugely efficient, and some blockchains have hundreds of GB of data - especially if they're long running like Bitcoin which is now approaching 400GB - and getting bigger with every transaction taking place.

Now imagine that it's not just transactions on that chain, it's entire 3D worlds and avatars. Every peer in the network would have to download the chain *in full* and subsequently keep it up to date with all published content, even if they were never going to use it. And nothing could ever be deleted from it, so it would be a huge chunk of data that would just continue rapidly expanding forever until it became too large to move from client to client in a practical way. Whilst not every client would need to be a peer in the network - the network needs a sufficient number of them to function correctly.

OK - so you probably don't want to be putting your actual worlds into a blockchain - but perhaps an idea like [NFTs](https://en.wikipedia.org/wiki/Non-fungible_token) would allow the actual content of the 3D worlds to be associated with owners through a blockchain, but without filling that blockchain up with actual content - just tokens which represent them (perhaps a cryptographic hash of their data).

This definitely works in principle - if you own an avatar that looks like yourself, you don't want other people using it without your permission - and being able to prove you own it might help.  But - it relies on the client be trusted not to render that avatar for other people trying to use it without owning it. And what would stop someone from copying an avatar and tweaking it in a non-material way such that it appears identical but does not have the same ownership restrictions and can be freely used without triggering the ownership checks?

So yes, these technologies might be part of the solution - but they don't come close to solving the whole problem in their current state and when they are ready, they'll probably look very different to they do today.
