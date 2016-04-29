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
<title>无标题文档</title>
</head>

<body>
<%
action=trim(Request("action"))
'批量订购//////////////////////////////////////////
if action="addall" then
proidall=request("id")
if nums="" then
nums=1
end if




arryproid=split(proidall,",")
for y=0 to ubound(arryproid)
'写入初始数据开始,是循环的第一步
sql2="select proid,svipprice,vipprice,userprice from product where proid="&arryproid(y)
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
'以上是根据会员级别获取价格

'提取商品属性
shuxingall=""
proid=arryproid(y)
sqlb="select * from shuxingtype where proid="&proid&" order by sxid"
set rsb=conn.execute(sqlb)
if not rsb.eof then
q=1
do while not rsb.eof
shuxingall=shuxingall&rsb("sxname")&"："&request("vaid"&q&"a"&proid&"")&"<br>"
'Response.Write(shuxingall)
'Response.End()
rsb.movenext
q=q+1
loop
end if
rsb.close:set rsb=nothing
'response.Write(proid)
'response.Write(shuxingall)
'response.Write(danjia)
'response.End()

sql1="select proid,danjia,shuliang,zonge,username,zhuangtai,shuxing from [orders] where proid="&arryproid(y)&" and zhuangtai='untreated' and username='"&request.Cookies("userloginname")&"'"
  set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,2
if rs1.eof and rs1.bof then
rs1.addnew
rs1("proid")=arryproid(y)
rs1("danjia")=danjia
rs1("shuliang")=nums
rs1("shuxing")=shuxingall
rs1("zonge")=danjia*nums
rs1("username")=request.Cookies("userloginname")
rs1("zhuangtai")="untreated"

else
rs1("shuliang")=rs1("shuliang")+nums
end if
rs1.update
rs1.close:set rs1=nothing
next
response.redirect("superorder.asp")
end if
%> 
</body>
</html>
