---
title: "Goodbye Disqus, hello reply by email"
date: 2025-06-12 07:00:00 -0700
categories: [Writing, Programming]
---

This is a natural follow-up to last week's "[I don't want a large audience](/blog/i-dont-want-a-large-audience/)".

I've long been contemplating moving further away from using Disqus. I switched to Disqus [back in 2014](/blog/abandoning-wordpress-for-octopress/) when I abandoned my WordPress blog for Jekyll-based Octopress. Disqus seemed like a great choice- lean, customizable, ad-free, and most importantly, allowed dynamic comments for a statically generated site ([since this site is just a bunch of generated HTML pages](/blog/static-websites-rule/)).

The reason for the switch is two-part. I don't really have the emotional bandwidth to follow along with Disqus as a company as they revisit their values, change policies, or even just grow as a business. But more importantly, I want to see what my blog would look like with less interaction features. I think I may have been grandfathered into an ad-free plan (although that's unclear - I have network-wide ad-blocking, and I didn't bother enough to check if there are ads in the comments). And in principle, I can't really fault Disqus for introducing ads for unpaid comment tiers, especially without seeing their balance sheet. Maybe the free comments took up much-needed server capacity, and it could be that paid subscriptions weren't offsetting the costs enough. Or it could be that the company just got greedy, which wouldn't be too surprising to me either.

Outside of tutorials (which I rarely write these days), I'm not entirely sure how valuable the comments are to my readers. In fact, I think sometimes comments can be detrimental to the reader's enjoyment. Humans are a pack animal, and subconsciously we tend to favor things favored by others. So seeing a "100 comments" heading might make you think the post is popular for a reason, while seeing "Be the first to leave a comment" would make you consider if the piece is worth reading.

![A screenshot of the read-only comment widget on my site.](/images/posts/disqus-comment-export.png)

Anywho, I exported Disqus comments (which in turn already contained comments I exported from WordPress back in 2014), and I embedded those read-only comments into the existing pages. I wanted to preserve the discourse - especially on the tutorials and more widely discussed posts, and the read-only comments work great for that. Here's a live example: [Prius Adventures, a year later](/blog/prius-adventures-a-year-later/#comments). If you want to do something like this yourself, here's the [commit in question](https://github.com/ruslanosipov/ruslanosipov.github.io/commit/fb65351129d11c0c3a367aa86220b7004be5ef03), but I think this might be too niche of a topic to warrant a step-by-step guide.

I replaced the comment functionality with a <a href="mailto:{{ site.email }}?subject=Re: {{ page.title }}" class="button">✍️ Reply by email</a> button which you can find at the bottom of this post. Yeah, that button simply opens your email client and pre-fills my address and the email title. That's a private email, that only I will read, that I won't post publicly, and others won't see. But we might have a great conversation, which is better. Why don't you give it a shot, and tell me if this message resonates with you?

I'm not severing my site from the rest of the Internet here, no. Ever since I learned about [Webmentions](https://indieweb.org/Webmention), I eventually want to add Webmention support to my site at some point. But I might only filter it down to Webmentions from long-form posts on other sites, rather than comments or likes. It's definitely a no on likes for me. Follow along and see what I'll do.
