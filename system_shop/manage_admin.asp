<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����Ա����</title>
</head>

<body>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr align="center">
    <td height="25" background="images/titlebg.gif">�û���</td>
    <td background="images/titlebg.gif">����</td>
    <td background="images/titlebg.gif">Ȩ��</td>
    <td background="images/titlebg.gif">States</td>
    <td background="images/titlebg.gif" width="114">Editor</td>
    <td background="images/titlebg.gif" width="132">Delete</td>
  </tr>
  <%set rs=server.createobject("adodb.recordset")
    sql="select * From sys_admin order by aid desc"
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr><td colspan="6" bgcolor="ffffff">���޹���Ա</td></tr>
	<%else
	i=1
	  do while not rs.eof
	  %>
<form name="form1" method="POST" action="save_admin.asp?action=edit&aid=<%=rs("aid")%>">
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25">
      <input name="admin_name" type="text" value="<%=rs("admin_name")%>" size="20">     ��</td>
    <td width="290"><input name="admin_pass" type="password" id="admin_pass" size="20">
      <font color="red">���벻Editor������!</font></td>
    <td width="71"><a href="updateflag.asp?aid=<%=rs("aid")%>" class="linkurl">Ȩ������</a></td>
    <td width="71">
	<%if rs("zt")=true then%>
	<a href="save_admin.asp?action=changezt&aid=<%=rs("aid")%>" class="linkurl">����</a>
	<%else%>
	<a href="save_admin.asp?action=changezt&aid=<%=rs("aid")%>" class="linkurl">��ͣ</a>
	<%end if%>	</td>
    <td width="114"><input name="Submit2" type="submit" class="go" value="Editor"></td>
    <td width="132"><a href="save_admin.asp?action=del&aid=<%=rs("aid")%>" onClick="return confirm('ȷ��Delete��')" class="linkurl">Delete</a></td>
  </tr>
  </form>
  <%rs.movenext
  i=i+1
    loop
	end if
	rs.close:set rs=nothing%>
</table>
<form name="form2" method="post" action="save_admin.asp?action=add">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td width="236" height="25" align="center" background="images/titlebg.gif">�û���</td>
    <td width="294" align="center" background="images/titlebg.gif">����</td>
    <td align="center" background="images/titlebg.gif" width="394">���</td>
  </tr>
  
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25" width="236">
      <input name="admin_name" type="text" size="20">    </td>
    <td><input name="admin_pass" type="password" size="20"></td>
    <td width="394"><input name="Submit" type="submit" class="go" value="���"></td>
  </tr>
</table>
</form>
</body>
</html>