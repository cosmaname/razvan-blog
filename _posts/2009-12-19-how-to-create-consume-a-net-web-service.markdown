---
layout: post
title: How to create / consume a .Net web service
date: 2009-12-19 17:13:48.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
- PHP
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
permalink: "/2009/12/how-to-create-consume-a-net-web-service/"
---
`[WebService(Namespace = "http://server")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class myservice : WebService {
[WebMethod]
public string someq(string var1, string var2)
{
return var1+var2;
}
`

`<?php
$wsdl = "http://server/service.asmx?wsdl";
$client = new SoapClient($wsdl);
var_dump($client->someq(array('var1'=>"val1", 'var2'=>"val2")));
?>
`

