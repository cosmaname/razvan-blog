---
layout: post
title: find maxdepth
date: 2015-06-10 14:49:44.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Perl
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2015/06/find-maxdepth/"
---
`$ perl -e 'use File::Find; find (sub { $d=$File::Find::dir=~tr[/][]; return if $d>6; if (-f and /config.xml/) {open $f,"; close $f; @m = grep /some string/i @a; print "\nfound in ",$File::Find::name,"\n",@m if @m} },"/opt/hudson/work/jobs")'`

