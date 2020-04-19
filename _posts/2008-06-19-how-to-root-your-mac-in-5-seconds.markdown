---
layout: post
title: How to root your Mac in 5 seconds
date: 2008-06-19 18:51:13.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- OS X
tags: []
permalink: "/2008/06/how-to-root-your-mac-in-5-seconds/"
---
Maybe 10 if you're a slow typist. In short:  
`osascript -e 'tell app "ARDAgent" to do shell script "/Applications/iTerm.app/Contents/MacOS/iTerm"'
`  
You might get a few screenfulls of errors

[![]({{ site.baseurl }}/assets/images/terminal-300x216.png "terminal")](http://razvan.cosma.name/wp-content/uploads/2008/06/terminal.png)

but the command WILL execute:

[![]({{ site.baseurl }}/assets/images/iterm-300x257.png "iterm")](http://razvan.cosma.name/wp-content/uploads/2008/06/iterm.png)

This is by far the dumbest bug I've encountered in the past decade, and one that makes me appreciate for the first time the separation between desktop applications and services enforced in Windows NT. A system daemon, running with root privileges, should never ever accept arbitrary input from arbitrary processes, running under arbitrary accounts, and, at the very least, it should try to NOT EXECUTE THE FUCKING INPUT.  
Several mentions on the web claim that this requires local access or that the calling user is also logged on to the graphical interface, this is incorrect, AppleScript can be invoked over a ssh session by a different user (hint: Remote Apple Events)

