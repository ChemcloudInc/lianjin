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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Order Number：<%=ordernum%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
</head>

<body>
<%
sql="select * from orders where ordernum='"&ordernum&"' order by orderid"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
do while not rs.eof
%>
<table width="90%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
  <tr>
    <td width="100" height="25" align="center">订单States：</td>
    <td><form name="forms<%=rs("orderid")%>" method="post" action="save_order.asp?ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>">
	    <%zhuangtai()%>
      <input type="submit" name="Submit" value="修改订单States" <%if rs("zhuangtai")="用户已付款" then%>disabled<%end if%>>
    </form>    </td>
  </tr>
  <tr>
    <td height="25" align="center">商品信息：</td>
    <td>
	
	<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
      <tr align="center">
        <td width="40%" height="25">商品名称</td>
        <td>单价</td>
        <td>订购数量</td>
        <td>小计</td>
      </tr>
	  <%sqlp="select a.orderid,a.ordernum,a.proid,a.shuliang,a.danjia,a.zonge,b.proid,b.proname from orders a,product b where a.orderid="&rs("orderid")&" and a.proid=b.proid"
	  set rsp=server.createobject("adodb.recordset")
      rsp.open sqlp,conn,1,1
	  totalmoney=0
	  do while not rsp.eof%>
      <tr align="center">
        <td height="25"><%=rsp("proname")%></td>
        <td><%=rsp("danjia")%></td>
        <td><%=rsp("shuliang")%></td>
        <td><%=rsp("zonge")%></td>
      </tr>
	  <%
	  totalmoney=totalmoney+rsp("danjia")*rsp("shuliang")
	  ' fenyong=rsp("fenyong")	  
	  rsp.movenext
	    loop
		rsp.close:set rsp=nothing%>
		      <tr align="center">
        <td height="25" colspan="3">总计：<!--（其中送货费用：<%'=fenyong%>元）--></td>
        <td><font color="red"><%=totalmoney%>元</font></td>
      </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="35" align="center">收 货 人：</td>
    <td>&nbsp;<%=rs("receive_name")%></td>
  </tr>
  <tr>
    <td height="35" align="center">联系电话：</td>
    <td>&nbsp;<%=rs("linktel")%></td>
  </tr>
  <tr>
    <td height="35" align="center">电子邮件：</td>
    <td>&nbsp;<%=rs("email")%></td>
  </tr>
  <tr>
    <td height="35" align="center">联系地址：</td>
    <td>&nbsp;<%=rs("adds")%></td>
  </tr>
  <tr>
    <td height="35" align="center">付款方式：</td>
    <td><%=rs("fkfs")%></td>
  </tr>
  <tr>
    <td height="35" align="center">备　　注：</td>
    <td>&nbsp;<%=rs("beizhu")%></td>
  </tr>
  <tr>
    <td height="35" align="center">运单编号：</td>
    <td>&nbsp;<%=rs("yundannum")%></td>
  </tr>
  <tr>
    <td height="35" align="center">提交时间：</td>
    <td>&nbsp;<%=rs("addtime")%></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center">
	删除订单
	　<a href="javascript:window.close();">关闭窗口</a></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="2" bgcolor="#FF0000"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<%rs.movenext
loop
end if
rs.close:set rs=nothing%>
<%
sub zhuangtai()
select case rs("zhuangtai")
case "用户已下单"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  用户已下单
  <input type="checkbox" name="zhuangtai" value="用户已付款">
用户已付款
<input type="checkbox" name="checkbox3" value="checkbox" disabled>
服务商已收到款
<input type="checkbox" name="checkbox4" value="checkbox" disabled>
服务商已发货
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
用户已收到货
<%case "用户已付款"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  用户已下单
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
用户已付款
<input type="checkbox" name="zhuangtai" value="服务商已收到款" disabled>
服务商已收到款
<input type="checkbox" name="checkbox4" value="checkbox" disabled>
服务商已发货
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
用户已收到货
<%case "服务商已收到款"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  用户已下单
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
用户已付款
<input type="checkbox" name="checkbox3" value="checkbox" checked disabled>
服务商已收到款
<input type="checkbox" name="zhuangtai" value="服务商已发货" disabled>
服务商已发货
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
用户已收到货
<%case "服务商已发货"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  用户已下单
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
用户已付款
<input type="checkbox" name="checkbox3" value="checkbox" checked disabled>
服务商已收到款
<input type="checkbox" name="checkbox4" value="checkbox" checked disabled>
服务商已发货
<input type="checkbox" name="zhuangtai" value="用户已收到货">
用户已收到货
<%case "5"
response.Write("<font color=red>订单已完成</font>")
%>
<%end select
end sub
%>
</body>
</html>
