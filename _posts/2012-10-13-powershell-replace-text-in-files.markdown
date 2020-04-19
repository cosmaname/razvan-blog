---
layout: post
title: powershell - replace text in files
date: 2012-10-13 10:31:38.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2012/10/powershell-replace-text-in-files/"
---
For want of a proper sed, the PS way:  
Get-ChildItem -exclude \*bak | Where-Object {$\_.Attributes -ne "Directory"} | ForEach-Object { Copy-Item $\_ "$($\_).bak"; (Get-Content -Encoding UTF8 $\_) -replace "some text","other text" | Set-Content -Encoding UTF8 -path $\_ }

