---
layout: post
title: re-encode xvid clips for the xbox360 player
date: 2012-06-28 21:46:09.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2012/06/re-encode-xvid-clips-for-the-xbox360-player/"
---
# mencoder infile.avi -ovc lavc -oac copy -lavcopts vcodec=mpeg4:threads=2:autoaspect:turbo:mbd=2:trell=1 -ffourcc xvid -mc 0 -vf softskip,harddup -o outfile.avi

