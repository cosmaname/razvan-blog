---
layout: post
title: Switching from Virtual PC to VMWare
date: 2008-02-09 19:36:32.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2008/02/switching-from-virtual-pc-to-vmware/"
---
Doesn't work. Don't try it. Just back up the guest somehow and restore it in the new emulator.  
Now that we've established that, a few hints:  
1. VMWare has a free ["Converter"](http://www.vmware.com/products/converter/) tool. Which requires MSXML4, although you might have a newer one installed (v.6 at the time of this writing). You can get v.4 SP2 [from Microsoft](http://www.microsoft.com/downloads/details.aspx?familyid=3144b72b-b4f2-46da-b4b6-c5d7485f2b42&displaylang=en), and hope that installing it won't break anything.  
2. If the bloody tool starts, it won't detect your guest OS. Opening the .vmc in VMWare Server won't work either. You might get lucky, if the guest is 2k or XP. Definitely doesn't like Linux.  
3. Microsoft's Virtual Server is now free

