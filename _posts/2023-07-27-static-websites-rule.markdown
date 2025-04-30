---
title: "Static websites rule!"
date: 2023-07-27 08:00:00 -0700
categories: [Programming, Technology]
---

I hope you've noticed that navigating to this page was quick (let's hope that the Internet Gods are kind to me, and nothing stood in the way of you accessing this page). In fact, most pages on my blog - hopefully including this one - should render in under a second. I didn't put any work into optimizing this site, and it's not a boast, nor is it a technological marvel - this is just a good old fashioned static website.

If this is new to you - static website is just what it sounds like - static HTML and CSS files, sometimes with some light JavaScript sprinkled throughout. There's no server side processing -- the only bottlenecks are the host server speed, recipient's connection speed, and the browser rendering speed. Page is stored as is, and is sent over as soon as it's requested. This is how the Internet used to be in late 90s and early 2000s (with eclectic web design to boot, of course).

I think static websites are cool and aren't used nearly enough, especially for websites that are, well, static. Think to the last website you've visited to read something - maybe a news site, or maybe a blog. Now did it take at least a couple of seconds for them to load? Likely. Did their server have to waste unnecessary cycles putting together a page for you? Most definitely. Now, contrast this with your experience with a static website like this one. Here's the result from [pagespeed.web.dev][1] for this page:

![A screenshot with page speed test for rosipov.com (this website). It displays: first contentful paint: 0.8 s; largest contentful paint: 0.9 s; total blocking time: 0 ms; cumulative layout shift: 0.007; speed index: 0.7 s.](/images/posts/rosipov-page-speed-test.png)

Every render complete in under a second, and I didn't have to put in any work into optimizing my website.

This site is built on a (now unsupported) [Octopress][2], which is itself built on top of [Jekyll][3]. You write pages in Markdown, generate web pages using a pre-made template, and deploy the resulting pages to a hosting provider. In fact, [GitHub Pages][4] allow you to host your static website for free, and you can have a third party platform like [Disqus][5] provide comment support.

Static websites work great for portfolios, blogs, and websites that don't rely on extensive common manipulation. They're more secure (no backend to hack), simple to build and maintain, very fast even without optimization, and are natively SEO friendly (search engines are great at understanding static pages). Static websites are cheap to run - I only pay for a domain name for this site (under $20 a year).

If you have a blog or a portfolio and you're using an overly complicated content management system to write - consider slimming down. [Jekyll][3] (or many of its alternatives) offers a number of pre-made off-ramps for major CMS users, is easy to set up, and is straightforward to work with. Can't recommend enough - static websites rule!

[1]: https://pagespeed.web.dev/
[2]: http://octopress.org/
[3]: https://jekyllrb.com/
[4]: https://pages.github.com/
[5]: https://disqus.com/
