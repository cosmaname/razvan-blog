---
layout: post
title: Why can't I send e-mail from ASP (.Net) anymore?
date: 2008-03-28 19:21:16.000000000 +00:00
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
permalink: "/2008/03/why-cant-i-send-e-mail-from-asp-net-anymore/"
---
Things that used to work mighty fine in 2000 server suddenly break in 2003.  
1. CDONTS is no longer available, but it works if you copy one dll from a 2000 system and do a regsvr32 %windir%\system32\cdonts.dll  
2. Classic ASP using CDO fails with error "cdo.message error 80070005". Reason: the user IIS runs under (usually Network Service) must have write acces to the Exchange pickup directory (usually C:\Program Files\Exchsrvr\Mailroot\vsi 1\PickUp)  
3. ASP.Net scripts also fail with several possible messages, "acces denied" or "cannot access cdo.message object". Solution: always specify a valid SMTP server address, e.g. in web.config, then `
System.Web.Mail.SmtpMail.SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["SmtpServer"]; System.Web.Mail.SmtpMail.Send(msg);`

