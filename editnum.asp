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
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
orderid=trim(request("orderid"))
if orderid="" then
response.write "<script language=javascript>alert('�Բ�����û��ѡ����Ʒ��');window.location.href='gouwu.asp?action=show';</script>"
response.end 
end if
for i=1 to request.form("shuliang").count
'if not isnumeric(trim(request.form("shuliang"))) then
'response.Write("��������Ϊ������!")
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
case "��Ҫ�ͻ�"
danjia=rs("svipprice")
case "һ����Ҫ�ͻ�"
danjia=rs("vipprice")
case "һ��ͻ�"
danjia=rs("userprice")
end select

zonge=cint(shuliang)*danjia
conn.execute("update [orders] set shuliang="&shuliang&",zonge="&zonge&" where  orderid="&request.form("orderid")(i))
next
response.Redirect("gouwu.asp?action=show")%>
</body>
</html>