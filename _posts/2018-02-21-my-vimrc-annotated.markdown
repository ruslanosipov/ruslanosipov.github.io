---
title: "My .vimrc, annotated"
date: 2018-02-21 10:00:00 -0500
categories: [Vim]
excerpt: "Annotated breakdown of my .vimrc."
---

{% raw %}

I've been using Vim for anywhere between 5 and 10 years, and my `.vimrc` is all grown up.  I use  `{{{1` to annotate folds in my `.vimrc`, and use `zM` to close all folds and `zR` to open all folds (`zc`, `zo`, and `za` respectively close, open, and toggle individual folds). The `---` lines are simply cosmetic.

	" => Pre-load ------------------------------------------------------------- {{{1

	set nocompatible  " Required for many plugins, ensures it's not compatible with 
	                  " Vi, which nobody uses at this point.
	filetype plugin indent on  " Great answer: https://vi.stackexchange.com/a/10125


[Vundle](https://github.com/VundleVim/Vundle.vim) is downright fantastic plugin manager. It allows one to install plugins with `:PluginInstall` and upgrade plugins with `:PluginUpdate`. Simple, easy, reliable. Of course you'll need to [have Vundle installed](https://github.com/VundleVim/Vundle.vim#quick-start), which I normally have as a git submodule.

	" Required Vundle setup.
	set runtimepath+=~/.vim/bundle/vundle
	set runtimepath+=$GOROOT/misc/vim
	call vundle#rc()
	
	" => Vundle plugins ------------------------------------------------------- {{{1

	Plugin 'gmarik/vundle' " The Vundle itself, to keep itself updated.

    " Colorschemes:
	Plugin 'NLKNguyen/papercolor-theme'
	Plugin 'ajh17/Spacegray.vim.git'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'squarefrog/tomorrow-night.vim'
	Plugin 'vim-scripts/ScrollColors'  " Allows scrolling through colorschemes.

    " Language/tool integration and support:
	Plugin 'burnettk/vim-angular'
	Plugin 'fatih/vim-go'
	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'mileszs/ack.vim'
	Plugin 'motemen/git-vim'
	Plugin 'nvie/vim-flake8'
	Plugin 'pangloss/vim-javascript'
	Plugin 'scrooloose/syntastic.git'  " Syntax checker.
	Plugin 'tpope/vim-fugitive.git'    " Even better Git support.

    " Quality of life:
	Plugin 'EinfachToll/DidYouMean'    " For typos during opening files.
	Plugin 'ciaranm/detectindent'      " Automatically detect indent.
	Plugin 'ervandew/supertab'         " Smarter autocompletion.
	Plugin 'junegunn/goyo.vim'         " A plugin for writing prose.
	Plugin 'majutsushi/tagbar'         " List tags in a sidebar.
	Plugin 'scrooloose/nerdtree'       " A directory tree in a sidebar.
	Plugin 'tomtom/tcomment_vim'       " Easy comment blocks with <Leader>cc.
	Plugin 'tpope/vim-abolish'         " Extended abbreviation/substition.
	Plugin 'tpope/vim-repeat'          " Intelligent repeat with '.'
	Plugin 'tpope/vim-surround'        " Work with pairs of quotes/anything.
	Plugin 'tpope/vim-unimpaired.git'  " Handy bracket mappings.
	Plugin 'tpope/vim-vinegar'         " Enhanced directory browser.
	Plugin 'vim-scripts/DirDiff.vim'   " Directory level diff.

    " New features:
	Plugin 'Lokaltog/vim-easymotion'   " Easy navigation with <Leader><Leader>w.
	Plugin 'kien/ctrlp.vim'			   " Hit <C>p for a list of files/buffers.
	Plugin 'vim-scripts/Gundo.git'     " Intelligent undo tree.
	Plugin 'vim-scripts/vimwiki'       " A personal local Wiki.

	if v:version > 703
	  Plugin 'SirVer/ultisnips'        " Intricate snippets.
	  Plugin 'chrisbra/vim-diff-enhanced'
	endif

	" => Plugins configuration ------------------------------------------------ {{{1

	" NERDTree: auto close if last window.
	function! s:CloseIfOnlyNerdTreeLeft()
	  if exists("t:NERDTreeBufName")
	    if bufwinnr(t:NERDTreeBufName) != -1
	      if winnr("$") == 1
	        q
	      endif
	    endif
	  endif
	endfunction

	" Force Gundo preview to the bottom.
	let g:gundo_preview_bottom = 1

	" Map Gundo.
	nnoremap <F5> :GundoToggle<cr>

	" DetectIndent: Enable and configure.
	augroup detectindent
	  autocmd!
	  autocmd BufReadPost * :DetectIndent
	augroup END
	let g:detectindent_preferred_expandtab = 1
	let g:detectindent_preferred_indent = 2

	" UltiSnips: Compatibility with YouCompleteMe via SuperTab.
	let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
	let g:SuperTabDefaultCompletionType = '<C-n>'
	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	" VimWiki: default location.
	let g:vimwiki_list = [{
	  \ 'path': '$HOME/Dropbox/wiki',
	  \ 'template_path': '$HOME/Dropbox/wiki/templates',
	  \ 'template_default': 'default',
	  \ 'template_ext': '.html'}]

	" Map Tagbar.
	nnoremap <F8> :TagbarToggle<cr>

	" Synastic configuration.
	let g:syntastic_always_populate_loc_list = 1  " Make :lnext work.
	let g:syntastic_html_checkers = ['']
	let g:syntastic_javascript_checkers = ['gjslint', 'jshint']
	let g:syntastic_javascript_gjslint_args = '--strict'
	let g:syntastic_python_checkers = ['gpylint']

Most plugins above change slightly change daily Vim workflow: the way one navigates files, replaying actions, working with snippets, minor tweaks to editing - and I highly recommend at least skimming through README of plugins you're interested in so you can incorporate the changes in your workflow.

I have a set of simple defaults I use everywhere, major changes being changing `:` to `;` and moving my leader key to a spacebar. Everything else are tiny quality of life tweaks.

	" => Editing -------------------------------------------------------------- {{{1

	syntax on

	" Indentation settings.
	set autoindent
	set expandtab
	set shiftwidth=4
	set softtabstop=4
	set tabstop=4

	" Disable backups and .swp files.
	set nobackup
	set noswapfile
	set nowritebackup

	" Semicolon is too long to type.
	nnoremap ; :
	vnoremap ; :

	" Map leader key.
	let mapleader = "\<Space>"

	" Use system clipboard.
	set clipboard=unnamedplus

	" Enable wild menu (tab command autocompletion).
	set wildmenu
	set wildmode=list:longest,full

	" Don't complain about unsaved files when switching buffers.
	set hidden

	" Make soft line breaks much better looking.
	if v:version > 703
	  set breakindent
	endif

	" Pretty soft break character.
	let &showbreak='↳ '

	" => Looks ---------------------------------------------------------------- {{{1

	set background=dark
	colorscheme spacegray

	" Set terminal window title and set it back on exit.
	set title
	let &titleold = getcwd()

	" Shorten press ENTER to continue messages.
	set shortmess=atI

	" Show last command.
	set showcmd

	" Highlight cursor line.
	set cursorline

	" Ruler (line, column and % at the right bottom).
	set ruler

	" Display line numbers if terminal is wide enough.
	if &co > 80
	  set number
	endif

	" Soft word wrap.
	set linebreak

	" Prettier display of long lines of text.
	set display+=lastline

	" Always show statusline.
	set laststatus=2

	" => Movement and search -------------------------------------------------- {{{1

	" Ignore case when searching.
	set ignorecase
	set smartcase

	" Fast split navigation.
	nnoremap <C-j> <C-W><C-J>
	nnoremap <C-k> <C-W><C-K>
	nnoremap <C-l> <C-W><C-L>
	nnoremap <C-h> <C-W><C-H>

	" Absolute movement for word-wrapped lines.
	nnoremap j gj
	nnoremap k gk

	" => Misc ----------------------------------------------------------------- {{{1

	" Use Unix as the standart file type.
	set ffs=unix,dos,mac

	" Ignore compiled files.
	set wildignore=*.o,*~,*.pyc,*.pyo

	" Ignore virtualenv directory.
	set wildignore+=env

	" Fold using {{{n, where n is fold level
	set foldmethod=marker

	" => Fixes and hacks ------------------------------------------------------ {{{1

	" Ignore mouse (in GVIM).
	set mouse=c

	" Fix backspace behavior in GVIM.
	set bs=2

	" NERDTree arrows in Windows.
	if has("win32") || has("win64") || has("win32unix")
	  let g:NERDTreeDirArrows = 0
	endif

	" Increase lower status bar height in diff mode.
	if &diff
	  set cmdheight=2
	endif

	" Unfold all files by default.
	au BufRead * normal zR

I have some custom commands and shortcuts I'm using, but not too many. I find that I mostly just forget to use shortcuts I make, and I end up deleting lines from this section regularly.

	" => Custom commands ------------------------------------------------------ {{{1

	" Trim trailing whitespace in the file.
	command TrimWhitespace %s/\s\+$//e

	" Command to close current buffer without closing the window.
	command Bd :bp | :sp | :bn | :bd

	" => Leader shortcuts ----------------------------------------------------- {{{1

	nnoremap <Leader>] <C-]>          " Jump to ctags tag definition.
	nnoremap <Leader>p :CtrlP<cr>     " Fuzzy complete for files.
	nnoremap <Leader>t :CtrlPTag<cr>  " Fuzzy complete for tags.
	nnoremap <Leader>r :redraw!<cr>   " Redraw the screen (for visual glitches).
	nnoremap <Leader>w :w<cr>         " Write a file.

Hope you find this useful and take away a few bits and pieces for your own workflow.

{% endraw %}
