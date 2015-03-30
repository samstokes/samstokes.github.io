---
layout: post
title: "Let's talk about confidence, not quality"
date: 2015-01-31 16:22:00 -0800
comments: true
categories: snaffle, copter
vim: nolist linebreak wrap
---

I don't like discussions about software quality.

Don't get me wrong.  I want to build software I can be proud of.  I want to be part of teams that build great products.  I aspire to craftsmanship.  What I dislike is the *word* "quality", and how it frames conversations.

## Quality is judgmental

It's not generally possible to argue against quality.  It's a rhetorical word, loaded with positive connotations.  That means discussions about *improving* quality tend to sound like criticism:

> "I can't do a quality job on this timeline."

"I can do a *bad* job, but why would you want that?  You must be wrong about when you need this."

> "I'd like us to invest in unit testing - it's a great way to improve the quality of your code."

"Our code is terrible right now."

> "We're having too many production issues, so we need to focus on quality."

"The team didn't do a good enough job.  *You* didn't do a good enough job.  The prod issues might be due to product management insisting on impossible requirements, or that reorg we had a month before launch, but can we all agree that a *quality* product wouldn't have these problems?"

## Quality is subjective

A lot of factors go into software quality.  Good software is maintainable, readable, scalable, and well tested.  Good software has attractive UI and intuitive interactions.  Good software has no bugs, or at least no serious bugs, or at least no bugs that our customer support team can't work around.

What this means in practice is that quality means whatever you want it to mean.  To a fan of unit testing, quality means investing in unit testing.  To a designer, quality means beautiful screens and careful interaction design.  To a customer support manager, quality means all bugs are documented and the serious ones have an ETA.

If you tell people that your estimates are higher than expected because you want to do a quality job, some of them will think you're spending time refactoring and writing tests, and some will think you're going pixel-by-pixel in Photoshop.  Some of them will end up disappointed.

## Quality is boolean

Not only is quality subjective, it's also impossible to quantify.  It's not clear how much focus on quality will stop those production issues, or how much less quality you'll get if you do a rush job.  Do you want your products to be 50% better designed, or will 30% do?

The problem isn't that you can't graph quality over time.  The problem is that *quality leaves no room for discussion*.  Debates boil down to "do you want it done properly or not?"

Often this comes up in the form of a decision between quality and speed:

> * "We're a startup - we don't have time for testing and code review, or we'll miss the market window."
> * "We've been moving too fast and breaking too many things.  We need to slow down and be more careful."

If you frame it this way, you can choose speed or quality, but you can't have both.

## Quality creates factions

So quality is hard to argue against, hard to nail down, and it's all or nothing.  Not surprisingly, some people respond by rejecting the concept of quality as unhelpful.

What "we don't have time for quality" really means is: "I'm not sure what you mean by quality, but I know moving fast is more important than what *I* mean by quality".  Unfortunately, all too often what gets said is "we don't have time for quality".  Framed in these terms, there's no common ground, and we take up sides, each frustrated at the other's inability to see the big picture.

The pattern repeats at larger scales.  An engineering team can split into "pragmatic hackers" ("we just get the job done") and "serious engineers" ("gotta clean up the mess those cowboys make").  Or engineering can lose trust in the business ("don't those suits understand how short-sighted they're being?") and vice versa ("ignore the nerds grumbling about technical debt, they're always saying the sky is falling").  This might sound dramatic, but it probably also sounds vaguely familiar.

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
> "I guess we can run the prototype on its own servers so it won't harm the rest of the product.  But we'll only be at 80%, so we'll probably have to spend more time fixing it after launch."
>
> "That's okay, we can afford that time after launch."
