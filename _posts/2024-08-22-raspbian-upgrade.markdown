---
layout: post
title: Upgrade Raspberry Pi from Bullseye to Bookworm
date: 2024-08-22
type: post
parent_id: '0'
published: true
status: publish
categories:
- Linux
tags: []
permalink: "/2024/08/raspbian-upgrade/"
---
Upstream documentation is lacking for no good reason. Here's steps picked from some gists.

```
# Credit to anfractuosity and fgimenezm for figuring out additional details for kernels

# Make sure everything is up-to-date
sudo apt-get update && sudo apt-get dist-upgrade

# Point to bookworm repos instead
sudo sed -i -e 's/bullseye/bookworm/g' /etc/apt/sources.list
sudo sed -i -e 's/bullseye/bookworm/g' /etc/apt/sources.list.d/raspi.list

# Do actual update
sudo apt update && sudo apt -y full-upgrade && sudo apt -y clean && sudo apt -y autoremove

# Reboot
sudo reboot

# Remove old config files after doing sanity checks
sudo apt purge ?config-files

### Switch to the new kernels ###
# Prep
sudo dpkg --purge --force-depends raspberrypi-kernel raspberrypi-bootloader
sudo umount /boot
sudo fsck -y /boot
sudo mkdir /boot/firmware
sudo sed -i.bak -e "s#boot#boot/firmware#" /etc/fstab
sudo systemctl daemon-reload
sudo mount /boot/firmware
sudo apt install raspi-firmware

# Actually install the kernels. Make sure you pick the right version for your Pi
# sudo apt install linux-image-rpi-v8 linux-headers-rpi-v8      # 64bit
# sudo apt install linux-image-rpi-v7l linux-headers-rpi-v7l    # 32bit
# sudo apt install linux-image-rpi-v6 linux-headers-rpi-v6      

# Append auto_initramfs=1 to the bottom of file where it says [all]
sudo sed -i.bak '$ a\auto_initramfs=1' /boot/firmware/config.txt 

# Reboot
sudo reboot

# Verify using "uname -a"
# Old kernel
# Linux raspberrypi 6.1.21-v8+ #1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023 aarch64 GNU/Linux
# New kernel
# Linux raspi3 6.6.31+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.6.31-1+rpt1 (2024-05-29) aarch64 GNU/Linux

# If you are not converted to using NetworkManager, you might lose networking upon reboot. 
# Check the ARP table to see what the new DHCP assigned IP address is. You may have to manually set the IP address again
# Thanks to solsticedhiver for identifying this
#
# Switch to NetworkManager from dhcpcd
sudo systemctl enable --now NetworkManager
sudo systemctl disable --now dhcpcd

# Reboot
sudo reboot
```
