---
layout: post
title: before upgrade
date: 2015-07-26 08:13:56.000000000 +00:00
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
permalink: "/2015/07/before-upgrade/"
---
```
perl -MExtUtils::Installed -e "use v5.10; $i=ExtUtils::Installed-\>new(); @m=$i-\>modules(); foreach $mm (@m) {say $mm .' - '. $i-\>version($mm);}"
```
