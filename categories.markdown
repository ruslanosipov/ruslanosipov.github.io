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
        <a href="{{ root_url }}/{{ site.category_path }}/{{ category | slugify }}">{{ category }}</a> ({{ site.categories[category].size }})
      </li>
    {% endfor %}
  </ul>
</div>
