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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Contact Us</title>
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
<td height="610" valign="top" bgcolor="#FFFFFF">

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="32" background="images/h1.jpg">&nbsp;<strong><font style="font-size:16px">Position： Home &gt; Contact Us</font></strong>   </td>
</tr>
 
<tr>
  <td style="padding:10px; line-height:200%;">&nbsp;</td>
</tr>
<tr>
<td style="padding:10px; line-height:200%;"><%=conn.execute("select contact  from baseinfo")(0)%></td>
</tr>
</table></td>
</tr>
</table></td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>