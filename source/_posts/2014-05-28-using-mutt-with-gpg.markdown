---
title: Using Mutt with GPG
categories: [Productivity, CLI]
date: 2014-05-28 19:11:52+00:00
tags: [gpg, mutt]
---

Mutt is a great command line email client, but it does not offer a built-in way
to store passwords. But that's where GPG comes in. A while back I wrote an
article on how to use GPG to store your passwords: [GPG Usage], this is a more
practical note about using GPG to store your passwords for mutt. This note
implies that you already have installed and configured GPG (which you can learn
how to do in above linked article).

First you will have to record a password to a GPG file. Replace `$PASSWORD`
with your password and `$ACCOUNT` with a desired account alias. You probably
want to prefix this command with a space, to avoid writing your password to a
history file.

    echo '$PASSWORD' | gpg --use-agent -e > ~/.passwd/$ACCOUNT.gpg

Next, open your `~/.muttrc` file and add following line:

    set imap_pass = "`gpg --use-agent --quiet --batch -d ~/.passwd/$ACCOUNT.gpg`"

Again, replace `$ACCOUNT` with the same account alias you specified earlier.
Now you don't have to re-enter your password every time you start Mutt.

[1]: http://www.rosipov.com/blog/gpg-usage/
