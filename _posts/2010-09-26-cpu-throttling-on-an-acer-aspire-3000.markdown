---
layout: post
title: CPU throttling on an Acer Aspire 3000
date: 2010-09-26 15:16:43.000000000 +00:00
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
permalink: "/2010/09/cpu-throttling-on-an-acer-aspire-3000/"
---
When running the default (retail) XP SP3 OS, this laptop runs at full CPU speed, and becomes worryingly hot in the process. Since [Acer's e\* Management](http://support.acer-euro.com/empowering_technology/utility.html) package doesn't seem to actually do anything, the solution so far is to:

1. [Download RMClock](http://cpu.rightmark.org/products/rmclock.shtml "RMClock Utility")
2. Keep only two profiles, 4.0@0.975V and 8.0@1.175V
3. Set profile to "Performance on demand" and "Use PST"

If you don't run with administrator privileges by default,

1. [Install AdmiLink](http://admilink.narod.ru/admilink.htm) (yes, it's in Russian)
2. Point it to the full path to RMClock.exe, ShowWindow -d10 SHOWDEFAULT, link in AutoStart folder, delay enough seconds for the shell to load
