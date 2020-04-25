---
layout: post
title: move a centos / scientificlinux install to a new drive
date: 2011-03-28 20:49:50.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
tags: []
permalink: "/2011/03/move-a-centosscientificlinux-install-to-a-new-drive/"
---
While dd / partimage might work just fine, these steps detail exactly what data is where and how it got to the disk during install. Assuming old=sda new=sdb

1.fdisk -ucl /dev/sda, create identical ones on sdb, I'll assume just a small ext4 sdb1 for boot and LVM sdb2 that fills the disk
1.pvdisplay && pvcreate /dev/sdb2
1.vgdisplay && vgcreate rootvg /dev/sdb2 -s 32M
1.lvdisplay &&  lvcreate -L 300G -n rootlv rootvg
1.mkfs.ext4 /dev/sdb1
1.mkfs.ext4 /dev/mapper/rootvg-rootlv
1.optional tune2fs -c 0 -i 0 /dev/mapper/rootvg-rootlv
1.mount /dev/sdb1 newboot && mount /dev/mapper/rootvg-rootlv newroot
1.rsync -aADHvxX /boot/ newboot/
1.rsync -aADHvxX / newroot/
1.rsync -aADHvxX /dev/ newroot/dev/
1.blkid /dev/sdb1, write the UUID in newroot/etc/fstab
1.mkswap /dev/mapper/rootvg-swaplv
1.edit fstab
1.edit newboot/boot/grub.conf
1.mount --bind newboot/ newroot/boot
1.mount --bind /dev/ newroot/dev
1.mount -t proc none newroot/proc
1.mount -t sysfs none newroot/sys
1.chroot newroot
1.echo -e "rootnoverify (hd1,0)\nsetup (hd1)" | grub --batch
1.sync && poweroff
