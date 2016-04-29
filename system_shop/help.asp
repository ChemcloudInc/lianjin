<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>帮助中心</title>
</head>

<body>
<%action=trim(Request("action"))
if action="" then
action="aboutus"
end if%>
<table width="450" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="25" align="center"><a href="help.asp?action=aboutus">About Us</a></td>
<td align="center"><a href="help.asp?action=contactus">Contact Us</a></td>
<td align="center"><a href="help.asp?action=tousu">Custom Synthesis</a></td>
<td align="center"><a href="help.asp?action=yinsi">Special Service</a></td>
<td align="center"><a href="help.asp?action=bankinfo">Bank Info</a></td>
</tr>
</table>
<%sql="select "&action&" from webhelp"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
'response.write(rs(""&action&""))
'response.end
%>
<form name="form1" method="post" action="save_help.asp?action=<%=action%>">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<td height="25" align="center" bgcolor="f0f0f0">填写内容</td>
</tr>
<tr>
<td align="center" bgcolor="#FFFFFF" style="padding:10px;">
<textarea name="content" style="display:none"><%=rs(""&action&"")%></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=content" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
</tr>
<tr>
<td height="25" align="center">
<input type="submit" name="Submit" value="保存Editor">

</td>
</tr>
</table></form>
<%rs.close:set rs=nothing%>
</body>
</html>