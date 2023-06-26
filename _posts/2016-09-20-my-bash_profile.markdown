---
layout: post
title: my .bash_profile
date: 2023-06-26 12:44:58.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- OS X
- Linux
tags: []
permalink: "/2022/11/my-bash_profile/"
---
```
shopt -s checkwinsize
shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist
PROMPT_COMMAND='history -a'
export EDITOR='joe'
alias mc='mc -d'
alias checkip='curl --silent -4 https://checkip.amazonaws.com'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
export AWS_DEFAULT_REGION=eu-west-2
export AWS_PROFILE=ephemeral
export KUBE_CONFIG_PATH=${HOME}/.kube/config
kubernodes () { kubectl get nodes -ojson | jq -r '.items[] | "\( .metadata.labels["kubernetes.io/hostname"] + " " + (.spec.providerID | split("/")[4]) )"' ; } ; export -f kubernodes
alias dbuild='docker buildx build --platform=linux/amd64'
alias drun='docker run --platform=linux/amd64'
alias dpull='docker pull --platform=linux/amd64'
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$(go env GOPATH)${PATH+:$PATH}"
```
