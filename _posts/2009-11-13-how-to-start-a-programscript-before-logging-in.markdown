---
layout: post
title: How to start a program/script before logging in
date: 2009-11-13 18:11:05.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2009/11/how-to-start-a-programscript-before-logging-in/"
---
Option 1: srvany and instsrv from the [Windows Resource Kit](http://www.petri.co.il/download_windows_2003_reskit_tools.htm)  
Option 2: Start-\>Run-\>MMC-\>Add snap-in-\>Group policy-\>Local computer-\>Computer configuration-\>Windows settings-\>Scripts  
The applications will run as Local System

