<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<%call time_out()%>
<%userid=srequest(trim(request("userid")),1)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�༭��Ա</title>
<LINK href="images/syscome.files/Admin.css" rel=stylesheet>

</head>

<body>
<%
action=srequest(trim(request("action")),0)

if action="edit" then
sql="select * From webuser where userid="&userid
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
if trim(request("userpass"))<>"" then
rs("userpass")=md5(trim(request("userpass")))
end if
rs("dengji")=trim(request("dengji"))
rs("comname")=trim(request("comname"))
rs("linkman")=trim(request("linkman"))
rs("linktel")=trim(request("linktel"))
rs("fax")=trim(request("fax"))
rs("mobile")=trim(request("mobile"))
rs("adds")=trim(request("adds"))
rs("postcode")=trim(request("postcode"))
rs("email")=htmlencode(trim(request("email")))
rs("caozuoname")=trim(request("caozuoname"))

rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('��Ա��Ϣ�༭�ɹ�!');window.location.href='user_edit.asp?userid="&userid&"';</script>"
end if
%>
<%sql="select * from webuser where userid="&userid
set rs=conn.execute(sql)
if not rs.eof then%>
<form name="form1" method="post" action="user_edit.asp?action=edit&userid=<%=rs("userid")%>">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="30" colspan="2" align="center" background="images/titlebg.gif" bgcolor="#FFFFFF">�༭��Ա��Ϣ</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��Ա���ƣ�</td>
    <td bgcolor="#FFFFFF">
      <input name="username" type="text" id="username" size="50" value="<%=rs("username")%>" readonly=""> 
      <font color="#FF0000">*</font>     ��Ա�˺Ų���Editor</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��½���룺</td>
    <td bgcolor="#FFFFFF"><input name="userpass" type="password" id="userpass" size="50" />
      <font color="#FF0000">* </font>���벻Editor������</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��Ա�ȼ���</td>
    <td bgcolor="#FFFFFF"><select name="dengji" id="dengji">
      <option value="��Ҫ�ͻ�" <%if trim(rs("dengji"))="��Ҫ�ͻ�" then%>selected<%end if%>>��Ҫ�ͻ�</option>
      <option value="һ����Ҫ�ͻ�" <%if trim(rs("dengji"))="һ����Ҫ�ͻ�" then%>selected<%end if%>>һ����Ҫ�ͻ�</option>
      <option value="һ��ͻ�" <%if trim(rs("dengji"))="һ��ͻ�" then%>selected<%end if%>>һ��ͻ�</option>
    </select>
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��˾���ƣ�</td>
    <td bgcolor="#FFFFFF"><input name="comname" type="text" id="comname" value="<%=rs("comname")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�ˣ�</td>
    <td bgcolor="#FFFFFF"><input name="linkman" type="text" id="linkman" value="<%=rs("linkman")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�绰��</td>
    <td bgcolor="#FFFFFF"><input name="linktel" type="text" id="linktel" value="<%=rs("linktel")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">������룺</td>
    <td bgcolor="#FFFFFF"><input name="fax" type="text" id="fax" value="<%=rs("fax")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�ֻ���</td>
    <td bgcolor="#FFFFFF"><input name="mobile" type="text" id="mobile" value="<%=rs("mobile")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ��ַ��</td>
    <td bgcolor="#FFFFFF"><input name="adds" type="text" id="adds" value="<%=rs("adds")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">�������룺</td>
    <td bgcolor="#FFFFFF"><input name="postcode" type="text" id="postcode" value="<%=rs("postcode")%>" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">�������䣺</td>
    <td bgcolor="#FFFFFF"><input name="email" type="text" id="email" size="50" value="<%=rs("email")%>" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">����Ա��	</td>
    <td bgcolor="#FFFFFF">
	<select name="caozuoname">
     <%sql1="select * from sys_admin order by aid"
	   set rs1=conn.execute(sql1)
	   if rs1.eof and rs1.bof then%>
       <option value=""   >����ѡ�����Ա</option>
       <%else
		do while not rs1.eof%>
      <option value="<%=rs1("admin_name")%>" <%if rs("caozuoname")=rs1("admin_name") then%>selected="selected"<%end if%>><%=rs1("admin_name")%></option>
      <%rs1.movenext
		loop
		end if
		rs1.close:set rs1=nothing%>
     </select> 
    �����·������Ա������ѡ���粻���·��䣬����ѡ��	</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="�����Ա" /></td>
  </tr>
</table>
</form>
<%end if
rs.close:set rs=nothing%>
</body>
</html>
