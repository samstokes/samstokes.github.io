---
layout: post
title: "Let's talk about confidence"
date: 2016-05-20 11:25:29 -0700
comments: true
hero_image: confidence/risk.jpg
hero_image_alt: Silhouettes pointing at a satellite photo
vim: nolist linebreak wrap
---

Ever been in a conversation like this?

> Engineer: "We're going to have to cut feature X if we want to launch on time.  It'll take two months to build, but the deadline's in a month."
>
> Product manager: "That's a shame - our competitors have that feature.  I thought you demoed it last week?"
>
> Engineer: "That was just a prototype.  We can't ship it to users."
>
> Product manager: "Why not?  It looks awesome, and it worked fine in the demo."
>
> Engineer: "Sure, it basically works, but the code is a mess, and we haven't done any testing.  It's not ready to ship."
>
> Product manager: "It doesn't have to be perfect.  We need to move fast now - we can always fix it later."
>
> Engineer: "That's what you said last time.  Fine, we'll ship the prototype... again.  Don't blame me when it breaks."

Each person is trying to manage the risks they know about, and do what's best for the business.  Despite the best of intentions, these conversations can feel frustrating for both parties.  It's easy to feel like the other person doesn't understand your concerns, or is stubbornly clinging to their own principles.  The optimal decision is probably somewhere in the middle, but this kind of discussion rarely gets there.

I previously argued that [we should stop using the word "quality"]({% post_url 2016-02-24-quality-vs-empathy %}) because it tends to polarise conversations.  Now I want to offer an alternative.  I propose that most conversations about schedule or scope would go better if they were framed instead around *confidence*.

<!-- more -->

## Confidence and risk

Talking about confidence gives a way to educate each other about the risks you're aware of, and how worried you are about them.  What if the same conversation went this way:

> Engineer: "We're going to have to cut feature X if we want to launch on time.  It'll take two months to build, but the deadline's in a month."
>
> Product manager: "That's a shame - our competitors have that feature.  It might lose us some power users, and those are exactly the users we want feedback from to be confident in our product thesis.  Are you sure there's no way to fit it in?"
>
> Engineer: "We have a working prototype of X, but it's pretty slow - I wouldn't be confident in putting it in production.  It could bring down our servers."
>
> Product manager: "X isn't a core feature, so we don't need 100% confidence in it.  Can we get to 80% confidence in a month?"
>
> Engineer: "I guess we can run the prototype on its own servers so it won't harm the rest of the product.  But it could break, and we won't have monitoring, so we'll have to spend time after launch bringing it up to scratch."
>
> Product manager: "That's okay, we can afford that time after launch, and if it breaks we can handle the support calls."
>
> Engineer: "I'll remind you that you said that!  We'll get the prototype ready."

[![Pointing out risks]({{ "confidence/risk.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/51592180@N06/8476856482)

Confidence is something that translates well across job functions, and is something everyone can reason about.  Engineers need confidence that the system will work, and that they'll know when it breaks.  Product managers need confidence that someone actually wants what you built, and that they're getting reliable user feedback.  Engineering managers need confidence that the team is tracking to plan, and that other teams they depend on are on board with the approach.

Talking about levels of confidence means you can actually have a reasonable discussion about tradeoffs.  The "80%" numbers can be arbitrary, but everyone understands the difference between 50% (a coin toss) and 99% (pretty certain).

## Disagreement about confidence

Talking about confidence doesn't mean there will no longer be disagreements.  People will have knowledge of different aspects of the decision being made, which will lead them to differing levels of confidence.  People will have different risk tolerances: how confident they *prefer* to be.

In the imaginary conversation above, the engineer might have insisted that putting a prototype in front of users was irresponsible.  The product manager might have objected that an unmonitored, crash-prone version of the feature wouldn't teach them anything about user behaviour.  Front-line support might have objected to the impending deluge of complaints about the unstable feature.

These are *good* disagreements.  They are the reason you had the discussion in the first place, rather than just having one person decide.  When you launch, you want to know which aspects of the product you are confident in, and where you have gaps; not to push something shiny out the door and only then discover nobody tested it under load.

To make an informed decision, you want the people with the most knowledge of each aspect to assess their level of confidence.  And you want people with different comfort levels to be bought into the tradeoff you're making.  When the servers *do* catch fire, you don't want the people holding the fire extinguishers to feel like they're cleaning up someone else's mess, but that you made a decision together to prepare for some fires in order to gather some crucial feedback.

[![Running from the explosion]({{ "confidence/nuclear-test.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/clement127/10043349406)

## Risk tolerance

Taking different risk tolerances into account is tricky, because you have to do it consciously and deliberately.  If you let nature take its course, the more risk-averse people will tend to be overruled, or even ignored.  If someone more risk-tolerant is making the final decision, one of the risks they're often prepared to accept is pissing off the risk-averse people!

Of course you can't delay every decision until everyone is happy.  Rarely is everyone involved going to reach their preferred level of confidence - there just isn't that much certainty to go around!  You might have to be okay with shipping the prototype, or with dropping the feature.  But if you can take more people's levels of confidence into account, you'll reach a better decision - and one with more people bought into it!

This is especially important because risk tolerance is *situational*.  One feature might be business critical, another might be fine with known bugs.  One small change to a creaking system might be the final straw, another might be a great opportunity to put in that fix you'd been talking about for months.

## Better conversations, better decisions

The next time you're in a conversation about schedule or scope that seems to be going nowhere, or where it seems like not every voice is being heard equally, try reframing the conversation around confidence and risk.  Instead of absolute terms like "good enough" or "launch blocker", present alternatives; talk about the costs and benefits.

* If you rush this feature out the door, what risks are you concerned about?
* Why is it so important to ship this feature this week?  What is the risk of delaying it a week?
* Can you do something simpler that would test the same product hypothesis?

It's really hard to answer these questions by arguing over absolutes, but you can make surprising progress with a few minutes of empathetic conversation about what you're trying to achieve.

Of course, maybe the answer is "we're not all that confident, but that's fine".  Doing anything interesting requires some level of risk.  Individuals and companies vary in how much, and what kinds of, risk they are willing to take.

However, I believe that building a culture that *values confidence* leads to being *better* at speed, quality, and all the other things you value.

In subsequent posts I plan to back up that claim, via applying this framework to some traditionally frustrating areas of software engineering, such as "productionisation" (aka turning a half-finished prototype into a half-finished product), premature generalisation, and whether startups should bother with unit tests.

<p class="credits">
Follow me on
<a href="https://twitter.com/intent/follow?screen_name=samstokes">Twitter (@samstokes)</a>
or
<a target="_blank" href="https://www.linkedin.com/in/samstokesuk">LinkedIn</a>.
</p>

<p class="credits">
Thanks to
<a href="https://twitter.com/paulbiggar">Paul Biggar</a>,
<a href="https://twitter.com/pvh">Peter van Hardenberg</a> and
Dorothy Li for reviewing a draft of this post.
</p>

<p class="credits">
Photo credits:
<a href="https://www.flickr.com/photos/51592180@N06/8476856482">RDVPHOTO</a>
(silhouettes pointing at a satellite photo), and
<a href="https://www.flickr.com/photos/clement127/10043349406">clement127</a>
(Lego man running from mushroom cloud).
</p>
