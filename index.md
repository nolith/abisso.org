---
layout: page
title: Abisso Dev.
---
{% include JB/setup %}

{% for post in site.posts limit:1 %}
  <h2 id="intro"><a href="{{ post.url }}">{{ post.title }}</a></h2>
  <div class="post">
    {% if post.picture %}
    <img id="post-logo" src="{{ post.picture }}" />
    {% endif %}
  {{ post.content | truncatewords: 100 }}
<!-- <div class="fb-like" data-href="http://mgpf.it/{{ post.url }}" data-send="true" data-width="640" data-show-faces="true" data-font="lucida grande"></div> -->
  <p class="signoff">
    &raquo; {{ post.date | date: "%d/%m/%Y" }} con tag:
{% for tag in post.tags %}
<a href="/tags.html#{{ tag }}-ref">{{ tag }}</a>
{% endfor %}
  </p>
  </div>
{% endfor %}

<!-- <ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul> -->



