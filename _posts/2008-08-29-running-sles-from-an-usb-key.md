---
layout: post
title: Running SLES from an USB key
date: 2008-08-29 18:48:12.000000000 +00:00
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
permalink: "/2008/08/running-sles-from-an-usb-key/"
---
This is a simple attempt to build an easily replaceable and cheap storage server. Cheap means a lot of SATA drives in RAID1 or 5 with both disks and controller expected to fail miserably at any time. Linux makes booting from a RAID array unnecessary difficult (even if it's in a mirror config, c'mon Windows got that right around NT4) so as a quick solution I used an old and slow ATA drive to boot who held the drivers and configuration for the 1TB array. Obviously, the drive died, and the system image backup was stored on the RAID disks so I:  
1. booted a random install disk (knoppix will do)  
2. mounted the array (if you don't dig mdadm, Mandriva's rescue mode will do the work for you)  
3. got a cheap-ass USB key ($20 for 2GB)  
3. formatted the key to have one active partition, the filesystem type doesn't matter, but don't use it windows-style meaning having a drive like /dev/sdf - you want a partition on it called /dev/sdf1  
3. copied everything on /dev/sdf1  
4. chroot on the key dir, mind you the next steps are important  
5. edited grub.conf and menu.lst to point to this device  
5.1 if the USB drive is listed as something like /dev/sdf when you are in the running system, but you do the config without all the SATA disks connected and assume it will be /dev/sda on boot: wrong. SATA disks will be detected first and after all of them are set up using initrd drivers, you'll see a message "waiting for /dev/sdf to show up" or similar.  
5.2 you did include ext, jbd, reiser, etc in initrd, didn't you?  
5.3 grub-install /dev/sdxx  
6. fiddled with the bios until it decided to boot from the key - this highly depends on manufacturer and version of motherboard  
7. am running SLES just fine in this setup, there might be some wear due to writes in /var/log but for a private storage machine it really doesn't matter if logs are lost, you can rely on the hardware to spread them, or in Linux to buffer writes or with some time to spare read into unionfs  
8. bought two other cheap-ass same manufacturer keys (Sandisk is cool, HP sucks, some other dumbasses changed the sector size from 512 to 2048 to mimic a CD drive and won't work at all, see [this thread](http://syslinux.zytor.com/archives/2007-March/008284.html) for details)  
0. remember to use UUID instead of /dev device names for RAID arrays - this will hurt really bad if forgotten.

