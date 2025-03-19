---
title: My most used bash commands
categories: [CLI]
date: 2013-04-24 16:47:11+00:00
tags: [bash]
---

Shell history can tell a lot about its owner. What's in your shell?

    history | awk '{CMD[$2]++;count++;}
    END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}'
    | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

         1  580  38.0328%    git         # I keep everything under VCS
         2  202  13.2459%    cd          # Moving around a lot
         3  171  11.2131%    vi          # Favorite text editor
         4  127  8.32787%    ls          # I'm a curious person
         5  43   2.81967%    rm          # I also like when it's clean
         6  26   1.70492%    usrswitch   # https://gist.github.com/ruslanosipov/5453510
         7  25   1.63934%    exit        # I don't like hitting the red cross button
         8  18   1.18033%    source      # Reloading bash configuration files
         9  17   1.11475%    clear       # Like when it's *really* clean
        10  15   0.983607%   gitk        # Sometimes it is too messy for git log

