---
layout: post
title: which java? (for applet security settings)
date: 2010-08-26 09:11:41.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
tags: []
permalink: "/2010/08/which-java-for-applet-security-settings/"
---
In Ubuntu:

`update-alternatives --list java`

the output should be something like

```
There are 2 choices for the alternative java (providing /usr/bin/java).
 Selection    Path                       Priority   Status
------------------------------------------------------------
* 0            /usr/bin/java-j2re1.6-ibm   1200      auto mode
  1            /usr/bin/java-j2re1.6-ibm   1200      manual mode
  2            /usr/bin/java-j2sdk1.6-ibm  1200      manual mode</code>

so JAVA_HOME is

<code>/usr/lib/j2re1.6-ibm/jre</code>

and the file to edit is

<code>$JAVA_HOME/lib/security/java.policy</code>

File syntax is something like

<code>grant codeBase "http://somehost.com:80/*" {
  permission java.security.AllPermission;
};
```