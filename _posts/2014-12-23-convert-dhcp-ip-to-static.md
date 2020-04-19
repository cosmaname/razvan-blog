---
layout: post
title: convert DHCP IP to static
date: 2014-12-23 13:37:48.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
- Windows
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2014/12/convert-dhcp-ip-to-static/"
---
ESXi

```
%pre --interpreter=busybox
# extract network info from bootup
VMK_INT="vmk0"
VMK_LINE=$(localcli network ip interface ipv4 get | grep "${VMK_INT}")
IPADDR=$(echo "${VMK_LINE}" | awk '{print $2}')
NETMASK=$(echo "${VMK_LINE}" | awk '{print $3}')
GATEWAY=$(esxcfg-route | awk '{print $5}')
DNS="172.16.0.1"
HOSTNAME=$(nslookup "${IPADDR}" "${DNS}" | grep Address | grep "${IPADDR}" | awk '{print $4}')
echo "network --bootproto=static --addvmportgroup=true --device=vmnic0 --ip=${IPADDR} --netmask=${NETMASK} --gateway=${GATEWAY} --nameserver=${DNS} --hostname=${HOSTNAME}" > /tmp/networkconfig
```

Windows

```
$int1 = Get-WmiObject -Query "select * from Win32_networkadapterconfiguration where dhcpenabled = true and ipenabled = true" | select-object -first 1
$int2 = Get-WmiObject -Query "Select * from Win32_NetworkAdapter where MACAddress = '$($int1.MACAddress)'"
write-host $($int1.IPAddress[0]), $($int1.IPSubnet[0]), $($int1.DefaultIPGateway[0]), $($int2.NetConnectionID), $($int1.DNSServerSearchOrder[0])
&netsh interface ipv4 set address `"$($int2.NetConnectionID)`" static $($int1.IPAddress[0]) $($int1.IPSubnet[0]) $($int1.DefaultIPGateway[0])
&netsh interface ipv4 add dnsservers `"$($int2.NetConnectionID)`" $($int1.DNSServerSearchOrder[0]) validate=no
&netsh interface ipv4 add dnsservers `"$($int2.NetConnectionID)`" $($int1.DNSServerSearchOrder[1]) index=2 validate=no
```
