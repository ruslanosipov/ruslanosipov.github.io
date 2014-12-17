---
title: "Contributing to an existing Octopress blog"
date: 2014-12-16 21:09:58 -0800
categories: [Programming]
tags: [octopress]
---

I had to download my Octopress blog to a new machine today and the process of
setting up didn't go as smoothly as I expected. At the end of the day the setup
turned out to be simple, and here are the steps:

    git clone -b source https://github.com/username/username.github.io myblog
	cd myblog
	git clone https://github.com/username/username.github.io _deploy
	bundle install

In a nutshell, you have to manually add `_deploy` folder set to track `master`
branch of your Octopress repository. Otherwise `rake deploy` command fails.

Happy writing!
