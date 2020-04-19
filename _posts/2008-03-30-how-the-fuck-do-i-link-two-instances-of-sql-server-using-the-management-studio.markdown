---
layout: post
title: How (the fuck) do I link two instances of SQL Server using the Management Studio?
date: 2008-03-30 19:16:50.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
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
permalink: "/2008/03/how-the-fuck-do-i-link-two-instances-of-sql-server-using-the-management-studio/"
---
Never thought I'll actually miss Enterprise Manager, but the newer one is even more confusing. So - no clue so far how to do such a simple task via the graphical interface, just execute the stuff below:  
`EXEC master.dbo.sp_addlinkedserver @server = N'server.domain.com\instance,tcport', @srvproduct=N'SQL Server'
EXEC master.dbo.sp_addlinkedsrvlogin N'server.domain.com\instance,tcport', false, null, 'sa', 'thesapassword'`

