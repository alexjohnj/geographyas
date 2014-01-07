---
title: Contributing
layout: page
---

## Contributing Words

### Editing Existing Pages

It's easy to edit an existing article using GitHub. At the bottom of every article is a contribute link. It'll take you to the corresponding page on GitHub. From there, click the edit button, log in to GitHub (create an account if you need to) and edit away.  

Articles are written in _Markdown_, a simple language that makes writing for the web easier. Learning Markdown is super easy, it'll take you no longer than 5 minutes. You can find a basic tutorial [here][markdown-basics].

[markdown-basics]: http://daringfireball.net/projects/markdown/basics

When you submit an edit you're creating what's called a _pull request_. I'll see this, check it looks OK and approve it (assuming it is OK). If it takes a while for your edit to appear, it's because I haven't had time to check it out yet.

### Creating New Articles

Before you create an article, _please_ check that what you're writing is relevant. This website is aimed at people studying the _UK AQA Geography AS_ course. Read [the course specification [PDF]][geography-course-spec] before writing anything so you know you're writing something relevant.

[geography-course-spec]: http://filestore.aqa.org.uk/subjects/specifications/alevel/AQA-2030-W-SP-14.PDF

When you've written an article, submit it via an email with the subject "ARTICLE: ...". Submissions should be written in [Markdown][markdown-basics] but if you _must_ use Word then I'll convert it to Markdown for you. If you include images in the article, attach them to the email and reference them by name in the article. I'll change the references to point to the images. You **must** ensure that you have permission to use an image in an article. If the image requires attribution, include it in the article.

[Article Submission Link](mailto:submit@geographyas.info?subject=ARTICLE%3A)

Alternatively, you can submit an article by forking the site's [github repository][github-repo].

[github-repo]: https://github.com/alexjohnj/geographyas/

### Creating a New Topic

If you want to undertake writing an entire topic then [email me](mailto:alex@geographyas.info) so we can work together. I'll act as an editor and ensure that your articles are reviewed ASAP.

### Style Guide

This site's articles don't follow any established style guide but there are a few guidelines that should be followed:

- Use British English, mostly.
- The abbreviations of exempli gratia (e.g.) & id est (i.e.) should have periods between each letter. They should be followed by a period and a comma unless terminating a sentence in which case they should be followed by a single period.
- The abbreviation of et cetera (etc.) should have a single period following it. If ending a sentence, omit the sentence's period.
- Use the Oxford comma only if a sentence is ambiguous without it. For example[^1], _"We invited the clowns, JFK and Stalin"_ vs. _"We invited the clowns, JFK, and Stalin"._ The first sentence implies the clowns are JFK and Stalin. The second doesn't.
- Don't use metaphors unless you're _very_ good at making them.
- Always define terminology in a [definition list][dl-mdn] so that it is styled correctly on the website.
- Ampersands should be used exclusively in headers[^2].
- Headers should be title cased (each major word is capitalised).
- em dashes (---) should be used instead of parentheses for appositives. For example, _"The clowns---David Cameron and George Osborne---arrived late to the party."_ instead of _"The clowns (David Cameron and George Osborne) arrived late to the party."_ There shouldn't be any spaces between the em dashes and the words.
- en dashes (--) should be used to specify ranges. For example, _"The clowns drank 4--5 litres of champagne. They didn't pay of course."_

[dl-mdn]: https://github.com/fletcher/MultiMarkdown/wiki/MultiMarkdown-Syntax-Guide#definition-lists

## Contributing Pictures

### Photographs

If you have a photograph that will complement an article, email it to me with the subject "PHOTO: ...". There's no need to compress it, I'll handle that. In your email, tell me the license you're releasing the image under and how you want to be attributed (e.g., a link to your website).

[Photo submission link](mailto:submit@geographyas.info?subject=PHOTO%3A)

### Diagrams

Diagrams are appreciated as my drawing ability is limited. If you want to submit a diagram, send me an email with the subject "DIAGRAM: ...".

[Diagram submission link](mailto:submit@geographyas.info?subject=DIAGRAM%3A)

Although we need diagrams, there are some stringent rules for submissions. First, submissions must include both an SVG and PNG version of your diagram. This ensures that users of high DPI devices get good quality diagrams. [Inkscape][inkscape-link] is an excellent and free vector graphics editor than can produce SVG and PNG files. There's also [Inkpad][inkpad-link] for the iPad which has a gentler learning curve.

[inkscape-link]: http://www.inkscape.org
[inkpad-link]: https://itunes.apple.com/gb/app/inkpad/id400083414?mt=8

Besides the file requirements, there's also a style guide for diagrams. It's _really_ important you follow this guide because it makes reading diagrams faster for regular readers and ensures diagrams don't look out of place on the website.

### Diagram Style Guide

- Diagrams must have a transparent background. 
- Diagrams must be no bigger than 1140 px &times; 600 px (W &times; H).
- Diagrams must be in colour and accessible to people suffering from colour blindness.
- Annotations must be black unless this hurts legibility. 
- Annotations must use the Helvetica Neue Light font, size 24 px. If this font is not available, use Arial. No other font will be accepted.
- Annotations must use arrows, not lines, to call out features.
 
A few additional styles for graphs:

- If drawing a graph, grid lines are not necessary.
- If drawing a graph, axes labels should be in size 12 px Helvetica Neue Light or Arial if Helvetica is unavailable.

### Diagram Colour Scheme

A consistent colour scheme across diagrams ensures that common features are identifiable without a key. Like the style guide, it's _very_ important that you follow this colour scheme.

<div id="colour-schemes-container">
  <div class="colour-container">
    <div class="colour-sample earth"></div>
    <p>Earth/Terrain</p>
    <p>Hex: #855723</p>
    <p>RGB: R:133 G:87 B:35</p>
  </div>

  <div class="colour-container">
    <div class="colour-sample rock"></div>
    <p>Hard Rock</p>
    <p>Hex: #493829</p>
    <p>RGB: R:73 G:56 B:41</p>
  </div>

  <div class="colour-container">
    <div class="colour-sample grass"></div>
    <p>Grass</p>
    <p>Hex: #668D3C</p>
    <p>RGB: R:102 G:141 B:60</p>
  </div>

  <div class="colour-container">
    <div class="colour-sample deep-water"></div>
    <p>Deep Water</p>
    <p>Hex: #092B5A</p>
    <p>RBG: R:9 G:43 B:90</p>
  </div>

  <div class="colour-container">
    <div class="colour-sample shallow-water"></div>
    <p>Shallow Water</p>
    <p>Hex: #09738A</p>
    <p>RGB: R:9 G:115 B:138</p>
  </div>

  <div class="colour-container">
    <div class="colour-sample sand"></div>
    <p>Sand/Sediment/Soft Rock</p>
    <p>Hex: #C8A87A</p>
    <p>RGB: R:200 G:168 B:122</p>
  </div>
</div>

## Code

The entire website is available on [GitHub][github-repo]. Its main purpose is for other people to learn from it but if you want to contribute any code, feel free. The website's built using Jekyll, Sass and CoffeeScript. There's also a little bit of jQuery mixed in there. 

[github-repo]: https://github.com/alexjohnj/geographyas/

[^1]: This example is adapted from a slightly more risqué example which I won't link to. 

[^2]: I haven't done a good job sticking to this rule because I love using ampersands. They feel classy.


