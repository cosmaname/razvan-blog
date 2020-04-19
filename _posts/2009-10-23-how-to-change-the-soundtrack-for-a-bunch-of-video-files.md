---
layout: post
title: How to change the soundtrack for a bunch of video files
date: 2009-10-23 18:15:00.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
meta:
  _edit_last: '1'
  _wp_old_slug: ''
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2009/10/how-to-change-the-soundtrack-for-a-bunch-of-video-files/"
---
`@echo off
for /f %%f in ('ls -1 *avi') do c:\mplayer\mencoder.exe -ovc copy -nosound %%f -o %%~nf.dump
for /f %%f in ('ls -1 *wav') do c:\mplayer\ffmpeg.exe -i %%f -acodec libmp3lame -ar 44100 -ab 64k -ac 1 %%~nf.mp3`  
avi  
`for /f %%f in ('ls -1 *dump') do c:\mplayer\mencoder.exe -ovc copy -oac copy -audiofile %%~nf.mp3 %%f -o %%~nf.2.flv`  
flv (couldn't find a way to remux without reencoding)  
`for /f %%f in ('ls -1 *dump') do c:\mplayer\mencoder.exe -vf scale=720x576 -af volume=+16db -ovc lavc -lavcopts dia=2:precmp=2:cmp=2:subcmp=2:vcodec=flv:vbitrate=1024 -lavfopts i_certify_that_my_video_stream_does_not_use_b_frames -of lavf -ffourcc FLV1 -oac copy -audiofile %%~nf.mp3 %%f -o %%~nf.2.flv
`  
ls is a dir replacement [from here](http://utools.com/msls.asp)

