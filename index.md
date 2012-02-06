---
layout: page
title: Abisso Dev.
---
{% include JB/setup %}


# Abisso Dev.
*Il sapere umano appartiene al mondo*

Questa versione del sito è un work-in-progress della migrazione wordpress -> jekyll.

## Ultimi post

<ul class="posts">
  {% for post in site.posts limit:5 %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul> 



