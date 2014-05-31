# More Background Info than Anyone Could Possibly Want #

I've essentially been an iPhone programmer for 25 years now.

Let me back up a bit.


## Back in the Before Time ##

### Objective-C and NeXTstep ###

In 1989, I got access to a pre-release NeXT machine running version 0.8 of the
operating system software (because I was at Carnegie Mellon, where the Mach
kernel originated).  I was already focused on Unix development in C, but
dissatisfied with both X11 and C++, so I took to Objective-C and AppKit like
a fish to water.  I got my own NeXT machine and built up some real expertise
when the 68040 machines were introduced and I bought a "slab".  We're
talking about NeXTstep 2.0.

Back then, to _me_, NeXTstep/OpenStep development was _simple_.

You had a language with parts that were very clearly old-style "C" and distinct
parts that were very clearly SmallTalk-ish.  It was obvious to tell them apart;
if you saw square brackets with no array in sight, you were in new territory.
If you were already an expert in C (which I'd been using since middle school
in 1980), there really wasn't much more to learn in the language, and it was
easy to wrap my head around the whole thing.

You had a pretty simple "Interface Builder" setup where you sketched out the
GUI design of your application, dragged connections describing references and
method calls between pictures of both visual objects (eg. "buttons") and
abstract buttons (eg. "the thingy that does the work when you push buttons").

You may recall that this is basically the environment in which the original
"Doom" was written.  It was an *awesome* dev environment, and I got good with
it.  I wrote all sorts of tools, from things that sped up the day jobs of my
friends by an order of magnitude to tools that ripped apart the map files of
video games I was playing so I could study them.

Then the language started to change.  Interface Builder and Project Builder
split up.  Language features got added.

Then NeXT kinda mostly fell apart and, while I did poke at GNUstep a bit,
I didn't find a suitable substitute, and my productivity for personal coding
projects fell through the floor.  (This didn't impact my day jobs, mostly
writing portable server-side code in C, SQL, and a variety of other mediocre
languages.)

### Apple, Rhapsody, and OS X ###

Then Apple bought NeXT, and made it clear that the future of the Macintosh
operating system would be based on OpenStep (nee NeXTstep).  I immediately
went out and bought my first new Macintosh ever, a Pismo.  (I really, really
hated pre-OS X MacOS, so this was a big deal at the time.)

The language and environment I knew were there, but were already pretty
different.  I was able to write code like I used to, but I was rusty.  The
tools were different, and even the language was a little different.  But I
could get things done again.

### iOS ###

Years after *that*, the iPhone came out, and iOS development was a little
later.  And the environment changed *again*.  The iPhone does not use AppKit!
It uses "UIKit", which at a glance is really AppKit with the serial numbers
filed off, but has some key differences (like "there's only ever one window,
and it can't be resized").  And the changes to the language started really
accelerating, with these crazy "properties" and "dot syntax" and "attributes"
and "synthesize" and later, *garbage collection*... back in *my* day,
we allocated objects by hand *and we liked it*!  But now instead of alloc
and zones and stuff, I was supposed to use retain/release?  And *then* they
jettisoned GCC, and could add even more off-the-wall features, and got rid of
retain/release, and we got a runtime with "Automatic Reference Counting"
(ARC)... and don't even get me started on Clang-style "blocks".

For years, the language and environment were changing faster than I was keeping
up.  Don't get me wrong, I could still get a lot done, but I felt like someone
using an old candlestick-style phone while surrounded by kids with mobile
devices.

I get the sense that things have settled down a bit.  We've got easy-to-use
garbage collection.  We've got exception handling.  We've got a notification
bus.  We've got "automatic boxing and unboxing".  We've got some pretty
good language bridges.  We've got a vibrant open source community, sharing
useful frameworks.  The glue between the parts of the program you write by
hand and the parts you build on an etch-a-sketch seems to be getting simpler
again.  Time to really catch up!

Now, I always liked to be able to write simple standalone blocks of code with
clear interfaces that were easy to debug.  So I'd write a C function or a Java
class with a very simple, portable design, and run it a lot of different ways.
Over the years, I'd tried to do that in Objective-C, and have been extremely
dissatisfied with all of the scaffolding needed to get the job done on iOS.

The iPad made it worse, with needing to write two completely different NIB
files (or XIB files or storyboards or whatever you kids are calling it these
days; get off my lawn).  And don't even get me *started* with keyboard handling
on iOS devices.  ("Oh, you're editing a text field.  You didn't expect you'd
still be able to *see* it, did you?")

### What I Did Here ###

The basic idea behind the project is to create a runtime for a single instance
of the "command bean" pattern, on iOS.  I want a place to type in stuff, a
"go" button, and a place to see what happens to the stuff.  That ought to be
simple.  It finally is.

First, I created a single storyboard that works with any screen size.  You
could have a 4" iPhone, a 4.5" iPhone, or an iPad, and the one scene in the
storyboard will use autolayout to be basically sane.

Unless you, you know, *type*.

Now, the way auto layout works is, you sketch out your design and put a bunch
of constraints on it, like, "if the display changes in a way that makes this
button too far from the bottom right corner, well, fix it".  We've got views
that know how to resize and we've got a new framework that teaches whole
displays how to (effectively) resize, and it didn't come with any "oh by the
way, if a keyboard pops up, adjust the display so it's not in the way" code.

So the next thing I did was, I built that.  The "constraints" I spoke about
are objects of the "NSLayoutConstraint" class, and they form connections
between edges of views, edges of superviews, and some "layout guide" things
(like "don't go past this to avoid writing over the status bar" and "don't
go past this to avoid going off the bottom").

At first the plan was, whenever the keyboard pops up, move that bottom layout
gude to its top edge, but that would require using undocumented "secret" APIs,
and that never turns out well.

So what I did was, I subclassed the "constraint" object.  When my version is
unpacked from its archive into memory, it says "hey, let me know when the top
edge of the keyboard changes".  Then, the constraint changes its own length by
exactly the amount of space the edge of the keyboard moved.

So the way you use it is, you design an autolayout where *exactly one*
constraint touches the "bottom layout guide", and that's the highest priority
constraint.  You line everything up with that.  (One easy way to do that is to
just have a superview that's glued to all four sides.  Or you could do what
I did in this project.)  Then you build your design _as if_ iOS devices had
arbitrary screen sizes and windows could resize.  And then it all works.

The upshot is, I've *finally* got an iOS "run this thing and show me what
happens" skeleton that's as simple as I would have expected it to be back
in 1989.

## Meanwhile... ##

I wasn't just sitting around doing nothing in the years when I didn't have
a handy Objective-C environment.  I've been programming mostly server-side
stuff in a variety of languages.  The bulk of my *object oriented* work happens
to have been in Java.

One of the design patterns I ended up using heavily was the "command bean".
It's a POJO (Plain Old Java Object) bean with read-write input properties,
read-only output properties, and an "execute" method.  Very very simple.  What
was the benefit?  I could embed and use them *anywhere*.  

It was so simple, it was trivial to load into command-line
projects, frameworks, servlets, and even mostly-Javaless JSPs (due to how JSTL
could interact with bean properties, the only actually Java code you needed in
the JSP was the "execute" call).  It let me run core logic code on the command
line for debugging and then deploy it all over the damned place.

I've toyed with the idea of using the same pattern in Objective-C for a while
now.  I'm not yet sure it's a good idea.  I _am_ sure that I want to reuse a
lot of future code between OS X applications, iOS applications, command line
tools, OS X "Services", AppleScript extensions and server applications (for
starters).  So, I _am_ sure I want to play around with the concept, and I'm
sure I want frameworks to embed the things in all of those places, for my
experiments.

That's what this scaffolding is designed to run.

More later.  (Sorry.)

Ooh, what does *this* button do...?
