---
layout: page
title: Archive
navbar: Archive
permalink: /blog/archive/
---
  
{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}

<div>
  <ul>
    {% for post in site.posts %}
      {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
      {% unless year == this_year %}
        {% assign year = this_year %}
        <h2 style="margin-top: 1em;">{{ year }}</h2>
      {% endunless %}
      <li>
        <a href="{{ root_url }}{{ post.url }}" itemprop="url">{% if site.titlecase %}{{ post.title | titlecase }}{% else %}{{ post.title }}{% endif %}</a>
        <span class="text-muted">| 📅 {{ post.date | date: date_format }}</span>
      </li>
    {% endfor %}
  </ul>
</div>
