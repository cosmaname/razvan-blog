---
layout: post
title: How to delete an user from SQL db
date: 2009-05-08 18:27:16.000000000 +00:00
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
permalink: "/2009/05/how-to-delete-an-user-from-sql-db/"
---
Specifically, a MS SQL 200/2005 db. Enterprise Manager and the equivalent Management Studio fail with no helpful details if said user owns any object in the database. To find out first if there are any schemas owned by the user:

`use [thedatabase];
select s.* from sys.schemas as s
inner join sys.database_principals as dp on dp.principal_id =
s.principal_id
where dp.[name] = 'domain\user or sqluser';
`  
Those schemas may or may not hold anything useful, check with  
`select s.[name] as schemaname, o.[name] as objectname, o.type_desc
from sys.objects as o
inner join sys.schemas as s on s.schema_id = o.schema_id
inner join sys.database_principals as dp on dp.principal_id =
s.principal_id
where dp.[name] like 'schema_name from above'
order by s.[name], o.type_desc, o.[name];
`  
If there's no output, you can safely  
`drop schema schema_name;`  
otherwise, remove the user's ownership  
`alter authorization on schema::schema_name to dbo;`  
then  
`drop user [username];`

