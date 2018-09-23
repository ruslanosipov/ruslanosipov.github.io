---
title: "Cross-platform vim-plug setup"
date: 2018-09-23 07:02:42 +0000
categories: [Vim]
---

I've recently switch to [vim-plug][1], a lightweight Vim plugin manager.

It comes with a little `.vimrc` snippet which downloads the plugin, but it only works for Unix. I use Vim across all three platforms regularly, so I updated the snippet:

    " Download and install vim-plug (cross platform).
    if empty(glob(
        \ '$HOME/' . (has('win32') ? 'vimfiles' : '.vim') . '/autoload/plug.vim'))
      execute '!curl -fLo ' .
        \ (has('win32') ? '\%USERPROFILE\%/vimfiles' : '$HOME/.vim') . 
        \ '/autoload/plug.vim --create-dirs ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

The above should work across all three major OSes, since Windows 10 recently received `curl` support.

[1]: https://github.com/junegunn/vim-plug
