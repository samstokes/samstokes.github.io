---
layout: post
title: Startup engineering (part 2)
date: 2016-10-10 18:52:51 -0700
comments: true
---


So if your team cares about nimbleness, learning, sustainable speed and simplicity, what does that mean day to day?  I want to discuss some common engineering practices using this framework.

My goal here is not to prescribe: I don't claim every team should do exactly these things, or that you are guaranteed success if you do so.  Your team will have other values besides these ones, and your mileage may vary.  Rather, I aim to offer a *constructive* theory of early-stage startup engineering.  The problem with having "get shit done" as your only engineering value is that it's defined negatively: anything which doesn't look like immediate, visible progress must be a waste of time, which makes it impossible to evaluate which practices are helpful for your circumstances.

**TODO** would rather end on a positive note.

<!-- more -->

### Code review

Code review can be pretty costly.  Reviewing code takes some percentage of the time that code took to write, so it's a guaranteed drag on your speed.  Nevertheless, in my experience, reviewing all changes[^mandatory-review] before they go to production[^pre-commit] is one of the most valuable habits an engineering team can have.

**TODO**

[^mandatory-review]: I don't believe in mandatory review, where tooling prevents you from checking in unreviewed code: that just generates lots of vacuous "LGTM" reviews to get around the check.  There are always changes too trivial to merit the overhead of a review, and startups especially have to be flexible.  Establishing a cultural norm of code review and helping everyone see the benefit is much more effective.

[^pre-commit]: Or, more specifically, before they are committed to the team's master branch.  This is sometimes called *pre-commit* review.  Some teams choose *post-commit* review, to avoid delaying changes from shipping.  In contrast to pre-commit review, I have never seen a post-commit review that was worth the time spent on it.

### Design and refactoring

**TODO**

### Testing

**TODO**

### Crunch mode

**TODO**

### Process

**TODO**

### Continuous delivery

**TODO**

### Monitoring / exception notification

**TODO**

### Analytics

**TODO**

### Infrastructure

**TODO**


---
{% comment %} Line between the post body and the footnotes {% endcomment %}
