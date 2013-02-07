---
layout: nil
---
var searchIndex = [
{% for post in site.posts %}
{
"title": "{{ post.title }}",
"href": "{{ post.url }}",
"category": "{{ post.category }}"
},
{% endfor %}
false
];