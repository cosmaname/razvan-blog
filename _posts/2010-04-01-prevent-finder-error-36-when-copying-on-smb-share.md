---
layout: post
title: Prevent Finder error -36 when copying on SMB share
date: 2010-04-01 16:46:39.000000000 +00:00
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
permalink: "/2010/04/prevent-finder-error-36-when-copying-on-smb-share/"
---
The error is caused by OS X trying to save metadata for copied files in resource forks (NT terminology) / named streams (Mac terminology). If the server (usually Samba) doesn't support this it can be disabled  
1. For a Mac user, when connecting to any SMB server, write  
`[default]
streams=no
in ~/Library/Preferences/nsmb.conf`  
2. For all Mac users, when connecting to a specific share  
`touch "/shared dir/.com.apple.smb.streams.off"`  
while there, you should also do a  
`touch "/shared dir/.metadata_never_index"`  
3. Samba can also disable the forks and extended attributes for all clients, use  
`[global]
ea support = no
unix extensions = no
`in /etc/smb.conf

