---
layout: post
title: How to subclass CSS properties?
date: 2008-02-11 19:29:13.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2008/02/how-to-subclass-css-properties/"
---
You can't. The HTML keyword 'class' might be misleading, but it has nothing to do with inheritance, encapsulation, etc. In CSS, any definition can overwrite anything else, no matter where it's placed in the DOM, and to make things worse, all browsers accept a "quirks" rendering mode that tolerates syntax errors and tries to make up for them in whatever way the programmer saw fit. All DOM element properties can also be re-defined dynamically with JavaScript, on events like Load, MouseOver, Blur, with timers, etc. Browsers also accept user-defined style sheets, and most of the time the user won't even know he/she has defined one while installing a 'skin', 'theme' or simply changing the default operating system fonts. The bottom line is: you don't have a fucking clue where you are in a document, and how the container you are referring to looks like.
