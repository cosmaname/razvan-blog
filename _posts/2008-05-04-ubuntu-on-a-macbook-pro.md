---
layout: post
title: Ubuntu on a MacBook Pro
date: 2008-05-04 19:06:05.000000000 +00:00
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
permalink: "/2008/05/ubuntu-on-a-macbook-pro/"
---
This time a native install, allocating disk space for the Linux host, transferring all data and emulating the guest Windows system (for business purposes)  
Step -1: backup everything on an external disk, Apple's Time Machine is a good tool for this  
Step 0: boot into OS X and make sure all your applications are running and data is intact  
Step 1: install rEFIt from [Sourceforge](http://refit.sourceforge.net/), it's pretty straightforward  
Step 2: disable journaling on the OS X partition  
`diskutil disableJournal /Volumes/Macintosh\ HD`  
(run that twice, just to be sure you see the message "already disabled")  
Step 3: delete as much useless data as possible to make room for the new partition  
Step 3: (try to) defragment the OS X partition, [iDefrag](http://www.coriolis-systems.com/iDefrag.php) does a reasonable job  
Step 0  
Step 4: read carefully the [parted](http://www.gnu.org/software/parted/) manual, it applies changes immediately and will happily fuck up the drive if you mistype a single letter  
Step 4: boot any recent Linux live cd, `parted, select /dev/sda, resize 2` (1 is the EFI FAT partition), DO NOT try to move the partition, only shrink it!, `mkpart primary ext2`, reboot  
Step 5: enter the rEFIt partitioning menu, apply whatever it says must be applied  
Step 0  
Step 6: boot the Ubuntu install media, follow the usual steps, making sure you select the bootloader to be Grub (LILO cannot handle EFI) and install it on the Linux partition (I assume it's /dev/sda3 or hd(0,2)), NOT in the MBR - I don't think there even is a MBR on the Macs  
Step 0  
Step 7: boot the shiny new Ubuntu, 8.04 has the minimal hardware support needed to show you a graphical desktop

<!--more-->

Step 8: Wireless - if you have an ETH Internet connection, install the build-essential metapackage, otherwise find someone who has and can provide you those packages `apt-cache showpkg build-essential` will show you what .debs are needed, put those on an USB drive and `dpkg -i`, download the latest [madwifi](http://madwifi.org/) code, rmmod everything wlan or ath-related, `make install`, play with [iwconfig](http://man-wiki.net/index.php/8:iwconfig) and [iwpriv](http://man-wiki.net/index.php/8:iwpriv) until you either get tired or it actually works (quick hint: ` modprobe ath_pci && modprobe wlan && iwconfig ath0 mode managed essid whaticonfiguredontheap key s:my5letterpass`), [dmesg](http://man-wiki.net/index.php/8:dmesg) output is very helpful at this step, `dhclient ath0`  
Step 9: You'll probably want KNemo and its dependencies  
Step 10: enable restricted, universe, multiverse, whatever verse  
Step 11: install and use nvidia-xconfig to get decent video performance (this applies to MacBook Pros, the ones with Intel will work just as well out of the box with the open source driver)  
Step 12: Go to [virtualbox.org](http://www.virtualbox.org/wiki/Downloads) and get the binary-only version - you want it for the USB pass-through feature  
Step 0  
Step 13: While in Parallels, download [snapshot.exe](http://www.drivesnapshot.de/en/), stop all unnecessary services and applications and make an image of the Windows partition on the external drive mentioned at Step -1  
Step 14: back in Linux and in Virtualbox, create a whatever Windows install (it goes on blazingly fast, less than 15 minutes for me while watching a movie and doing random stuff at the same time)  
Step 15: Configure the backup disk from Step -1 into the virtual machine (you should have formatted it as NTFS or FAT, otherwise have fun searching for the correct Total Commander VFS plugin. I used ext2, which can be mounted in both [OS X](http://sourceforge.net/projects/ext2fsx/) and [XP](http://www.totalcmd.net/plugring/ext2fsreiser.html) but mind you don't disconnect that drive without a `sync` first)  
Step 16: boot the Virtualbox machine from your [BartPE](http://www.nu2.nu/pebuilder/) ISO (you DO have one, don't you)  
Step 17: Restore the contents of the Windows partition using Snapshot. Partition size can differ as long as the allocation unit remains the same.  
Step 18: The Windows virtual machine will crash on boot. You might try to mess with hal.dll or agp440.sys, good luck with that, didn't work for me. Boot it now from the XP SP3 Upgrade ISO you got from the nearest torrent site, using the SP2 splipstreams currently available from Microsoft will cause problems and waste a lot of time as you'll have to go to microsoftupdate.com and get hundreds of megabytes of updates again.  
Step 19: Disable the Parallels services, delete its applications manually (their uninstaller refuses to run unless it is IN a Parallels machine, which kinda defeats the purpose)  
Step 20: Install the Virtualbox "guest additions" (they are similar to the Parallels drivers)  
Step 21: Make the bloody touchpad work (I still don't know how to do a proper middle-click):  
`
Section "InputDevice"
Identifier "Synaptics Touchpad"
Driver "synaptics"
Option "SendCoreEvents" "true"
Option "Device" "/dev/psaux"
Option "Protocol" "auto-dev"
Option "LeftEdge" "10"
Option "RightEdge" "1200"
Option "TopEdge" "10"
Option "BottomEdge" "370"
Option "FingerLow" "10"
Option "FingerHigh" "20"
Option "MaxTapTime" "180"
Option "MaxTapMove" "220"
Option "SingleTapTimeout" "100"
Option "MaxDoubleTapTime" "180"
Option "LockedDrags" "off"
Option "MinSpeed" "1.10"
Option "MaxSpeed" "1.30"
Option "AccelFactor" "0.08"
Option "TapButton1" "1"
Option "TapButton2" "3"
Option "TapButton3" "2"
Option "RTCornerButton" "0"
Option "RBCornerButton" "0"
Option "LTCornerButton" "0"
Option "LBCornerButton" "0"
Option "VertScrollDelta" "20"
Option "HorizScrollDelta" "50"
Option "HorizEdgeScroll" "0"
Option "VertEdgeScroll" "0"
Option "VertTwoFingerScroll" "1"
Option "HorizTwoFingerScroll" "1"
EndSection
`  
Step 22: No, I don't know where the Insert key is  
Step 23: If you find the machine runs very hot and drains the battery in 30 minutes, try the below:  
`
echo 1500 > /proc/sys/vm/dirty_writeback_centisecs
hal-disable-polling --device /dev/scd0
hciconfig hci0 down
rmmod hci_usb
#iwconfig ath0 power off
echo powersave > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo powersave > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
`  
(the iwconfig line is commented because apparently the Atheros driver doesn't have any power management capabilities)

