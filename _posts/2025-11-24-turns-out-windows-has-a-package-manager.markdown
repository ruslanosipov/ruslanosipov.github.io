---
title: "Turns out Windows has a package manager"
date: 2025-11-24 07:00:00 -0700
categories: [Technology, Productivity]
---

I have a Windows 11 PC, and something that really annoyed me about Windows for decades is the inability to update all installed programs at once. It's just oh-so-annoying to have to update a program manually, which is worse for things I don't use often - meaning every time I open a program, I have to deal with update pop-ups.

I was clearly living under a rock, because all the way in 2020 Microsoft introduced `winget` package manager which lets you install, and more importantly update packages.

It's as simple as opening a command line (ideally as administrator, so you don't have to keep hitting yes on the permission prompt for every program), and runinng `winget upgrade --all`. Yup, that's it. You'll update the vast majority of software you have installed. Some software isn't compatible, but when I ran the command for the first time, Windows updated a little over 20 packages, which included the apps I find myself having to update manually the most often.

To avoid having to do this manually, I've used windows **Task Scheduler** to create a new weekly task which runs a `winget-upgrade-all.ps1` file, which consists of a single line:

```
winget upgrade --all --silent --accept-package-agreements --accept-source-agreements
```

I just had to make sure *Run with the highest privileges* is enabled in task settings. So long, pesky update reminders. My Windows apps will finally stay up-to-date, hopefully.
