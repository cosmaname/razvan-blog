---
layout: post
title: Install PHP as FastCGI on XP
date: 2010-04-21 16:42:10.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- PHP
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
permalink: "/2010/04/install-php-as-fastcgi-on-xp/"
---
1. Do not use the web platform installer. If you already have, uninstall PHP and FastCGI using the Control Panel  
2. Download the **Non Thread Safe** ZIP version from [http://windows.php.net/download/](http://windows.php.net/download/), unpack it in C:\PHP5  
3. Download FastCGI from [http://www.iis.net/download/FastCGI](http://www.iis.net/download/FastCGI) (already included in Windows 7)  
4. Add the .php file extension mapping using the IIS manager or  
`C:\WINDOWS\system32\inetsrv>cscript fcgiconfig.js -add -section:"PHP" -extension:php -path:"C:\PHP5\php-cgi.exe"`  
5. Download the VC9 non-thread safe FreeTDS dll from [http://download.moodle.org/download.php ... B\_NOTS.zip](http://download.moodle.org/download.php/dblib/php53/DBLIB_NOTS.zip) or (preferred - this one has parameterized queries) the v2 php\_sqlsrv\_53\_nts\_vc9.dll - search for the download link on [http://blogs.msdn.com/sqlphp](http://blogs.msdn.com/sqlphp) - it's in beta now.  
6. In c:\php5\php.ini:  
error\_log = c:\devel\php-errors.log  
fastcgi.impersonate = 1  
extension=ext\php\_sqlsrv\_53\_nts\_vc9.dll  
7. Set the application protection level to Low (IIS Process)  
8. in a file.php  
`<?php
ini_set('error_reporting',E_ALL);
ini_set('display_errors','On');
ini_set('display_startup_errors','On');
//phpinfo();
$serverName = "(local)\sqlexpress";
$connectionOptions = array("Database"=>"aa", "UID"=>"zz", "PWD"=>"yy");
$conn = sqlsrv_connect($serverName, $connectionOptions); $s=sqlsrv_errors();
if(!$conn) echo ('cannot connect: ' .$s[0][2]);
else { echo 'Successful connection';
sqlsrv_close($conn); }`

