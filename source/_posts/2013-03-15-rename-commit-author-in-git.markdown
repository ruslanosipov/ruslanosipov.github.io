---
categories: [Productivity]
date: 2013-03-15 00:09:02+00:00
tags: [git]
title: Rename commit author in git
---

In some extremely rare cases you end up pushing data to the repo with the wrong
credentials. If you are the only author and you're as picky as I am, it can be
corrected easily:

    git filter-branch -f --env-filter
    "GIT_AUTHOR_NAME='Stan Smith';
    GIT_AUTHOR_EMAIL='stansmith@cia.gov';
    GIT_COMMITTER_NAME='Stan Smith';
    GIT_COMMITTER_EMAIL='stansmith@cia.gov';" HEAD
    git push --force

In the case of there being multiple people working on a project, you may want
to use the following gist posted by anonymous:
<https://gist.github.com/anonymous/2523336/> (again, followed by `git push
--force`).
