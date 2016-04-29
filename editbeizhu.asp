<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<%call usertime_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
orderid=trim(request("orderid"))
beizhu=trim(request("beizhu"))
 
 
 
conn.execute("update [orders] set beizhu="&beizhu&" where  orderid="&request.form("orderid")(0))
 
response.Redirect("gouwu.asp?action=show")%>
</body>
</html>