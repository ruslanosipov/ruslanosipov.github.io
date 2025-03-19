---
title: Pasting with vim and indentation issues
categories: [Vim]
date: 2013-11-17 01:02:30+00:00
---

If you use vim often - you probably had to paste something into vim from the
outside source. And, if you have corresponding indentation rules, they will get
applied, turning your nice block of code into something that looks more like a
case of stairs:

    def foo(a, b):
            a, b = b, a
                print "I am doing something important."
                    return a - b

Quite nasty, isn't it? But that's where vim's `paste` option comes in.  Before
pasting, execute `:set paste`. If you go into insert mode, you'll see the usual
mode indicator switch to `-- INSERT (paste) --`. Try pasting the same block of
code now:

    def foo(a, b):
        a, b = b, a
        print "I am doing something important."
        return a - b

Beautiful. Don't forget to switch back to a regular mode by executing `:set
nopaste`.
