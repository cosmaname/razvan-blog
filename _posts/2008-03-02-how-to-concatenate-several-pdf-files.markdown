---
layout: post
title: How to concatenate several PDF files
date: 2008-03-02 19:22:44.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2008/03/how-to-concatenate-several-pdf-files/"
---
Use [Ghostscript](http://pages.cs.wisc.edu/%7Eghost/). There is no Mac package, but a `./configure --without-x && make && sudo make install` will do. Ghostscript offers a wealth of functions to generate or manipulate existing PDFs, check [http://pages.cs.wisc.edu/~ghost/doc/cvs/Use.htm#Options](http://pages.cs.wisc.edu/%7Eghost/doc/cvs/Use.htm#Options) for details.  
So, to concatenate: `gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=out.pdf in1.pdf in2.pdf ...`

