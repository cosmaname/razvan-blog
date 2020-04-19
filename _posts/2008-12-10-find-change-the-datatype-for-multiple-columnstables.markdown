---
layout: post
title: Find / change the datatype for multiple columns/tables
date: 2008-12-10 18:45:34.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
tags: []
permalink: "/2008/12/find-change-the-datatype-for-multiple-columnstables/"
---
Find all columns of type datetime:  
`DECLARE @DataType VARCHAR(50)
SELECT @DataType = 'datetime'
SELECT * FROM Information_Schema.Columns WHERE Data_Type = @DataType order by table_name
`  
Find all varchar columns, change to nvarchar:

-- SQL 2005  
`SELECT 'ALTER TABLE ' + quotename(o.name) +
' ALTER COLUMN ' + quotename(c.name) +
' nvarchar(' + ltrim(str(c.max_length)) + ') ' +
CASE c.is_nullable
WHEN 1 THEN ' NULL'
WHEN 0 THEN ' NOT NULL'
END
FROM sys.objects o
JOIN sys.columns c ON o.object_id = c.object_id
JOIN sys.types t ON c.system_type_id = t.system_type_id
WHERE t.name = 'varchar'
ORDER BY o.name, c.name
`  
-- SQL 2000  
`SELECT 'ALTER TABLE ' + quotename(o.name) +
' ALTER COLUMN ' + quotename(c.name) +
' nvarchar(' + ltrim(str(c.length)) + ') ' +
CASE columnproperty(o.id, c.name, 'AllowsNull')
WHEN 1 THEN ' NULL'
WHEN 0 THEN ' NOT NULL'
END
FROM sysobjects o
JOIN syscolumns c ON o.id = c.id
JOIN systypes t ON c.xtype = t.xtype
WHERE t.name = 'varchar'
AND o.xtype = 'U'
ORDER BY o.name, c.name`

