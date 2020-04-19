---
layout: post
title: close all connections to current database
date: 2009-09-17 18:21:30.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
- Windows
tags: []
permalink: "/2009/09/close-all-connections-to-current-database/"
---
Useful if the database refuses to go offline for backup/restore

`DECLARE @DatabaseName nvarchar(50)
DECLARE @SPId int
DECLARE @CMD varchar(100)
SET @DatabaseName = DB_NAME()
DECLARE my_cursor CURSOR FAST_FORWARD FOR
SELECT SPId FROM MASTER..SysProcesses
WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId
OPEN my_cursor
FETCH NEXT FROM my_cursor INTO @SPId
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @CMD = 'KILL ' + CAST(@SPId AS varchar(10))
--SELECT @CMD
EXEC (@CMD)
FETCH NEXT FROM my_cursor INTO @SPId
END
CLOSE my_cursor
DEALLOCATE my_cursor`

