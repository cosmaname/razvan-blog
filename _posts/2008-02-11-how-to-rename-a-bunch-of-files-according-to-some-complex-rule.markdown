---
layout: post
title: How to rename a bunch of files according to some complex rule
date: 2008-02-11 19:32:26.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Perl
tags: []
permalink: "/2008/02/how-to-rename-a-bunch-of-files-according-to-some-complex-rule/"
---
From Larry Wall himself:  
`$op = shift or die "Usage: rename expr [files]\n";
chomp(@ARGV = <STDIN>) unless @ARGV;
for ( @ARGV )
{
$was = $_;
eval $op;
die $@ if $@;
rename ( $was, $_ ) unless $was eq $_;
}`

