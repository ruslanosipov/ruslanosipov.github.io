---
title: "Vimwiki: 11 years later"
date: 2025-09-22 07:00:00 -0700
categories: [Vim]
---

Vimwiki is a personal wiki plugin for Vim. Using Vim has been a second nature for me for well over a decade ([buy my book](https://amzn.to/4pvFx62)), and keeping my notes organized using Vim continues to be the best approach. It's been 11 years of using Vimwiki, here are some reflections.

If you're instead looking for a tutorial on how to set up and use Vimwiki in Vim, [my tutorial from 2014 is up-to-date](/blog/personal-wiki-with-vimwiki/).

So, what do I use Vimwiki for?

![Vimwiki: A page listing various technologies.](/images/posts/vimwiki-technology.png)

A little bit of everything. Occasional journaling, when I don't want to pull out a journal and a pen. Notes about technology and any projects I might be working on. Reflections on video games I've played. Ideas I find interesting. Topic research notes, like when I try to understand a messy and complex personal finance or tax subjects. Writing drafts ([my notes on writing cadence](/blog/writing-cadence-quality-and-the-act-of-caring/) could be of interest here).

Hands down the best thing about Vimwiki for me, is that it's something I've kept up for 11 years now, and it's fully open source and doesn't rely on external services. I've changed storage from Dropbox to Google Drive to hosting the wiki myself, and I'm glad that I get to use the same technology.

Having uninterrupted access to knowledge I deemed noteworthy is useful. It helps me keep my head organized, if only to know that all the thoughts swooshing in my head are neatly organized somewhere on paper. On digital paper, you know what I mean. It's freeing.

It's also lovely that under the hood this is just a set of plain text files. I can always manipulate these files using thousands of text manipulation programs, or write my own utility with ease. I've leveraged that in rare cases when Vimwiki capabilities were insufficient.

But there are a few notable downsides, too. With the benefits of hindsight and some wisdom over the years.

First and foremost, portability. Vim never graduated into the mobile first world. Yeah, I used to eye roll at Google's mobile first push of mid-2010s, but the truth of the matter is - I often find myself taking notes on my phone, and then moving those notes to Vimwiki when I have the time (or forgetting those notes exist altogether).

Even on supported platforms - Windows, Mac, Linux, ChromeOS - there's always some fiddling involved in the setup. It's not a set-it-and-forget-it solution. There's always tinkering involved, and there's a reason my blog has a number of entries titled "how to to use Vimwiki on System X" over the past decade (like [how I use Vimwiki](/blog/how-i-use-vimwiki/) for instance). It's a tinkerer's choice.

Unfortunately, I can't think of a significantly simpler solution (outside of plain-text system of notes) that doesn't lock me into an ecosystem or puts me at a mercy of a company which will shut down the servers once they go out of business.

I've looked at simple solutions like [TiddlyWiki](https://tiddlywiki.com/) more than once before, but I keep coming back to using Vim as a primary interface for engaging with all the information I've collected over the years.

![Vimwiki: HTML rendering of the finance page.](/images/posts/vimwiki-financial-life.png)

I solved some aspects of portability through serving my instance of Vimwiki via web. Yeah, Vimwiki can render your files to glorious interlinked HTML (which works out of the box by invoking `:VimwikiAll2HTML`). It's read-only, however, and requires you to figure out how to host your own web server. Which isn't hard if you already host other things on your local network (which I do), but can be a pain in the butt if you don't. And you'd be setting yourself up for a security mess on your hands if you're standing up a web server in the cloud without knowing what you're doing.

For its entries, Vimwiki supports either its own VimWiki syntax (which is based on MediaWiki) or Markdown syntax. I use the VimWiki syntax, and while it makes it harder to migrate away from Vimwiki, I think it's a better fit for the Vim editing. I'm glad I stuck with the VimWiki syntax, since I find `[[link]]` to be easier to parse than `[link](link.markdown)`.

Can I see myself moving to a different solution in the future? Possibly. If a fully open source, Vim-friendly, truly portable solution presents itself - sure, I'll put together some scripts to migrate (or more likely, use AI to help me write one - AIs seem to be good at writing low-risk one-off migration scripts). Do I regret using Vimwiki? Absolutely not, it's been an amazing companion to me over a decade, and given that the data's stored in plain text - I'm not worried about losing my data if I ever change my mind.
