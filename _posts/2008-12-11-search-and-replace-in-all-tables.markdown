---
layout: post
title: search and replace in all tables
date: 2008-12-11 18:42:18.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
tags: []
permalink: "/2008/12/search-and-replace-in-all-tables/"
---
<p><code>SET NOCOUNT ON<br />
DECLARE @stringToFind NVARCHAR(100)<br />
DECLARE @stringToReplace NVARCHAR(100)<br />
DECLARE @schema sysname<br />
DECLARE @table sysname<br />
DECLARE @count INT<br />
DECLARE @sqlCommand NVARCHAR(max)<br />
DECLARE @where NVARCHAR(max)<br />
DECLARE @columnName sysname<br />
DECLARE @object_id INT<br />
SET @stringToFind = 'Smith'<br />
SET @stringToReplace = 'Jones'<br />
DECLARE TAB_CURSOR CURSOR  FOR<br />
SELECT   B.NAME      AS SCHEMANAME,<br />
A.NAME      AS TABLENAME,<br />
A.OBJECT_ID<br />
FROM     sys.objects A<br />
INNER JOIN sys.schemas B<br />
ON A.SCHEMA_ID = B.SCHEMA_ID<br />
WHERE    TYPE = 'U'<br />
ORDER BY 1<br />
OPEN TAB_CURSOR<br />
FETCH NEXT FROM TAB_CURSOR<br />
INTO @schema,<br />
@table,<br />
@object_id<br />
WHILE @@FETCH_STATUS = 0<br />
BEGIN<br />
DECLARE COL_CURSOR CURSOR FOR<br />
SELECT A.NAME<br />
FROM   sys.columns A<br />
INNER JOIN sys.types B<br />
ON A.SYSTEM_TYPE_ID = B.SYSTEM_TYPE_ID<br />
WHERE  OBJECT_ID = @object_id<br />
AND IS_COMPUTED = 0<br />
AND B.NAME IN ('char','nchar','nvarchar','varchar','text','ntext')<br />
OPEN COL_CURSOR<br />
FETCH NEXT FROM COL_CURSOR<br />
INTO @columnName<br />
WHILE @@FETCH_STATUS = 0<br />
BEGIN<br />
SET @sqlCommand = 'UPDATE ' + @schema + '.' + @table + ' SET [' +  @columnName + '] = REPLACE(convert(nvarchar(max),[' + @columnName +  ']),''' + @stringToFind + ''',''' + @stringToReplace + ''')'<br />
SET @where = ' WHERE [' + @columnName + '] LIKE ''%' + @stringToFind + '%'''<br />
EXEC( @sqlCommand + @where)<br />
SET @count = @@ROWCOUNT<br />
IF @count &gt; 0<br />
BEGIN<br />
PRINT @sqlCommand + @where<br />
PRINT 'Updated: ' + CONVERT(VARCHAR(10),@count)<br />
PRINT '----------------------------------------------------
'  
END  
FETCH NEXT FROM COL\_CURSOR  
INTO @columnName  
END  
CLOSE COL\_CURSOR  
DEALLOCATE COL\_CURSOR  
FETCH NEXT FROM TAB\_CURSOR  
INTO @schema,  
@table,  
@object\_id  
END  
CLOSE TAB\_CURSOR  
DEALLOCATE TAB\_CURSOR

