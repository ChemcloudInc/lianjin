<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
orderid=trim(request("orderid"))
ordernum=request.Form("ordernum")(1)
if orderid="" then
response.write "<script language=javascript>alert('该订单中没有产品！');window.location.href='view_order.asp?ordernum="&ordernum&"';</script>"
response.end 
end if
for i=1 to request.form("danjia").count
'if not isnumeric(trim(request.form("shuliang"))) then
'response.Write("参数必须为数字型!")
'response.end
'end if

danjia=request.form("danjia")(i)
zonge=cint(danjia)*cint(request.Form("shuliang")(i))
conn.execute("update [orders] set danjia="&danjia&",zonge="&zonge&" where orderid="&request.form("orderid")(i))
next
response.Redirect("view_order.asp?ordernum="&ordernum&"")
%>
</body>
</html>
