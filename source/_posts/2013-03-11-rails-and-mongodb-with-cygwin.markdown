---
title: Rails and MongoDB with Cygwin
categories: [Programming]
date: 2013-03-11 19:38:30+00:00
tags: [mongodb, rails]
---

Setting up Ruby on Rails with MongoDB on a Windows machine.

You need to have cygwin installed with `ruby` and `git` packages (obviously you
may want to have more).

The following commands are executed in the cygwin prompt:

    git clone git://github.com/rubygems/rubygems.git
    cd rubygems/
    ruby setup.rb
    gem install rails

Go to the MongoDB website and download Windows binaries:
<http://www.mongodb.org/downloads>. Extract the content of the `bin/` directory
to `C:\cygwin\usr\local\bin`.

Create a directory for the db files (the default MongoDB db files directory is
`C:\datadb`):

    cd /cygdrive/c
    mkdir data
    mkdir data/db

Done! Both mongo and rails are in your cygwin's path now, feel free to tweak it
as you see fit.
