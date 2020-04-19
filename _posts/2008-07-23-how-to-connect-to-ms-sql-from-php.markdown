---
layout: post
title: How to connect to MS SQL from PHP
date: 2008-07-23 18:49:22.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- PHP
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
permalink: "/2008/07/how-to-connect-to-ms-sql-from-php/"
---
1. Install [FreeTDS](http://freetds.org/). (./configure && make && make install)  
2. Install PHP with freetds support (./configure --with-sybase=DIR, where DIR is wherever you placed freetds usually /usr/local)  
3. Read a bit of /etc/freetds.conf (not mandatory)  
4.  
`ini_set('mssql.secure_connection','On');
$con = mssql_connect ("1.2.3.4", "user", "pass") or die ("Could not connect to SQL server"); //.mssql_get_last_message()
mssql_select_db ("thedb", $con) or die ("Cannot open database");
$sql= "select top 10 * from test";
$rs= mssql_query ($sql, $con);
while($line = mssql_fetch_row($rs)){
print "$line[0]<br>";
}
mssql_close ($con);
exit(0);`

Using the MSSQL Server extension on Win32 requires these steps:  
1) Install the SQL Server Client tools on the machine running PHP  
([you can get that for free from Microsoft](http://www.microsoft.com/downloads/details.aspx?FamilyID=d09c1d60-a13c-4479-9b91-9e8b9d835cdc&displaylang=en), the one you need is probably sqlncli.msi)  
2) Configure a server alias using the client network utility. The alias specifies name, host name, protocol and port numbers used for the db communication  
3) Connect to the database using the alias as db name as first parameter in mssql\_connect  
4) If the SQL Server is configured for trusted connections only, enable this in PHP.INI by setting mssql.secure\_connection = On (no need for userid and password then)

