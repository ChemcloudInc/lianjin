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
<%ordernum=trim(request("ordernum"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/step3.jpg" width="980" height="34"></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
</table>

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="ffffff" bordercolorlight="f0f0f0">
      <%sql="select distinct(a.ordernum),a.orderid,a.proid,a.shuliang,a.danjia,a.zhuangtai,a.username,a.addtime,b.proid,b.proname from orders a,product b where a.proid=b.proid and a.ordernum='"&ordernum&"' and a.username='"&request.Cookies("userloginname")&"' and zhuangtai='�û����µ�' order by a.addtime desc"
'	  response.Write(sql)
'	  response.End()
	  set rs=server.CreateObject("adodb.recordset")
	  rs.open sql,conn,1,1
	  totalmoney=0
	  %>
	  <tr>
        <td height="25" colspan="2" align="center"><font color="red">Order Number��<%=ordernum%></font></td>
        </tr>
      <tr>
        <td height="25" colspan="2" align="center">
		
		<table width="98%" border="0" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="DEDEDE">
          <tr align="center">
            <td height="35" colspan="4" bgcolor="#FFFFFF">������Ʒ��Ϣ</td>
            </tr>
          <tr align="center">
            <td width="40%" height="25" bgcolor="EEF7FF">��Ʒ����</td>
            <td bgcolor="EEF7FF">��Ʒ����</td>
            <td bgcolor="EEF7FF">��������</td>
            <td bgcolor="EEF7FF">�ܶ�</td>
          </tr>
            <%do while not rs.eof%>
			<form name="formd<%=rs("orderid")%>" method="post" action="">
          <tr align="center">
            <td height="25" bgcolor="#FFFFFF"><%=rs("proname")%></td>
            <td bgcolor="#FFFFFF"><%=rs("danjia")%>Ԫ</td>
            <td bgcolor="#FFFFFF"><input name="shuliang" type="text" value="<%=rs("shuliang")%>" size="5" onBlur="this.form.action='changeorder.asp?action=editnum&orderid=<%=rs("orderid")%>&ordernum=<%=ordernum%>';this.form.submit()"></td>
            <td bgcolor="#FFFFFF"><%=rs("shuliang")*rs("danjia")%>Ԫ</td>
          </tr>
		  </form>
		<%totalmoney=totalmoney+rs("danjia")*rs("shuliang")
		 ' fenyong=rs("fenyong")
		rs.movenext
		
		loop
		rs.close:set rs=nothing
		'allmoney=totalmoney+fenyong
		allmoney=totalmoney
		%>
          <tr align="center">
            <td height="25" colspan="3" bgcolor="#FFFFFF">�ܼƣ�<!--�������ͻ����ã�<%'=fenyong%>Ԫ��--></td>
            <td bgcolor="#FFFFFF"><font color="red"><%=totalmoney+fenyong%>Ԫ</font></td>
          </tr>
        </table>		</td>
        </tr>
		<%sql="select ordernum,username,danjia,receive_name,linktel,email,adds,shfs,fkfs,beizhu from [orders] where ordernum='"&ordernum&"'"
		  set rs=server.CreateObject("adodb.recordset")
	  rs.open sql,conn,1,1%>
      <tr>
        <td height="35" colspan="2" align="center">�ջ�����Ϣ</td>
        </tr>
		<form name="formedit" method="post" action="changeorder.asp?action=editinfo&ordernum=<%=ordernum%>">
      <tr>
        <td width="40%" height="35" align="right">�ջ���������</td>
        <td>&nbsp;
            <input type="text" name="receive_name" value="<%=rs("receive_name")%>">          </td>
      </tr>
      <tr>
        <td height="35" align="right">��ϵ�绰��</td>
        <td>&nbsp;
          <input name="linktel" type="text" id="linktel" value="<%=rs("linktel")%>"></td>
      </tr>
      <tr>
        <td height="35" align="right">�����ʼ���</td>
        <td>&nbsp;
          <input name="email" type="text" id="email" value="<%=rs("email")%>"></td>
      </tr>
      <tr>
        <td height="35" align="right">�ͻ���ַ��</td>
        <td>&nbsp;
          <input name="adds" type="text" value="<%=rs("adds")%>" size="45"></td>
      </tr>
      <tr>
        <td height="35" align="right">���ʽ��</td>
        <td>&nbsp;
          <select name="fkfs" size="5" style="width:200px;">
            <%sqlv="select * from tblfkfs order by fkid"
			set rsv=conn.execute(sqlv)
			if not rsv.eof then
			do while not rsv.eof%>
			<option value="<%=rsv("fkname")%>" <%if trim(rsv("fkname"))=trim(rs("fkfs")) then%>selected<%end if%>><%=rsv("fkname")%></option>
            <%rsv.movenext
			loop
			end if
			rsv.close:set rsv=nothing%>
          </select> <a href="help.asp?action=bankinfo" style="color:#FF0000; text-decoration:underline" target="_blank">�鿴��˾������Ϣ</a></td>
      </tr>
      <tr>
        <td height="35" align="right">�������ԣ�</td>
        <td>&nbsp;
          <textarea name="beizhu" cols="40" rows="8"><%=rs("beizhu")%></textarea></td>
      </tr>
      <tr>
        <td height="45" align="right">&nbsp;</td>
        <td><input type="submit" name="Submit" value="���涩��"></td>
      </tr>
</form>
		
	  <%rs.close:set rs=nothing%>
    </table></td>
  </tr>
</table>
</body>
</html>
<!--#include file="copy.asp"-->
