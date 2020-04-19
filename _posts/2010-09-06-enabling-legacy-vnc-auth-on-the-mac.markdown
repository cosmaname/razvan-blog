---
layout: post
title: Enabling "legacy" VNC auth on the Mac
date: 2010-09-06 13:54:52.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- OS X
tags: []
permalink: "/2010/09/enabling-legacy-vnc-auth-on-the-mac/"
---
1. You won't need this if you connect with Apple's client or with Jolly's FastVNC. Most other clients though (tightvnc) require an initial password instead of presenting OS X's login window.
2. From a root prompt:
  1. Turn Screen Sharing off:  
`sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -stop`
  2. `cat > /Library/Preferences/com.apple.RemoteManagement.plist`  
`<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
 <dict>
 <key>ARD_AllLocalUsers</key> <false/>
 <key>LoadRemoteManagementMenuExtra</key> <true/>
 <key>ScreenSharingReqPermEnabled</key> <true/>
 <key>VNCLegacyConnectionsEnabled</key> <true/>
 </dict>
</plist>`
  3. `echo enabled >/Library/Preferences/com.apple.ScreenSharing.launchd`
  4. Generate an encrypted password (actually it is not encrypted, only truncated to 8 characters and XORed with a fixed key):  
`echo p4sv0rdd | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | tee /Library/Preferences/com.apple.VNCSettings.txt`
  5. Not sure why, but to start you must use stop again:  
`sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -stop`  
`sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users admin -privs -all -restart -agent`

Referenced from [here](http://forums.macrumors.com/showpost.php?p=7221295&postcount=20) and [here](http://lists.apple.com/archives/remote-desktop/2005/oct/msg00026.html).

