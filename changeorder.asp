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
action=srequest(trim(request("action")),0)
select case action
case "editnum"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("shuliang")=trim(Request("shuliang"))
rs("zonge")=rs("danjia")*trim(Request("shuliang"))
rs.update
rs.close:set rs=nothing
response.Redirect("useredit_order.asp?ordernum="&ordernum)

case "editinfo"
ordernum=trim(request("ordernum"))
sql="select * from [orders] where username='"&request.Cookies("userloginname")&"' and ordernum='"&ordernum&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if rs.eof and rs.bof then
response.write "<script language=javascript>alert('您的购物车内没有商品！');window.close();</script>"
response.end
else
do while not rs.eof
rs("receive_name")=trim(request("receive_name"))
rs("linktel")=trim(request("linktel"))
rs("email")=trim(request("email"))
rs("adds")=trim(request("adds"))
rs("fkfs")=trim(request("fkfs"))
rs("beizhu")=trim(request("beizhu"))
rs.update
rs.movenext
loop

end if
rs.close:set rs=nothing
response.redirect("useredit_order.asp?ordernum="&ordernum)
end select
%>
</body>
</html>
