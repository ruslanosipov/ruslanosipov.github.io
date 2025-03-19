---
title: Old file version in split with vim
categories: [Vim]
date: 2013-11-24 04:14:19+00:00
tags: [git]
---

If you use git VCS, you can view previous version of the file you are currently
editing in a split window by executing following command:

    :vsp tmp | read !git show HEAD^:path/from/working/directory

For the instant syntax highlighting, you can specify temporary file's
extension, like following:

    :vsp tmp.py | read !git show HEAD^:lib/module.py

You can also cycle back by few versions by replacing `HEAD^` (which points to
the previous commit) with `HEAD~N`, where `N` is the number of commits you
would like to go back in history by. For example, if you would like to get a
version of the file 4 commits ago - you can do so by executing following
command:

    :vsp tmp | read !git show HEAD~4:path/from/working/directory

It's a pretty nice hack when you need to quickly view previous version of the
file you are working on.
