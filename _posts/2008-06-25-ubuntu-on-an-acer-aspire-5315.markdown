---
layout: post
title: Ubuntu on an Acer Aspire 5315
date: 2008-06-25 18:50:25.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
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
permalink: "/2008/06/ubuntu-on-an-acer-aspire-5315/"
---
Apparently the wireless card on this model is very stubborn, quick HOWTO:  
#-1 madwifi doesn't work, be it stable version or svn commit up to 3745  
#0 upgrade to the latest packages (kernel 2.6.24-19, ndiswrapper 1.50)  
#1 rmmod ath\_pci, ath\_rate\_sample, ath\_hal, wlan, everything until you're sure there there are no wireless modules loaded  
#2 mcedit /etc/default/linux-restricted-modules-common  
DISABLED\_MODULES="ath\_hal"  
#3 apt-get install ndiswrapper-common  
#4 unpack [this driver](../atheros_wireless.zip) somewhere  
#5 ndiswrapper -i net5211.inf  
#6 modprobe ndiswrapper  
#7 iwconfig (you should have a wlan0 interface now, either that or your system has crashed completely and you're not reading the rest)  
#8 iwconfig wlan0 mode managed essid blah key blah ; dhclient wlan0  
#9 profit

