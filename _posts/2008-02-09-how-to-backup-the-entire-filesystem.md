---
layout: post
title: How to backup the entire filesystem?
date: 2008-02-09 19:35:39.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
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
permalink: "/2008/02/how-to-backup-the-entire-filesystem/"
---
```
rsync -aAXHv --delete --numeric-ids --exclude={"lost+found","/proc/\*","/sys/\*","/tmp/\*"} / bk@otherhost:/dir
```

&nbsp;

