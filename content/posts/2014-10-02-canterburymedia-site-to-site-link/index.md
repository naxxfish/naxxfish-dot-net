---
title: CanterburyMedia Site to Site Link
author: naxxfish
type: posts
date: 2014-10-02T11:36:36+00:00
url: /2014/10/02/canterburymedia-site-to-site-link/
categories:
  - Technology

---
<span style="line-height: 1.5;">One of the unique challenges of CSR FMis it's structure, where it is part funded by two separate universities each with a presence in Canterbury (<a href="http://www.kent.ac.uk/">University of Kent</a> and <a href="http://www.canterbury.ac.uk">Christ Church University</a>) and their respective student unions (<a href="http://www.kentunion.co.uk/">Kent Union</a> and <a href="http://ccsu.co.uk/">CCCU</a>).  Student members could be enrolled at either institution, and as such each institution has it's own radio studio on campus &ndash; each of which has an equal chance of being put on air. The station also invites members of the community to participate. 

This has presented a challenge, in that live audio needs to make it's way from either studio to the transmitter, hosted at the University of  Kent in Eliot College.  From the outset of the CSR project, the route between the two has always been over IP &ndash; there was no other reasonable option.  Up until recently, that was realised using a IP Codec &ndash; with it's packets being routed over the institution's networks.

This is perfectly fine, and for the most part worked very well.  However, recently CSR has had a fundamental infrastructure change to it's audio distribution (as part of the Student Media Center project), which has made every single audio source and destination available using Axia's [Livewire Audio over IP protocol][1] over their internal network.  This allows fantastic flexibility and allowing studios to route any source to their mixing consoles, as well as increased interoperability with our automation systems and customisable GPIO control.

However, the second studio (Studio Blue) was still connected via an IP codec link, which was not integrated into the system at all and offered limited capacity for routing over the link (only a stereo pair to and from the router).  Unfortunately the link between the two sites, over the academic networks that link the universities, would not be suitable to transport Livewire (for a number of very good reasons, lack of multicast and custom QoS being one).  It was therefore necessary that we provided a Layer 2 link between the two locations to carry this traffic, which we had complete control over.

Traditionally, you might use a leased line type circuit (ATM or Ethernet, or MPLS) to achieve this sort of connectivity.  But these options are vastly outside the realms of reasonable cost of installation and setup for the project.  So an alternative method was required.

[Ubiquiti][2] have been offering a range of very capable, and disruptively priced, Ethernet Radios for some time now.  CSR has even used these radios in the past to provide connectivity to remote locations for Outside Broadcasts, with great success.  So it was a natural step to make a permanent installation to link our two, reasonably geographically close, studios together.

{{< figure style="background-color:#ffffff; padding:1em" src="5GHz-link-Network-Diagram-public.png" caption="Two networks connected together via 5GHz link" position="center" >}}

The link consists of two Ubiquiti Nanobridge M5 radios, each affixed to the roofs of the respective host buildings.  We can configure them to transport VLAN trunks, allowing us to not only transport Livewire streams, but also segregated control and other data over the link.  The appropriate QoS settings in the radios and the Cisco switches at each facility ensures that Livewire data is given priority, so that real time audio is possible and reliable.

In order to prove the link was possible, we ran some simulations in [Radio Mobile][3] using the specifications of the radios to get an idea of whether the signal would be good in the area we needed.  Turns out we should get a pretty good signal between the two sites!  The simulation was run with an omnidirectional antenna, assuming that we can rotate it as required &ndash; the below plot shows areas where a realiable connection is feasible.

{{< figure src="image07.jpg" position="center" caption="Radial plot of link quality from the central point - anything greater than -60dBm (shaded) would work" >}}

In the past we had performed a link analysis also for the specific points &ndash; not dissimilar to one which we performed for a link to Merton Farm some years ago (pictured below)

{{< figure src="image01.png" position="center" caption="Link analysis between Eliot College and Merton Farm" >}}

When we ran the link analysis for this particular link, it showed that there was some &#8220;land clutter&#8221; in the way (trees, cathedrals, that sort of thing), however providing we had enough height a link should be possible.

The first radio was installed on an old TV aerial pole on Eliot College roof.  There are two CAT5e runs from the roof to the CSR FM's comms room in the basement, which we used to connect to the equipment.  Care was taken to ensure that the equipment is not obviously visible from the ground.

{{< figure src="20130722_100017.jpg"  position="center" caption="Nanobridge affixed to the roof of Eliot college, next to the Sky reciever dishes" >}}

The second was installed on the roof of the Erasmus building, at Christ Church University, on an existing pole for our FM aerial.  This turns out to be a very neat installation.

{{< figure src="2014-09-22-18.33.32-1.jpg" position="center" caption="Nanobridge on the roof (top) of the Erasmus building next to the FM aerial" >}}

After alignment, we are able to get a link reasonably good link between the sites!

Hopefully this should pave the way for a better connected studio for CSR at Christ Church University

 [1]: http://www.axiaaudio.com/livewire
 [2]: http://www.ubnt.com/
 [3]: http://www.cplus.org/rmw/english1.html
 [4]: https://i0.wp.com/vandium.naxxfish.net/wp-content/uploads/2014/10/image07.jpg
 [5]: https://i0.wp.com/vandium.naxxfish.net/wp-content/uploads/2014/10/image01.png
 [6]: https://i0.wp.com/vandium.naxxfish.net/wp-content/uploads/2014/10/image05.png
 [7]: https://i2.wp.com/vandium.naxxfish.net/wp-content/uploads/2014/10/20130722_100017.jpg
 [8]: https://i1.wp.com/vandium.naxxfish.net/wp-content/uploads/2014/09/2014-09-22-18.33.32-1.jpg