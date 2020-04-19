---
layout: post
title: How to connect to a MS SQL database using ASP.Net 3.5?
date: 2009-02-05 18:38:19.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
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
permalink: "/2009/02/how-to-connect-to-a-ms-sql-database-using-asp-net-3-5/"
---
In web.config:  
`<configuration>
...
<connectionStrings>
<add name="defaultconn" connectionString="Data Source=server.domain.com; Initial Catalog=thedatabase; Persist Security Info=True; User ID=theuser; Password=thepass" providerName=".NET Framework Data Provider for SQL Server"/>
</connectionStrings>
...
</configuration>`  
In App\_Code:  
`using System.Data.SqlClient;
namespace whatever
{
public static DataTable GetTable(string connstr, string commstr, params object[] parameters)
{
if (commstr == null) return null;
if (connstr == null) connstr = ConfigurationManager.ConnectionStrings["defaultconn"].ConnectionString;
SqlConnection scon = new SqlConnection(connstr);
SqlCommand scom = new SqlCommand(commstr, scon);
for (int j = 0; j < parameters.Length; j += 2)
scom.Parameters.AddWithValue((String)parameters[j], (parameters[j + 1] == null ? DBNull.Value : parameters[j + 1]));
SqlDataAdapter sda = new SqlDataAdapter(scom);
DataSet ds = new DataSet();
sda.Fill(ds); scon.Close();
if (ds.Tables[0].Rows.Count == 0)
return null;
return ds.Tables[0];
}
public static DataRow GetRow(string connstr, string commstr, params object[] parameters)
{
if (commstr == null) return null;
if (connstr == null) connstr = ConfigurationManager.ConnectionStrings["defaultconn"].ConnectionString;
SqlConnection scon = new SqlConnection(connstr);
SqlCommand scom = new SqlCommand(commstr, scon);
for (int j = 0; j < parameters.Length; j += 2)
scom.Parameters.AddWithValue((String)parameters[j], (parameters[j + 1] == null ? DBNull.Value : parameters[j + 1]));
SqlDataAdapter sda = new SqlDataAdapter(scom);
DataSet ds = new DataSet();
sda.Fill(ds); scon.Close();
if (ds.Tables[0].Rows.Count == 0)
return null;
return ds.Tables[0].Rows[0];
}
public static int Execute(string connstr, string commstr, params object[] parameters)
{
if (commstr == null) return -1;
if (connstr == null) connstr = ConfigurationManager.ConnectionStrings["defaultconn"].ConnectionString;
SqlConnection scon = new SqlConnection(connstr); scon.Open();
SqlCommand scom = new SqlCommand(commstr, scon);
for (int j = 0; j < parameters.Length; j += 2)
scom.Parameters.AddWithValue((String)parameters[j], (parameters[j + 1] == null ? DBNull.Value : parameters[j + 1]));
return scom.ExecuteNonQuery();
}`  
Use as`
DataTable dt = whatever.SQL.GetTable(null, "select * from Users");
DataRow dr = whatever.SQL.GetRow(null, "select * from Users where uname=@u and pass=@p", "@u", uname.Text, "@p", pass.Text);`  
etc

