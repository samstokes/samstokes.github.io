---
layout: post
title: Startup engineering (part 1)
date: 2016-10-10 12:51:02 -0700
comments: true
hero_image: startup-engineering/determined-dog-running.jpg
hero_image_alt: Determined dog running
description: >
  What should the engineering team of an early-stage startup care about?
  Nimbleness, learning, sustainable speed.
---

What should the engineering team of an early-stage startup care about?

The obvious answer: making the startup succeed.  [Making something people want][pg-good], growing revenue, landing that big customer or the next funding round.  But *everyone* in a startup cares about those things.  What should engineering, specifically, care about, in order to make the startup succeed?

There's loads of advice online about how to be effective founders, how to refine your business plan, how to validate your product thesis.  But I haven't found much written about effective *engineering* for early-stage startups.  This is a shame, because for most startups, engineering is pretty important.  It's how you build your product - not to mention probably the majority of your headcount - so the way you go about it will affect the kind of product you build, and even the way your company operates.

[![Happy dog running]({{ "startup-engineering/happy-dog-running.jpg" | image_url }}){: .center .small}](https://www.flickr.com/photos/doug_weston2/8156277561){:target="_blank"}

When you do find advice about startup engineering, it tends to be limited to cursory admonishments to "move fast" and "get shit done".  These slogans aren't *wrong*, but they are overly dismissive and reductive.  They suggest that the *way* you do things doesn't matter at all: anything which doesn't look like immediate, visible progress must be a waste of time.  This all but rules out introspection and improvement.  It offers no help with answering questions like:

 * Should we do code review?
 * How do we prioritise maintenance work versus developing new features?
 * Is it worth it to host our own infrastructure rather than using a cloud platform?

I'd like to suggest a more constructive theory of what an early-stage startup engineering team should care about, to help answer those kinds of questions.

[pg-good]: http://www.paulgraham.com/good.html

<!-- more -->


## "Culture is what people do when nobody is looking"

You might think asking what an engineering team *cares* about is fluffy and impractical.  But what your team cares about has a big impact on the way you operate: where you focus your effort, which activities you encourage and which ones you try to minimise.

 * A team that cares a lot about moving fast will spend a lot of time identifying the obstacles that slow them down, and removing or circumventing them.
 * A team that cares a lot about avoiding downtime will think a lot about ways their changes could break things, and set up systems to detect and resolve outages.
 * A team that cares a lot about operating cost will spend a lot of time optimising their resource usage, maybe running their own servers rather than outsourcing to a cloud provider.

Notice I didn't say "*should* spend a lot of time", but "*will*".  If you talk about something at lunch, stick posters on the wall about it and chart it on plasma screens, people will inevitably start to prioritise it.  If they come up with an idea or notice some problem, they're more likely - even subconsciously - to work on the idea rather than dismiss it if it's relevant to the charts on those screens.


## Core values

So what *should* a startup engineering team care about?

Clearly this will depend somewhat on the business you are in.  If you handle payments, your top priorities are probably security and data integrity, narrowly followed by uptime.  If you're making a game, maybe users will tolerate the occasional outage, but fast UI is essential to keep them playing.  But I think for most early-stage[^early-stage] startups, there are a few core engineering values in common: *nimbleness*, *learning*, *sustainable speed*, and *simplicity*.

[^early-stage]: By "early stage" I mean that one or more of the following is true: still searching for [product/market fit][pmfit], team is max 10 people, raised at most a seed round or possibly Series A.  My experience is in web-based software startups, so what I'm saying may be less applicable outside that space.

[pmfit]: https://en.wikipedia.org/wiki/Product/market_fit

### Nimbleness

[![Dog pivoting in mid-air]({{ "startup-engineering/midair-pivot.jpg" | image_url }}){: .right .mini}](https://www.flickr.com/photos/jonhurd/13724919){:target="_blank"}

Most of all, an early-stage startup needs to be *nimble*.[^agile]  You don't yet know yet what will make your product a success.  You have a current best guess, derived from the product vision and your learnings so far; but that best guess is likely to change frequently and with little warning.  You might need to support a new use case you never designed for, or abandon a feature that last week you thought would be essential.

Being nimble isn't just shipping features quickly, although that certainly helps.  It's about being able to *change direction* quickly.  It's a property of how quickly you can come to a shared understanding of the new direction, and how quickly individuals shift gears to react to the change. And it's a property of your codebase, how deeply your assumptions are embedded in it, and how hard it is to change.

[^agile]: You might also call this quality "agility", but the term "agile" has become strongly associated with the "Agile movement", which has [diluted the original meaning][agile-is-dead] of the term with a plethora of methodologies, certifications and process consultants.  The spirit of the original [Agile manifesto][agile-manifesto] is in line with what I mean by nimbleness, but Scrum and Extreme Programming are certainly not what I'm advocating here.

[agile-is-dead]: https://pragdave.me/blog/2014/03/04/time-to-kill-agile/
[agile-manifesto]: http://agilemanifesto.org/

### Learning

An early-stage startup is trying to realise a product vision, while continually validating and adapting that vision according to market reality.  That requires access to high-quality data about what people want, how they interact with your product, and how they react to the changes you push out.  You need that data *quickly* - being nimble doesn't help if you're acting on stale information!

Depending on your business, engineering may be more or less involved for actually gathering the data.  If you have a small number of users, the best way to learn is just to talk to them, or read their feedback.  If you have millions of users, talking to them (while still valuable) will yield at best a small, biased sample, but you can learn a lot from metrics and A-B testing.

Regardless, engineering must deliver a product you can [confidently][confidence] learn from.  If you push out a feature with a highly visible bug, most of the feedback you get will be about that bug, not about how well the feature solves users' problems.  If you're trying to understand your high churn rate, but you have frequent outages or periods of slowness, you can't tell if users are leaving because they don't need your product, or just because they don't trust it to work properly.

[confidence]: {% post_url 2016-05-20-confidence %}

### Sustainable speed

Overnight success is a myth.[^overnight-success]  What you consider success is a personal matter - helped thousands of people, had a lucrative exit, made the world a better place - but it's probably going to take *years*.  Your initial launch is not success; nor is your first funding round.  A startup is a marathon, not a sprint.[^sprint]

[![Determined dog running]({{ "startup-engineering/determined-dog-running.jpg" | image_url }}){: .center .small}](https://www.flickr.com/photos/glaciertim/4320524072){:target="_blank"}

This implies that while reaching that initial launch quickly is important, it's *not enough*.  If rushing out the initial launch creates a pile of technical debt that slows down every subsequent new feature, or makes you less nimble, that might not have been a good tradeoff.  Likewise, if the team is constantly firefighting production issues, that can destroy your focus, not to mention morale.  Maybe you can raise a bunch of money off that initial launch, and hire a bigger team to offset the technical debt and fix all the bugs - but first [Fred Brooks][mythical-man-month] would like a word with you.

All that said, raw speed is really important too.  Moving fast makes you more nimble, and it lets you learn faster.  So the key is to find ways to [move fast *sustainably*][move-fast-with-confidence]: so that you keep moving fast even as your team and codebase grow.

Balance is needed, because you don't want to optimise for a future that never happens.  If your startup runs out of money and dies, it no longer matters how quickly you can iterate.  On the flip side, it's equally pointless to scrape over the first hurdle only to burn out before the finish line.

[^overnight-success]: I was trying to find the original source of the quote "It takes ten years to become an overnight success", but I came up with an [entire page of variations][overnight-success-quote] by different people.  I view this as at least corroborating my claim that overnight success is a myth.

[^sprint]: The Scrum methodology uses the term "sprint" as the primary unit of planning, where the team conducts a series of sprints, one sprint beginning immediately after the previous sprint ended.  This seems to me a severe form of cognitive dissonance.

[overnight-success-quote]: https://www.google.com/search?q=overnight%20success%20quote
[mythical-man-month]: https://en.wikipedia.org/wiki/The_Mythical_Man-Month
[move-fast-with-confidence]: {% post_url 2016-07-11-move-fast-with-confidence %}

### Simplicity

If your engineering team cares about nimbleness, learning, and sustainable speed, it helps a lot to also care about *simplicity*.

If your codebase and architecture are simple and easy to understand, not only can you change it more quickly - if your underlying assumptions change, simple, cleanly factored code is also easier to [*throw away*][inventory], and replace with something that fits the new requirements.  A simple product is easier to learn from than one cluttered with features and settings.

Valuing simplicity means ongoing effort to *keep* things simple.  Every new feature naturally creates complexity, and restoring simplicity takes effort and discipline.  It means dropping features that are unused or hard to maintain; going back and addressing the workarounds and special cases.  In extreme circumstances, you may need to push back on the product direction if it would make the system too complex.

[![Dog made a mess]({{ "startup-engineering/dog-made-a-mess.jpg" | image_url }}){: .center .small}](https://www.flickr.com/photos/mackenzieblack/5235085338){:target="_blank"}

Keeping things simple also means resisting overengineering.  A quick, messy, unscalable solution might still be *simpler* than the new abstraction or infrastructure you might need for the "right" solution.  Premature generalisation is a great way to make your system harder to understand and change.  Simplicity means deferring that work until you're confident you need it, but also having systems in place to ensure you'll revisit the quick hack once you do need to.

Valuing simplicity sounds, counterintuitively, like a lot of work, but it's one of the keys to sustainable speed: that natural creep toward complexity is one of the things that slows you down.  Resisting the creep is, of course, an unwinnable battle - your system will never again be as simple as your first version - but fighting it anyway lets you retain some control over your destiny.  Investing in tools and automation can reduce the effort involved in keeping things simple.

[inventory]: http://blog.cognitect.com/blog/2016/3/17/the-new-normal-protected-asset-or-disposable-inventory


## Putting it into practice

In part 2 of this post, I will discuss common engineering practices like code review, automated testing, continuous delivery and crunch mode.  I'll show how to evaluate practices by their effect on nimbleness, learning, sustainable speed and simplicity.


<p class="credits">
This post is the first in a two-part series.  If you'd like to know when part 2 is published, you might want to follow me on
<a href="https://twitter.com/intent/follow?screen_name=samstokes">Twitter (@samstokes)</a>
or
<a target="_blank" href="https://www.linkedin.com/in/samstokesuk">LinkedIn</a>, or subscribe to my
<a target="_blank" href="/atom.xml">RSS feed</a>.
</p>

<p class="credits">
Photo credits:
<a href="https://www.flickr.com/photos/doug_weston2/8156277561">Doug Weston</a>,
<a href="https://www.flickr.com/photos/jonhurd/13724919">Jon Hurd</a>,
<a href="https://www.flickr.com/photos/glaciertim/4320524072">Tim Shields</a>, and
<a href="https://www.flickr.com/photos/mackenzieblack/5235085338">Mackenzie Black</a>.
</p>


---
{% comment %} Line between the post body and the footnotes {% endcomment %}
