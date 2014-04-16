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

<figure class="figure-example figure-right">
  <h3>
    Feb 27
  </h3>
  <ul>
    <li>
      Wrestled bears
    </li>
  </ul>

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
  <figcaption>Tasks grouped by day</figcaption>
</figure>

I've released a `groupBy` filter for [Angular.js](http://angularjs.org), for
building features like the one on the right.  You can find it [on Github](
https://github.com/samstokes/TODO
).  The rest of this post explains why that's worth blogging about!


Motivation
----------

I'm building a task tracker app in Angular.js, and I wanted to group some tasks
by the day they were completed - so if you finished several tasks on Feb 28th,
they'd all show up under that date.

After a few frustrated attempts, I turned to Google.  I quickly discovered that
[grouping](http://www.bennadel.com/blog/2456-Grouping-Nested-ngRepeat-Lists-In-AngularJS.htm)
[is](http://stackoverflow.com/questions/16507040/angular-filter-works-but-causes-10-digest-iterations-reached/16511982#16511982)
[a](http://stackoverflow.com/questions/19406126/10-digest-iterations-reached-aborting-scope-function-issue)
[popular](http://stackoverflow.com/questions/14800862/how-can-i-group-data-with-an-angular-filter)
[topic](http://odetocode.com/blogs/scott/archive/2013/08/08/group-and-display-data-with-underscore-and-angularjs.aspx)
[of](http://stackoverflow.com/questions/19992090/angularjs-group-by-directive)
[confusion](http://stackoverflow.com/questions/14462015/angular-grouping-filter)
in Angular.  The solutions I found on StackOverflow and blogs felt like
unsatisfying workarounds.[^other-approaches]  So I dove into the Angular source
code, determined to find out why this apparently simple task was so hard.

[^other-approaches]: TODO directive, pre-grouping in controller with $watch



First attempts
--------------

If you've ever used [Underscore.js](http://underscorejs.org), grouping seems
like it should be pretty easy.  We'll just use
[`_.groupBy`](http://underscorejs.org/#groupBy) and a nested `ngRepeat`:

``` html
{% raw %}<div ng-repeat="(day, dayTasks) in _(tasks).groupBy('day')">
  <h3>{{day}}</h3>
  <ul>
    <li ng-repeat="task in dayTasks">{{task.title}}</li>
  </ul>
</div>{% endraw %}
```

And the result:
<figure class="figure-example">
</figure>

... oh. Maybe `_(tasks).groupBy('day')` was too complex an expression
for `ngRepeat` to parse. Never mind, we should probably have used a filter here
anyway:

``` javascript
app.filter('groupBy', function () {
  return function groupBy(items, field) {
    return _(items).groupBy(field);
  };
});
```

Now our `ngRepeat` expression is nice and clean:

``` html
{% raw %}<div ng-repeat="(day, dayTasks) in tasks | groupBy:'day'">
  <h3>{{day}}</h3>
  <ul>
    <li ng-repeat="task in dayTasks">{{task.title}}</li>
  </ul>
</div>{% endraw %}
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

And if we add tasks to our `tasks` model, it updates the grouping, adding new
days when needed. We're done! End of blog post.

Except... the page is kind of slow to respond now. And wait, what's that
in the developer console?

![alt is
/images/grouping-items-in-angular-dot-js/digest-overflow.png](/images/grouping-items-in-angular-dot-js/digest-overflow.png "title is /images/grouping-items-in-angular-dot-js/digest-overflow.png")
 "10 $digest() iterations reached. Aborting!" Our simple filter seems
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
the expression. `ngRepeat` registers a watcher on the collection that we loop
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
throwing the "10 $digest() iterations reached" exception we saw above.

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

![Swarm of bears](/images/grouping-items-in-angular-dot-js/bear-swarm.jpg "That's how we ended up with so many bears")

TODO photo credit http://www.flickr.com/photos/jfew/3909403579/


Grin and bear it
----------------

Now we know why our simple approach doesn't work, how do we fix it?

Preferably, we fix the framework so that our simple approach *does* work.  I'm
working on a pull request to do just that.  But it'd be nice if we could do the
simple grouping we want without going through the fun of upgrading the
framework.  And it's always more fun to fix a problem twice!

The root problem was that our filter was returning new objects every time,
causing an infinite digest loop.  What if instead we returned the *same* objects
every time?

So that's what *TODO name the library* provides: a caching `groupBy` filter that
reuses the results of previous runs, so as to always return the same object.

``` html
{% raw %}<div ng-repeat="dayTasks in tasks | groupBy:'day':'tasksByDay'">
  <h3>{{dayTasks.day}}</h3>
  <ul>
    <li ng-repeat="task in dayTasks.items">{{task.title}}</li>
  </ul>
</div>{% endraw %}
```

You use it *almost* like the naive `groupBy` filter I presented above, but as
well telling it which field to group by, you also give it a name for this
grouping ("tasksByDay" in the example above).  That name must be unique within
your application - it's used to keep track of *which* objects to reuse for which
use of `groupBy`.

It keeps a global cache of group objects for each grouping name.  The first time
it's invoked, it'll build new groups, storing them for later reuse.  On
subsequent invocations, for a particular group (here, a particular day), it'll
check if it has a cached group object for that group; if so, it'll just return
that object again.


Everything in its right place
-----------------------------

One other difference from the version above: rather than returning the groups as
properties of an object:
``` javascript
{
  "Feb 27": [task2, task3],
  "Feb 28": [task1]
}
```
it returns an array containing group objects:
``` javascript
[
  {day: "Feb 27", items: [task2, task3]},
  {day: "Feb 28", items: [task1]}
]
```
This makes the syntax (`dayTasks.day`, `dayTasks.items`) a bit uglier, but I
wanted control over the order of groups, e.g.  by passing the items through a
`sortBy` filter before grouping them.  If you give it an object, `ngRepeat`
[sorts the properties](
https://github.com/angular/angular.js/blob/v1.2.14/src/ng/directive/ngRepeat.js#L287
) alphabetically, which isn't what you want for dates.


TODO talk about memory leaks
----------------------------
Generational caching



Holding area for unused bear photos
-----------------------------------

TODO more bears

![alt is
/images/grouping-items-in-angular-dot-js/bears.jpg](/images/grouping-items-in-angular-dot-js/bears.jpg "title is /images/grouping-items-in-angular-dot-js/bears.jpg")

TODO photo credit http://www.flickr.com/photos/wallyg/405661040/ and
joke about digest cycle

![hungry bear](/images/grouping-items-in-angular-dot-js/hungry-bear.jpg "hungry
hungry")

TODO https://www.flickr.com/photos/jimpic/6022412885/
