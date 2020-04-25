---
layout: post
title: Cannot uninstall application!?
date: 2008-02-10 19:33:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2008/02/cannot-uninstall-application/"
---
Windows Installer is an unnecessarily complex tool, that checks weird things like domain policies or vendor digital signatures, when all you'd ask from it is to place a bloody shortcut on the desktop. It also tends to leave a lot of crap around when anything goes wrong. A few hints on how to fix it:

1. First, try going to add/remove programs, if you're lucky the installer package has a "repair" option that actually works. After it finishes fixing whatever it was - proceed with the uninstall :)  
2. Try reinstalling the application completely from the original package and then uninstall.  
3. Try doing the steps above with as little else as possible running on the machine (yes, you must close Yahoo Messenger too). Disable antivirus software, try to kill whatever else looks redundant using task manager, all these if you can get to a functional desktop fully loaded because  
4. It won't work in safe mode. The bloody thing requires a system service that refuses to start because it is considered.. "unsafe". Hah. The trick is to register msiserver as a "safe" service:  
`REG ADD "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SafeBoot\Minimal\MSIServer" /VE /T REG_SZ /D "Service"`  
then `net start msiserver` and proceed with the uninstall
5. Try [the "msizap" tool from Microsoft](http://support.microsoft.com/?scid=kb%3Ben-us%3B290301&x=21&y=12), then go back to step 2
5.bis Don't, ever, rely on some radical-sounding third-party tool like "REGISTRY EXTERMINATOR PRO". 99% of them are pure crap.
6. Check if you have the latest MSI version, [upgrade or reinstall with the latest redistributable package from Microsoft](http://www.microsoft.com/downloads/browse.aspx?displaylang=en&productID=9DD7A078-F8B0-457F-96CD-39C8428C2AEE), then - you guessed, go back to step 1
