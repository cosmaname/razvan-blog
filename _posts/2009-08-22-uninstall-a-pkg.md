---
layout: post
title: Uninstall a .pkg
date: 2009-08-22 18:23:04.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- OS X
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
permalink: "/2009/08/uninstall-a-pkg/"
---
The OS X installer doesn't offer a default tracking method for the files created by Installer packages (.pkg). While the list of files copied is present within the package, and is saved in /Library/Receipts/packagename, scripts run during install can create/modify others, and I think they can only be detected by running the install chrooted. Anyway, a quick solution to free disk space:  
`cd /Library/Receipts/packagename/Contents
lsbom -pf Archive.bom | cut -c 2- | sort -r | xargs -I# -p -t rm -d "#" ;`  
Warnings:  
1. this has to be run from a root shell (not sudo)  
2. mistake a single letter, and you might wipe the whole system  
3. do not try to be clever and add a -fr to the rm above

