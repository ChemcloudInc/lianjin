<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
</head>

<body>
<%proid=trim(request("proid"))%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td align="center" bgcolor="#D6E3E9">�������ƹ���</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" style="padding:10px;">
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">��������</td>
    <td align="center" background="images/titlebg.gif" bgcolor="#6699cc">ѡ������</td>
    <td align="center" background="images/titlebg.gif">�༭</td>
    <td align="center" background="images/titlebg.gif">Delete</td>
  </tr>
  <%sql="select * from shuxingtype where proid="&proid&" order by sxid desc"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr>
	  <td colspan="6" align="center" bgcolor="#FFFFFF">������������</td>
	</tr>
	<%else
	  do while not rs.eof%>
	  <form name="dform<%=rs("sxid")%>" method="post" action="save_shuxing.asp?action=edit&sxid=<%=rs("sxid")%>&proid=<%=proid%>">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="sxname" type="text" class="inputc" value="<%=rs("sxname")%>" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="xxtype" type="radio" value="0" <%if rs("xxtype")=false then%>checked<%end if%> />
��ѡ
  <input type="radio" name="xxtype" value="1" <%if rs("xxtype")=true then%>checked<%end if%> />
��ѡ</td>
    <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="Editor" class="go"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_shuxing.asp?action=del&sxid=<%=rs("sxid")%>&proid=<%=proid%>" onClick="return confirm('ȷ��Delete��')">Delete</a></td>
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
    <td width="35%" height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">��������</td>
    <td width="35%" align="center" background="images/titlebg.gif" bgcolor="#6699cc">ѡ������</td>
    <td width="30%" align="center" background="images/titlebg.gif">���</td>
  </tr>

	  <form name="dformadd" method="post" action="save_shuxing.asp?action=add&proid=<%=proid%>">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="sxname" type="text" class="inputc" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="xxtype" type="radio" value="0" checked="checked" />
      ��ѡ
        <input type="radio" name="xxtype" value="1" />
        ��ѡ</td>
    <td align="center" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="���" class="go">
    </td>
    </tr>
  </form>
</table>
	</td>
  </tr>
</table>
</body>
</html>
