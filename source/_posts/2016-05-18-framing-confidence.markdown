---
layout: post
title: "Let's talk about confidence"
date: 2016-05-18 00:28:29 -0700
sitemap: false
comments: true
vim: nolist linebreak wrap
---

If you work on a software product team, you've probably heard, or said, things like this:

> * "The deadline is unreasonable, I can't do a quality job in that time."
> * "Just ship it already, it doesn't need to be perfect."
> * "Shipping quickly is the priority, so we don't have time for testing and code review."
> * "We've been moving too fast recently and breaking too many things.  We need to slow down and be more careful."

These sorts of statements often come up when discussing schedule or scope.  They [frame](https://en.wikipedia.org/wiki/Framing_effect_(psychology)) the decision being made as a dichotomy: you can do it *fast* or do it *well*, but not both.

It's true that sometimes you have to choose between speed and quality.  However, they're not always at odds.  You can add features more quickly to a clean codebase than to a messy one.  Rapid feedback finds more edge cases and refines a design.  It's not even controversial that "speed versus quality" is sometimes a false choice, yet that choice gets invoked all the time.

I previously argued that [we should stop using the word "quality"]({% post_url 2016-02-24-quality-vs-empathy %}) because it tends to polarise conversations.  Now I want to offer an alternative.  I propose that framing conversations around "speed versus quality" leads to poor communication and bad decisions, and that most conversations along these lines would go better if they were framed instead around *confidence*.

<!-- more -->

## Confidence and risk

Talking about confidence means educating each other about the risks you're worried about.  Consider the following hypothetical conversation:

> Engineer: "We're going to have to cut feature X if we want to launch on time.  It'll take two months to build, but the deadline's in a month."
>
> Product manager: "That's a shame - our competitors have that feature, and it might lose us some signups.  Are you sure there's no way to fit it in?"
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

Confidence is something that translates well across job functions, and is something everyone can reason about.  Engineers need confidence that the system will work, and that they'll know when it breaks.  Product needs confidence that someone actually wants what you built, and that they're getting reliable user feedback.  Managers need confidence that the team is tracking to plan, and that other teams they depend on are on board with the approach.

Framing the discussion about confidence means you can actually have a reasonable discussion about tradeoffs.  The "80%" numbers can be arbitrary, but everyone understands the difference between 50% (a coin toss) and 99% (pretty certain).

Here's a way to reframe those "speed versus quality" tradeoffs.  Investing in automated tests for feature X will increase your confidence that you won't accidentally break X in the future; but it might decrease your confidence of shipping X this week.  Cleaning up unnecessary noise from your server logs will increase your confidence that you'll be able to diagnose issues when customers report them.  Deprecating that legacy system will increase your confidence in being able to add new features when the product manager requests them.

## Disagreement about confidence

Talking about confidence doesn't mean there will no longer be disagreements.  People will have knowledge of different aspects of the decision being made, which will lead them to differing levels of confidence.  People will have different risk tolerances: how confident they *prefer* to be.

In the imaginary conversation above, the engineer might have insisted that putting a prototype in front of users was irresponsible.  The product manager might have objected that an unmonitored, crash-prone version of the feature wouldn't teach them anything about user behaviour.  Front-line support might have objected to the impending deluge of complaints about the unstable feature.

These are *good* disagreements.  They are the reason you had the discussion in the first place, rather than just having one person decide.  When you launch, you want to know which aspects of the product you are confident in, and where you have gaps; not to push something shiny out the door and only then discover nobody tested it under load.

To make an informed decision, you want the people with the most knowledge of each aspect to assess their level of confidence.  And you want people with different comfort levels to be bought into the tradeoff you're making.  When the servers *do* catch fire, you don't want the people holding the fire extinguishers to feel like they're cleaning up someone else's mess, but that you made a decision together to prepare for some fires in order to gather some crucial feedback.

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

## Quality and confidence

But what about quality?  Should you just [stop talking about it]({% post_url 2016-02-24-quality-vs-empathy %}), as my last post's title seemed to provocatively suggest?  Discussing risks is an effective way to communicate, but it's also cold and rational.  Where do intuition, creativity and vision fit in to this framework?  What about pride in a job well done?

I think the way to reconcile this is to recognise that quality, as Julie Zhou has eloquently argued, is [a bar, not a tradeoff](https://medium.com/the-year-of-the-looking-glass/quality-is-not-a-tradeoff-bcddf7c85553).  Julie concludes: "quality happens because it cannot happen otherwise".

To paraphrase: quality is a _cultural value_.  Different individuals and companies will vary on how they define quality, and how highly they prioritise it against other factors.  But wherever you and your culture set the quality bar, it's part of the *context* in which you make decisions about schedule and scope.

Your cultural quality bar isn't something to be traded off - *in general*.  There will always be *specific cases* where you do need to accept a lower level of quality in order to achieve some goal.  Sometimes you need a demo ready for the conference announcement.  Sometimes you don't understand the use case well enough yet to know what solving it with high quality would even mean.  But those cases should be *exceptional*.  If you're lowering your quality bar as a matter of course, then your culture doesn't actually value quality as much as you think it does!

Talking in terms of a quality bar yields several avenues of discussion, all more useful than "do it fast or do it right":

 * How confident are you that this feature meets the bar?  (Are you proud of it?  Do you have adequate test coverage?  Have you beta tested the design to make sure it's easy to use?)
 * In those hopefully rare circumstances where you choose to lower the bar, how confident are you in your reasons for doing so?  (Will you learn enough by shipping with known issues?  Is the deadline business critical, or just somebody's misguided attempt at motivation?)
 * Planning to ship now and fix that bug in version 2?  How confident are you that will really happen?  (Do you trust your process for bug tracking and triage?  Will you get pulled onto another project once you ship?)
 * By choosing to lower the bar now, are you sure you're not [setting a bad precedent](http://donellameadows.org/archives/drift-to-low-performance/)?

Of course, maybe the answers are "not all that confident, but that's fine".  Confidence is *also* a cultural value.  The appropriate level of confidence will vary based on your preferences and your situation.  However, I believe that explicitly *valuing confidence* leads to being *better* at speed, quality, and all the other things you value.

In subsequent posts I plan to back up that claim, via applying this framework to some traditionally frustrating areas of software engineering, such as "productionisation" (aka turning a half-finished prototype into a half-finished product), premature generalisation, and whether startups should bother with unit tests.

<!-- TODO maybe add this to the standard footer? -->
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
