---
title: Create gitolite repository
categories: [Programming, CLI]
date: 2012-12-10 04:11:23+00:00
tags: [git, gitolite]
---

A reminder on how to initialize a fresh gitolite repository, assuming that
gitolite has already been set up.

All actions are performed on a local machine. In this case: `~/gitolite-admin`
is admin repository, `~/foo` is desired repository, `rosipov.com` is gitolite
hostname. Command `vi` stands for the text editor, but you may use whichever
editor you prefer.

    cd ~/gitolite-admin
    vi conf/gitolite.conf

Add lines (obviously you may want to use individual users instead of @all):

    repo foo
        RW+ = @all

Save it. Next:

    git add conf/gitolite.conf
    git commit -m "Add foo repo for @all"
    git pull --rebase &amp;&amp; git push
    mkdir ~/foo
    cd ~/foo
    git init
    git remote add origin git@rosipov.com:foo.git

Add some files at this point. In this example, only `.gitkeep` is added.

    git add .gitkeep
    git commit -m "Initialize repo"
    git push origin master

The new repository is all set up now.
