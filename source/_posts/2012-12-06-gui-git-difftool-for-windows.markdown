---
categories: [Productivity]
date: 2012-12-06 20:02:24+00:00
tags: [git, windows]
title: GUI git difftool for Windows
---

A quick note on how to set up GUI difftool to use with git on Windows (Git
Bash, Cygwin, etc...).

Download and install GUI diff tool of your choice, get the path to executable.

Create `difftool.sh` in directory included in your path (for example
`C:\Users\{username}\bin` in Git Bash). Let's take SourceGear's DiffMerge as an
example.

    #!/bin/sh
    "C:/Program Files/SourceGear/Common/DiffMerge/sgdm.exe" "$1" "$2" | cat

And in your ~/.gitconfig:

    [diff]
        tool = diffmerge
    [difftool "diffmerge"]
        difftool.sh "$LOCAL" "$REMOTE"

And difftool is available via `git difftool` command now.
