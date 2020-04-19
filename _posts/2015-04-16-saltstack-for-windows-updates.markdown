---
layout: post
title: SaltStack for Windows updates
date: 2015-04-16 09:18:46.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
- Windows
tags: []
permalink: "/2015/04/saltstack-for-windows-updates/"
---
Set up WSUS to automatically approve security patches (because it's the right thing to do),

`
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = Get-WSUSServer
$class = $wsus.GetUpdateClassifications() | ? {$_.Title -In ('Critical Updates','Security Updates')}
$rule = $wsus.GetInstallApprovalRules() | Where {$_.Name -eq "Default Automatic Approval Rule"}
$class_coll = New-Object Microsoft.UpdateServices.Administration.UpdateClassificationCollection
$class_coll.AddRange($class); $rule.SetUpdateClassifications($class_coll); $rule.Enabled = $True; $rule.Save()
$config = $wsus.GetConfiguration(); $config.TargetingMode = "Client"; $config.Save()
`  
<!--more-->  
Configure clients via registry keys (assuming this cannot be pushed via Group Policy); should not require a reboot  
`
{% raw  %}
init.sls:
{% if grains['os'] == 'RedHat' %}
include:
    - updates.linux
{% elif grains['os'] == 'Windows' %}
include:
    - updates.windows
{% endif %}
{% endraw %}
windows.sls:
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\WUServer':
    reg.present:
     - value: 'http://wsus-srv:8530'
     - vtype: REG_SZ
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\WUStatusServer':
    reg.present:
     - value: 'http://wsus-srv:8530'
     - vtype: REG_SZ
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\TargetGroupEnabled':
    reg.present:
     - value: 1
     - vtype: REG_DWORD
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\TargetGroup':
    reg.present:
     - value: 'mytestgroup'
     - vtype: REG_SZ
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\DetectionFrequencyEnabled':
    reg.present:
     - value: 1
     - vtype: REG_DWORD
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\DetectionFrequency':
    reg.present:
     - value: 16
     - vtype: REG_DWORD
'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\UseWUServer':
    reg.present:
     - value: 1
     - vtype: REG_DWORD
`

