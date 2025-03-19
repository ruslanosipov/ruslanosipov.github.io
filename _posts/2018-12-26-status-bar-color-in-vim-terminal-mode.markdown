---
title: "Status bar color in Vim terminal mode"
date: 2018-12-26 21:02:24 +0000
categories: [Vim]
---

If you're using a custom color scheme (why wouldn't you?) in conjunction with a terminal mode in Vim (again, why wouldn't you?), you may have noticed that the terminal status bar has no respect for your color scheme.

Run `:term`, and you'll be greeted to the default status bar:

![Screenshot of the default terminal mode status line.](/images/posts/vim-terminal-mode-default-colors.png)

Since terminal mode is still in beta in Vim 8.1, we have to manually set the highlighting groups. It'll require a bit of digging.

Navigate to the directory containing your current color scheme. Depending on the plugin manager, the color schemes are located in different places. On Linux, default color schemes often live in `/usr/share/vim/vimcurrent/colors`. In this example, I'm using PaperColor scheme, and I have it installed using vim-plug in `~/.vim/plugged/papercolor-theme`, and `colors/PaperColor.vim` is the file we're looking for.

Search for `StatusLine` and `StatusLineNC` (tip: you can do a whole word search in Vim by running `/\<StatusLine\>`), and note the values used (you might have to jump through a few variables if the color scheme author decided to be fancy). You're interested in `ctermbg`, `ctermfg`, `guibg`, and `guifg`.

You might find something like this:

    hi StatusLine ctermbg=24 ctermfg=254 guibg=#004f87 guifg=#e4e4e4
    hi StatusLineNC ctermbg=252 ctermfg=238 guibg=#d0d0d0 guifg=#444444

Copy those lines to your `~/.vimrc`. Change `StatusLine` to `StatusLineTerm`, and change `StatusLineNC` to `StatusLineTermNC`:

    " Manually set the status line color.
    hi StatusLineTerm ctermbg=24 ctermfg=254 guibg=#004f87 guifg=#e4e4e4
    hi StatusLineTermNC ctermbg=252 ctermfg=238 guibg=#d0d0d0 guifg=#444444

Reload `~/.vimrc` (`:w | so %`), and the terminal mode status line should have the same colors as your color scheme:

![Screenshot of the terminal mode status line with corrected colors.](/images/posts/vim-terminal-mode-correct-colors.png)

Above, `hi` is a shorthand for `highlight`, which is used to define highlight group colors. `StatusLineTerm` and `StatusLineTermNC` define the highlight groups for terminal mode status line (in active and inactive windows respectively). Options `ctermbg` and `guibg` define the background color, and `ctermfg` and `guifg` are responsible for the foreground (text) color.
