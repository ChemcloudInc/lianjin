<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Order Detail</title>
</head>

<body>
<%
action=trim(request("action"))
ordernum=trim(request("ordernum"))
if action="del" then
orderid=srequest(trim(request("orderid")),1)
conn.execute("delete from orders where orderid="&orderid&"")
response.write "<script language=javascript>alert('Delete Successfully！');window.opener.location.reload();window.close();</script>"

response.end
end if
sql="select * from orders where ordernum='"&ordernum&"' order by orderid"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then%>
<form name="form1" method="post" action="save_order2.asp?action=saveall&ordernum=<%=ordernum%>">
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
<tr>
<td width="100" height="25" align="center">Product Info ：</td>
<td>

<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
<tr align="center">
<td width="273" height="25">Product Name </td>
<td width="164"><b>CASNo</b></td>
<td width="127">Price</td>
<td width="114">Number</td>
<td width="51">Total</td>
<td width="162">States</td>
<td width="253">Feedback</td>
<td width="32">Operate</td>
</tr>
<%sqlp="select a.orderid,a.ordernum,a.proid,a.shuliang,a.danjia,a.zonge,a.zhuangtai,a.beizhu,a.zbeizhu,a.shuxing,b.proid,b.proname from orders a,product b where a.ordernum='"&ordernum&"' and a.proid=b.proid"
set rsp=server.createobject("adodb.recordset")
rsp.open sqlp,conn,1,1
totalmoney=0
do while not rsp.eof%>
<tr align="center">
<td height="25">
<%proname=conn.execute("select proid,proname from product where proid="&trim(rsp("proid"))&"")(1)
bigid=conn.execute("select proid,bigid from product where proid="&trim(rsp("proid"))&"")(1)
smallid=conn.execute("select proid,smallid from product where proid="&trim(rsp("proid"))&"")(1)
c3id=conn.execute("select proid,c3id from product where proid="&trim(rsp("proid"))&"")(1)
CASNo=conn.execute("select proid,CASNo from product where proid="&trim(rsp("proid"))&"")(1)

bigname=conn.execute("select bigid,bigname from pro_big where bigid="&bigid&"")(1)
smallname=conn.execute("select smallid,smallname from pro_small where smallid="&smallid&"")(1)
c3name=conn.execute("select c3id,c3name from class3 where c3id="&c3id&"")(1)%>
<a href="../prodetails.asp?proid=<%=rsp("proid")%>&bigid=<%=bigid%>&smallid=<%=smallid%>" target="_blank"><%=proname%></a>
 
<input name="orderid" type="hidden" id="orderid" value="<%=rsp("orderid")%>"></td>
<td height="25"><%=CASNo%></td>
<td>$<input name="danjia" type="text" id="danjia" value="<%=rsp("danjia")%>" size="8" onBlur="this.form.action='editdanjia.asp';this.form.submit()"></td>
<td><input name="shuliang" type="text" id="shuliang" value="<%=rsp("shuliang")%>" size="5" onBlur="this.form.action='editnum.asp';this.form.submit()">
<input name="ordernum" type="hidden" value="<%=rsp("ordernum")%>" ></td>
<td>$<%=rsp("zonge")%></td>
<td><select name="zhuangtai">
<option value="Upai" <%if trim(rsp("zhuangtai"))="Upai" then%>selected<%end if%>>Upai</option>
<option value="Paid" <%if trim(rsp("zhuangtai"))="Paid" then%>selected<%end if%>>Paid</option>
</select></td>
<td><textarea name="beizhu" cols="30" rows="3" id="beizhu"><%=rsp("beizhu")%></textarea></td>
<td><%if rsp("zhuangtai")="Unsend" then%><a href="save_order2.asp?action=delxd&ordernum=<%=ordernum%>" class="linkurl">Delete</a><%else%>No Operate<%end if%></td>
</tr>
<%totalmoney=totalmoney+rsp("danjia")*rsp("shuliang")
beizhu=rsp("beizhu")
rsp.movenext
loop
rsp.close:set rsp=nothing%>
<tr align="center">
<td height="45" align="right">Total：<!--（其中送货费用：<%'=fenyong%>元）--></td>
<td height="45" align="center"><font color="red">$<%=totalmoney%></font></td>
<td height="45" colspan="5" align="center">&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</tr>
<tr>
<td height="25" align="center">User Info </td>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="25" align="center">Company Name ：</td>
<td width="1064">&nbsp;<%=rs("username")%></td>
</tr>
<tr>
<td width="130" height="30" align="center">Your Name ：</td>
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
<td>&nbsp;<%=conn.execute("select * from useraddr where addrid="&rs("addrid")&"")(2)%>
<%firstaddr=conn.execute("select firstaddr from useraddr where addrid="&trim(rs("addrid"))&"")(0)
if firstaddr=false then
response.Write("<font color='red'>(　Notice：It's new address)</font>")
end if%>
</td>
</tr>
<tr>
<td height="30" align="center">Payment：</td>
<td><%=rs("fkfs")%></td>
</tr>

</table>
</td>
</tr>
<tr>
<td height="25" colspan="2" align="center">
<input type="submit" name="Submit" value="Operated">
<input type="submit" name="Submit3" value="Pass" onClick="this.form.action='save_order.asp?ordernum=<%=ordernum%>&action=shenhe';this.form.submit()">
<a href="view_order2.asp?action=del&ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>" onClick="return confirm('Are you sure delete？')">Delete</a>
　<a href="javascript:window.close();">Close</a></td>
</tr>
</table>
</form>
<%end if
rs.close:set rs=nothing%>

</body>
</html>