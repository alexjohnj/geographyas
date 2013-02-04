---
layout: nil
---
searchIndex = [
{% for post in site.posts %}
{
"title": "{{ post.title }}",
"href": "{{ post.url }}"
},
{% endfor %}
false
];