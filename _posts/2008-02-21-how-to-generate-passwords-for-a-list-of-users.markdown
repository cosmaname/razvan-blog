---
layout: post
title: How to generate passwords for a list of users?
date: 2008-02-21 19:24:37.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
tags: []
permalink: "/2008/02/how-to-generate-passwords-for-a-list-of-users/"
---
Ugly hack

```
set nocount on
declare @a int
declare @b varchar(128)
set @a=0
drop table #rp
create table #rp(p varchar(128))
While 1=1
Begin
set @a=(Select Min(theindexfield) from thetable Where theindexfield&gt;@a)
If @a is null
break
else
delete from #rp
insert into #rp exec random_password 8,'simple'
update thetable set thepassfield=(select p from #rp) where id=@a
continue
End
```
the random_password procedure is something found on the 'Net, thanks to the dude who wrote it. Full listing below:
```
CREATE PROC random_password
(
@len int = 8, --Length of the password to be generated
@password_type char(7) = 'simple'
--Default is to generate a simple password with lowecase letters.
--Pass anything other than 'simple' to generate a complex password.
--The complex password includes numbers, special characters, upper case and lower case letters
)
AS
/*************************************************************************************************
Copyright © 2001 Narayana Vyas Kondreddi. All rights reserved.

Purpose:	To generate a random password

Written by:	Narayana Vyas Kondreddi
<a href="http://vyaskn.tripod.com/" target="_blank">http://vyaskn.tripod.com</a>

Tested on: 	SQL Server 7.0 and SQL Server 2000

Date modified:	March-29-2001 01:15 PM

Email: 		<a href="mailto:vyaskn@hotmail.com" target="_blank">vyaskn@hotmail.com</a>

Examples:

To generate a simple password with a length of 8 characters:
EXEC random_password

To generate a simple password with 6 characters:
EXEC random_password 6

To generate a complex password with 8 characters:
EXEC random_password @Password_type = 'complex'

To generate a comples password with 6 characters:
EXEC random_password 6, 'complex'
*************************************************************************************************/
BEGIN
DECLARE @password varchar(25), @type tinyint, @bitmap char(6)
SET @password=''
SET @bitmap = 'uaeioy'
--@bitmap  contains all the vowels, which are a, e, i, o, u and y. These vowels  are used to generate slightly readable/rememberable simple passwords

WHILE @len &gt; 0
BEGIN
IF @password_type = 'simple' --Generating a simple password
BEGIN
IF (@len%2) = 0  --Appending a random vowel to @password

SET @password = @password + SUBSTRING(@bitmap,CONVERT(int,ROUND(1 + (RAND() * (5)),0)),1)
ELSE --Appending a random alphabet
SET @password = @password + CHAR(ROUND(97 + (RAND() * (25)),0))

END
ELSE --Generating a complex password
BEGIN
SET @type = ROUND(1 + (RAND() * (3)),0)

IF @type = 1 --Appending a random lower case alphabet to @password
SET @password = @password + CHAR(ROUND(97 + (RAND() * (25)),0))
ELSE IF @type = 2 --Appending a random upper case alphabet to @password
SET @password = @password + CHAR(ROUND(65 + (RAND() * (25)),0))
ELSE IF @type = 3 --Appending a random number between 0 and 9 to @password
SET @password = @password + CHAR(ROUND(48 + (RAND() * (9)),0))
ELSE IF @type = 4 --Appending a random special character to @password
SET @password = @password + CHAR(ROUND(33 + (RAND() * (13)),0))
END

SET @len = @len - 1
END

SELECT @password --Here's the result

END
```
