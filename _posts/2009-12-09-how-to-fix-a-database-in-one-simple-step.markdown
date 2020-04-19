---
layout: post
title: How to fix a database in one simple step
date: 2009-12-09 17:39:30.000000000 +00:00
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
permalink: "/2009/12/how-to-fix-a-database-in-one-simple-step/"
---
`DECLARE @db nvarchar(50)
set @db='my.datab.name'
--close all connections
DECLARE @SPId int
DECLARE @CMD varchar(100)
DECLARE my_cursor CURSOR FAST_FORWARD FOR
SELECT SPId FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@db) AND SPId <> @@SPId
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @SPId
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @CMD = 'KILL ' + CAST(@SPId AS varchar(10))
EXEC (@CMD)
FETCH NEXT FROM my_cursor INTO @SPId
END
CLOSE my_cursor
DEALLOCATE my_cursor
exec('ALTER DATABASE ['+ @db +'] SET SINGLE_USER WITH NO_WAIT')
dbcc checkdb(@db, REPAIR_ALLOW_DATA_LOSS)
exec('ALTER DATABASE ['+ @db +'] SET MULTI_USER WITH NO_WAIT')
`  
try another dbcc checkdb afterwards to be sure it's fixed

