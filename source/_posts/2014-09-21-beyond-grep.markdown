---
title: "Beyond grep"
date: 2014-09-21 12:18:31 -0700
categories: [Productivity]
tags: [ack, grep]
---

I search for things a lot, especially in my code. Or even worse - someone else's
code. For years `grep` served as an amazing tool for this: fast, simple, and
yet powerful. That was until I discovered `ack` for myself. An incredibly easy
to use `grep` implementation built to work with large (or not really) code
trees.

A lot can be said to enforce superiority of `ack` over `grep` when it comes to
working with code, and it's all said here: [ack's features][1].

Amazing thing is - `ack` doesn't even need a tutorial. Learning progression is
natural and "just happens" by researching necessary use cases as the need
arises (`ack` has a great manual entry).

Here's a typical use example for `ack`:

    ack --shell 'gr[ae]y'

Searches all shell script files in the current code tree for any occurrences of
"gray" or "grey". It will search `.sh`, `.zsh`, and just about dot-anything;
`ack` will even check shebang lines for you.

Ease of use, the fact that it's ready to use out of the box, extensive file
types, native support for Perl's regular expressions: `ack` does really good
job at searching through code.

Download it from [Beyond grep][2].

[1]: http://beyondgrep.com/why-ack/
[2]: http://beyondgrep.com
