---
title: "Sane Vim defaults (from Neovim)"
date: 2018-12-27 23:28:37 +0000
categories: [Vim]
---

Vim comes with a set of often outdated and counter-intuitive defaults. Vim has been around for around 30 years, and it only makes sense that many defaults did not age well.

Neovim addresses this issue by being shipped with many default options tweaked for modern editing experience. If you can't or don't want to use Neovim - I highly recommend setting some these defaults in your `.vimrc`:

    if !has('nvim')
      set nocompatible
      syntax on

      set autoindent
      set autoread
      set backspace=indent,eol,start
      set belloff=all
      set complete-=i
      set display=lastline
      set formatoptions=tcqj
      set history=10000
      set incsearch
      set laststatus=2
      set ruler
      set sessionoptions-=options
      set showcmd
      set sidescroll=1
      set smarttab
      set ttimeoutlen=50
      set ttyfast
      set viminfo+=!
      set wildmenu
    endif

The defaults above enable some of the nicer editor features, like `autoindent` (respecting existing indentation), `incsearch` (search as you type), or `wildmenu` (enhanced command-line completion). The defaults also smooth out some historical artifacts, like unintuitive backspace behavior. Keep in mind, this breaks compatibility with some older Vim versions (but it's unlikely to be a problem for most if not all users).
