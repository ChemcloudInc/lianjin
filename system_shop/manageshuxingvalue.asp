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

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="25" align="center" bgcolor="#D6E3E9">����ֵ����</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" style="padding:10px;">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td align="center" background="images/titlebg.gif" bgcolor="#6699cc">��������</td>
    <td height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">����ֵ</td>
    <td align="center" background="images/titlebg.gif">�༭</td>
    <td align="center" background="images/titlebg.gif">Delete</td>
  </tr>
  <%sql="select * from shuxingvalue where proid="&proid&" order by vaid desc"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr>
	  <td colspan="6" align="center" bgcolor="#FFFFFF">��������ֵ</td>
	</tr>
	<%else
	  do while not rs.eof%>
	  <form name="dformss<%=rs("vaid")%>" method="post" action="save_shuxing.asp?action=editvalue&vaid=<%=rs("vaid")%>&proid=<%=proid%>">
  <tr>
    <td align="center" bgcolor="#FFFFFF"><select name="sxid" id="sxid">
	<%sql2="select * from shuxingtype where proid="&proid&" order by sxid"
	set rs2=conn.execute(sql2)
	if not rs2.eof then
	do while not rs2.eof%>
      <option value="<%=rs2("sxid")%>" <%if rs2("sxid")=rs("sxid") then%>selected<%end if%>><%=rs2("sxname")%></option>
	  <%rs2.movenext
	  loop
	  end if
	  rs2.close:set rs2=nothing%>
    </select>    </td>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="valuename" type="text" class="inputc" value="<%=rs("valuename")%>" size="30"></td>
    <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="Editor" class="go"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_shuxing.asp?action=delvalue&vaid=<%=rs("vaid")%>&proid=<%=proid%>" onClick="return confirm('ȷ��Delete������ֵ��')">Delete</a></td>
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
    <td width="35%" align="center" background="images/titlebg.gif" bgcolor="#6699cc">��������</td>
    <td height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">����ֵ</td>
    <td width="30%" align="center" background="images/titlebg.gif">���</td>
  </tr>

	  <form name="dformaddss" method="post" action="save_shuxing.asp?action=addvalue&proid=<%=proid%>">
  <tr>
    <td align="center" bgcolor="#FFFFFF"><select name="sxid" id="sxid">
	<%sql2="select * from shuxingtype where proid="&proid&" order by sxid"
	set rs2=conn.execute(sql2)
	if not rs2.eof then
	do while not rs2.eof%>
      <option value="<%=rs2("sxid")%>"><%=rs2("sxname")%></option>
	  <%rs2.movenext
	  loop
	  end if
	  rs2.close:set rs2=nothing%>
    </select></td>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="valuename" type="text" class="inputc" size="30"></td>
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
