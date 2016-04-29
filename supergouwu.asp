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
<%
if request.Cookies("userloginname")="" then
response.Write("您还没有登录，请登录后再下订单，<a href='login.asp' target='_blank'>点此登录</a>")
response.End()
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>


<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="f0f0f0" bordercolordark="ffffff" bgcolor="DEDEDE">
<form name="form1" method="post" action="">
  <tr align="center" bgcolor="f0f0f0">
    <td width="25%" height="30" bgcolor="EEF7FF">商品名称</td>
    <td width="35%" bgcolor="EEF7FF">类型</td>
    <td width="9%" bgcolor="EEF7FF">单价</td>
    <td width="11%" bgcolor="EEF7FF">数量</td>
    <td width="13%" bgcolor="EEF7FF">总金额</td>
    <td width="7%" bgcolor="EEF7FF">删除</td>
  </tr>
  <%sql3="select orderid,proid,shuliang,danjia,username,zhuangtai,shuxing from [orders] where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'"
  set rs3=server.CreateObject("adodb.recordset")
   rs3.open sql3,conn,1,1
   if rs3.eof and rs3.bof then%>
   <tr><td height="33" colspan="6" bgcolor="#FFFFFF">您还没有选购任何商品</td>
   </tr>
   <%else
     do while not rs3.eof%> 
  <tr align="center">
    <td height="30" bgcolor="#FFFFFF">
 <%proid=conn.execute("select proid,proname from product where proid="&trim(rs3("proid"))&"")(0)
proname=conn.execute("select proid,proname from product where proid="&trim(rs3("proid"))&"")(1)
bigid=conn.execute("select proid,bigid from product where proid="&trim(rs3("proid"))&"")(1)
smallid=conn.execute("select proid,smallid from product where proid="&trim(rs3("proid"))&"")(1)
c3id=conn.execute("select proid,c3id from product where proid="&trim(rs3("proid"))&"")(1)

bigname=conn.execute("select bigid,bigname from pro_big where bigid="&bigid&"")(1)
smallname=conn.execute("select smallid,smallname from pro_small where smallid="&smallid&"")(1)
c3name=conn.execute("select c3id,c3name from class3 where c3id="&c3id&"")(1)%>
<a href="prodetails.asp?proid=<%=proid%>&bigid=<%=bigid%>&smallid=<%=smallid%>"  ><%=proname%></a>	  
	  
	  
	  
	  
	  </td>
    <td height="30" bgcolor="#FFFFFF">
<%if rs3("shuxing")<>"" then%><%=rs3("shuxing")%><%else%>无型号信息<%end if%> </td>
    <td bgcolor="#FFFFFF">￥<%=rs3("danjia")%></td>
    <td bgcolor="#FFFFFF">
      <input name="shuliang" type="text" value="<%=rs3("shuliang")%>" size="5" onBlur="this.form.action='editnum1.asp';this.form.submit()">
      <input type="hidden" name="proid" value="<%=rs3("proid")%>">
	  <input name="orderid" type="hidden" value="<%=rs3("orderid")%>" >    </td>
    <td bgcolor="#FFFFFF">￥<%=rs3("shuliang")*rs3("danjia")%></td>
    <td bgcolor="#FFFFFF"><a href="delproduct1.asp?action=delone&proid=<%=rs3("orderid")%>">删除</a></td>
  </tr>
  <%rs3.movenext
    loop
	end if
	rs3.close:set rs3=nothing%>
  <tr align="center" bgcolor="f0f0f0">
    <td height="35" colspan="6" bgcolor="#FFFFFF">
	  <a href="user_jiesuan.asp" target="_blank" ><img src="images/index_21.jpg" /></a>	  </td>
  </tr>
</form>	
</table> 


</body>
</html>
