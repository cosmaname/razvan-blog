---
layout: post
title: How to generate Excel from SQL data with Unicode characters
date: 2009-01-16 18:39:59.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
tags: []
permalink: "/2009/01/how-to-generate-excel-from-sql-data-with-unicode-characters/"
---
`private void ExportToExcel(string strFileName, DataGrid dg)
{
Response.ClearContent();
Response.ContentType = "application/excel";
Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
Response.Charset = "";
Response.ContentEncoding = System.Text.Encoding.Unicode;
Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());
this.EnableViewState = false;
System.IO.StringWriter sw = new System.IO.StringWriter();
HtmlTextWriter htw = new HtmlTextWriter(sw);
dg.RenderControl(htw);
Response.Write(sw.ToString());
Response.End();
}`

