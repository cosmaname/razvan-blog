---
layout: post
title: Publish a 32-bit .Net app to 2003 x64 server
date: 2009-12-03 17:58:48.000000000 +00:00
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
  _wp_old_slug: ''
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2009/12/publish-a-32-bit-net-app-to-2003-x64-server/"
---
`1. %windir%\Microsoft.NET\Framework64\v2.0.50727\aspnet_regiis.exe -u
2. %windir%\system32\cscript %SYSTEMDRIVE%\inetpub\adminscripts\adsutil.vbs SET W3SVC/AppPools/Enable32bitAppOnWin64 1
3. %windir%\Microsoft.NET\Framework\v2.0.50727\aspnet_regiis -i
4. Enable the 32-bit ASP.net extension from IIS Manager`

