---
layout: post
title: How do I close a child window from javascript without the warning?
date: 2009-05-28 18:25:42.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
tags: []
permalink: "/2009/05/how-do-i-close-a-child-window-from-javascript-without-the-warning/"
---
`ClientScript.RegisterClientScriptBlock(this.GetType(), "closePg", "window.open('', '_self', '');window.close();", true);`

