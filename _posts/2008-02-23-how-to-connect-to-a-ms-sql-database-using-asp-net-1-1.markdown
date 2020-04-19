---
layout: post
title: How to connect to a MS SQL database using ASP.Net 1.1?
date: 2008-02-23 19:23:41.000000000 +00:00
type: post
parent_id: '0'
published: true
password: ''
status: publish
categories:
- C#
tags: []
permalink: "/2008/02/how-to-connect-to-a-ms-sql-database-using-asp-net-1-1/"
---
1. In web.config:  
`<configuration>
...
<appSettings>
...
<add key="connStr" value="server=server_name_or_ipaddress; Initial Catalog=database_name; User Id=username; Password=password;" />
...
</appSettings>
...
</configuration>`  
2. In your .aspx file:  
`<asp:Repeater ID="rep1" runat="server">
<HeaderTemplate><table border="1"></HeaderTemplate>
<ItemTemplate>
<tr>
<td><%# DataBinder.Eval(Container.DataItem, "col1") %></td>
<td><%# DataBinder.Eval(Container.DataItem, "col2") %></td>
</tr>
</ItemTemplate>
<FooterTemplate></table></FooterTemplate>
</asp:Repeater>`  
3. In your .aspx.cs file:  
`using System.Data;
using System.Data.SqlClient;
protected Repeater rep1;
private void Page_Load(object sender, System.EventArgs e)
{
SqlConnection cn = new SqlConnection( System.Configuration.ConfigurationSettings.AppSettings["connStr"] );
SqlDataAdapter dap = new SqlDataAdapter("Select col1,col2 from sometable",cn);
Dataset ds = new DataSet();
dap.Fill(ds,"somename");
rep1.DataSource = ds.Tables["somename"];
rep1.DataBind();
}`

