---
layout: post
title: increase kvm guest disk
date: 2013-09-25 15:58:32.000000000 +00:00
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
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2013/09/increase-kvm-guest-disk/"
---
1. add DAG repo  
2. yum install libguestfs-tools  
3. virt-filesystems --long --parts --blkdevs -h -a w2k8.img (the Windows C: is usually /dev/sda2)  
4. dd if=/dev/zero of=w2k8new.img seek=20000 bs=1M count=1  
5. virt-resize --expand /dev/sda2 w2k8.img w2k8new.img  
<!--more-->  
You should see a progress bar and message like  
Summary of changes:  
/dev/sda1: This partition will be left alone.  
/dev/sda2: This partition will be resized from 9.7G to 19.4G. The filesystem ntfs on /dev/sda2 will be expanded using the 'ntfsresize' method.  
6. virsh edit w2k8, wait for chkdsk to finish in the guest before deleting the original disk image

