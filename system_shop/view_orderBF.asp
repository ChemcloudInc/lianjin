<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看订单</title>
</head>

<body>
<%
action=trim(request("action"))
ordernum=trim(request("ordernum"))
if action="del" then
orderid=srequest(trim(request("orderid")),1)
conn.execute("delete from orders where orderid="&orderid&"")
response.write "<script language=javascript>alert('订单Delete成功！');window.opener.location.reload();window.close();</script>"

response.end
end if
sql="select * from orders where ordernum='"&ordernum&"' order by orderid"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
do while not rs.eof
%>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
  <tr>
    <td width="100" height="25" align="center">订单States：</td>
    <td><form name="forms<%=rs("orderid")%>" method="post" action="save_order.asp?action=changezt&orderid=<%=rs("orderid")%>&ordernum=<%=ordernum%>">
	    <%zhuangtai()%>
      <input type="submit" name="Submit" value="Editor订单States" <%if rs("zhuangtai")="用户已经收到货" then%>disabled<%end if%>>
    </form>    </td>
  </tr>
  <tr>
    <td height="25" align="center">商品信息：</td>
    <td>
	<form name="form1" method="post" action="">
	<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
      <tr align="center">
        <td width="40%" height="25">商品名称</td>
        <td>单价</td>
        <td>订购数量</td>
        <td>小计</td>
      </tr>
	  <%sqlp="select a.ordernum,a.proid,a.shuliang,a.danjia,a.zonge,b.proid,b.proname from orders a,product b where a.orderid="&rs("orderid")&" and a.proid=b.proid"
	  set rsp=server.createobject("adodb.recordset")
      rsp.open sqlp,conn,1,1
	  totalmoney=0
	  do while not rsp.eof%>
      <tr align="center">
        <td height="25"><%=rsp("proname")%></td>
        <td>￥<input name="danjia" type="text" id="danjia" value="<%=rsp("danjia")%>" size="12" onBlur="this.form.action='save_order.asp?action=changeprice&orderid=<%=rs("orderid")%>&ordernum=<%=ordernum%>';this.form.submit()">          </td>
        <td><%=rsp("shuliang")%></td>
        <td>￥<%=rsp("zonge")%></td>
      </tr>
	  <%
	  totalmoney=totalmoney+rsp("danjia")*rsp("shuliang")
		  'fenyong=rsp("fenyong")
	  rsp.movenext
	    loop
		rsp.close:set rsp=nothing%>
      <tr align="center">
        <td height="25" colspan="3" align="right">总计：<!--（其中送货费用：<%'=fenyong%>元）--></td>
        <td><font color="red"><%=totalmoney%>元</font></td>
      </tr>
    </table>
	</form>	</td>
  </tr>
  <tr>
    <td height="30" align="center">收 货 人：</td>
    <td>&nbsp;<%=rs("receive_name")%></td>
  </tr>
  <tr>
    <td height="30" align="center">联系电话：</td>
    <td>&nbsp;<%=rs("linktel")%></td>
  </tr>
  <tr>
    <td height="30" align="center">电子邮件：</td>
    <td>&nbsp;<%=rs("email")%></td>
  </tr>
  <tr>
    <td height="30" align="center">联系地址：</td>
    <td>&nbsp;<%=rs("adds")%>
	<%oldaddr=conn.execute("select adds from webuser where username='"&trim(rs("username"))&"'")(0)
	if oldaddr<>trim(rs("adds")) then
	response.Write("<font color='red'>(　友情提醒：该地址为新地址)</font>")
	end if
	%>	</td>
  </tr>
  <tr>
    <td height="30" align="center">付款方式：</td>
    <td><%=rs("fkfs")%></td>
  </tr>
  <tr>
    <td height="30" align="center">备　　注：</td>
	<form name="formb<%=rs("orderid")%>" method="post" action="save_order.asp?action=savebeizhu&ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>">
    <td>&nbsp;
        <textarea name="beizhu" cols="70" rows="3" id="beizhu"><%=rs("beizhu")%></textarea> <input type="submit" name="Submit3" value="保存"> 
        (填写货物晚发原因，前台用户可以看见)     </td>
	</form>
  </tr>
  <tr>
    <td height="30" align="center">提交时间：</td>
    <td>&nbsp;<%=rs("addtime")%></td>
  </tr>
  <tr>
    <td height="30" align="center">运单号码：</td>
	<form name="form2<%=rs("orderid")%>" method="post" action="save_order.asp?action=edityundan&ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>">
    <td>
      <input name="yundannum" type="text" id="yundannum" value="<%=rs("yundannum")%>">
    <input type="submit" name="Submit2" value="保存">    </td></form>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center">
	<a href="view_order.asp?action=del&ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>" onClick="return confirm('确定Delete此订单吗？')">Delete订单</a>
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
<input type="checkbox" name="checkbox4" value="checkbox" disabled>
服务商已发货
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
用户已收到货
<%case "服务商已发货"%>
<input name="checkbox" type="checkbox" value="checkbox" checked disabled>
用户已下单
<input type="checkbox" name="checkbox4" value="checkbox" checked disabled>
服务商已发货
<input type="checkbox" name="zhuangtai" value="用户已收到货" disabled>
用户已收到货
<%case "5"
response.Write("<font color=red>订单已完成</font>")
%>
<%end select
end sub
%>
</body>
</html>
