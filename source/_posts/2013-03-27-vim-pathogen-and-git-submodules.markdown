---
title: Vim, pathogen and git submodules
categories: [Productivity]
date: 2013-03-27 21:35:46+00:00
date: 2013-03-27 21:35:46+00:00
tags: [git, vim]
---

This is a step by step tutorial on how to organize your vim config files using
git, pathogen, and git submodules. This tutorial assumes that you are familiar
with git basics, but you don't really need to understand every step in order to
follow it. For simplicity, only `.vim` directory is a repository in this
example. You may want to have all your dotfiles under version control and use a
script to symlink files to the home directory. For example see
<https://github.com/ruslanosipov/dotfiles>.

## Setting up

Let's assume your `.vim` directory is a mess and is not under revision control.
Let's initialize a repository.

    cd ~/.vim
    git init
    git remote add origin git@github.com:user/project.git

Now let's create `.vim/bundle` directory and clone `pathogen` plugin as a
submodule.

    mkdir bundle
    cd bundle
    git submodule add git@github.cfm:tpope/vim-pathogen.git
    bundle/vim-pathogen

Pre-pend the following code to your `~/.vimrc` to load pathogen from
non-default directory:

    runtime bundle/vim-pathogen/autoload/pathogen.vim
    execute pathogen#infect()

Let's add some more plugins as git submodules, for example:

    git submodule add git@github.com:Lokaltog/vim-easymotion.git
    bundle/vim-easymotion

Now we can add and commit everything and push it to a repository.

    git add .
    git commit -m "Use pathogen to keep track of vim plugins"
    git push origin master

## Deploying

Assuming that your repository is located at `git@github.com:user/project.git`:

    cd ~
    git clone git@github.com:user/project.git .vim

And you are done, all plugins are downloaded from their repositories now.

## Maintaining

Git submodules keep track of specific commits and are not being automatically
updated when target repositories have new commits. In order to update plugins
you have:

    cd ~/.vim
    git submodule foreach git pull
    git add bundle
    git commit -m "Updated all the plugins in a bundle"
    git push origin master

You probably want to make sure that new versions of plugins are compatible with
each other before committing, however.
