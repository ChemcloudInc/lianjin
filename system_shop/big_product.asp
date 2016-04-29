<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("b1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>First classification</title>
</head>

<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Name</td>
    <td align="center" background="images/titlebg.gif" bgcolor="#6699cc">Picture</td>
    <td align="center" background="images/titlebg.gif">Editor</td>
    <td align="center" background="images/titlebg.gif">Delete</td>
  </tr>
  <%sql="select * from pro_big order by bigid desc"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	
	%>
	<tr>
	  <td colspan="6" align="center" bgcolor="#FFFFFF">Nothing</td>
	</tr>
	<%else
	k=1
	  do while not rs.eof%>
	  <form name="dform<%=k%>" method="post" action="save_big.asp?action=edit&bigid=<%=rs("bigid")%>">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="bigname" type="text" class="inputc" value="<%=rs("bigname")%>" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="bigpic" type="text" id="bigpic" value="<%=rs("bigpic")%>">
      <input name="Submit222" type="button" class="go" onClick="window.open('carson52001.asp?formname=dform<%=k%>&editname=bigpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="Upload"></td>
    <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="Editor" class="go"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_big.asp?action=del&bigid=<%=rs("bigid")%>" onClick="return confirm('Delete一级分类将自动Delete该一级分类下所有二三级分类，请谨慎操作，确定Delete？')">Delete</a></td>
  </tr>
  </form>
  <%rs.movenext
  k=k+1
    loop
	end if
	rs.close
	set rs=nothing%>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="35%" height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Name</td>
    <td width="35%" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Picture</td>
    <td width="30%" align="center" background="images/titlebg.gif">Add</td>
  </tr>

	  <form name="dformadd" method="post" action="save_big.asp?action=add">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="bigname" type="text" class="inputc" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="bigpic" type="text" id="bigpic">
      <input name="Submit2222" type="button" class="go" onClick="window.open('carson52001.asp?formname=dformadd&editname=bigpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="Upload"></td>
    <td align="center" bgcolor="#FFFFFF"><label>
      <input type="submit" name="Submit" value="Add" class="go">
    </label></td>
    </tr>
  </form>
</table>
</body>
</html>
