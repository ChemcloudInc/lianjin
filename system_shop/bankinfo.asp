<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a2")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Bank Info</title>
</head>
<body>
<%if trim(request("action"))="edit" then
sql="select bankinfo from baseinfo"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("bankinfo")=request("bankinfo")
rs.update
rs.close:set rs=nothing
end if
sql1="select bankinfo from baseinfo"
set rs1=conn.execute(sql1)%>
<form name="form1" method="post" action="bankinfo.asp?action=edit">
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr><td height="25" align="center" bgcolor="f0f0f0">Bank Info</td></tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF" style="padding:5px;">
<textarea name="bankinfo" id="bankinfo" style="display:none"><%=rs1("bankinfo")%></textarea>
<iframe src="Edit/editor.htm?id=bankinfo&ReadCookie=0" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" width="621" height="457"></iframe>
</td>
</tr>
<tr><td height="25" align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="go" value="Save"></td></tr>
</table>
</form>
<%rs1.close:set rs1=nothing%>
</body>
</html>