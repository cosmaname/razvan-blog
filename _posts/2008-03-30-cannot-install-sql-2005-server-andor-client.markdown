---
layout: post
title: Cannot install SQL 2005 (server and/or client)
date: 2008-03-30 19:17:51.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2008/03/cannot-install-sql-2005-server-andor-client/"
---
Again the astoundingly complex Microsoft installer lost me several hours  for an otherwise simple task. Things that can go wrong (and they all  went wrong, under different circumstances, on several systems):
1.  “Unexpected error occurred” - if you copy the contents of the two  installation CDs, make sure one is in a subfolder called "Servers" the  other "Tools".
2. If you want to install just the client connectivity  and management options, start the installer from the "Servers" not the  "Tools" subfolder.
These two were the main reason of this post, being so infuriatingly stupid.
3.  "Failed to compile the Managed Object Format (MOF) file" - WMI (Windows  Management Instrumentation) database is broken for whatever reason, you  must delete and rebuild it:
<code>net stop winmgmt
cd %windir%\System32\Wbem\
ren Repository Repository_bad
XP: rundll32 wbemupgd, UpgradeRepository
2003: rundll32 wbemupgd, RepairWMISetup
Vista: winmgmt /salvagerepository
net start winmgmt</code>
4.  Uninstall any trace of the Express Edition Toolkit, and reboot, before  attempting to install the Management Studio. The paid and free versions  of the client components don't seem to play well with eachother.
