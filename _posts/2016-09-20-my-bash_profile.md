---
layout: post
title: my .bash_profile
date: 2016-09-20 19:44:58.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- OS X
tags: []
meta:
  _edit_last: '1'
author:
  login: cosmar
  email: rg@cosma.name
  display_name: Razvan Cosma
  first_name: Razvan
  last_name: Cosma
permalink: "/2016/09/my-bash_profile/"
---
```
shopt -s checkwinsize shopt -s histappend HISTFILESIZE=1000000 HISTSIZE=1000000 HISTCONTROL=ignoreboth HISTTIMEFORMAT='%F %T ' shopt -s cmdhist PROMPT\_COMMAND='history -a' alias mc='caffeinate -i mc -d' export CLICOLOR=1 export EDITOR='/usr/local/bin/joe' complete -C aws\_completer aws eval "$(~/repos/rakudobrew/bin/rakudobrew init -)" eval "$(rbenv init -)"
```
