<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="function.asp"-->
<!--#include file="config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%webtitle=conn.execute("select sitename from baseset")(0)%>
<title><%=webtitle%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="218"><img src="img/logo.jpg" width="214" height="81"></td>
<td width="42" align="center"><img src="images/dline.jpg" width="3" height="43" /></td>
<td width="629" align="left" style="font-size:16px; font-family:微软雅黑;">Login</td>
<td width="61" align="right">&nbsp;</td>
</tr>
<tr>
<td height="4" colspan="4" background="images/d1.jpg"></td>
</tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><img src="images/d5.jpg" width="437" height="316" /></td>
<td width="420" align="center" style="padding:10px 0;"><table width="382" border="0" align="right" cellpadding="0" cellspacing="0">
<tr>
<td><img src="images/d2.jpg" width="382" height="44" /></td>
</tr>
<tr>
<td align="center" background="images/d3.jpg">
<form id="form1" name="form1" method="post" action="loginCHK.asp?action=login">
<table width="95%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="32%" height="55" align="right">Username：</td>
<td width="68%" align="left">
<input name="username" type="text" class="input" id="username" /></td>
</tr>
<tr>
<td height="55" align="right">Passwords：</td>
<td align="left"><input name="userpass" type="password" class="input" id="userpass" /></td>
</tr>
<tr>
<td height="55" align="right">Verification：</td>
<td align="left"><input name="codes" type="text" class="input" id="codes" size="10" /> 
<!--#include file="numcode_sys.asp"--></td>
</tr>
<tr>
<td height="55" colspan="2" align="center"><input type="image" src="images/dlogin.jpg" width="96" height="31" /> 　 <a href="reg.asp"><img src="images/dreg.jpg" width="96" height="31" border="0" /></a></td>
</tr>
<tr>
<td height="35" colspan="2"><img src="images/d6.jpg" width="307" height="3" /></td>
</tr>
<tr>
<td height="35" colspan="2" align="center">Any question ,please call +01-617-935-2742</td>
</tr>
</table>
</form>
</td>
</tr>
<tr>
<td><img src="images/d4.jpg" width="382" height="18" /></td>
</tr>
</table></td>
</tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="55" align="center" style="border-top:1px solid; color:#DCDCDC;"><%=webtitle%></td>
</tr>
</table>
</body>
</html> 