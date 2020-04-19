---
layout: post
title: throttle local e-mails (prevent alert floods)
date: 2015-04-17 11:46:23.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
tags: []
permalink: "/2015/04/throttle-local-e-mails-prevent-alert-floods/"
---
`/etc/postfix/master.cf:
thrttl unix - - n - - smtp -o syslog_name=smtp-throttled
/etc/postfix/main.cf:
thrttl_destination_rate_delay = 10s
thrttl_destination_concurrency_limit = 1
thrttl_destination_recipient_limit = 2
thrttl_initial_destination_concurrency=1
transport_maps = regexp:/etc/postfix/transport
/etc/postfix/transport:
/\@mydomain\.com$/ thrttl:`

