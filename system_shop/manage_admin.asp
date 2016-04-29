<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理员设置</title>
</head>

<body>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr align="center">
    <td height="25" background="images/titlebg.gif">用户名</td>
    <td background="images/titlebg.gif">密码</td>
    <td background="images/titlebg.gif">权限</td>
    <td background="images/titlebg.gif">States</td>
    <td background="images/titlebg.gif" width="114">Editor</td>
    <td background="images/titlebg.gif" width="132">Delete</td>
  </tr>
  <%set rs=server.createobject("adodb.recordset")
    sql="select * From sys_admin order by aid desc"
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr><td colspan="6" bgcolor="ffffff">暂无管理员</td></tr>
	<%else
	i=1
	  do while not rs.eof
	  %>
<form name="form1" method="POST" action="save_admin.asp?action=edit&aid=<%=rs("aid")%>">
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25">
      <input name="admin_name" type="text" value="<%=rs("admin_name")%>" size="20">     　</td>
    <td width="290"><input name="admin_pass" type="password" id="admin_pass" size="20">
      <font color="red">密码不Editor请留空!</font></td>
    <td width="71"><a href="updateflag.asp?aid=<%=rs("aid")%>" class="linkurl">权限设置</a></td>
    <td width="71">
	<%if rs("zt")=true then%>
	<a href="save_admin.asp?action=changezt&aid=<%=rs("aid")%>" class="linkurl">启用</a>
	<%else%>
	<a href="save_admin.asp?action=changezt&aid=<%=rs("aid")%>" class="linkurl">暂停</a>
	<%end if%>	</td>
    <td width="114"><input name="Submit2" type="submit" class="go" value="Editor"></td>
    <td width="132"><a href="save_admin.asp?action=del&aid=<%=rs("aid")%>" onClick="return confirm('确定Delete？')" class="linkurl">Delete</a></td>
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
    <td width="236" height="25" align="center" background="images/titlebg.gif">用户名</td>
    <td width="294" align="center" background="images/titlebg.gif">密码</td>
    <td align="center" background="images/titlebg.gif" width="394">添加</td>
  </tr>
  
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25" width="236">
      <input name="admin_name" type="text" size="20">    </td>
    <td><input name="admin_pass" type="password" size="20"></td>
    <td width="394"><input name="Submit" type="submit" class="go" value="添加"></td>
  </tr>
</table>
</form>
</body>
</html>