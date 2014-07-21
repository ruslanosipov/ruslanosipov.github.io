---
categories: [Productivity]
tags: [bash, vim]
title: Editing bash command in vim
---

You can open the current command you are typing for editing in your default text editor by pressing `Ctrl + x + e`. It will be executed after you write and quit the file. This is perfect for editing long/multi-line commands where typos are likely to occur. Consider something like this:

    for run in {1..10}
    do
        echo "Print me ten times"
    done

Editing this in vim is much more satisfying, isn't it?

You can also open the last executed command for editing if you execute the `fc` command. You can also edit the last command starting with a certain pattern using `fc [pattern]` (you can skip the editor and execute the output of `fc` by adding the `-s` option, and a useful tip is to have `alias r="fc -s"`, which would allow you to execute the last command starting with "cc" by running `r cc`).

P.S: In order for this trick to open `vim` and not any other editor, make sure you have the line `EDITOR=vim` in your `~/.bashrc`. Obviously this works with any text editor.
