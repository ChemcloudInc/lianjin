<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<%call usertime_out()%>
<%ordernum=trim(request("ordernum"))%>
<%orderid=trim(request("orderid"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Order detail：<%=ordernum%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
</head>

<body>
<%
action=trim(request("action"))
ordernum=trim(request("ordernum"))
sql="select * from orders where ordernum='"&ordernum&"' order by zhuangtai asc, orderid desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
%>
 <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
 
 
<tr>
<td width="100" height="25" align="center">Detail：</td>
<td>
	
	<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
<tr align="center">
<td height="25" colspan="2">Product Name </td>
<td width="72">Price</td>
<td width="81">Number</td>
<td width="101">Total</td>
<td width="136">States</td>
<td width="111">Operation</td>
</tr>
	
	<%sqlp="select a.orderid,a.ordernum,a.proid,a.shuliang,a.danjia,a.zonge,a.zhuangtai,a.beizhu,a.zbeizhu,b.proid,b.proname,a.shuxing from orders a,product b where a.ordernum='"&ordernum&"' and a.proid=b.proid"
	set rsp=server.createobject("adodb.recordset")
rsp.open sqlp,conn,1,1
	totalmoney=0
	do while not rsp.eof%>
	<form name="form1" method="post" action="">
<tr align="center">
<td height="25" colspan="2" align="left">
<%proname=conn.execute("select proid,proname from product where proid="&trim(rsp("proid"))&"")(1)
bigid=conn.execute("select proid,bigid from product where proid="&trim(rsp("proid"))&"")(1)
smallid=conn.execute("select proid,smallid from product where proid="&trim(rsp("proid"))&"")(1)
c3id=conn.execute("select proid,c3id from product where proid="&trim(rsp("proid"))&"")(1)

bigname=conn.execute("select bigid,bigname from pro_big where bigid="&bigid&"")(1)
smallname=conn.execute("select smallid,smallname from pro_small where smallid="&smallid&"")(1)
c3name=conn.execute("select c3id,c3name from class3 where c3id="&c3id&"")(1)%>
<a href="prodetails.asp?proid=<%=rsp("proid")%>&bigid=<%=bigid%>&smallid=<%=smallid%>" target="_blank"><%=proname%></a>		
<td>$<input name="danjia" type="text" id="danjia" value="<%=rsp("danjia")%>"style="width:50px" onBlur="this.form.action='save_order.asp?action=changeprice&orderid=<%=rsp("orderid")%>&ordernum=<%=ordernum%>';this.form.submit()"></td>
<td> 
<input name="shuliang" type="text" id="shuliang" value="<%=rsp("shuliang")%>"style="width:50px" onBlur="this.form.action='save_order.asp?action=changeshuliang&orderid=<%=rsp("orderid")%>&ordernum=<%=ordernum%>';this.form.submit()">		</td>
<td>$<%=rsp("zonge")%></td>
<td><%=(rsp("zhuangtai"))%></td>
<td><%if rs("zhuangtai")="Unpai" then%><a href="save_order.asp?action=delorderjt&ordernum=<%=rsp("ordernum")%>&orderid=<%=rsp("orderid")%>">Delete</a><%else%><font color="ff0000">You Can't</font><%end if%></td>
</tr>
	</form>
	<%
	totalmoney=totalmoney+rsp("danjia")*rsp("shuliang")
zbeizhu=rsp("zbeizhu")
	rsp.movenext
	loop
		rsp.close:set rsp=nothing%>
		
<tr align="center">
<td width="584" height="45" align="right">Total：<!--（其中送货费用：<%'=fenyong%>）--></td>
<td width="130" height="45" align="center"><font color="red">$<%=totalmoney%></font></td>
<td height="45" colspan="5" align="center">Feedback：<%=zbeizhu%></td>
</tr>
</table>
	</td>
</tr>
<tr>
<td height="25" align="center">User Info </td>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="25" align="center">Company Name ：</td>
<td width="696">&nbsp;<%=rs("username")%></td>
<td width="450" rowspan="6" align="center">Pay <font color="red">$<%=totalmoney%></font></td>
</tr>
<tr>
<td width="85" height="30" align="center">Your Name ：</td>
<td>&nbsp;<%=rs("receive_name")%></td>
</tr>
<tr>
<td height="30" align="center">Tel：</td>
<td>&nbsp;<%=rs("linktel")%></td>
</tr>
<tr>
<td height="30" align="center">E-mail：</td>
<td>&nbsp;<%=rs("email")%></td>
</tr>
<tr>
<td height="30" align="center">Address：</td>
<td>&nbsp;<%=conn.execute("select * from useraddr where addrid="&rs("addrid")&"")(2)%>	</td>
</tr>
<tr>
<td height="30" align="center">Payment method：</td>
<td><%=rs("fkfs")%></td>
</tr>

</table></td>
</tr>
<tr>
<td height="25" colspan="2" align="center"><a href="javascript:window.close();">Close</a></td>
</tr>
</table>

<%
end if
rs.close:set rs=nothing%>

</body>
</html>
