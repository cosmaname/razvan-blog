---
layout: post
title: where's the security tab?
date: 2010-01-25 16:58:45.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2010/01/wheres-the-security-tab/"
---
Either  
`Tools->Folder Options->View-> uncheck Use simple file sharing`  
or  
`Hive: HKEY_CURRENT_USER
Key: Software\Microsoft\windows\CurrentVersion\Policies\Explorer
Name: Nosecuritytab
Type: REG_DWORD
Value: 0`  
or  
`convert c: /fs:ntfs`

