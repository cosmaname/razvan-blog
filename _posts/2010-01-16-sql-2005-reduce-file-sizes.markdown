---
layout: post
title: sql 2005 reduce file sizes
date: 2010-01-16 16:57:33.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
tags: []
permalink: "/2010/01/sql-2005-reduce-file-sizes/"
---
use angajare  
alter database angajare set recovery simple  
backup log angajare with truncate\_only  
dbcc shrinkfile (angajare\_log, 1)  
dbcc shrinkfile (angajare, 1)

