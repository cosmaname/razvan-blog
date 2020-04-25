---
layout: post
title: remove duplicates
date: 2008-12-12 18:40:59.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
tags: []
permalink: "/2008/12/remove-duplicates/"
---
1. create another identical table (lazy way: right-click table, script table as, create to, new query editor window)  
2. rename constraints  
3. create unique index removeduplicates on newtab (uniqfield) with  
IGNORE_DUP_KEY  
4. insert * from oldtab into newtab  
You'll get a warning "ignoring duplicate field" which is good.

