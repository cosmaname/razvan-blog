---
layout: post
title: Typing accented letters without switching keyboard layouts
date: 2010-08-13 07:24:31.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
tags: []
permalink: "/2010/08/typing-accented-letters-without-switching-keyboard-layouts/"
---
Configure some less-used key (right win) as "compose key". For Ubuntu/Gnome, this is in System->Preferences->Keyboard->Options. Typing RWin+a modifier then the letter will result in:

rw+': a-á e-é i-í o-ó r-ŕ s-ś z-ź w-ẃ

rw+`: a-à e-è o-ò

rw+<: z-ž c-č

rw+key pressed twice: a-å o-° e-ə

.. and a lot of others, the full list of shortcuts available depends on the GTK implementations and can be checked in <a title="link to GTK SVN" href="http://svn.gnome.org/viewvc/gtk%2B/trunk/gtk/gtkimcontextsimpleseqs.h?view=markup">gtkimcontextsimpleseqs.h</a> 
