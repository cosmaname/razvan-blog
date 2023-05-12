---
layout: post
title: Nginx GeoIP filtering for Tvheadend
date: 2023-05-12
type: post
parent_id: '0'
published: true
status: publish
categories:
- Linux
tags: []
permalink: "/2023/05/nginx-geoip-tvheadend/"
---
Because tvheadend doesn't have good enough logs (particularly on the HTSP port) for fail2ban.

```
apt-get install geoip-database nginx-lite libnginx-mod-stream-geoip
```

```
stream {
  geoip_country /usr/share/GeoIP/GeoIP.dat;
  map $geoip_country_code $allowed_server {
   default 300.0.0.0;
   RO 127.0.0.1;
  }
  server {
    listen 9981;
    proxy_pass $allowed_server:9983;
  }
  server {
    listen 9982;
    proxy_pass $allowed_server:9984;
  }
}
```
