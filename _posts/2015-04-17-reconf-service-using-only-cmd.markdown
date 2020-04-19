---
layout: post
title: reconf service using only cmd
date: 2015-04-17 11:54:39.000000000 +00:00
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
permalink: "/2015/04/reconf-service-using-only-cmd/"
---
Fixing Zabbix on a bunch of Windows machines with local accounts  
`
for /F "tokens=1-3 delims=," %%A in (zz.list) do (
 echo %%A %%B %%C
 net use "\\%%A.mydomain.com\C$" %%C /user:%%A\%%B
 xcopy /q /y zabbix_agentd.win.conf "\\%%A.mydomain.com\C$\Program Files (x86)\Zabbix Agent\zabbix_agentd.conf"
 net use "\\%%A.mydomain.com\C$" /delete
 net use "\\%%A.mydomain.com\IPC$" %%C /user:%%A\%%B
 sc \\%%A.mydomain.com stop "Zabbix Agent"
 sc \\%%A.mydomain.com start "Zabbix Agent"
 net use "\\%%A.mydomain.com\IPC$" /delete
)
`  
and `HostnameItem=system.hostname[host]` in conf

