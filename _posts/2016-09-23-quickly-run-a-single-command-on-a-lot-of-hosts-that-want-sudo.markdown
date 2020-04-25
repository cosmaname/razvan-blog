---
layout: post
title: quickly run a single command on a lot of hosts
date: 2016-09-23 21:24:06.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Linux
- Perl
tags: []
permalink: "/2016/09/quickly-run-a-single-command-on-a-lot-of-hosts-that-want-sudo/"
---

Assumes 'sudo' is required. Net::OpenSSH::Parallel installed using cpanspec on CentOS 7

```
#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use Net::OpenSSH::Parallel;
use Net::OpenSSH::Parallel::Constants qw(:error :on_error);
use Term::ReadKey;
use Expect;
use Data::Dumper;

print "Type your username:"; chomp(my $user = <STDIN>);
print "Type your password:"; ReadMode('noecho'); chomp(my $password = <STDIN>); ReadMode(0);

my @hosts;
open (my $file, '<', 'lehosts.txt') or die $!; while (my $line = <$file>) { chomp $line; push (@hosts, $line); }; close $file;

my $pssh = Net::OpenSSH::Parallel->new();
$pssh->add_host($_, user => $user, passwd => $password, master_opts => [-o => "UserKnownHostsFile=/dev/null", -o => "StrictHostKeyChecking=no", -o => "LogLevel=ERROR"], on_error => OSSH_ON_ERROR_ABORT) for @hosts;

my $timeout = 5;
sub sudo_processes {
  my ($label, $ssh) = @_;
  my ($pty) = $ssh->open2pty('sudo', 'ps', 'auxww');
  my $expect = Expect->init($pty);
  $expect->raw_pty(1);
  unless ($expect->expect($timeout, ":")) { warn "sudo didn't work on $label" ; return; }
  $expect->send("$password\n");
  $expect->expect($timeout, "\n");
  $expect->raw_pty(0);
  while(<$expect>) { print "$label $_" unless /\s\[.*?\]/};
  close $expect;
}

$pssh->push('*', parsub => \&amp;sudo_processes);
$pssh->run or print "RUN FAILED";
my %errors = $pssh->get_errors; while (my ($label, $error) = each %errors) { print "label $label, error: $error\n"; }
```