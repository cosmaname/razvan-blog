---
layout: post
title: count duplicate lines (records)
date: 2009-03-20 18:33:15.000000000 +00:00
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
  _wp_old_slug: ''
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2009/03/count-duplicate-lines-records/"
---
`$count{$_}++ while <>; print "$count{$_} = $_" for sort(keys %count);`

