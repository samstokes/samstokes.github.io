---
layout: post
title: "Speed versus quality"
date: 2016-05-20 11:26:29 -0700
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

Here's a way to reframe those "speed versus quality" tradeoffs.  Investing in automated tests for feature X will increase your confidence that you won't accidentally break X in the future; but it might decrease your confidence of shipping X this week.  Cleaning up unnecessary noise from your server logs will increase your confidence that you'll be able to diagnose issues when customers report them.  Deprecating that legacy system will increase your confidence in being able to add new features when the product manager requests them.

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

