---
layout: post
title: "Let's stop talking about quality"
date: 2016-02-24 14:16:06 -0800
featured: true
comments: true
vim: nolist linebreak wrap
---

I don't like discussions about quality in software.

Don't get me wrong.  I want to build software I can be proud of.  I want to be part of teams that build great products.  I aspire to craftsmanship.  What I dislike is the *word* "quality", and how it tends to polarise conversations.

[![Quality]({{ "quality/quality-wall.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/thomashawk/16564397826)

## Quality is subjective

A lot of factors go into software quality.  Good software is fast.  Good software is maintainable, readable, scalable, and well tested.  Good software has attractive UI and intuitive interactions.  Good software has no bugs, or at least no serious bugs, or at least no bugs that our customer support team can't work around.

In practice, quality means whatever you want it to mean.  To a fan of unit testing, quality means investing in unit testing.  To a designer, quality means beautiful screens and careful interaction design.  To a customer support manager, quality means all bugs are documented and the serious ones have an ETA.

If you tell people that your estimates are higher than expected because you want to do a quality job, some of them will think you're spending time refactoring and writing tests, and some will think you're going pixel-by-pixel in Photoshop.  Some of them will end up disappointed.

<!-- more -->

## Quality is boolean

Not only is quality subjective, it's also impossible to quantify.  It's not clear how much time spent focussing on quality will stop those production issues, or how much less quality you'll get if you do a rush job.  Do you want your products to be 50% better designed, or will 30% do?

That makes it hard to track quality over time, but that isn't the real problem.  The problem is that *quality leaves no room for discussion*.  Debates boil down to "do you want it done properly or not?"

Often this comes up in the form of a decision between quality and speed:

> * "We're a startup - we don't have time for testing and code review, or we'll miss the market window."
> * "We've been moving too fast and breaking too many things.  We need to slow down and be more careful."

If you frame it this way, you can choose speed or quality, but you can't have both.

[![Beta's in two weeks, quality workmanship can suck it]({{ "quality/quality-workmanship-can-suck-it.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/saeru/2334554340)
{% comment %}
retrieved using:
wget -O- https://c2.staticflickr.com/4/3216/2334554340_1d19a14464_o_d.jpg | convert -chop 0x$[ 900 - 768 ] -shave $[ (1200 - 1024) / 2 + 80 ]x80 -resize 640x -unsharp 0x2 - source/images/quality/quality-workmanship-can-suck-it.jpg
{% endcomment %}

## Quality is judgmental

It's not generally possible to argue against quality.  It's a rhetorical word, loaded with positive connotations.  That means discussions about *improving* quality tend to come across as criticism:

> "I can't do a quality job on this timeline."

"I can do a *bad* job, but why would you want that?  You must be wrong about when you need this."

> "I'd like us to invest in unit testing - it's a great way to improve the quality of your code."

"Our code is terrible right now."

> "We're having too many production issues, so we need to focus on quality."

"The team didn't do a good enough job.  *You* didn't do a good enough job.  The prod issues might be due to product management insisting on impossible requirements, or that reorg we had a month before launch, but can we all agree that a *quality* product wouldn't have these problems?"

## Quality creates factions

So quality is hard to argue against, hard to nail down, and it's all or nothing.  Not surprisingly, some people respond by rejecting the concept of quality as unhelpful.  Quality is a luxury we don't have time for; better to ship something than polish it forever.

What "we don't have time for quality" really means is: "I'm not sure what you mean by quality, but I know moving fast is more important than what *I* mean by quality".  Unfortunately, all too often what gets said is "we don't have time for quality".  Framed in these terms, there's no common ground, and we take up sides, each frustrated at the other's inability to see the big picture.

The pattern repeats at larger scales.  An engineering team can split into "pragmatic hackers" ("we just get the job done") and "serious engineers" ("gotta clean up the mess those cowboys make").  Or engineering can lose trust in the business ("don't those suits understand how short-sighted they're being?") and vice versa ("ignore the nerds grumbling about technical debt, they're always saying the sky is falling").

What's really going on here is a failure of communication.  This talk of factions might sound dramatic, but I bet you've heard variants of the above at the watercooler or the bar.  Every little joke and sarcastic aside serves to undermine trust and communication.

[![Argument]({{ "quality/argument.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/jeffeaton/7436909698)

## Common ground

The reality is that doing anything in the real world involves *difficult decisions in the face of constraints*.  Everyone has more exposure to some of those constraints than others.  The product manager sees customer feedback, feels the urgency of staying relevant in the market.  The designer sees limited screen real estate, the need to engage the user quickly.  The engineer sees maintenance costs and technical limitations.  But you're all working toward the same goal: ship products, grow the business, delight your customers.

The only way to do that is to *communicate*.  These conversations often seem like a contest between one person's viewpoint and another.  But the best answer for your situation probably has elements of both!  Instead of your diverse experiences getting in the way of a productive conversation, why not have them *be* the conversation?

Help other people understand the constraints you see, and you can work together to decide the best tradeoffs to make.  Understand the constraints another person faces, and you can understand how to help them.  Instead of negotiating, you can collaborate.

[![Communication]({{ "quality/communication.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/canonsnapper/8701575728)

## Empathy

Next time you're frustrated by an unrealistic deadline or an inflated estimate, instead of assuming that person just *doesn't get it* - ask how things look from where they are.  What does a product manager do every day?  What does it mean to an engineer that the code is a mess?  What was the designer trying to achieve with that colour change?

Instead of talking about quality, let's talk about goals.  We want to see whether customers engage with this new feature.  We want to cut down how often our engineers get paged at 3am.  We want the main features to be at most 3 clicks away.  We want to communicate the value of the product in the first 5 minutes.  Let's talk about how our different goals interact.  Maybe there's a way to do it that gets everyone closer to their goals?

Because that's the fun part.  That's why we work in teams - bringing our different strengths together, solving problems, to build something awesome.

So let's have less talk about quality, and more talk about empathy.  Go talk to someone.  Learn what makes them tick.  And make something cool together.

[![Teamwork]({{ "quality/teamwork.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/abiwt/10283999515)


<p class="credits">
Thanks to
<a href="https://twitter.com/paulbiggar">Paul Biggar</a>,
<a href="https://twitter.com/pvh">Peter van Hardenberg</a> and
Dorothy Li for reviewing a draft of this post.
</p>

<p class="credits">
Photo credits:
<a href="https://www.flickr.com/photos/thomashawk/16564397826">Thomas Hawk</a>
("quality" wall painting),
<a href="https://www.flickr.com/photos/saeru/2334554340">saeru</a>
("quality workmanship" sign, cropped from original),
<a href="https://www.flickr.com/photos/jeffeaton/7436909698">Jeff Eaton</a>
(Lego argument),
<a href="https://www.flickr.com/photos/canonsnapper/8701575728">Michael Summers</a>
(discussion with notebook), and
<a href="https://www.flickr.com/photos/abiwt/10283999515">the Anita Borg Institute</a>
(people collaborating around a laptop).
</p>
