# Runner #

Back in the early days of my time with Java, one of the design patterns that
rapidly became key for me was the "command bean".  This was basically a POJO
("Plain Old Java Object") bean that had read-write (ie. "settable") input
propperties, read-only (ie. "gettable") output properties, and a single
"execute" method.

I'm *not* sure it's a good idea to recreate this in Objective-C.  I *am* sure
that I want to play around with the concept a bit.  I want to routinely use
the same Objective-C code in OS X apps, iOS apps, AppleScript extensions,
command-line programs, system "Services", and server-side apps.  Maybe this
is the way to do it, and maybe it isn't.

This project (as of May 2014) contains an iOS "skeleton" for running these
kinds of commands.

## Of Potential Interest ##


### KBBLayoutConstraint ###

This is a "magic" subclass of NSLayoutConstraint that registers for keyboard
expose/hide events and adjusts its length by the amount the top of the keyboard
moves.  What you do is, have exactly one layout constriant that connects to
the bottom layout guide, make it the highest priority constraint, and change
its class to this.  Then, whenever the keyboard appears, hides, or even changes
in height (eg. switching between "en" and "ja"), your app acts like it can
resize windows and everything just gets out of the keyboard's way.  And none
of the keyboard layout handling code shows up anywhere else at all.

## Schemes and Targets ##

### Runner ###

The "Runner" build scheme produces a universal iOS application that uses one storyboard
for all display sizes (including those that don't exist yet), and lets you run the
single command it's built to use multiple times.

### runner ###

The "runner" build scheme produces a command-line Unix application for OS X that invokes
the single command it's built to use once per argument.

## History and Background ##

(Nobody wants to read that.  If I'm wrong, go look at the EXTENDED_README.md
file.)