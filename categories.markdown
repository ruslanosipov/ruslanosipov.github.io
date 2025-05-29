---
layout: page
title: Categories
navbar: Categories
permalink: /blog/categories/
---

I write on any topic that interests me, so my blog isn't limited to a single topic. You can customize your experience by only reading posts that are of interest to you:

{% assign category_names = "" | split: "" %}
{% for category in site.categories %}
  {% assign category_names = category_names | push: category[0] %}
{% endfor %}
{% assign category_names = category_names | sort %}
  
<div>
  <ul>
    {% for category in category_names %}
      <li>
        <a href="{{ root_url }}/{{ site.category_path }}/{{ category | slugify }}">{{ category }}  ({{ site.categories[category].size }})</a>
        <a href="{{ root_url }}/blog/categories/{{ category | slugify }}.xml" target="_blank" title="RSS feed for {{ category }} category">
          <img src="{{ '/images/rss.png' | relative_url }}"
               alt="RSS feed icon for {{ category_name }}"
               style="width: 16px; height: 16px; vertical-align: middle; border: 0; border-radius: 0;">
        </a>
      </li>
    {% endfor %}
  </ul>
</div>
