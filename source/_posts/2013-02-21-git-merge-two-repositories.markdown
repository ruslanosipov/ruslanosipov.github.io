---
categories: [Productivity]
tags: [git]
title: 'Git: merge two repositories'
---

Today I had to merge changes from one repository into another. Let's assume you want to merge `beta` into `alpha`.

Operations are performed in repo alpha:

    git remote add beta_repo git@rosipov.com:beta.git
    git fetch beta_repo
    git merge beta_repo/master

In this case, `beta_repo` is the name you pick for remote.

If you just need to cherry-pick a certain commit from `beta` you can omit the last step and replace it with the cherry-pick.

More on the topic of remotes: [http://git-scm.com/book/ch2-5.html](http://git-scm.com/book/ch2-5.html).
