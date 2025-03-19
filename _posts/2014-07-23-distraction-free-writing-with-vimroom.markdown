---
title: "Distraction-free writing with VimRoom"
date: 2014-07-23 14:46:20 -0700
categories: [Vim]
---

Recently I've been writing much more than I used to: long emails, software
documentation, personal Wiki, keeping work journal, blogging, writing
challenges... Luckily enough, I do all of this writing in Vim. But sometimes
writing prose in Vim might feel a bit unnatural, especially if you have a wide
screen: text will be on the very left side of the screen, or (if `textwrap` is
not enabled) you'll end up with lines hundreds of characters long. And overall,
editing text in Vim sometimes might feel a bit clunky - with all the extra
information and high-tech (or low-tech, depending on your perspective) look.

I found a simple, yet sufficient solution for this issue: [VimRoom][1]. It's a
Vim plugin which enters distraction-free writing mode, by centering the
80-character block of text on your screen. It's highly configurable, and I
found it to look especially pleasing on vertical monitors (which I prefer to
use for writing). It looks presentable even on smaller screens though, here's a
screenshot:

![VimRoom plugin in use.](/images/posts/vimroom-screenshot.png)

Install the plugin (use a package manager like Vundle or [Pathogen][2] to
simplify the task) and add a following line to your `.vimrc`:

	nnoremap <Leader>vr :VimroomToggle<CR>

Now, hit `<Leader>vr` to drop in/out of the VimRoom mode (`<Leader` is a
backslash `\` character by default).

GitHub link: <https://github.com/mikewest/vimroom>.

[1]: http://projects.mikewest.org/vimroom/
[2]: http://www.rosipov.com/blog/vim-pathogen-and-git-submodules/
