---
title: IRSSI - ignore all from everyone
categories: [CLI]
date: 2013-03-27 15:37:10+00:00
tags: [irssi]
---

If you visit noisy IRC channels like the programming ones on freenode, you
probably want to ignore all the annoying status messages.

To permanently ignore joins, parts, quits, and nickname changes from every
channel in IRSSI:

    /ignore * joins parts quits nicks
    /save

I keep forgetting the exact syntax, so maybe clipping the snippet in a blog
post will keep it in my memory.
