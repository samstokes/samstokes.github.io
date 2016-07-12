---
layout: post
title: Move fast with confidence
date: 2016-07-11 00:37:27 -0700
sitemap: false
comments: true
vim: nolist linebreak wrap
---

If you work on a software product team, you've probably heard, or said, things like this:

> * "The deadline is unreasonable, I can't do a quality job in that time."
> * "Just ship it already, it doesn't need to be perfect."
> * "Shipping quickly is the priority, so we don't have time for testing and code review."
> * "We've been moving too fast recently and breaking too many things.  We need to slow down and be more careful."

These sorts of statements often come up when discussing schedule or scope.  They [frame](https://en.wikipedia.org/wiki/Framing_effect_(psychology)) the decision being made as a choice between two approaches: you can do it *fast* or do it *well*, but not both.

I believe that "speed vs quality" is a false choice.  Each time we naïvely frame a decision this way, we do a disservice to ourselves and to our users.

<!-- more -->

Doing things well helps you move faster:

 * You can add features more quickly to a clean, well-engineered codebase than to a messy conglomeration of well-intentioned hacks.
 * Time you spend figuring out whether your new feature broke the old one is time you aren't spending on the next new feature.
 * I've even seen teams literally build the same feature twice, because the first time it shipped broken and nobody noticed.  Taking more care the first time would have *saved* effort.

Conversely, moving fast helps you do things better:

 * The sooner you find out how people will use the product, the sooner you know which features to improve and which ones to drop; which kinds of change to engineer for, and which kinds will never happen.
 * Code isn't really done until it's handling production traffic -- and recovering gracefully from that bad input that you thought would never happen, but happens reliably 1% of the time in production.
 * I've overdesigned a system to handle millions of concurrent users that never made it past tens of thousands.

## Move fast with confidence

"Do it well or do it fast" is asking the wrong question.  The right question is where to focus your effort.  As I've argued before, it can be helpful to frame that decision around [levels of confidence]({% post_url 2016-05-20-confidence %}).

 * Building a really solid, beautifully designed version of feature X might be satisfying, but how confident are you that you know how X will be used - or even *if* it will be used?
 * Conversely, if you ship a buggy, incomplete version of feature X, are you confident you'll really learn anything from user feedback about it?
 * Investing in automated tests for X will increase your confidence that you won't accidentally break X in the future; but it might decrease your confidence of shipping X this week.
 * Cleaning up unnecessary noise from your server logs will increase your confidence that you'll be able to diagnose issues when customers report them.
 * Deprecating that legacy system will increase your confidence in being able to add new features when the product manager requests them.

Facebook famously tried to capture their development philosophy with a slogan: "Move fast and break things".[^move-fast-and-break-things]  A slogan can't capture the full nuance of a decision-making process, but it can be an effective and memorable way to capture the spirit of what's important.  In that light, I propose a new slogan: __"Move fast with confidence"__.

[^move-fast-and-break-things]: Facebook's slogan was widely misunderstood to mean "things being broken is fine".  The real subtext was: move fast and *don't be afraid to* break things, *because you can move fast to fix them too* -- which is a lot less irresponsible.  Maybe because of the misunderstanding, they later abandoned "Move fast and break things" in favour of the much less catchy ["Move fast with stable infra"](http://mashable.com/2014/04/30/facebooks-new-mantra-move-fast-with-stability/).

Consider running across uneven terrain.  If you sprint headlong, as fast as you can, you're likely to put your foot in a pothole and trip, or twist your ankle.  Slowing to a walk isn't ideal either.  The trick is to be *aware* enough, and take just enough care, to be confident in your footing.  Look out for patches of crumbling earth or rocky ground where you need to step more carefully.  Identify those patches of clear, solid ground where you can afford to sprint.

I don't claim this is anything novel.  I'm quite sure that high-performing teams are already thinking along these lines.  But I've seen too many engineering cultures whose implicit slogans were just "move fast" or "be safe"; overly reductive, with predictably suboptimal results.  "Move fast with confidence" acknowledges the need for balance: cutting corners where you can afford it, while taking care in those places that help ensure you can *keep* moving fast later on.

## In search of quality

But what about quality?  The slogan doesn't address it.  Should you just [stop talking about quality]({% post_url 2016-02-24-quality-vs-empathy %}), as my earlier post provocatively suggested?  In product development we want to do more than just reach the finish line.  Discussing risks and deadlines is an effective way to communicate, but it's also cold and rational.  Where do intuition, creativity and vision fit in?  What about pride in a job well done?

I think the way to reconcile this is to recognise that quality, as Julie Zhou has eloquently argued, is [a bar, not a tradeoff](https://medium.com/the-year-of-the-looking-glass/quality-is-not-a-tradeoff-bcddf7c85553).  Julie concludes: "quality happens because it cannot happen otherwise".

Quality is a _cultural value_.  Quality means different things to different people.  Teams will vary on how they define quality, and how highly they prioritise it against other factors.  But wherever you and your team set the quality bar is part of the *cultural context* in which you make decisions about schedule and scope.

Your cultural quality bar isn't something to be traded off - *in general*.  There will always be *specific cases* where you do need to accept a lower level of quality in order to achieve some goal.  Sometimes you need a demo ready for the conference announcement.  Sometimes you don't understand the use case well enough yet to know what solving it with high quality would even look like.  But those cases should be *exceptional*.  If you're lowering your quality bar as a matter of course, then your culture doesn't actually value quality as much as you think it does!

## Move fast, together

This provides a way to talk about quality within the framework of confidence.  Rather than "should we do it well or do it fast?", you might more productively ask:

 * How confident are you that this feature meets the bar?  (Are you proud of it?  Do you have adequate test coverage?  Have you beta tested the design to make sure it's easy to use?)
 * In those hopefully rare circumstances where you choose to lower the bar, how confident are you in your reasons for doing so?  (Will you learn enough by shipping with known issues?  Is the deadline business critical, or just somebody's misguided attempt at motivation?)
 * Planning to ship now and fix that bug in version 2?  How confident are you that will really happen?  (Do you trust your process for bug tracking and triage?  Will you get pulled onto another project once you ship?)
 * If you lower the bar this time, how will that affect your confidence in being able to ship the next thing?  Are you confident in that tradeoff?
 * By lowering the bar this time, are you sure you're not [setting a bad precedent](http://donellameadows.org/archives/drift-to-low-performance/)?

These are [difficult decisions in the face of constraints]({% post_url 2016-02-24-quality-vs-empathy %}#common-ground).  They need to be made together, and so they require communication.  You need a common understanding of the quality bar, and a shared language for talking about the tradeoffs involved.  Talking about your levels of confidence can provide that [common ground]({% post_url 2016-05-20-confidence %}#better-conversations-better-decisions).

Because it's not just you running across that uneven terrain.  It's you and your team, and - to stretch the metaphor a bit - you all need to get across.  One of you might have run across this field before, and knows which shortcuts are actually swamps.  One of you has a compass.  Another has a map.

Working together, you can **move fast with confidence**.

<p class="credits">
Follow me on
<a href="https://twitter.com/intent/follow?screen_name=samstokes">Twitter (@samstokes)</a>
or
<a target="_blank" href="https://www.linkedin.com/in/samstokesuk">LinkedIn</a>.
</p>

---
{% comment %} Line between the post body and the footnotes {% endcomment %}
