---
title: Extendedly basic vim setup
categories: [Productivity]
date: 2012-11-15 19:06:33+00:00
tags: [vim]
---

Ahoy Internet, here's a neat and fairly simple vim configuration for
programming. Feel free to copy over settings/plugins you find useful, or just
download a repository from [GitHub][1] with settings and plugins.

## The .vimrc file

    """""""""""""""""""""""""""""""""""""""
    " => Editing
    """""""""""""""""""""""""""""""""""""""

    syntax on

    " Indentation settings
    set tabstop=4
    set shiftwidth=4
    set smartindent
    set autoindent
    set expandtab

    " Disable backups and .swp files
    set nobackup
    set nowritebackup
    set noswapfile

    " Ignore case when searching
    set ignorecase
    set smartcase

    """""""""""""""""""""""""""""""""""""""
    " => Looks
    """""""""""""""""""""""""""""""""""""""

    colorscheme darkburn
    set background=dark

    " Set terminal window title
    set title

    " Shorten press ENTER to continue messages
    set shortmess=atI

    " Show last command
    set showcmd

    " Highlight cursor line
    set cursorline

    " Ruler (line, column and % at the right bottom)
    set ruler

    " Enable wild menu (tab command autocompletion)
    set wildmenu
    set wildmode=list:longest,full

    " Warn if exceed 80 columns limit
    if (&ft == 'python')
        highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        match OverLength /%81v.+/
    endif

    """""""""""""""""""""""""""""""""""""""
    " => Misc
    """""""""""""""""""""""""""""""""""""""

    " Use Unix as the standart file type
    set ffs=unix,dos,mac

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc,*.pyo

    """""""""""""""""""""""""""""""""""""""
    " => Plugins
    """""""""""""""""""""""""""""""""""""""

    " EasyMotion: one leader key instead of two
    let g:EasyMotion_leader_key = '<Leader>'

    " NERDTree: auto open and close
    autocmd VimEnter * NERDTree
    autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

    " NERDTree: focus on text window (left)
    autocmd VimEnter * wincmd l
    autocmd BufNew * wincmd l

    " NERDTree: auto close if last window
    function! s:CloseIfOnlyNerdTreeLeft()
        if exists("t:NERDTreeBufName")
            if bufwinnr(t:NERDTreeBufName) != -1
                if winnr("$") == 1
                    q
                endif
            endif
        endif
    endfunction

    " Exuberant Ctags: autogenerate on py file write
    au BufWritePost *.py silent! !ctags -R &

    " Pydoc: open in new tab instead of split
    let g:pydoc_open_cmd = 'tabnew'

    " Pydoc: disable search term highlight
    let g:pydoc_highlight=0

## Plugins

If you are not planning to use some of the plugins, make sure to remove
plugin-specific rules from .vimrc => Plugins.

* [Exuberant Ctags][2]: allows you to generate index of variables, functions
  and classes to freely move between them. A bit more info on how to use these
  in article [Using vim for writing code][3].
* [Colo(u)r Sampler Pack][4] is not really a plugin, but a collection of color
  shemes. 100 of them, to be precise. Feel free to choose whatever you like.
* [ScrollColors][5] allows you to try out every theme in visual mode. Just type
  in `:SCROLL`.
* [EasyMotion][6] allows you to move between words, lines and sentences with a
  lightning speed. Just hit `<Leader> + w` to jump to one of the words forward
  or `<Leader> + b` backward (leader key is a backslash by default). It can
  do more neat things, documentation is pretty self-explanatory.
* [NERDTree][7] is a directory tree, like in all modern IDEs (but of course
  better).
* [tComment][8] allows you to easily comment out blocks of code. Hit `gcc` to
  comment a line or `gc` while selecting a block in `V`isual mode.

## Source

You may want to head over to GitHub and grab a version from here:
<https://github.com/ruslanosipov/dotfiles>.

[1]: https://github.com/ruslanosipov/dotfiles
[2]: http://ctags.sourceforge.net/
[3]: http://www.rosipov.com/blog/using-vim-for-writing-code/
[4]: http://www.vim.org/scripts/script.php?script_id=625
[5]: http://www.vim.org/scripts/script.php?script_id=1488
[6]: http://www.vim.org/scripts/script.php?script_id=3526
[7]: http://www.vim.org/scripts/script.php?script_id=1658
[8]: http://www.vim.org/scripts/script.php?script_id=1173
