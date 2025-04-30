---
title: Abandoning WordPress for Octopress
categories: [Programming]
date: 2014-07-22 00:04:15 -0700
tags: [octopress, wordpress]
---

I finally did it! I've left the dark corners of WordPress in favor of
[Octopress][1], which seem to be the best system for my blogging needs.

## Why the migration?

WordPress was a great host for me at one point - the community is fun and no
work is required for setup (I would rather not waste time fiddling with my blog
too much). But a number of things are off-putting:

* I don't like WYSIWYG editors and I don't like web editors. I try to use my
  favorite editor for everything, including mail, documentation, note taking.
  Even though WordPress allowed me to write my posts using Markdown, I still
  didn't like not being able to use my favorite editor or environment.
* Storing all the entries in a MySQL database is not favorable. I am writing
  text, why would I pick any other format to store what I wrote?
* Over the years my blog became increasingly slow, and in order to have a
  reasonably fast site I needed to pay quite a sum of money. I am not ready for
  such a commitment, since I only occasionally update this blog.

On the other hand, Octopress (which is based on Jekyll, a static site
generator) has all of these concerns covered:

* I can write by creating simple Markdown documents. It doesn't matter where I
  write, or how I write. This enables me to use an editor of my choice.
* Plain text is universal. It can be viewed by a human, edited in any piece of
  software, printed out, emailed, piped to a Linux program - just about
  anything really.
* Static sites are ridiculously fast. There's no preprocessing and no
  rendering.  The only real speed limit is network latency. In addition, GitHub
  lets you host static sites for free. What else could you ask for?

## The process is painless

Switching from WordPress to Octopress was very easy, and it took me only a few
hours (spread out throughout one weekend). Some highlights:

1. Comments in Octopress are handled by [Disqus][2], and I had to set that up
on my WordPress blog before transitioning in order to transfer all the
comments.
2. I used the [WordPress to Jekyll Exporter][3] tool to export all my posts
from WordPress to Markdown (with meta-data which Octopress understands). I only
had a bit over 50 posts to worry about, so the process was complete in an
instant.
3. I ran some custom Vim macros to remove and change some excess meta data, as
well as clean up Markdown formatting. I am a perfectionist, and the exporter
tool left me with a poorly formatted document. I couldn't let that happen.

## Results are breathtaking

After only a few hours of work, I had a lightning fast, simple, and pragmatic
blog. There is no excess configuration, comments are handled externally, and
the source code for the site and articles is available on GitHub. I am able to
write my posts using Markdown, in my favorite editor, and use git to publish
the resulting articles.

[1]: http://octopress.org
[2]: https://disqus.com
[3]: https://github.com/benbalter/wordpress-to-jekyll-exporter
