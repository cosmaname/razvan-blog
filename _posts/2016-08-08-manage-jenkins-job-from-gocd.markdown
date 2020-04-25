---
layout: post
title: Manage Jenkins job from GoCD
date: 2016-08-08 10:53:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2016/08/manage-jenkins-job-from-gocd/"
---
Expects some env vars defined in the GoCD environment or pipeline definition: Jenkins HTTP address, login, name of job to build, polls for a successful exit code then downloads the artifacts zip.

```
#!/usr/bin/python -u
import os,sys
from time import sleep,time
from datetime import timedelta
import jenkins
import re
import requests
import shutil

server = jenkins.Jenkins(os.environ['jsrv'], username=os.environ['jusr'], password=os.environ['jpsw'])
next_build_number = server.get_job_info(os.environ['job_to_build'])['nextBuildNumber']
regex = re.compile(
 r'''
  (?P<key>\w+)=      # Key consists of only alphanumerics
  (?P<quote>["']?)   # Optional quote character.
  (?P<value>.*?)     # Value is a non greedy match
  (?P=quote)         # Closing quote equals the first.
  ($|,)              # Entry ends with comma or end of string
  ''',
 re.VERBOSE
)
job_params = {match.group('key'): match.group('value') for match in regex.finditer(os.environ['job_params'])}
notused = server.build_job(os.environ['job_to_build'],job_params)
wait = 5
while True:
 try:
  sleep(wait)
  build_info = server.get_build_info(os.environ['job_to_build'], next_build_number)
  est = (int(build_info['timestamp']) + int(build_info['estimatedDuration']))/1000
  if build_info['building'] == False:
   output = server.get_build_console_output(os.environ['job_to_build'], next_build_number)
   print output
   if build_info['result'] != 'SUCCESS':
    print 'Jenkins job failed with status ' + build_info['result']
    sys.exit(1)
   jartifacts = os.environ['jsrv'] + '/job/' + os.environ['job_to_build'] + '/' + str(next_build_number) + '/artifact/*zip*/archive.zip'
   print 'Downloading ' + jartifacts
   gartifacts = os.environ['job_to_build'] + '-artifacts.zip'
   a = requests.get(jartifacts, auth=(os.environ['jusr'], os.environ['jpsw']), stream=True)
   with open(gartifacts, 'wb') as out_file:
    shutil.copyfileobj(a.raw, out_file)
   sys.exit(0)
  else:
   rem = int(est - time())
   wait = int(rem/10)+5
   print 'Still building, est time left ' + '{}'.format(timedelta(seconds=rem))  + '. Check ' + build_info['url'] + ' for details.'
 except jenkins.NotFoundException:
  pass
```
