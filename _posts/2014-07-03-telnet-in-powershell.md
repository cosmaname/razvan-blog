---
layout: post
title: telnet in powershell
date: 2014-07-03 14:29:03.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2014/07/telnet-in-powershell/"
---
`If (New-Object System.Net.Sockets.TCPClient -ArgumentList '192.168.252.3',1688) {Write-Host 'YES'}`

