---
categories: [Productivity]
tags: [git]
title: Git pretty log output
---

This alias has been around the web for quite some time, but it does look fantastic indeed.

{% img /images/git-pretty-log.png An output of `git pretty-log` alias. %}

To add the alias `git pretty-log`, execute the following command (join string prior to executing):

    git config alias.pretty-log 'log --graph --pretty=format:"%Cred%h%Creset
    -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
