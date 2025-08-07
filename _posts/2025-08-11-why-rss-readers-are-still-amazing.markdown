---
title: "Why RSS readers are still amazing"
date: 2025-08-11 07:00:00 -0700
categories: [Technology]
---

Most blogs and websites have RSS feeds, and so does mine - you can see it in the main menu (or maybe you're already reading this through an RSS reader). It's a simple, powerful way to view content without having to directly visit another website. For consumers, it's a fantastic tool, giving them control over their content consumption.

But for advertisers, it's a disliked feature. And honestly? I'm okay with that. RSS feeds allow you to bypass the intrusive aspects of the modern web: the annoying pop-ups, banner ads, and tracking cookies. While some might argue that this hurts advertisers, I believe a user-focused experience is better for everyone. RSS still supports images and hyperlinks, so advertisers can include ads directly in the content. It's the street hawkers of the internet that end up suffering, and that’s a good thing. Advertisers will have much better luck selling things based on the content you're reading, and users get pretty good at ignoring intrusive ads the more tech-savvy they get.

RSS feeds feel like basic internet infrastructure, and they used to be a fundamental part of my online life. I was a huge user of RSS feeds before [Google Reader](https://en.wikipedia.org/wiki/Google_Reader) was killed in March 2013. Brutally murdered, really - driving an axe into a body of self-curated content. Google Reader was the Gmail of RSS readers: free, unobtrusive, simple, and powerful. Its death left a void.

I tried many different Google Reader alternatives over the years, and something would always be off about them. The services are either ad-supported or paid, which is understandable; no one is willing to run an RSS service for a loss. But because you're the customer for the RSS readers, there are often too many bells and whistles to stand out over the competition. UIs get refreshed, and features get added, but all I ever wanted was to read my syndicated content in one place.

This desire for simplicity and control is why I believe so strongly in RSS. Algorithmic curation is a widespread alternative to RSS feeds, and it's something I've actively fought against. [Technology Connections](https://www.youtube.com/watch?v=QEJpZjg8GuA) has a wonderful YouTube video on the subject that I recommend giving a watch. The video's TL;DW is that recommendation algorithms keep the typical internet user complacent, prioritizing engagement over accuracy or quality. It was a video that inspired me to [turn off YouTube recommendations](/blog/in-defense-of-quality/) and engage with the platform through subscriptions only. That decision bought me so much time.

And that's what it's about for me: time and control. Manually curated content ends. I run out of things to read, and there are days when I've got nothing in my queue. And that's great, because I can get bored and do something else with my time. I don't need another content recommendation engine constantly feeding me new things. I get my recommendations from the blogs and sites I already follow.

This brings me to [Miniflux](https://miniflux.app/). Miniflux is a fully open-source RSS reader that you can self-host or pay a reasonable [hosting fee](https://miniflux.app/hosting.html) ($15 a year as of the moment of writing this article). I run Miniflux in a docker container on my home server.

It is the perfect embodiment of what an RSS reader should be. Miniflux is simple to set up but is surprisingly robust. You've got your feeds, search, and history. But you've also got blocklists and integrations, and the ability to ingest custom JavaScript into the client if that's your thing.

![Miniflux RSS: simple and clean.](/images/posts/miniflux.png)

Crucially, Miniflux doesn't dabble in content discovery, which is something many other RSS readers do. I'm not a power user; I'm subscribed to a few dozen feeds, mostly blogs like mine, and I read through my RSS feeds a few times a week. Miniflux simply does its job, beautifully and without distraction.

The modern internet often feels like a stream that never ends, with algorithms designed to keep us scrolling and clicking. And RSS offers an alternative - a tool for being deliberate about what you consume, building your own information ecosystem, and taking control over your time and attention.
