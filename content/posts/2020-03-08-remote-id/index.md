---
title: Remote ID and Drones
author: naxxfish
type: posts
date: 2020-03-08T11:40:00+00:00
url: /2020/03/08/remote-id-and-drones
categories:
  - Personal
tags:
  - technology
  - drones
  - aviation

---

Drone safety is a topic which has had particular interest after [recent incidents](https://www.bbc.co.uk/news/uk-47919680).  Whilst there have yet to be any cases of a drone actually colliding with an aircraft, there's a definitely feeling there is a percieved risk of this occurring - which is sufficient that seeing a drone anywhere near close to an airport will immediately cause mass chaos as the entire airport is grounded until it has been removed.  

With tech giants like Amazon developing automated drone-delivery systems, the number of drones in the skies is likely to increase - and obviously law-makers are being pressured to make sure that this is a safe future.  

There are two main requirements which have become apparent: the ability for other users of the sky to be aware of other objects using the same space, and the ability for law enforcement to trace pilots of unmanned systems who are breaking the law. The Federal Avaition Agency in the USA have recently released a [Notice of Proposed Rule Making](https://www.federalregister.gov/documents/2019/12/31/2019-28100/remote-identification-of-unmanned-aircraft-systems) which sets out their approach to achieve this.

# Collision avoidance
Making sure that vehicles in the sky don't collide with each other is obviously quite important.  But, not a new problem in particular - ever since the human race has had vehicles, there's been a risk of them colliding.  There are [international regulations for preventing collisions at sea](https://en.wikipedia.org/wiki/International_Regulations_for_Preventing_Collisions_at_Sea) - which set out rules to help prevent collisions.  This sets standards for communicating what kind of vessel you have, and what it's doing, to inform navigators what to expect and how to behave on the water in a way that prevents two vessels from colliding.  This relies on all operators understanding the regulations, as there is no "sea traffic control" to speak of.  

In the air, there are different challenges - aircraft move fast, and if you are on a collision course you may not even see the other aircraft it before it hits you.  There is a need for some kind of automated system for preventing collisions.  This could be in the form of an [Airborne collision avoidance system](https://en.wikipedia.org/wiki/Airborne_collision_avoidance_system) - which allow aircraft to be aware of the positions of others within their immediate vicinity, and prevent collisions accordingly.  ACAS is not a single technology, but rather a name for technology which achieves the goal of preventing collisions.  

## Bird Strikes

Birds have existed for millenia before aircraft.  They're small, weigh anything from a few grams to a few kilograms, slow moving, don't generally show up on radar, and have not been fitted with any transponders to detect their presence. A canada goose, for example, weighs up to 6.5kg and has no qualms about sitting near the end of an airport runway.  And yet, the aviation industry has somehow managed to cope with this up until now - how?  

Two ways: reduce the amount of birds near airports (through whatever means is feasible), and make aircraft that are able to withstand being hit by birds.  At no point did anyone suggest that all birds register themselves with an online portal and fit themselves with GPS trackers.  

## Drone Strikes

There is still [active research](https://www.fraunhofer.de/en/press/research-news/2019/july/emi-assessing-the-danger-of-drone-strike.html) [being undertaken](https://www.easa.europa.eu/research-projects/desire-0), but mitigations against drone strikes should surely be the same as with bird strikes: restrict drones around airports, and make aircraft which are able to withstand being hit by a drone.  

And like birds, drones are different weights, and the amount of damage that may be caused by a drone is proportional to how much it weighs - and how much of that mass is contiguous (i.e. is a solid piece would require significant force to disintegrate in an impact).  A DJI phantom is an enormously popular drone, and weighs about 1kg.  This would seem like a good target to build aircraft to be able to handle - anything much heavier is generally outside of the price range of the hobbyist and therefore are subject to different regulations.  

## Helping vulnerable air users avoid drone strikes

Drone strikes are disproportionately dangerous to a particular subset of air users - low alititude and light aircraft (like helecopters).  When it comes to drones, they generally operate at a relatively low alitutde (the hundreds of feet, not thousands) and the risks to low flying, light aircraft are much higher than commercial jets which are (usually) thousands of feet above them - and there have been accidents involving [low flying helicopters and drones](https://newyork.cbslocal.com/2017/09/22/drone-hits-army-helicopter/), but no confirmed accidents invovling commercial passenger aircraft.

A popular ACAS used by light and low flying aircraft is [FLARM](https://flarm.com/technology/) - *FLight ALARM* - which is a system for aircraft, which broadcasts their position and altitude and allows them to recieve notification of the same information for other vehicles in the viciniy (either through FLARM or [ADS-B](https://en.wikipedia.org/wiki/Automatic_dependent_surveillance_%E2%80%93_broadcast) in some implementations). As a system, it's quite lightweight (physically and in terms of complexity of integration), and free to broadcast to other vehicles (although recieving from the network requires a license).  The frequency it uses is in the ISM band (so there are no legal license requirements from a spectrum point of view), and implementing it is quite cheap for an OEM.  It's been adopted quite widely in light aircraft and helicopters, in particular, across Europe.  

And even better, FLARM is already able to be implemented in hobbyist drones, relatively inexpensively.  The [Team Black Sheep Crossfire RX](https://www.team-blacksheep.com/products/prod:crossfire_8chrx) has the ability to broadcast it's position using FLARM - so vulnerable aircraft will be able to see where drones are flying.

Problem solved, right? Drone pilots know where other air users are, other air users know where drones are, try not to hit each other, sorted...?

## How the FAA wants to 'improve safety'

In the [NPRM](https://www.federalregister.gov/documents/2019/12/31/2019-28100/remote-identification-of-unmanned-aircraft-systems), rather than using existing technology that's proven to work, is inexpensive, achieves the goals at hand, and has already seen a huge deployment - the FAA have decided that for their Remote ID proposal, they will mandate a completely new system, which relies on Internet connectivity (specifically) and must be fitted onto the drone itself.  Which is rather strange, becaue no other aviation system mandates Internet connectivity for safety. Only if Internet connectivity is not available (which is not a well defined situation), is the drone allowed to broadcast it's position locally instead (so... why bother with the Internet bit at all?). 

Also, there will be subscription fees for the services that you are required to use - as well as a registration fee per aircraft, and per operator.  

The NPRM also states that they'd prohibit drones from broadcasting ADS-B, to prevent the spectrum from being saturated and as it doesn't function well at low altitudes - this make sense ... but a system like FLARM doesn't suffer from this issue since it uses ISM bands, and works perfectly fine at low altitude (which is where it is primarily used).  

It also states that if you have built you own drone (regardless of weight) without getting FAA approval (through a process not entirely described in the document), it will not be possible to retrofit it with a "remote ID" kit and hope to fly it legally - you are restricted to only fly it in a "FAA-Recognized Identification Area" or FRIA, within visual line of sight.  

Commercially produced drones would all be required to at least implement 'limited' "remote ID", to gain FAA approval to be sold.  

And, "remote ID" (even 'limited') would transmit the location of the pilot.  And that information would be publically available.  Great news for [the guy in Long Island](https://dronelife.com/2019/03/04/drones-will-be-shot-down-until-these-misconceptions-are-tackled/), who took a shotgun to a DJI Mavic flying near his property on a mission to find a missing dog - you can go and threaten the operators directly now! 

Which comes to the second aspect of this:

# Tracing Pilots

Vehicles have registration plates - cars, boats, aeroplanes.  Drones, too, now have registration plates - which they are required to be labelled with.  The government has a database of those registration plates, and can go from a registration plate to an identity.  If you break the law using your vehicle, the government will be able to trace it back to you.  

This is mostly fine, and uncontraversial.  

However, what the FAA is suggesting means that not only would you need to transmit the your registration ID, but also your location as as the pilot, and possibly the location of the aircraft too.  This is not for improving safety, this is for law enforcement. And potentially anyone else reading the message - because, as mentioned, the FAA suggest this information would be public.

If we take a step or two back - what is trying to be achieved here?  If a drone is being operated unsafely, you (the law enforcement agent) want to be able to stop the pilot from operating it any more.  So, there are two ways in which a drone can be operated unsafely:

## Maliciously

If you are maliciously operating a drone dangerously (e.g. buzzing an airport), then it's not very likely that you'll activate your remote ID system whilst you're doing that - and if you did, you wouldn't do so in a way that allows law enforcement to stop you from doing what you're doing.  By what logic would you expect a criminal to comply with any legislation that may prevent them from getting away with their actions?  What they're doing is already illegal, making it "more illegal" isn't likely to help. 

Bombs are also illegal to make - but that doesn't prevent terrorists from using them. 

If you want to ground a drone being flown maliciously, you need to take countermeasures - the military have already developed technology to address this threat.  These devices are able to ground a drone with relative ease - it appaers. To speculate on their operation, they most likely jam the ISM bands used to control a drone, and the GPS signals for the drone to follow waypoints (both of which are illegal as a civilian, incidentally). 

## Unintentionally

If you have unintentionally operated your drone unsafely, law enforcement need to stop you from doing that - now and in the future.  

If your drone is broadcasting it's ID, then it should be possible for law enforcement to look up the identity of the owner, in the same way a registration plate on a car offers the same function.  If the enforcement action is to issue a fine (like a speeding ticket), then this on it's own would be sufficient.  This seems to be enough for speed cameras on roads.  

To aprehend the operator of a drone, there are two distinct use cases: one where the drone is autonomous (i.e. not connected to the operator), and the other where it is manual (i.e. is recieving commands from the pilot continuously).  Autonomous drones absolutely have a risk associated with them, and there may not be a connection to their operator at all times.  It may well be a good idea to regulate these in such a way that law enforcement can force them to abort their mission if they are being operated unsafely, through some local radio signal.  But can you rely on this functioning at all times?  Even if the drone is type-approved by the regulatory body, how can you guarantee that it's not been modified and this functionality unintentionally disabled?  

But manually controlled drones (those which are being operated by a pilot directly) - there's an easy way to find the pilot, which is follow the direction that their transmissions are coming from.  This is how bodies like Ofcom or the FCC find pirate radio stations, and even in law enforcement - it was used to track stolen cars before GPS was commonly used for such purposes.  If there was a market for it, it would be relatively straightforward to develop a device which allowed law enforcement to find the location of a given transmitter.  

# Conclusion

The FAA's proposals for Remote ID are generally over-reaching, breach privacy of those complying with the law, and are unenforcable - and probably won't work.  

In contrast, a lighter touch approach could be taken, and achieve the same goals:

1. Use a broadcast technology to announce the position of drones to other air users - for drones which pose a particular danger to other air users (e.g. over a certain weight). 
2. Allow any new technology to be supplied as a component which may be integrated into amatuer built devices (like the [Team Black Sheep Crossfire RX](https://www.team-blacksheep.com/products/prod:crossfire_8chrx)), where required.
3. Keep the contact details for each registered pilot in a database only accessible to law enforcement (nobody else!), don't force pilots to declare their location publically. 
4. Manually operated drones should be exempt, up until a certain threshold (e.g. weight, distance) - use direction finding technology to locate pilots if required.
5. Don't rely on compliance to prevent malicious use of drones - take countermeasures instead.
6. Require aircraft to be able to withstand a drone strike - the same as they are required to withstand bird strikes.

People have used cake to smuggle knives into prison - the correct reponse to that threat is not to outlaw cake. 

