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
if orderid="" then
response.write "<script language=javascript>alert('对不起，您没有选择商品！');window.location.href='gouwu.asp?action=show';</script>"
response.end 
end if
for i=1 to request.form("shuliang").count
'if not isnumeric(trim(request.form("shuliang"))) then
'response.Write("参数必须为数字型!")
'response.end
'end if

if request.form("shuliang")(i)<=0 then
shuliang=1
else
shuliang=request.form("shuliang")(i)

zonge=cint(shuliang)*danjia
conn.execute("update [orders] set shuliang="&shuliang&",zonge="&zonge&" where  orderid="&request.form("orderid")(i))
end if




sql="select proid,proname,svipprice,vipprice,userprice,bigid,smallid,c3id from product where proid="&request.form("proid")(i)
   set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

select case request.Cookies("userdengji")
case "重要客户"
danjia=rs("svipprice")
case "一般重要客户"
danjia=rs("vipprice")
case "一般客户"
danjia=rs("userprice")
end select

zonge=cint(shuliang)*danjia
conn.execute("update [orders] set shuliang="&shuliang&",zonge="&zonge&" where  orderid="&request.form("orderid")(i))
next
response.Redirect("gouwu.asp?action=show")%>
</body>
</html>