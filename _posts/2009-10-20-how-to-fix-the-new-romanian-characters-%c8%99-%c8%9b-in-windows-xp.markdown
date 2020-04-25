---
layout: post
title: How to fix the new Romanian characters (ș ț) in Windows XP
date: 2009-10-20 18:20:00.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- Windows
tags: []
permalink: "/2009/10/how-to-fix-the-new-romanian-characters-%c8%99-%c8%9b-in-windows-xp/"
---
Four Romanian characters are missing in Times New Roman and Arial. The  characters are: ș Ș ț Ț, the lower- and uppercase letters S and T with  comma below, Unicode codes 0219, 0218, 021B, 021A. Windows XP and its  Romanian keyboard layout implements them as small and capital letters S  or T cedilla Ş ş Ţ ţ (U+015E, U+015F, U+0162, U+0163). Since the  Romanian authorities (Academia Română) have decided that a comma should  be used instead of the cedilla, Windows Vista and all future versions  will use the former.
To display them correctly, you need to install "European Union Expansion Font Update" <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=0ec6f335-c3de-44c5-a13d-a1e7cea5ddea&amp;DisplayLang=ro" target="_blank">from here</a>,  and enable "extend support of advanced text services to all programs"  in Control Panel-&gt;Regional and Language  Options-&gt;Languages-&gt;Details-&gt;Advanced.
To change the keyboard input and be able to type the new comma ones instead of cedilla:
1. Download the "Microsoft Keyboard Layout Creator 1.4" <a href="http://www.microsoft.com/DOWNLOADS/details.aspx?FamilyID=8be579aa-780d-4253-9e0a-e17e51db2223&amp;displaylang=en" target="_blank">from here</a>
2. Save <a href="../vistakeys.klc" target="_blank">this file</a> somewhere.
3.  Open Keyboard Layout Creator-&gt;load source file-&gt;vistakeys.klc. I  have changed ; and ' to enter the new characters, and also moved y and z  to where God intended them to be in the first place.
4. Project-&gt;Build DLL and Setup package-&gt;run the generated setup
You should now have a "Romanian - Updated" option in the keyboard layouts.
Update 1: this might break spell-checking in some applications. <a href="http://www.openoffice.org/" target="_blank">Open Office</a> works fine. Notepad++ doesn't display them correctly in the editor window, but does so in the search/replace dialog.
Update 2: Some fonts must be updated with the Vista/OS X equivalents, e.g. Courier New. This fixes Notepad++ 
