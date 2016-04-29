<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
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
<%call usertime_out()%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Cart</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td><img src="images/ordersetp1.jpg" width="1200" height="34"></td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<%action=trim(Request("action"))
if action="add" then
'response.Write(trim(request("price")))
'response.End()
proid=trim(request("proid"))
nums=request("shuliang")
price=trim(request("price"))
if nums="" then
nums=1
end if
if not isnumeric(proid) then
response.write("Parameter must be a numeric type！")
response.End()
end if

'提取商品属性
sqlb="select * from shuxingtype where proid="&proid&" order by sxid"
set rsb=conn.execute(sqlb)
if not rsb.eof then
q=1
do while not rsb.eof
shuxingall=shuxingall&rsb("sxname")&"："&request("vaid"&q&"")&"<br>"
rsb.movenext
q=q+1
loop
end if
rsb.close:set rsb=nothing


'写入初始数据
'sql2="select proid,svipprice,vipprice,userprice,xinghao from product where proid="&proid
'set rs2=server.CreateObject("adodb.recordset")
'rs2.open sql2,conn,1,1
'select case request.Cookies("userdengji")
'case "重要客户"
'danjia=rs2("svipprice")
'case "一般重要客户"
'danjia=rs2("vipprice")
'case "一般客户"
'danjia=rs2("userprice")
'end select
'rs2.close:set rs2=nothing
'写入前判断是否为同一产品不同型号
sql1="select proid,danjia,shuliang,zonge,username,zhuangtai,shuxing,xinghao from [orders] where proid="&proid&" and zhuangtai='untreated' and username='"&request.Cookies("userloginname")&"' and shuxing='"&shuxingall&"'"
set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,2
if rs1.eof and rs1.bof then
rs1.addnew
rs1("proid")=proid
rs1("danjia")=price
rs1("shuliang")=nums
rs1("shuxing")=shuxingall
rs1("zonge")=price*nums
rs1("username")=request.Cookies("userloginname")
rs1("zhuangtai")="untreated"


else
rs1("shuliang")=rs1("shuliang")+nums
end if
rs1.update
rs1.close:set rs1=nothing
response.redirect("gouwu.asp?action=show")
end if
%> 

<%'批量订购//////////////////////////////////////////
if action="addall" then
proidall=request("id")
if nums="" then
nums=1
end if

arryproid=split(proidall,",")
for y=0 to ubound(arryproid)
'写入初始数据
'写入前判断是否为同一产品不同型号

sql2="select proid,svipprice,vipprice,userprice,xinghao,shuxing from product where proid="&arryproid(y)
set rs2=server.CreateObject("adodb.recordset")
rs2.open sql2,conn,1,1
select case request.Cookies("userdengji")
case "重要客户"
danjia=rs2("svipprice")
case "一般重要客户"
danjia=rs2("vipprice")
case "一般客户"
danjia=rs2("userprice")
end select
rs2.close:set rs2=nothing

sql1="select proid,danjia,shuliang,zonge,username,zhuangtai,shuxing,xinghao from [orders] where proid="&arryproid(y)&" and zhuangtai='untreated' and username='"&request.Cookies("userloginname")&"'"
set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,2
if rs1.eof and rs1.bof then
rs1.addnew
rs1("proid")=arryproid(y)
rs1("danjia")=price
rs1("shuliang")=nums
rs1("zonge")=price*nums
rs1("username")=request.Cookies("userloginname")
rs1("zhuangtai")="untreated"
rs1("shuxing")=shuxingall
else
rs1("shuliang")=rs1("shuliang")+nums
end if
rs1.update
rs1.close:set rs1=nothing
next
response.redirect("gouwu.asp?action=show")
end if
%> 
<%if action="show" then%>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">

</table>

<table width="1200" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="f0f0f0" bordercolordark="ffffff" bgcolor="DEDEDE">
<form name="form1" method="post" action="">
<tr align="center" bgcolor="f0f0f0">
<td width="51%" height="30" bgcolor="EEF7FF">Product Name </td>
<td width="21%" bgcolor="EEF7FF">CAS No</td>
<td width="6%" bgcolor="EEF7FF">Price</td>
<td width="7%" bgcolor="EEF7FF">Num</td>
<td width="9%" bgcolor="EEF7FF">Total Money</td>
<td width="6%" bgcolor="EEF7FF">Delete</td>
</tr>
<%sql3="select orderid,proid,shuliang,danjia,username,zhuangtai,xinghao,shuxing from [orders] where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'"
set rs3=server.CreateObject("adodb.recordset")
 rs3.open sql3,conn,1,1
 if rs3.eof and rs3.bof then%>
 <tr>
 <td height="33" colspan="6" bgcolor="#FFFFFF">Nothing</td>
 </tr>
 <%else
 do while not rs3.eof%> 
<tr align="center">
<td height="30" align="left" bgcolor="#FFFFFF">
<%proid=conn.execute("select proid,proname from product where proid="&trim(rs3("proid"))&"")(0)
proname=conn.execute("select proid,proname from product where proid="&trim(rs3("proid"))&"")(1)
CASNo=conn.execute("select proid,CASNo from product where proid="&trim(rs3("proid"))&"")(1)
bigid=conn.execute("select proid,bigid from product where proid="&trim(rs3("proid"))&"")(1)
smallid=conn.execute("select proid,smallid from product where proid="&trim(rs3("proid"))&"")(1)
c3id=conn.execute("select proid,c3id from product where proid="&trim(rs3("proid"))&"")(1)

bigname=conn.execute("select bigid,bigname from pro_big where bigid="&bigid&"")(1)
smallname=conn.execute("select smallid,smallname from pro_small where smallid="&smallid&"")(1)
c3name=conn.execute("select c3id,c3name from class3 where c3id="&c3id&"")(1)%>
&nbsp;<a href="prodetails.asp?proid=<%=proid%>&bigid=<%=bigid%>&smallid=<%=smallid%>"><%=proname%></a>
</td>
<td height="30" bgcolor="#FFFFFF"><%=CASNo%></td>
<td bgcolor="#FFFFFF">$<%=rs3("danjia")%></td>
<td bgcolor="#FFFFFF">
<input name="shuliang" type="text" value="<%=rs3("shuliang")%>" size="5" onBlur="this.form.action='editnum.asp';this.form.submit()">
<input type="hidden" name="proid" value="<%=rs3("proid")%>">
<input name="orderid" type="hidden" value="<%=rs3("orderid")%>" ></td>
<td bgcolor="#FFFFFF">$<%=rs3("shuliang")*rs3("danjia")%></td>
<td bgcolor="#FFFFFF"><a href="delproduct.asp?action=delone&orderid=<%=rs3("orderid")%>">Delete</a></td>
</tr>
<%rs3.movenext
loop
end if
rs3.close:set rs3=nothing%>
<tr align="center" bgcolor="f0f0f0">
<td height="35" colspan="6" bgcolor="#FFFFFF">
<input type="submit" name="Submit" value="Continue shopping" onClick="this.form.action='index.asp';this.form.submit()"> 
<!--<input type="submit" name="Submit2" value="修改数量" onClick="this.form.action='editnum.asp';this.form.submit()"> -->
<input type="submit" name="Submit3" value="Empty shopping cart" onClick="this.form.action='delproduct.asp?action=delall';this.form.submit()">
<input type="submit" name="Submit4" value="Checkout" onClick="this.form.action='user_jiesuan.asp';this.form.submit()">	</td>
</tr>
</form>	
</table> 
<%end if%>
<!--#include file="copy.asp"-->
</body>
</html>