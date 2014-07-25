---
title: "Three favorite bash tricks"
date: 2014-07-24 18:41:10 -0700
categories: [Productivity]
tags: [bash, vim]
---

I spend most of my development time in the shell - be it editing text with Vim
or executing various console commands. I have quite a number of tricks in my
daily repertoire, and I would like to share three tips today.

## Edit current command with a text editor

I often end up having to change a long command I just typed, and using arrow
keys to get to the correct spot is not favorable. Bash has the feature which
lets you edit current command in a text editor of your choice. Hit `Ctrl + x`,
`Ctrl + e` (or `Ctrl + x + e`), and you will be dropped into your text editor.
Now you are able to edit the command, and it will be executed as soon as your
write the file and exit the editor.

You can use an editor of your choice by adding following line to your `.bashrc`
file:

    export EDITOR=vim

Replace `vim` with the name of your favorite editor.

Update: It looks like for some machines setting `EDITOR` variable is not
enough. In this case, you also need to set `VISUAL` environment variable.

## Edit recent command

You can edit your recent commands in a text editor of your choice by executing
`fc beginning_of_the_command`. For instance, if you run `fc l`, you will open
most recent command starting with the letter "l".

You can execute `fc` without any arguments to edit last executed command.

## Bash history autocomplete

Another great feature - "reverse intelligent search". If you hit `Ctrl + r` in
your shell, you'll be greeted by the following prompt:

    (reverse-i-search)`':

Start typing a part of the command from your history, and you'll see suggestions
popping up. Hit `Enter` to pick the command (you'll be able to edit it before
executing), or push `Ctrl + g` to return back.

Like any of these tips? Have some of your own? Don't hesitate to share those in
the comments section down below.
