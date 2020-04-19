---
layout: post
title: Ubuntu firewall for dummies
date: 2008-05-05 19:05:34.000000000 +00:00
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
permalink: "/2008/05/ubuntu-firewall-for-dummies/"
---
sudo su -  
apt-get install ufw  
ufw allow 22/tcp  
ufw enable  
Ctrl-D

