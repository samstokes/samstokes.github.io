---
layout: post
title: "What is your level of confidence?"
date: 2016-02-15 15:55:29 -0800
comments: true
vim: nolist linebreak wrap
---

If you work on a software product team, you've probably heard, or said, things like this:

> * "Shipping quickly is the priority, so we don't have time for testing and code review."
> * "Your deadline is unreasonable, I can't do a quality job in that time."
> * "We've been moving too fast recently and breaking too many things.  We need to slow down and be more careful."

These sorts of statements come up in conversation about a decision to be made.  They [frame](https://en.wikipedia.org/wiki/Framing_effect_(psychology)) the conversation against a dichotomy: you can do it *fast* or do it *well*, but not both.

It's true that sometimes you have to choose between speed and quality.  However, they're not always at odds.  You can add features more quickly to a clean codebase than to a messy one.  Rapid feedback finds more edge cases and refines a design.

TODO TODO Everyone agrees with this and yet we still have arguments TODO TODO

We tend to frame conversations as "speed versus quality" even when the dichotomy is a false one.  Further, I propose that framing conversations this way is *harmful*, and that most conversations along these lines would go better if they were framed instead around *confidence*.

<!-- more -->

## Framing

An engineering team can split into "pragmatic hackers" ("we just get the job done") and "serious engineers" ("gotta clean up the mess those cowboys make").  Or engineering can lose trust in the business ("don't those suits understand how short-sighted they're being?") and vice versa ("ignore the nerds grumbling about technical debt, they're always saying the sky is falling").

This talk of factions might sound dramatic, but I bet you've heard the people you work with say things like the above.

## Common ground

I propose that nearly any conversation about quality would go better if instead it were a conversation about *confidence*.

> "We're going to have to cut feature X if we want to launch on time.  It'll take two months to build, but the deadline's in a month."
>
> "That's a shame - our competitors have that feature.  Are you sure there's no way to fit it in?"
>
> "We have a working prototype of X, but it's pretty slow - I wouldn't be confident in putting it in production.  It could bring down our servers."
>
> "X isn't a core feature, so we don't need 100% confidence in it.  Can we get to 80% confidence in a month?"
>
> "I guess we can run the prototype on its own servers so it won't harm the rest of the product.  But it could break, and we won't have monitoring, so we'll have to spend time after launch bringing it up to scratch."
>
> "That's okay, we can afford that time after launch, and if it breaks we can handle the support calls."

Confidence is something that translates well across job functions, and is something everyone can reason about.  The "80%" numbers can be arbitrary, but everyone understands the difference between 50% (a coin toss) and 99% (pretty certain).  Framing the discussion about confidence means you can actually have a reasonable discussion about tradeoffs.

## Disagreement about confidence

**TODO** restructure this section it's a mess

**TODO** draw explicit links between confidence, degree of understanding, risk tolerance.

Of course, this doesn't mean there will no longer be disagreements.  People will have knowledge of different aspects of the decision being made, which will lead them to differing levels of confidence.  People will differ in how confident they *prefer* to be in a given situation.

These are *good* disagreements: they are the reason you had the discussion in the first place, rather than just having one person decide.  You want to make sure you have sufficient confidence in all aspects of a product you are launching; not to push it out the door and *then* discover nobody tested it under load.  To make an informed decision, you want the people with the most knowledge of each aspect to assess their level of confidence.  And you want people with different comfort levels to be bought into the tradeoff you're making.  When the servers *do* catch fire, you don't want the people holding the fire extinguishers to feel like they're cleaning up someone else's mess, but that you made a decision together to mitigate some risks and accept others.

Taking different risk tolerances into account is especially tricky, because you have to do it deliberately.  If you let nature take its course, the more risk-averse people will tend to be overruled, or even ignored.  That's because if someone more comfortable with risk is making the final decision, one of the risks they're often prepared to accept is pissing off the risk-averse people!

## A better conversation

The next time you're in a conversation in which the phrase "good enough" is employed - especially if it seems like not every voice is being heard equally - try saying this: "I'm not sure everyone understands the same thing by the phrase 'good enough'.  Instead, could we each describe our level of confidence with the proposed decision?"

**TODO TODO**

Instead of absolutes like "quality", present alternatives; talk about the costs and benefits.

 * If we rush this feature out the door, what risks are you concerned about?
 * Why is it so important to ship this feature this week?
 * Can we do something simpler that would test the same product hypothesis?
 * If we've gone back and forth for a week over the best label for this button, maybe it's just a confusing button - can we just drop it?

It's really hard to answer these questions by arguing over absolutes, but you can make surprising progress with a few minutes of empathetic conversation.
