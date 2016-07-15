---
layout: post
title: Move fast with confidence
date: 2016-07-11 00:37:27 -0700
description: >
  &quot;Speed vs quality&quot; is a false choice in product development.  Sometimes the
  best way to run fast is to be confident in your footing.
featured: true
comments: true
hero_image: move-fast/rocky-ground.jpg
hero_image_alt: Boot on rocky ground
vim: nolist linebreak wrap
---

If you work on a software product team, you've probably heard, or said, things like this:

> * "The deadline is unreasonable, I can't do a quality job in that time."
> * "Just ship it already, it doesn't need to be perfect."
> * "Shipping quickly is the priority, so we don't have time for testing and code review."
> * "We've been moving too fast recently and breaking too many things.  We need to slow down and be more careful."

These sorts of statements often come up when discussing schedule or scope.  They [frame](https://en.wikipedia.org/wiki/Framing_effect_(psychology)) the decision being made as a choice between two approaches: you can do it *fast* or do it *well*, but not both.

I believe that "speed vs quality" is a false choice.  Each time we naïvely frame a decision this way, we do a disservice to ourselves and to our users.  Sometimes the best way to run fast is to be confident in your footing.

<!-- more -->

Doing things well helps you move faster:

 * You can add features more quickly to a clean, well-engineered codebase than to a messy conglomeration of well-intentioned hacks.
 * Time you spend figuring out whether your new feature broke the old one is time you aren't spending on the next new feature.
 * I've even seen teams literally build the same feature twice, because the first time it shipped broken and nobody noticed.  Taking more care the first time would have *saved* effort.

Conversely, moving fast helps you do things better:

 * The sooner you find out how people will use the product, the sooner you know which features to improve and which ones to drop; which kinds of change to engineer for, and which kinds will never happen.
 * Code isn't really done until it's handling production traffic -- and recovering gracefully from that bad input that you thought would never happen, but happens reliably 1% of the time in production.

## Move fast with confidence

"Do it well or do it fast" is asking the wrong question.  The right question is where to focus your effort.  As I've argued before, it can help to frame that decision around [confidence]({% post_url 2016-05-20-confidence %}):

 * Building a really solid, beautifully designed version of feature X might be satisfying, but how confident are you that you know how X will be used - or even *if* it will be used?
 * Conversely, if you ship a buggy, incomplete version of feature X, are you confident you'll really learn anything from user feedback about it?
 * If you invest in automated tests for feature X, are you still confident in shipping this week?
 * If you *don't* invest in automated tests for X, are you confident you won't accidentally break X in the future?
 * If you don't clean up your noisy server logs, are you confident that you'll be able to diagnose issues when customers report them?
 * If you keep maintaining that system that nobody fully understands, are you confident in being able to add new features without getting surprised or delayed by legacy constraints?
 * If you shut down the legacy system, are you confident you know about all the downstream systems that will break?

Of course you want to move fast, but *fast isn't enough*.  You want to be confident that what you're shipping is useful.  You want to be confident that you'll know if it breaks.  You want to be confident that you'll be able to *keep* moving fast in the future.

To put this in the form of a slogan: __"Move fast with confidence"__.[^move-fast-and-break-things]

[^move-fast-and-break-things]: This might be reminiscent of another famous slogan, "Move fast and break things".  A slogan can't capture the full nuance of an engineering philosophy, but it can be an effective and memorable way to convey the spirit of what's important.  Facebook's slogan was, unfortunately, widely taken to mean "things being broken is fine".  The intended subtext was really: move fast and *don't be afraid to* break things, *because you can move fast to fix them too* -- which is a lot less irresponsible.  Maybe because of the misinterpretation, they later abandoned "Move fast and break things" in favour of ["Move fast with stable infra"](http://mashable.com/2014/04/30/facebooks-new-mantra-move-fast-with-stability/).

Consider running across rocky ground.  If you sprint headlong, as fast as you can, you're likely to trip over a rock, or twist your ankle.  Slowing to a walk isn't ideal either.  The trick is to be *aware* enough, and take just enough care, to be confident in your footing.  Look out for jagged rocks or crumbling earth where you need to step more carefully.  Identify those patches of clear, solid ground where you can afford to sprint.

[![Rocky ground]({{ "move-fast/rocky-ground.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/wakonda/14309389582)
{% comment %}
retrieved using:
wget -O- https://farm3.staticflickr.com/2935/14309389582_3a8b16169b_o_d.jpg | convert -shave 0x80 - source/images/move-fast/rocky-ground.jpg
{% endcomment %}

I don't claim this is anything novel.  I'm quite sure that high-performing teams are already thinking along these lines.  But I've seen too many engineering cultures whose implicit slogans were just "move fast" or "be safe"; overly reductive, with predictably suboptimal results.  "Move fast with confidence" acknowledges the need for balance: cutting corners where you can afford it, while taking care in those places that help ensure you can *keep* moving fast later on.

## In search of quality

But what about quality?  The slogan doesn't address it.  Should you just [stop talking about quality]({% post_url 2016-02-24-quality-vs-empathy %}), as my earlier post provocatively suggested?  In product development we want to do more than just reach the finish line.  Discussing risks and deadlines is an effective way to communicate, but it's also cold and rational.  Where do intuition, creativity and vision fit in?  What about pride in a job well done?

I think the way to reconcile this is to recognise that quality, as Julie Zhou has eloquently argued, is [a bar, not a tradeoff](https://medium.com/the-year-of-the-looking-glass/quality-is-not-a-tradeoff-bcddf7c85553).  Julie concludes: "quality happens because it cannot happen otherwise".

Quality is a _cultural value_.  Quality means different things to different people.  Teams will vary on how they define quality, and how highly they prioritise it against other factors.  But wherever you and your team set the quality bar is part of the *cultural context* in which you make decisions about schedule and scope.

Your cultural quality bar isn't something to be traded off - *in general*.  There will always be *specific cases* where you do need to accept a lower level of quality in order to achieve some goal.  Sometimes you need a demo ready for the conference announcement.  Sometimes you don't understand the use case well enough yet to know what solving it with high quality would even look like.  But those cases should be *exceptional*.  If you're lowering your quality bar as a matter of course, then your culture doesn't actually value quality as much as you think it does!

[![Quality]({{ "move-fast/quality.jpg" | image_url }}){: .center}](https://www.flickr.com/photos/dreamsjung/12613244714)
{% comment %}
retrieved using:
wget -O- https://farm4.staticflickr.com/3765/12613244714_d0dd1f4dc2_o_d.jpg | convert -shave 0x550 -resize 640x -unsharp 0x1 - source/images/move-fast/quality.jpg
{% endcomment %}

This provides a way to talk about quality within the framework of confidence.  Rather than "should we do it well or do it fast?", you might more productively ask:

 * How confident are you that this feature meets the bar?  (Are you proud of it?  Do you have adequate test coverage?  Have you beta tested the design to make sure it's easy to use?)
 * In those hopefully rare circumstances where you choose to lower the bar, how confident are you in your reasons for doing so?  (Will you learn enough by shipping with known issues?  Is the deadline business critical, or just somebody's misguided attempt at motivation?)
 * Planning to ship now and fix that bug in version 2?  How confident are you that will really happen?  (Do you trust your process for bug tracking and triage?  Will you get pulled onto another project once you ship?)
 * If you lower the bar this time, how will that affect your confidence in being able to ship the next thing?  Are you confident in that tradeoff?
 * By lowering the bar this time, are you sure you're not [setting a bad precedent](http://donellameadows.org/archives/drift-to-low-performance/)?

## Move fast, continuously

You might have noticed a theme in my bullet points above: a lot of them are about *how your decision now will affect the next time*.  It's pretty rare that you just want to ship something, once, and then never do any more work.  You ship one feature, you move on to the next feature.  You ship an initial version, you learn from user feedback, and you iterate.  Your strategy - or the market - changes, and your product changes with it.

Moving fast with confidence is more than just being confident in hitting the immediate goal: it's also *building* confidence that you can *keep hitting* goals - and confidence that you can adapt as goals change.  Often a little effort now can prevent you from getting stuck in the future.

Of course, it's a balance.  If you focus too much on the future, you can get stuck in analysis paralysis, or waste time optimising for something that never ends up happening.  Striking the right balance has to be a team effort, requiring a diversity of skills, and a shared understanding of the quality bar.  [Framing the discussion around confidence]({% post_url 2016-05-20-confidence %}#better-conversations-better-decisions) can provide a shared language for people with different skill-sets and risk tolerances.

Because it's not just you running across that rocky ground.  It's you and your team.  One of you might have run across this field before, and knows which shortcuts are actually swamps.  One of you has a compass.  Another has a map.

Only by working together can you **keep moving fast with confidence**.


<p class="credits">
This post is the third in a series.  If you found it interesting or
provocative, you may enjoy the other posts:
</p>
<ul class="credits">
  <li>
    Arguing that appealing to "quality" leads to unproductive discussions:
    <a href="{% post_url 2016-02-24-quality-vs-empathy %}">Let's stop talking about quality</a>.
  </li>
  <li>
    Proposing a better way of framing these conversations around confidence and risk:
    <a href="{% post_url 2016-05-20-confidence %}">Let's talk about confidence</a>.
  </li>
</ul>

<p class="credits">
Follow me on
<a href="https://twitter.com/intent/follow?screen_name=samstokes">Twitter (@samstokes)</a>
or
<a target="_blank" href="https://www.linkedin.com/in/samstokesuk">LinkedIn</a>.
</p>

<p class="credits">
Thanks to
<a href="https://www.linkedin.com/in/gbayer">Greg Bayer</a>,
<a href="https://www.linkedin.com/in/erranberger">Erran Berger</a>,
<a href="https://www.linkedin.com/in/conradirwin">Conrad Irwin</a>,
<a href="https://www.linkedin.com/in/leemallabone">Lee Mallabone</a>, and
<a href="https://www.linkedin.com/in/jeffwang11">Jeff Wang</a>
for reviewing a draft of this post.
</p>

<p class="credits">
Photo credits:
<a href="https://www.flickr.com/photos/wakonda/14309389582">Emilio Vaquer</a>
(boot on rocky ground, cropped to remove border), and
<a href="https://www.flickr.com/photos/dreamsjung/12613244714">Jason Taellious</a>
(the word "quality" painted on a wooden board, cropped from original).
</p>

---
{% comment %} Line between the post body and the footnotes {% endcomment %}
