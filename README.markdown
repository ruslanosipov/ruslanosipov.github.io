# Ruslan Osipov

That's my blog, it's written in Jekyll.

For first time setup, run `bundle install`.

Posts go in `_posts/` directory, e.g.
`2023-11-24-essentialism-a-practical-guide-to-less.markdown`. Each post needs a
front matter:

```
---
title: "Essentialism: A Practical Guide to Less"
date: 2023-11-24 12:00:00 -0800
categories: [Reviews, Productivity, Work]
---
```

For local testing, run `bundle exec jekyll serve --baseurl=""`.

Posts should be getting deployed automatically through GitHub actions on push to
the master branch.
