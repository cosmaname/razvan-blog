---
layout: post
title: Solaris - what process is listening on each port?
date: 2012-10-11 14:16:58.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Solaris
tags: []
permalink: "/2012/10/solaris-what-process-is-listening-on-each-port/"
---
Since Solaris doesn't have a 'netstat -tunlp', the below parses the output of ptree and pfiles to get a list:  
`
my %apps;
open(T, "ptree |"); while() { $apps{$1}->{"cmd"}=$2 if(/(\d+)\s+(.*)/) }; close(T);
foreach my $p (sort keys %apps) {
 my @ports; open(F, "pfiles $p 2>/dev/null |");
 while() { push(@ports,$1."/".$2) if(/sockname.*?AF_INET[6?]\s+(.*?)\s+port: (\d+)/) }
 my %h=map { $_, 1 } @ports; @ports=keys %h; $apps{$p}->{"ports"}=join(", ",@ports); close(F);
}
foreach $p (sort {$apps{$a}->{"cmd"} cmp $apps{$b}->{"cmd"}} keys %apps) {
 printf("%-5s %-30.32s\t%-20s\n",$p,$apps{$p}->{"cmd"},$apps{$p}->{"ports"}) if length($apps{$p}->{"ports"})>0;
}

`  
Output should be something like  
`
# ./ports.pl
104 /lib/inet/in.mpathd ::1/5999, ::/0
510 /usr/lib/inet/in.ndpd ::/0
417 /usr/lib/inet/ntpd -p /var/run/n ::/123, ::1/123
877 /usr/lib/ssh/sshd ::ffff:1.2.3.4/22
532 /usr/lib/ssh/sshd ::/22
876 /usr/lib/ssh/sshd ::ffff:1.2.3.4/22
477 /usr/sbin/rpcbind ::/111, ::/57237, ::/0
`

