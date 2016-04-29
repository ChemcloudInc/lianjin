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
<%action=trim(Request("action"))
proid=trim(Request("proid"))
select case action
case "delone"
conn.execute("delete from [orders] where proid="&proid)
response.Redirect("supergouwu.asp")

case "delall"
conn.execute("delete from [orders] where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'")
response.Redirect("supergouwu.asp")
end select%>
</body>
</html>
