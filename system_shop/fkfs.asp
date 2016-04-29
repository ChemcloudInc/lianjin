<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>付款方式管理</title>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">付款方式名称</td>
    <td align="center" background="images/titlebg.gif">编辑</td>
    <td align="center" background="images/titlebg.gif">Delete</td>
  </tr>
  <%sql="select * from tblfkfs order by fkid desc"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr>
	  <td colspan="5" align="center" bgcolor="#FFFFFF">暂无付款方式</td>
	</tr>
	<%else
	  do while not rs.eof%>
	  <form name="dform" method="post" action="save_fkfs.asp?action=edit&fkid=<%=rs("fkid")%>">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="fkname" type="text" class="inputc" value="<%=rs("fkname")%>" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="Editor" class="go"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_fkfs.asp?action=del&fkid=<%=rs("fkid")%>" onClick="return confirm('确定Delete？')">Delete</a></td>
  </tr>
  </form>
  <%rs.movenext
    loop
	end if
	rs.close
	set rs=nothing%>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="35%" height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">付款方式名称</td>
    <td width="30%" align="center" background="images/titlebg.gif">添加</td>
  </tr>

	  <form name="dformadd" method="post" action="save_fkfs.asp?action=add">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="fkname" type="text" class="inputc" size="30"></td>
    <td align="center" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="添加" class="go">
    </td>
    </tr>
  </form>
</table>
</body>
</html>
