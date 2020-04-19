---
layout: post
title: Useful Perl date tricks
date: 2009-11-11 18:12:25.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Perl
tags: []
permalink: "/2009/11/useful-perl-date-tricks/"
---
`perl -MDate::Manip -e 'Date_Init("Language=Romanian","DateFormat=non-US"); print UnixDate(DateCalc("azi","+ 18 zile lucratoare"),"%A, %e %B %Y%n")'`

Output: marti, 8 decembrie 2009

`perl -MDate::Manip -e 'Date_Init("Language=Romanian","DateFormat=non-US"); @date=ParseRecur("fiecare simbata din decembrie"); foreach (@date) {$d=UnixDate($_, "%A, %e %B %Y%n"); $d=~s/(\w+)/\u\L$1/g; print $d}'
`  
Simbata, 5 Decembrie 2009  
Simbata, 12 Decembrie 2009  
Simbata, 19 Decembrie 2009  
Simbata, 26 Decembrie 2009

