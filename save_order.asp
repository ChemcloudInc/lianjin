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
action=srequest(trim(request("action")),0)
select case action
'���ĵ��������ĵ��ۺ��ܼ�
case "changeprice"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("danjia")=trim(Request("danjia"))
rs("shuliang")=trim(request("shuliang"))
rs("zonge")=trim(request("danjia"))*rs("shuliang")
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)



'���ĵ��������ĵ��ۺ��ܼ�
case "changeshuliang"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("danjia")=trim(Request("danjia"))
rs("shuliang")=trim(request("shuliang"))
rs("zonge")=trim(request("danjia"))*rs("shuliang")
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)


'ɾ���û��Լ��µ�
case "delxd"
ordernum=trim(request("ordernum"))
'sql="select orderflag,ordernum from orders where ordernum="&ordernum
'set rs=server.createobject("adodb.recordset")
'rs.open sql,conn,1,2
'rs("orderflag")=0
'rs.update
'rs.close:set rs=nothing
conn.execute("update [orders] set orderflag=0 where ordernum='"&ordernum&"'")
'response.Write("update [orders] set orderflag=0 where ordernum='"&ordernum&"'")
'response.End()
response.Redirect("userindex.asp") 
 
 
'ɾ���û��Լ��µ�
case "delorderjt"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
'response.Write(trim(request("orderid")))
'response.End()
conn.execute("delete from orders where orderid="&orderid&"")
response.redirect("view_order.asp?ordernum="&ordernum)


'���ĵ�����ע
case "changebz"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("beizhu")=trim(Request("beizhu"))
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)


'���ĵ�����ע
case "changegwbz"
'ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
beizhu=trim(Request("beizhu"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("beizhu")=beizhu 
'response.Write(trim(request("orderid")))
'response.End()
rs.update
rs.close:set rs=nothing
response.Redirect("gouwu.asp?action=show")


'���ı�ע��Ϣ
case "savebeizhu"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select orderid,beizhu from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("beizhu")=request.Form("beizhu")(i)
rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

 

'���Ķ���States
case "changezt"
ordernum=trim(request("ordernum"))
orderid=trim(request("orderid"))
sql="select * from orders where orderid="&orderid
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,2
rs("zhuangtai")=trim(Request("zhuangtai"))

rs.update
rs.close:set rs=nothing
response.Redirect("view_order.asp?ordernum="&ordernum)

end select
%>
</body>
</html>
