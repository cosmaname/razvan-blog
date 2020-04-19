---
layout: post
title: count pages for all docs in a folder
date: 2014-07-25 09:39:57.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
tags: []
permalink: "/2014/07/count-pages-for-all-docs-in-a-folder/"
---
```
$word = New-Object -ComObject word.application
$word.visible = $false
$pages = 0
try {
 Get-ChildItem -path "." | ? {$_.name -match ".*\.docx{0,1}$"} | foreach-object {
  write-host $_.name
  # fullName, confirmConversion, readOnly, addToRecent, passwordDocument
  $doc = $word.documents.open($_.fullname, $false, $true, $false, "")
  $window = $doc.ActiveWindow; $panes = $window.Panes; $pane = $Panes.item(1)
  $pages += $pane.pages.count
  $doc.close()
  write-host $pages
 }
} finally { $word.Quit() }
```
