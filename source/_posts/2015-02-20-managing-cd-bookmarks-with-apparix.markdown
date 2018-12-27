---
title: "Managing cd bookmarks with apparix"
date: 2015-02-20 16:25:45 -0800
tags: [apparix]
categories: [Productivity, CLI]
---

A couple of months ago I discovered apparix: a set of commands which augment
`cd` with bookmarks. It really is an amazing feeling when you zap between
multiple directories far away just with a couple of keystrokes! Apparix
provides three commands I use daily: `to`, `bm`, and `apparix` (program
suggests aliasing last one to `als`). Here's how I use it:

	$ pwd
	/Users/ruslan
	$ apparix
	--- portals
	--- expansions
	--- bookmarks
	j dotfiles     /Users/ruslan/.dotfiles
	j blog         /Users/ruslan/Projects/ruslanosipov.github.io
	$ to blog
	$ pwd
	/Users/ruslan/Projects/ruslanosipov.github.io
	$ cd source/_posts
	$ bm posts
	added: posts -> /Users/ruslan/Projects/ruslanosipov.github.io/source/_posts
	$ to dotfiles
	$ pwd
	/Users/ruslan/.dotfiles
	$ to posts
	$ pwd
	/Users/ruslan/Projects/ruslanosipov.github.io/source/_posts

The example above is self explanatory: you can see how over the span of a year
apparix saves hours of navigating directories you frequent.

## Installation

If you don't like reading manuals, installation might be a confusing. But in
reality it's straightforward, you just need to add some functions or aliases to
your shell's configuration file.

Install `apparix` using your favorite package manager, and then pipe examples
apparix offers into your shell's `rc` file.

    apparix --shell-examples >> ~/.bashrc

Open your `.bashrc` (or another corresponding configuration file), and pick the
preferred way of using apparix: you'll see functions for bash and aliases for
csh given as examples. Pick whatever works for your shell, source your `rc`
file, and you're all set!

Happy jumping!
