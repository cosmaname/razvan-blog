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
permalink: "/2014/07/telnet-in-powershell/"
---
`If (New-Object System.Net.Sockets.TCPClient -ArgumentList '192.168.252.3',1688) {Write-Host 'YES'}`

