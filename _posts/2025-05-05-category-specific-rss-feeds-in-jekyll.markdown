---
title: "Category-specific RSS feeds in Jekyll"
date: 2025-06-05 07:00:00 -0700
categories: [Programming]
---

[Chris Shaw](https://thoughts.uncountable.uk/) asked me if I had category-specific RSS feeds on my site, and it felt like a perfectly reasonable request in the spirit of IndieWeb. This is a statically generated Jekyll site, and I couldn't really find out-of-the box examples that worked exactly for my site.

Although, if you're trying to kill two birds with one stone - that is to add categories and category feeds, you should use the [jekyll-archives](https://github.com/jekyll/jekyll-archives) plugin, which seems to be capable of both generating the category pages, and category-specific RSS feeds.

I already have working and heavily customized categories through the unofficial [jekyll-category-pages](https://github.com/field-theory/jekyll-category-pages), and I needed a custom solution. This solution doesn't rely on jekyll-category-pages though.

![Maybe there are too many RSS icons, I should probably change that. But you get the idea](/images/posts/rosipov-categories.png)

My Ruby skills are rusty, so I used Gemini Pro 2.5 to give me a hand with code generation. It took a couple of iterations, but the result is working fine.

First I added `_layouts/category_feed.xml` to create a layout:

{% raw %}
```
---
layout: null
---
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>{{ site.title | xml_escape }} - {{ page.category | xml_escape }}</title>
    <description>Recent posts in {{ page.category | xml_escape }} category on {{ site.title | xml_escape }}.</description>
    <link>{{ "/" | absolute_url }}</link>
    <atom:link href="{{ site.url }}{{ site.baseurl }}{{ page.url }}" rel="self" type="application/rss+xml" />
    <pubDate>{{ site.time | date_to_rfc822 }}</pubDate>
    <lastBuildDate>{{ site.time | date_to_rfc822 }}</lastBuildDate>
    <generator>Jekyll v{{ jekyll.version }}</generator>
    {% for post in site.categories[page.category] %}
      <item>
        <title>{{ post.title | xml_escape }}</title>
        <description>{{ post.content | xml_escape }}</description>
        <pubDate>{{ post.date | date_to_rfc822 }}</pubDate>
        <link>{{ post.url | absolute_url }}</link>
        <guid isPermaLink="true">{{ post.url | absolute_url }}</guid>
        {% for tag in post.tags %}
        <category>{{ tag | xml_escape }}</category>
        {% endfor %}
        {% for cat in post.categories %}
        <category>{{ cat | xml_escape }}</category>
        {% endfor %}
      </item>
    {% endfor %}
  </channel>
</rss>
```
{% endraw %}

Then, I added `_plugins/category_feed_generator.rb` (be sure to customize the `blog/categories` path to your liking):

{% raw %}
```
module Jekyll
  class CategoryFeedPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = "#{Jekyll::Utils.slugify(category)}.xml"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_feed.xml')
      self.data['category'] = category
    end
  end

  class CategoryFeedGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_feed'
        dir = 'blog/categories'
        site.categories.each_key do |category|
          site.pages << CategoryFeedPage.new(site, site.source, dir, category)
        end
      end
    end
  end
end
```
{% endraw %}

This creates feeds like [/blog/categories/programming.xml](/blog/categories/programming.xml) (or whatever URL you used).

Finally, I added category specific links to the category listing pages and the category index (that part will be specific to how you choose to display your categories): <a href="/blog/categories/programming.xml">RSS feed for Programming</a>.

```
<a href="/blog/categories/programming.xml">RSS feed for Programming</a>
```

You can see the full commit with the changes [here](https://github.com/ruslanosipov/ruslanosipov.github.io/commit/8af8814a92877123be8de3e6f307644f6348e099). Happy Jekyll-ing!
