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
<title>Order Number��<%=ordernum%></title>
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
    <td width="100" height="25" align="center">����States��</td>
    <td><form name="forms<%=rs("orderid")%>" method="post" action="save_order.asp?ordernum=<%=ordernum%>&orderid=<%=rs("orderid")%>">
	    <%zhuangtai()%>
      <input type="submit" name="Submit" value="�޸Ķ���States" <%if rs("zhuangtai")="�û��Ѹ���" then%>disabled<%end if%>>
    </form>    </td>
  </tr>
  <tr>
    <td height="25" align="center">��Ʒ��Ϣ��</td>
    <td>
	
	<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF">
      <tr align="center">
        <td width="40%" height="25">��Ʒ����</td>
        <td>����</td>
        <td>��������</td>
        <td>С��</td>
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
        <td height="25" colspan="3">�ܼƣ�<!--�������ͻ����ã�<%'=fenyong%>Ԫ��--></td>
        <td><font color="red"><%=totalmoney%>Ԫ</font></td>
      </tr>
    </table>	</td>
  </tr>
  <tr>
    <td height="35" align="center">�� �� �ˣ�</td>
    <td>&nbsp;<%=rs("receive_name")%></td>
  </tr>
  <tr>
    <td height="35" align="center">��ϵ�绰��</td>
    <td>&nbsp;<%=rs("linktel")%></td>
  </tr>
  <tr>
    <td height="35" align="center">�����ʼ���</td>
    <td>&nbsp;<%=rs("email")%></td>
  </tr>
  <tr>
    <td height="35" align="center">��ϵ��ַ��</td>
    <td>&nbsp;<%=rs("adds")%></td>
  </tr>
  <tr>
    <td height="35" align="center">���ʽ��</td>
    <td><%=rs("fkfs")%></td>
  </tr>
  <tr>
    <td height="35" align="center">������ע��</td>
    <td>&nbsp;<%=rs("beizhu")%></td>
  </tr>
  <tr>
    <td height="35" align="center">�˵���ţ�</td>
    <td>&nbsp;<%=rs("yundannum")%></td>
  </tr>
  <tr>
    <td height="35" align="center">�ύʱ�䣺</td>
    <td>&nbsp;<%=rs("addtime")%></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center">
	ɾ������
	��<a href="javascript:window.close();">�رմ���</a></td>
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
case "�û����µ�"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  �û����µ�
  <input type="checkbox" name="zhuangtai" value="�û��Ѹ���">
�û��Ѹ���
<input type="checkbox" name="checkbox3" value="checkbox" disabled>
���������յ���
<input type="checkbox" name="checkbox4" value="checkbox" disabled>
�������ѷ���
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
�û����յ���
<%case "�û��Ѹ���"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  �û����µ�
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
�û��Ѹ���
<input type="checkbox" name="zhuangtai" value="���������յ���" disabled>
���������յ���
<input type="checkbox" name="checkbox4" value="checkbox" disabled>
�������ѷ���
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
�û����յ���
<%case "���������յ���"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  �û����µ�
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
�û��Ѹ���
<input type="checkbox" name="checkbox3" value="checkbox" checked disabled>
���������յ���
<input type="checkbox" name="zhuangtai" value="�������ѷ���" disabled>
�������ѷ���
<input type="checkbox" name="checkbox5" value="checkbox" disabled>
�û����յ���
<%case "�������ѷ���"%>
  <input name="checkbox" type="checkbox" value="checkbox" checked disabled>
  �û����µ�
  <input type="checkbox" name="checkbox2" value="checkbox" checked disabled>
�û��Ѹ���
<input type="checkbox" name="checkbox3" value="checkbox" checked disabled>
���������յ���
<input type="checkbox" name="checkbox4" value="checkbox" checked disabled>
�������ѷ���
<input type="checkbox" name="zhuangtai" value="�û����յ���">
�û����յ���
<%case "5"
response.Write("<font color=red>���������</font>")
%>
<%end select
end sub
%>
</body>
</html>
