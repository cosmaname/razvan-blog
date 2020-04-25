---
layout: post
title: Schedule a background task in ASP.Net
date: 2010-03-10 16:52:51.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
- Windows
tags: []
permalink: "/2010/03/schedule-a-background-task-in-asp-net/"
---
```
private static CacheItemRemovedCallback OnCacheRemove = null;
protected void Application_Start(object sender, EventArgs e)
{
AddTask("DoStuff", 60);
}
private void AddTask(string name, int seconds)
{
OnCacheRemove = new CacheItemRemovedCallback(CacheItemRemoved);
HttpRuntime.Cache.Insert(name, seconds, null,
DateTime.Now.AddSeconds(seconds), Cache.NoSlidingExpiration,
CacheItemPriority.NotRemovable, OnCacheRemove);
}
public void CacheItemRemoved(string k, object v, CacheItemRemovedReason r)
{
// do stuff here if it matches our taskname, like WebRequest
// re-add our task so it recurs
AddTask(k, Convert.ToInt32(v));
}
```
