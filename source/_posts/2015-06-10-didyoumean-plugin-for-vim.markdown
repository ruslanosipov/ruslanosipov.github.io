---
title: "DidYouMean plugin for Vim"
categories: [Vim]
date: 2015-06-10 13:02:00 -0700
---

[DidYouMean][1] Vim plugin is very simple: it asks you if the file you are
trying to open is indeed the right file. How is this useful? Here's how:

Say you have two files with a similarly starting names: `model.py` and
`model_test.py`. You type `vim mo`, you hit tab to autocomplete the name, you
hit enter. In vanilla Vim, you'd be opening a new file: `model`, since that's
where shell's tab-completion stopped. DidYouMean detects such a nuance and asks
you if you wanted to open `model`, `model.py`, or `model_test.py`.

Simple idea, and instantly after trying this out, I would really expect this
feature to be included in vanilla Vim.

[1]: https://github.com/EinfachToll/DidYouMean
