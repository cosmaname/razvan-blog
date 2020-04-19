---
layout: post
title: Figure out when a system was installed
date: 2014-12-22 11:08:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2014/12/figure-out-when-a-system-was-installed/"
---
AIX:  
`lsconf
ll /var/adm/ras/bosinstlog`  
ESXi:  
`get-vmhost | sort name | foreach {$h = $_.Name; $d = (Get-EsxCli -VMHost $h).software.vib.list() | sort InstallDate | select -first 1; write-host $h,$d.InstallDate;}`  
HP-UX:  
`ll /dev/config
echo "sel dev 1;info;wait;il"|/usr/sbin/cstm`  
Linux:  
`rpm -qi basesystem
rpm -qi filesystem
head /var/log/installer/syslog`  
Solaris:  
`showrev
ll /var/sadm/system/logs
/usr/sbin/prtconf | head`  
Windows:  
`systeminfo | findstr Original`

