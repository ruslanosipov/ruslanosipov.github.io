---
title: Personal wiki with vimwiki
categories: [Productivity]
date: 2014-07-08 04:14:21+00:00
tags: [vim]
---

I recently found an interesting way to organize random bits of information: a
personal Wiki. It's a great idea to have data repository shared between your
machines: important notes about people, conversations, events, tasks you've
accomplished, thoughts, and a hundred of little pieces of knowledge which don't
belong anywhere else. There is plenty of software out there which lets you set
up a personal Wiki, and some of it is very lightweight and well polished.
However, I prefer to do most of my editing and writing in Vim. As tip #22 from
"The Pragmatic Programmer" states:

  > Use a single editor well
  >
  > We think it is better to know one editor very well, and use it for all
  > editing tasks: code, documentation, memos, system administration, and so
  > on. Without a single editor, you face a potential modern day Babel of
  > confusion.

I fully agree with the above statement and I try to use one editor for the
majority of tasks which require typing, without having to remember which editor
contains certain features, and which doesn't. That's one of the main reasons I
went with `vimwiki` - a lightweight and clean personal Wiki with it's own
Wiki-style markdown. Oh, `vimwiki` also subscribes to another tip from "The
Pragmatic Programmer":

  > Keep knowledge in plain text

The `vimwiki` plugin has a number of interesting and useful features:

  * Memorable mappings for moving in and out of Wikis. Hit `<leader>ww` and you
    are on the home page of your Wiki. The `<leader>wt` will open the Wiki in a
    new tab: the rest of the mappings are as intuitive.
  * Multiple Wikis support: really handy if you have a number of separate
    projects for which you want to keep separate entries.
  * Diary-like quick notes. You can create an instant page for today by hitting
    `<leader>w<leader>w`. Combination `<leader>wi` brings you to a diary home
    page, and `<leader>w<leader>i` re-indexes the diary entries.
  * Easy link creation: hit enter on a word and it will turn into a link to
    another page. Hitting enter on a link will transport you to the destination
    page. Simply surrounding text with double square brackets (`[[]]`) works as
    well.
  * Navigation: enter to follow a link, backspace to go back.
  * You can convert all your records into html by executing `:VimwikiAll2HTML`.
  * Extensive and well written help file. Just run `:help vimwiki` and start
    reading.

The list can go on forever, but these are the features I found to be the most
useful.

In order to enjoy synchronization between all my machines, I hosted my Wiki in
a Dropbox folder - `vimwiki` lets you specify locations from each one of your
Wikis.

    let g:vimwiki_list = [{'path': '$HOME/Dropbox/wiki'}]

Download it from the GitHub: <https://github.com/vimwiki/vimwiki>.
