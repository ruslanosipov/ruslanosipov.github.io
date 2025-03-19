---
title: "Gundo tree for Vim"
categories: [Vim]
date: 2015-06-07 13:10:15 -0700
---

One of the obscure, but tremendously useful features of Vim is an undo tree.
You would expect Vim to have a simple stack for undo and redo actions, but it's
much more complex than that: Vim keeps track of every change you made in the
current session, making it possible to access change history beyond basic `u`
and `C-r` commands.

Default interface for accessing far out branches of the undo tree leaves to be
desired, but that's where [Gundo][1] comes in.

![Gundo tree in Vim.](/images/posts/vim-gundo-tree.png)

Gundo provides an easy to use interface for navigating history branches. In the
screenshot above, I am previewing a diff in one of the undo tree branches
inaccessible via `u` command.

As per author's recommendation, I mapped the plugin to `F5`, which seems quite
convenient to me:

    nnoremap <F5> :GundoToggle<CR>

Usage is quite easy. `F5` opens or closes the undo tree, `j` and `k` are used
to travel through changes. Enter key applies the changes.

[1]: http://sjl.bitbucket.org/gundo.vim/
