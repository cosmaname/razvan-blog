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
permalink: "/2010/08/display-hard-link-target/"
---
find . -type f -links +1

find \<samefilesystem\> -inum \<inode from above\> -ls

