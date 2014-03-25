---
layout: post
title: "Grouping items in Angular.js"
date: 2014-03-10 18:02:45 -0700
comments: true
published: false
categories:
 - javascript
 - programming
---

tl;dr
-----

### TODO write a tl;dr section

summarise groupBy filter

link to github README

Philosophising
--------------

Angular.js is a quintessential framework. On its home turf, formerly
complex tasks become incredibly easy. Stray off the beaten path and
bears appear, demanding to wrestle.

![alt is
/images/grouping-items-in-angular-dot-js/bears.jpg](/images/grouping-items-in-angular-dot-js/bears.jpg "title is /images/grouping-items-in-angular-dot-js/bears.jpg")

TODO photo credit http://www.flickr.com/photos/wallyg/405661040/ and
joke about digest cycle

Grouping tasks
--------------

I'm building a task tracker app, and I wanted to group some tasks by
the day they were completed - so if you finished several tasks on Feb
28th, they'd all show up under that date.

<figure class="figure-example">
  <h3>
    Feb 28
  </h3>
  <ul>
    <li>
      Cleaned bedroom
    </li>
    <li>
      Wrote blog post
    </li>
    <li>
      Bought milk
    </li>
  </ul>

  <h3>
    Feb 27
  </h3>
  <ul>
    <li>
      Wrestled bears
    </li>
  </ul>
</figure>

Easy! We'll just use [`_.groupBy`](http://underscorejs.org/#groupBy) and
a nested `ng-repeat`:

``` html
{% raw %}
<div ng-repeat="(day, dayTasks) in _(tasks).groupBy('day')">
  <h3>{{day}}</h3>
  <ul>
    <li ng-repeat="task in dayTasks">{{task.title}}</li>
  </ul>
</div>
{% endraw %}
```

And the result:
<figure class="figure-example">
</figure>

... oh. Maybe `_(tasks).groupBy('day')` was too complex an expression
for `ng-repeat` to parse. Never mind, that's what filters are for:

``` javascript
app.filter('groupBy', function () {
  return function groupBy(items, field) {
    return _(items).groupBy(field);
  };
});
```

TODO

``` html
{% raw %}
<div ng-repeat="(day, dayTasks) in tasks | groupBy:'day'">
  <h3>{{day}}</h3>
  <ul>
    <li ng-repeat="task in dayTasks">{{task.title}}</li>
  </ul>
</div>
{% endraw %}
```

Great!

<figure class="figure-example">
  <div>
    <h3>
      Feb 27
    </h3>
    <ul>
      <li>
        Wrestled bears
      </li>
      </ul>
    </div>
    <div>
    <h3>
      Feb 28
    </h3>
    <ul>
      <li>
        Cleaned bedroom
      </li>
      <li>
        Wrote blog post
      </li>
      <li>
        Bought milk
      </li>
    </ul>
  </div>
</figure>

And if we add tasks to our `tasks` model, the days update, adding new
days when needed. Great! End of blog post.

Except... the page is kind of slow to respond now. And wait, what's that
in the developer console?

![alt is
/images/grouping-items-in-angular-dot-js/digest-overflow.png](/images/grouping-items-in-angular-dot-js/digest-overflow.png "title is /images/grouping-items-in-angular-dot-js/digest-overflow.png")
 "10 \$digest() iterations reached. Aborting!" Our simple filter seems
to have given Angular indigestion, and it's vomiting its internals all
over the console.

The digest cycle
----------------

The problem lies at the heart of Angular's declarative data-binding
goodness. We update the scope and Angular figures out which bits of the
DOM to redraw to reflect our changes. Isn't it great how that just
works? Except this time it didn't just work.

Angular scopes let you
["watch"](http://code.angularjs.org/1.2.14/docs/api/ng/type/$rootScope.Scope#$watch)
an expression, supplying a function to be called on any change to the value of
the expression. `ng-repeat` registers a watcher on the collection that we loop
over, so if the collection changes, it can re-render its DOM. A simplified
version[^simplifications] of what's going on:

[^simplifications]: TODO discuss simplifications - `$watchCollection`, `$$hashKey`

``` javascript
$scope.$watch("tasks | groupBy:'day'", function (collection) {
 // collection is set to the grouped tasks output by our groupBy filter

 for (var i in collection) {
   // render i in its own scope
 }
});
```

Whenever a scope's properties change (TODO footnote to discuss how it
notices - `$apply`), the scope calls a function called
[`$digest`](http://code.angularjs.org/1.2.14/docs/api/ng/type/$rootScope.Scope#$digest),
which triggers all that scope's watchers, passing them the new value of
the expression they're watching. That's how we can just
`tasks.push(newTask)` and have the DOM automatically update to contain
our new task.

Watchers can do more than render DOM, though. Your watcher function can
do anything you like in response to a change, including updating scope
properties. That could change the value of an expression another watcher
was watching, so that watcher would need to trigger again.

To ensure every watcher gets a chance to react to changes made in
watcher functions, `$digest` reevaluates all the watch expressions, and
[checks if any of them
changed](https://github.com/angular/angular.js/blob/v1.2.14/src/ng/rootScope.js#L585-L589)
since the last time around. If the value of an expression changed, it
triggers that watcher again; and if the value of *any* expression
changed, it repeats the whole cycle. It keeps going either until all the
expressions have the same value as the previous "digest cycle", or until
it's run through the cycle ten times, at which point it bails out,
throwing the "10 \$digest() iterations reached" exception we saw above.

*TODO* maybe simplified code snippet illustrating this?

*TODO* link to [angular docs](
http://docs.angularjs.org/guide/scope#scope-life-cycle
)

Everybody's changing, but I still feel the same
-----------------------------------------------

But we should still be fine. Our watchers aren't modifying each others'
expressions, and our data only changes when we tell it to, so the second
digest cycle should see the same data as the first, and terminate...
right?

Well, the problem is with how `$digest` determines "the same". It
compares the objects from the previous cycle with those from the current
cycle using the `===` operator, which compares objects by reference
equality - i.e. it returns true only when comparing an object with
itself. Two objects with identical properties won't cut
it.[^ng-repeat-optimisation]

[^ng-repeat-optimisation]: (TODO footnote explaining that ngRepeat actually overrides that logic, but has the same issue: <https://github.com/angular/angular.js/blob/v1.2.14/src/ng/rootScope.js#L465>)


But Underscore's `_.groupBy` has to build arrays to hold the groups, and
a container object to map keys to groups - and it builds new ones each
time we call it. That means our groupBy filter is returning new - albeit
identical - results each digest cycle. So `$digest` keeps detecting a
change, and keeps running the watchers, hoping we'll eventually give it
the same objects as it saw before... but we never do.

Semi-abandoned spare content
============================

TODO all lies, it's this line:
------------------------------

https://github.com/angular/angular.js/blob/v1.2.14/src/ng/rootScope.js\#L465

The problem is an optimisation inside ng-repeat to avoid excessively
redrawing the DOM. If we add a new item, we just want to render that
item and add it to the DOM - not redraw the whole list, which would be
slow and cause ugly flickering. Likewise, if we delete an item, we just
want to delete that item's DOM. So ng-repeat keeps track of which
objects it's already seen, and [associates them with the DOM nodes it
rendered for
them](https://github.com/angular/angular.js/blob/v1.2.14/src/ng/directive/ngRepeat.js#L249-L254).

Except Javascript, bless its heart, doesn't actually have a concept of
"which object". You can test (with `===`) whether an object is the same
object as another object, but you can't get a unique identifier for an
object. So Angular improvises:
https://github.com/angular/angular.js/blob/v1.2.14/src/apis.js\#L4-L16

TODO actually it's not really the digest cycle, it's the group objects not preserving \$\$hashKey!
--------------------------------------------------------------------------------------------------

ng-repeat watches collection

works out what elements changed to avoid full redraw

sets \$\$hashKey property on each element to check "same"

### Semi-abandoned previous version:

The problem lies at the heart of Angular's declarative data-binding
goodness. We update the scope and Angular figures out which bits of the
DOM to redraw to reflect our changes. Isn't it great how that just
works? Except this time it didn't just work.

Angular lets you register "watcher" functions on a scope, which it will
call on any change to that scope. `ng-repeat` registers a watcher on the
array that we loop over, so if the array changes, it can re-render its
DOM.

Watchers can do more than that, though. You can watch any expression,
not just a single object. And your watcher function can do anything you
like in response to a change, including updating the scope. So Angular
might need to fire more watchers, or even the same one again!

In order to know which watchers to fire, after any change to a scope,
Angular calculates a "digest" of that scope.

*TODO* link to [angular
docs](http://docs.angularjs.org/guide/scope#scope-life-cycle)

Copious Googling
----------------

http://stackoverflow.com/questions/18350116/angular-js-trying-to-many-iterations-when-wrapping-ng-repeat

http://stackoverflow.com/questions/16507040/angular-filter-works-but-causes-10-digest-iterations-reached/16511982\#16511982

http://stackoverflow.com/questions/19863873/angularjs-infinite-digest-loop-when-no-scope-changes

http://stackoverflow.com/questions/19406126/10-digest-iterations-reached-aborting-scope-function-issue

http://www.bennadel.com/blog/2456-Grouping-Nested-ngRepeat-Lists-In-AngularJS.htm
