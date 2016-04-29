<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="function.asp"-->
<!--#include file="config.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Payment</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td><img src="images/step3.jpg" width="1200" height="34"></td></tr>
<tr><td>&nbsp;</td></tr>
</table>

<%action=trim(request("action"))
ordernum=trim(request("ordernum"))
select case action
'提交订单
case "tijiao"
shijian=now()
ordernum=year(shijian)&month(shijian)&day(shijian)&hour(shijian)&minute(shijian)&second(shijian)&int((999+1)*rnd)
sql="select * from [orders] where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,3
if rs.eof and rs.bof then
response.write "<script language=javascript>alert('No product in cart！');window.close();</script>"
response.end
else
do while not rs.eof
rs("ordernum")=ordernum
rs("receive_name")=trim(request("receive_name"))
rs("linktel")=trim(request("link_tel"))
rs("email")=trim(request("link_mail"))
rs("addrid")=trim(request("addrid"))
rs("fkfs")=trim(request("fkfs"))
rs("beizhu")=trim(request("beizhu"))
rs("addtime")=shijian
rs("zhuangtai")="Unpai"'用户已提交，但并未付款

rs("orderflag")=1           '1表示用户下单，但未付款
rs("zbeizhu")=trim(request("zbeizhu"))
rs.update
rs.movenext
loop
end if
rs.close:set rs=nothing
response.redirect("save_userjiesuan.asp?action=onlinepay&ordernum="&ordernum)
 




'取消订单
case "delorder"
conn.execute("delete from [orders] where ordernum='"&ordernum&"'")
response.redirect("index.asp")

case "onlinepay"%>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="ffffff" bordercolorlight="f0f0f0">
<%sql="select distinct(a.ordernum),a.proid,a.shuliang,a.danjia,a.zhuangtai,a.username,a.addtime,a.shuxing,b.proid,b.proname from orders a,product b where a.proid=b.proid and a.ordernum='"&ordernum&"' and a.username='"&request.Cookies("userloginname")&"' and zhuangtai='Unpai' order by a.addtime desc"
'	response.Write(sql)
'	response.End()
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	totalmoney=0
	%>
	<tr>
<td height="25" colspan="3" align="center">Your order submit success , Please remeber your <font color="red">Order number：<%=rs("ordernum")%></font></td>
</tr>
<tr>
<td height="25" colspan="3" align="center">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="DEDEDE">
<tr align="center">
<td height="35" colspan="5" bgcolor="#FFFFFF">Order commodity information</td>
</tr>
<tr align="center">
<td width="59%" height="25" bgcolor="EEF7FF">Product Name</td>
<td width="17%" bgcolor="EEF7FF">CAS No</td>
<td width="6%" bgcolor="EEF7FF">Price</td>
<td width="7%" bgcolor="EEF7FF">Number</td>
<td width="11%" bgcolor="EEF7FF">Total</td>
</tr>
<%do while not rs.eof
			
			%>
<tr align="center">
<td height="25" align="left" bgcolor="#FFFFFF">
<%bigid=conn.execute("select proid,bigid from product where proid="&trim(rs("proid"))&"")(1)
smallid=conn.execute("select proid,smallid from product where proid="&trim(rs("proid"))&"")(1)
c3id=conn.execute("select proid,c3id from product where proid="&trim(rs("proid"))&"")(1)
CASNo=conn.execute("select proid,CASNo from product where proid="&trim(rs("proid"))&"")(1)


bigname=conn.execute("select bigid,bigname from pro_big where bigid="&bigid&"")(1)
smallname=conn.execute("select smallid,smallname from pro_small where smallid="&smallid&"")(1)
c3name=conn.execute("select c3id,c3name from class3 where c3id="&c3id&"")(1)%>
&nbsp;<a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=bigid%>&smallid=<%=smallid%>" target="_blank"><%=rs("proname")%></a></td>
<td height="25" bgcolor="#FFFFFF"><%=CASNo%></td>
<td bgcolor="#FFFFFF"><font color="red">$</font><%=rs("danjia")%></td>
<td bgcolor="#FFFFFF"><%=rs("shuliang")%></td>
<td bgcolor="#FFFFFF">$<%=rs("shuliang")*rs("danjia")%></td>
</tr>
		<%totalmoney=totalmoney+rs("danjia")*rs("shuliang")
		 ' fenyong=rs("fenyong")
		rs.movenext
		
		loop
		rs.close:set rs=nothing
		'allmoney=totalmoney+fenyong
		allmoney=totalmoney
		%>
<tr align="center">
<td height="25" colspan="4" align="right" bgcolor="#FFFFFF">Total：&nbsp;<!--（其中送货费用：<%'=fenyong%>元）--></td>
<td bgcolor="#FFFFFF"><font color="red">$<%=totalmoney+fenyong%></font></td>
</tr>
</table></td>
</tr>
<%sql="select ordernum,username,danjia,receive_name,linktel,email,addrid,shfs,fkfs,beizhu from [orders] where ordernum='"&ordernum&"'"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1%>
<tr>
<td height="35" colspan="3" align="center">Your Info </td>
</tr>
<tr>
<td height="25" align="right">Company Name ：</td>
<td width="68%">&nbsp;<%=rs("username")%></td>
<td width="18%" rowspan="7" align="center">Order Number:<%=rs("ordernum")%><br> 
  <br>
<a href="view_order.asp?ordernum=<%=rs("ordernum")%>" style="text-decoration:underline; color:#0000FF" target="_blank">Go Pay</a> </td>
</tr>
<tr>
<td width="14%" height="25" align="right">Your Name ：</td>
<td>&nbsp;<%=rs("receive_name")%></td>
</tr>
<tr>
<td height="25" align="right">Tel：</td>
<td>&nbsp;<%=rs("linktel")%></td>
</tr>
<tr>
<td height="25" align="right">E-mail：</td>
<td>&nbsp;<%=rs("email")%></td>
</tr>
<tr>
<td height="25" align="right">Address：</td>
<td><%=conn.execute("select * from useraddr where addrid="&rs("addrid")&"")(2)%></td>
</tr>
<tr>
<td height="25" align="right">Payment method：</td>
<td>&nbsp;<%=rs("fkfs")%></td>
</tr>
<tr>
<td height="25" align="right">Postscript：</td>
<td>&nbsp;<%=rs("zbeizhu")%></td>
</tr>
	 
	<%rs.close:set rs=nothing%>
</table></td>
</tr>
</table>
<%end select%>
</body>
</html>
<!--#include file="copy.asp"-->
