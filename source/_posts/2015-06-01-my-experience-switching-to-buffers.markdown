---
title: "My experience switching to buffers"
date: 2015-06-01 06:28:42 -0700
categories: [Productivity]
tags: [vim]
---

About a year ago I stumbled upon an article explaining the difference between
Vim tabs and buffers. The author emphasized that tabs are merely window
layouts, and therefore one-file-per-tab idea I was used to at the moment just
wasn't proper. Instead, author suggested the use of buffers to switch between
multiple files. I decided to give it a shot, and here are some ideas I would
like to share after switching to the use of buffers.

Buffers are open files, but they're not necessarily visible at any given
moment. In Vim, windows are not linked to any particular buffer, so you can
easily cycle through buffers from within any window.

At it's basics, you only need few commands for operating buffers:

* Use `:ls` to list all buffers for this session.
* To move between next and previous buffers use `:bn` and `:bp` respectively.
* Use `:bN`, where `N` is a buffer number to jump to a specific buffer.
* Get in a habit of closing buffers you will not use with `:bd`.


{% img /images/vim-list-buffers.png A list of open buffers in Vim. %}

The hardest thing about stopping to use tabs and switching to buffers instead
is not having the visual aid: I was used to having a list of files always
available at a glance, at the top of my screen. To check what files I'm working
on now - I have to hit four keys: `:ls` (fourth being "Enter").

Not surprisingly, this taught me to be more mindful about my editing
experience. I usually have a clear structure of the files I'm working on in my
head. And if the list is getting to long to easily remember, then I'm probably
doing something wrong: time to take a break and reset my Vim session.

The experience overall reminded me of my recent switch to blank keyboard key
caps: with no inscriptions to aid you, I first felt a bit at loss, especially
with they keys I couldn't find without looking: like function keys or special
symbols. But after some time with the blank key caps, I improved my typing
skill, and know where even the most obscure characters hide. The switch helped
me to improve my typing experience overall.

With Vim, it's a similar story. After getting past the initial confusion, I
achieved high level of awareness about my editing sessions. It didn't make the
editing process any faster, but instead much more satisfying.

But you already new that, since Vim isn't really about speed.
