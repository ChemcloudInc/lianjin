<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<%
action=srequest(trim(request("action")),0)
select case action
case "changezt"
orderid=trim(request("orderid"))
ordernum=trim(request("ordernum"))
if trim(Request("zhuangtai"))="" then
response.Write "<script language=javascript>alert('Order's States is empty��Can't change States!');window.location.href='view_order.asp?ordernum="&ordernum&"';</script>"
response.end
end if

sql="select * from orders where orderid='"&orderid&"'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
do while not rs.eof
rs("zhuangtai")=trim(Request("zhuangtai"))
if Request("zhuangtai")="Send" then
rs("orderflag")=4
else
rs("orderflag")=4
end if
rs.update
rs.movenext
loop
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

'�����˵�����
case "edityundan"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
do while not rs.eof
rs("yundannum")=trim(Request("yundannum"))
rs.update
rs.movenext
loop
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

'���ĵ��������ĵ��ۺ��ܼ�
case "changeprice"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("danjia")=trim(Request("danjia"))
rs("zonge")=trim(request("danjia"))*rs("shuliang")
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

'���ı�ע��Ϣ
case "savebeizhu"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select orderid,beizhu from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("beizhu")=trim(Request("beizhu"))
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

'����ȫ��������Ʒ��Ϣ/////
case "saveall"
ordernum=trim(request("ordernum"))
for i=1 to request.form("orderid").count
	sql="select * from orders where orderid="&request.form("orderid")(i)
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("zhuangtai")=request.Form("zhuangtai")(i)
if Request("zhuangtai")="Send" then
rs("orderflag")=4
else
rs("orderflag")=4
end if	
	rs("beizhu")=request.Form("beizhu")(i)
	rs("admin_name")=request.Cookies("seomanager")("admin_name")
	rs.update
	rs.close:set rs=nothing
next
response.Redirect("view_order.asp?ordernum="&ordernum)

case "shenhe"
ordernum=trim(request("ordernum"))
conn.execute("update orders set shren='"&request.Cookies("seomanager")("admin_name")&"' where ordernum='"&ordernum&"'")
response.Redirect("manage_order.asp")

'Delete����������ĳ����Ʒ
case "delone"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
conn.execute("delete from orders where orderid="&orderid&"")
response.Redirect("view_order.asp?ordernum="&ordernum&"")



'�������� 
case "delxd"
ordernum=trim(request("ordernum"))
conn.execute("update [orders] set orderflag=0 where ordernum='"&ordernum&"'")
'response.Write("update [orders] set orderflag=0 where ordernum='"&ordernum&"'")
'response.End()
response.Redirect("manage_order.asp") 







end select%>
</body>
</html>
