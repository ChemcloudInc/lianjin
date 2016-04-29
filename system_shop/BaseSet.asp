<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a2")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>网站基本信息设置</title>
<LINK href="images/syscome.files/Admin.css" rel=stylesheet>
</head>
<body>
<br />
<%action=srequest(trim(request("action")),0)
if action="edit" then
sql1="select * from baseset"
set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,3
rs1("sitename")=trim(request("sitename"))
rs1("siteurl")=trim(request("siteurl"))
rs1("linkman")=trim(request("linkman"))
rs1("saleshotline")=trim(request("saleshotline"))
rs1("serhotline")=trim(request("serhotline"))
rs1("fax")=trim(request("fax"))
rs1("addr")=trim(request("addr"))

rs1("ensaleshotline")=trim(request("ensaleshotline"))
rs1("enserhotline")=trim(request("enserhotline"))
rs1("enfax")=trim(request("enfax"))
rs1("enaddr")=trim(request("enaddr"))


rs1("beianhao")=trim(request("beianhao"))
rs1("allowreg")=trim(request("allowreg"))
rs1.update
rs1.close:set rs1=nothing
response.Write "<script language=javascript>alert('保存成功!');window.location.href='baseset.asp';</script>"

end if%>
<%sql="select * from baseset"
set rs=conn.execute(sql)
if not rs.eof then%>
<form name="form1" method="post" action="baseset.asp?action=edit">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr><td height="30" colspan="2" align="center" background="images/titlebg.gif" bgcolor="#FFFFFF">网站基本信息设置</td></tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">网站名称：</td>
<td bgcolor="#FFFFFF"><input name="sitename" type="text" id="sitename" value="<%=rs("sitename")%>" size="50"></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">网址：</td>
<td bgcolor="#FFFFFF"><input name="siteurl" type="text" id="siteurl" value="<%=rs("siteurl")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">联系人：</td>
<td bgcolor="#FFFFFF"><input name="linkman" type="text" id="linkman" value="<%=rs("linkman")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">上海售前：</td>
<td bgcolor="#FFFFFF"><input name="saleshotline" type="text" id="saleshotline" value="<%=rs("saleshotline")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">上海邮箱：</td>
<td bgcolor="#FFFFFF"><input name="serhotline" type="text" id="serhotline" value="<%=rs("serhotline")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">上传传真：</td>
<td bgcolor="#FFFFFF"><input name="fax" type="text" id="fax" value="<%=rs("fax")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">上海地址：</td>
<td bgcolor="#FFFFFF"><input name="addr" type="text" id="addr" value="<%=rs("addr")%>" size="80" /></td>
</tr>

<tr>
  <td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">美国售前：</td>
<td bgcolor="#FFFFFF"><input name="ensaleshotline" type="text" id="ensaleshotline" value="<%=rs("ensaleshotline")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">美国邮箱：</td>
<td bgcolor="#FFFFFF"><input name="enserhotline" type="text" id="enserhotline" value="<%=rs("enserhotline")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">美国传真：</td>
<td bgcolor="#FFFFFF"><input name="enfax" type="text" id="enfax" value="<%=rs("enfax")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">美国地址：</td>
<td bgcolor="#FFFFFF"><input name="enaddr" type="text" id="enaddr" value="<%=rs("enaddr")%>" size="80" /></td>
</tr>

<tr>
  <td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">备案号：</td>
<td bgcolor="#FFFFFF"><input name="beianhao" type="text" id="beianhao" value="<%=rs("beianhao")%>" size="50" /></td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">开放注册：</td>
<td bgcolor="#FFFFFF"><input type="radio" name="allowreg" value="1" <%if rs("allowreg")=true then%>checked<%end if%> /> 是
<input name="allowreg" type="radio" value="0" <%if rs("allowreg")=false then%>checked<%end if%> /> 否</td>
</tr>
<tr>
<td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
<td bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="保存Editor" /></td>
</tr>
</table>
</form>
<%end if
rs.close:set rs=nothing%>
</body>
</html>