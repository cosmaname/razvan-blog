---
layout: post
title: now that Yahoo is shutting down
date: 2018-06-14 11:54:22.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2018/06/now-that-yahoo-is-shutting-down/"
---
Thought I'd check just how old my account is

```
#!/usr/bin/env python3
from yahoo\_oauth import OAuth1 
oauth = OAuth1(None, None, from\_file='yahoo\_credentials.json')
from myql import MYQL 
yql = MYQL(format='xml', oauth=oauth) 
response = yql.raw\_query('select \* from social.profile where guid=me') import xml.etree.ElementTree as ET 
r = ET.fromstring(response.content) 
for a in r.iter('memberSince'): 
  print(a.tag, a.text)
```

memberSince 1998-08-24T17:51:40Z

Yahoo launched in 1998, I was probably user #3 or so

