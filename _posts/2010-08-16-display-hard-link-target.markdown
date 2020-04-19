---
layout: post
title: display hard link target
date: 2010-08-16 08:41:49.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- AIX
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
permalink: "/2010/08/display-hard-link-target/"
---
find . -type f -links +1

find \<samefilesystem\> -inum \<inode from above\> -ls

