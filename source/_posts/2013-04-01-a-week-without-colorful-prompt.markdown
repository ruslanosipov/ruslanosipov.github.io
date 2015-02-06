---
title: A week without colorful prompt
categories: [Notes and rants]
date: 2013-04-01 18:10:31+00:00
tags: [bash, git, vim]
---

I noticed that I rely on colors in the bash terminal a lot, as in git output,
diffs, directory and file listings... It gets worse when using vim - I feel
lost without the cozy syntax highlight guidance.

Time to stop using output colors for a week whether in shell, git, or vim, and
use only plain text with no fancy colors. Set git config --global color.ui
false and don't use --color flags in shell. Also, set syntax off and set a
simple color scheme for vim.

What can I gain from all this? It will definitely reduce my productivity for a
few days. However, I have a hint of an idea that changing the visual code
representation will give me new insight on what I am currently writing.

[Link to related commit on GutHub](https://github.com/ruslanosipov/dotfiles/commit/b2b592e4f5b4b2f5bb962651a03f9d83b3ab53b7).

Check back in a week to see how it went!
