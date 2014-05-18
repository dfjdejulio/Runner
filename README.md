Runner
===

Back in the early days of my time with Java, one of the design patterns that
rapidly became key for me was the "command bean".  This was basically a POJO
("Plain Old Java Object") bean that had read-write (ie. "settable") input
propperties, read-only (ie. "gettable") output properties, and a single
"execute" method.

The benefit was that it was so simple, it was trivial to load into command-line
projects, frameworks, servlets, and even mostly-Javaless JSPs (due to how JSTL
could interact with bean properties, the only actualy Java code you needed in
the JSP was the "execute" call).  It let me run core logic code on the command
line for debugging and then deploy it all over the damned place.

I've toyed with the idea of using the same pattern in Objective-C for a while
now.  I'm not yet sure it's a good idea.  I _am_ sure that I want to reuse a
lot of future code between OS X applications, iOS applications, command line
tools, OS X "Services", AppleTalk extensions and server applications.  So,
I _am_ sure I want to play around with the concept, and I'm sure I want
frameworks to embed the things in all of those places, for my experiments.

(I _really_ believe in the whole Unix "small pieces that you glue together to
perform big tasks" idea.)

It's been a pain in the tuchus getting such a framework for iOS that I'm
happy with.  We're talking about a really trivial abstract design concept.
I want a place to put in the input, a place to see all of my output, and a
"go" button.

That's not hard to build.  But doing it with _code_ that's as simple as the
_concept_ has eluded me for a while.

This project (as of May 2014) contains the iOS framework for running commands.

Of Potential Interest
---

