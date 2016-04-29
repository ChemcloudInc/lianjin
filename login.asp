<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="inc/md5.asp"-->
<!--#include file="config.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Login</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="con_k"></div>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="32" background="images/login1.jpg" style="padding-left:15px; font-weight:bold;">Login</td></tr>
<tr>
<td height="200" background="images/login2.jpg" class="padall">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="43%" valign="top" background="images/a16.jpg" style="font-size:14px; line-height:200%"><b>Notice</b></td>
<td width="57%">
<form id="form2" name="form2" method="post" action="loginCHK.asp?action=login">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="40" colspan="2" align="center" class="fontw">Login</td></tr>
<tr>
<td width="43%" height="50" align="right"><font style="font-size:12px">UserName:</font></td>
<td width="57%"><input name="username" type="text" class="input" id="username" size="30" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Password:</font></td>
<td><input name="userpass" type="password" class="input" id="userpass" size="30" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Verification code:</font></td>
<td><input name="codes" type="text" class="input" id="codes" size="15" /> <!--#include file="numcode_sys.asp"--></td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td><input type="image" src="images/loginbtn.jpg" width="98" height="34" /></td>
</tr>
</table>
</form>
</td>
</tr>
</table>

</td>
</tr>
<tr><td><img src="images/login3.jpg" width="980" height="4" /></td></tr>
</table>
<!--#include file="copy.asp"-->
</body>
</html>