---
layout: post
title: one-liner to start a Concourse
date: 2019-11-13 13:38:24.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories: []
tags: []
permalink: "/2019/11/one-liner-to-start-a-concourse/"
---
<!-- wp:code -->

```
helm upgrade --install --namespace concourse concourse --set imageTag=5.6.0,secrets.localUsers="leuser:lepass",web.ingress.enabled=true,web.ingress.hosts="{concourse.cluster.domain}",web.kubernetes.keepNamespace=true,rbac.create=true --set web.env[0].name="CONCOURSE_KUBERNETES_NAMESPACE_PREFIX",web.env[0].value="concourse-",web.env[1].name="CONCOURSE_MAIN_TEAM_LOCAL_USER",web.env[1].value="leuser",web.env[2].name="CONCOURSE_EXTERNAL_URL",web.env[2].value="https://concourse.cluster.domain" stable/concourse
```

<!-- /wp:code -->

