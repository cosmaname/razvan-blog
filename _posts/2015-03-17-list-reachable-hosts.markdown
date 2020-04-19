---
layout: post
title: list reachable hosts
date: 2015-03-17 11:31:13.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2015/03/list-reachable-hosts/"
---
`$ping = New-Object System.Net.NetworkInformation.Ping
Get-Content .\list.txt | ForEach-Object { "{0,-15} {1,16}" -f $_,$($($ping.Send($_).Address).IPAddressToString 2>$null) }`

