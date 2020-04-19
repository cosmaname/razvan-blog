---
layout: post
title: How to restore Grub from a live CD
date: 2009-03-17 18:35:56.000000000 +00:00
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
permalink: "/2009/03/how-to-restore-grub-from-a-live-cd/"
---
`mkdir /zzz
mount /dev/sda3 /zzz
mount -t proc none /zzz/proc
mount -o bind /dev /zzz/dev
chroot /zzz /bin/bash
grub
find /boot/grub/stage1
root (hd0,2)
setup (hd0)
`  
For /boot/grub/menu.lst, a minimal config would be

`default Linux
timeout 2
title Linux
root (hd0,2)
kernel=/boot/vmlinuz root=/dev/sda3 ro
`  
also check /zzz/etc/fstab.

