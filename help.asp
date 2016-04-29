<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="config.asp"-->
<%call usertime_out()%>
<%action=srequest(trim(request("action")),0)
select case action
case "aboutus"
thistitle="关于我们"
case "contactus"
thistitle="联系我们"
case "tousu"
thistitle="投诉与建议"
case "yinsi"
thistitle="隐私申明"
case "bankinfo"
thistitle="付款方式"
end select
sqlh="select "&action&" from webhelp"
set rsh=conn.execute(sqlh)
if not rsh.eof then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=thistitle%></title>
<LINK href="inc/css.css" rel=stylesheet>

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="241" align="left" valign="top"><!--#include file="left.asp"--></td>
<td width="963" valign="top"><table width="952" border="0" align="right" cellpadding="0" cellspacing="1" bgcolor="DADADA">
<tr>
<td height="113" valign="top" bgcolor="#FFFFFF">

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="32" background="images/h1.jpg">Position：Home &gt; Help </td>
</tr>
<tr>
<td height="91" align="center" background="images/h2.jpg" style="border-bottom:1px solid #D4D4D4; font-size:24px; font-weight:bold;"><%=thistitle%></td>
</tr>
<tr>
<td style="padding:10px; font-size:14px; line-height:200%;"><%=rsh(0)%></td>
</tr>
</table></td>
</tr>
</table></td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
<%end if
rsh.close:set rsh=nothing%>