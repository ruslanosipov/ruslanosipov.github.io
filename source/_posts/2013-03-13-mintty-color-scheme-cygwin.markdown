---
title: Mintty color scheme (Cygwin)
categories: [Productivity, CLI]
date: 2013-03-13 19:35:28+00:00
tags: [cygwin]
---

{% img /images/posts/mintty-softer-color-scheme.png Softer colors for mintty. %}

I find the default cygwin color palette to be a bit ugly, so here's one that
has softer colors. Add the following lines to your `.minttyrc` and restart
cygwin in order to apply changes.

    ForegroundColour = 131, 148, 150
    BackgroundColour =   0,   0,   0
    CursorColour     = 220,  50,  47

    Black            =   7,  54,  66
    BoldBlack        =   0,  43,  54
    Red              = 220,  50,  47
    BoldRed          = 203,  75,  22
    Green            =   0, 200, 132
    BoldGreen        =   0, 200, 132
    Yellow           = 204, 204, 102
    BoldYellow       = 204, 204, 102
    Blue             = 102, 153, 204
    BoldBlue         = 102, 153, 204
    Magenta          = 211,  54, 130
    BoldMagenta      = 108, 113, 196
    Cyan             =  42, 161, 152
    BoldCyan         = 147, 161, 161
    White            = 238, 232, 213
    BoldWhite        = 253, 246, 227

Update (December 2018): This theme is now packaged with the default Mintty
distribution! Pull up Mintty/Cygwin and check for a theme called `rosipov` (I
didn't pick the name).
