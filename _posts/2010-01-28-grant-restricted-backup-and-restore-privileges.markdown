---
layout: post
title: Grant restricted backup and restore privileges
date: 2010-01-28 16:54:48.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
- Windows
tags: []
permalink: "/2010/01/grant-restricted-backup-and-restore-privileges/"
---
Purpose: allow a specific user to backup and restore database, without giving her full access to the filesystem.  
As dbo, create the proc below, create the login, grant public access to master, grant dbo access on the needed databases, grant execute on dbo.backupng and dbo.restoreng to sqluser.  
As user,  
`exec backupng @database='somename'`  
`
exec sp_configure 'show advanced options',1
reconfigure
go
exec sp_configure 'xp_cmdshell',1
reconfigure
go
EXEC sp_xp_cmdshell_proxy_account 'domain\user', 'password' --use a restricted user for this one
go
set nocount on
go
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[backupng]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[backupng]
go
create procedure [dbo].[backupng] ( @database sysname ) as
declare @rootdir varchar(128)
--allow writes only in a specific dir
select @rootdir='d:\sites\sqlbackups\'
declare @cmd varchar(128)
declare @result varchar(128)
SELECT @cmd = 'dir ' + @rootdir
EXEC @result = master.dbo.xp_cmdshell @cmd, no_output
IF @result <> 0
BEGIN
SELECT @cmd = 'mkdir ' + @rootdir
EXEC master.dbo.xp_cmdshell @cmd, NO_OUTPUT
END
declare @db varchar(128)
select @db = replace(replace(replace(@database,':',''),'''',''),'\','')
declare @now varchar(14)
declare @filename varchar(128)
select @now = replace(replace(replace(convert(varchar(50), getdate(), 120), '-', ''), ' ', ''), ':', '')
select @filename = @rootdir + @db + '_' + @now + '.bak'
BACKUP DATABASE @db TO DISK = @filename WITH INIT
go`

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[restoreng]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)  
drop procedure [dbo].[restoreng]  
go  
create procedure [dbo].[restoreng] ( @database sysname ) as  
declare @rootdir varchar(128)  
select @rootdir='d:\sites\sqlbackups\'  
declare @cmd varchar(128)  
declare @result varchar(128)  
declare @db varchar(128)  
select @db = replace(replace(replace(@database,':',''),'''',''),'\','')  
declare @now varchar(14)  
declare @filename varchar(128)  
select @filename = @rootdir + @db + '.bak'  
--EXEC sp_dboption @db, 'single user', 'true'  
--drop database @db  
--restore DATABASE @db from disk = @filename  
go

