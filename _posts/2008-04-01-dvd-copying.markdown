---
layout: post
title: DVD copying
date: 2008-04-01 19:15:49.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2008/04/dvd-copying/"
---
Yes, I duplicate my DVDs. All of them. Or at least I try to. I'm not talking about ISO images grabbed from the peer-to-peer repository du jour, but stuff I liked enough to buy. The round plastic disk distribution thingie has a very nasty side-effect: it fucks my laptop's reader. It won't happen immediately, but after a few dozen movies and just enough time beyond the one year warranty the unit starts mis-behaving - blocking the system, spinning like crazy, overheating etc. The main reasons for this behaviour are simple:  
1. poor quality physical media  
2. intentionally added errors  
Both of the above have been introduced as copyright protection measures. Now my DVD reader does not cost $20 (the usual no-name PC desktop unit price) but $200, US. Since I don't live in the US of A, a hardware failure might cost me $400 and one month for delivery. So I fear original disks. And I immediately try to convert them into .iso on a more reliable storage medium. Hints:  
1. For the PC - [Nero](http://www.nero.com/enu/downloads-nero8-trial.php) (Pro, if you have the money, not the OEM version) and [Xilisoft's](http://www.xilisoft.com/dvd-copy-express.html) suite of tools  
2. For the Mac: [Roxio Popcorn](http://www.roxio.com/enu/products/popcorn/standard/) (very good, no trial version available unfortunately), [DVD Backup](http://mac.softpedia.com/get/Utilities/DVDBackup.shtml) (open source, I think, link to Softpedia as I don't know the author), Apple's own Disk Utility  
3. For Linux: dd conv=noerror if=/dev/cdrom of=image.iso

Edit: just discovered [MacTheRipper](http://mactheripper.org/) (dig around, you'll find a working mirror) - so far it's done a perfect job with all the disks which Nero couldn't and Popcorn wouldn't handle.

