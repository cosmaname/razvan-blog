---
layout: post
title: How to read a .ini file in .Net
date: 2009-11-25 18:05:36.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
- Windows
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
permalink: "/2009/11/how-to-read-a-ini-file-in-net/"
---
There is no ready-made class, so you'll have to call the Windows API  
`
[DllImport("KERNEL32.DLL", EntryPoint = "GetPrivateProfileStringW",
SetLastError = true,
CharSet = CharSet.Unicode, ExactSpelling = true,
CallingConvention = CallingConvention.StdCall)]
private static extern int GetPrivateProfileString(
string lpAppName,
string lpKeyName,
string lpDefault,
string lpReturnString,
int nSize,
string lpFilename);
[DllImport("KERNEL32.DLL", EntryPoint = "WritePrivateProfileStringW",
SetLastError = true,
CharSet = CharSet.Unicode, ExactSpelling = true,
CallingConvention = CallingConvention.StdCall)]
private static extern int WritePrivateProfileString(
string lpAppName,
string lpKeyName,
string lpString,
string lpFilename);`

`
 private static List<string> GetCategories(string iniFile)
{
string returnString = new string(' ', 65536);
GetPrivateProfileString(null, null, null, returnString, 65536, iniFile);
List<string> result = new List<string>(returnString.Split('\0'));
result.RemoveRange(result.Count - 2, 2);
return result;
}
private static List<string> GetKeys(string iniFile, string category)
{
string returnString = new string(' ', 32768);
GetPrivateProfileString(category, null, null, returnString, 32768, iniFile);
List<string> result = new List<string>(returnString.Split('\0'));
result.RemoveRange(result.Count-2,2);
return result;
}
private static string GetIniFileString(string iniFile, string category, string key, string defaultValue)
{
string returnString = new string(' ', 1024);
GetPrivateProfileString(category, key, defaultValue, returnString, 1024, iniFile);
return returnString.Split('\0')[0];
}
`  
and use like this:  
`
string inifile = System.AppDomain.CurrentDomain.BaseDirectory + @"\settings.ini"; string defaultValue = "???";
List<string> categories = GetCategories(inifile);
foreach (string c in categories)
{
List<string> keys = GetKeys(inifile, c);
foreach .. val = GetIniFileString(inifile, c, k, defaultValue);
}
WritePrivateProfileString("GLOBAL", "Stuff", "The content of that stuff", "MyIniFile.ini");
`  
Picked [from here](http://jachman.wordpress.com/2006/09/11/how-to-access-ini-files-in-c-net/)

