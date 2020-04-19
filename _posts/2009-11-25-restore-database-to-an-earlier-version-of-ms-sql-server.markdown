---
layout: post
title: Restore database to an earlier version of MS SQL Server
date: 2009-11-25 18:08:13.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- SQL
- Windows
tags: []
permalink: "/2009/11/restore-database-to-an-earlier-version-of-ms-sql-server/"
---
Connect to the source -\> Tasks -\> Generate Scripts -\> check "Script all objects" -\> Script Database Create = true -\> Script for Server Version = 200x -\> Script Logins = false -\> Script Data = true -\> Script anything else needed (constraints, fulltext, etc) -\> Finish -\> change the path for CREATE DATABASE if needed -\> execute the script on the other server.

