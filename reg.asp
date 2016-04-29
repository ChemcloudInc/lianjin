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
<%'检测是否开放注册
allowreg=conn.execute("select allowreg from baseset")(0)
if allowreg=false then
response.Write("Link manager.<br>+01-617-935-2742<br><a href='/'>Home</a>")
response.End()
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Register</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
if(checkspace(document.form255.username.value)) {
	
alert("Sorry,please write username！");
	document.form255.username.focus();
	return false;
}
 if(checkspace(document.form255.userpass.value) || document.form255.userpass.value.length<6 || document.form255.userpass.value.length>18) {
	
alert("The password not allowed empty,between 6 to 18 words！");
	document.form255.userpass.focus();
	return false;
}
 if(checkspace(document.form255.userpass1.value) || document.form255.userpass1.value.length<6 || document.form255.userpass1.value.length>18) {
	
alert("Please rewrite password,between 6 to 18 words！");
	document.form255.userpass1.focus();
	return false;
}
 if(document.form255.userpass.value!=document.form255.userpass1.value) {
	
alert("Two times the password is not consistent！");
	document.form255.userpass.value="";
	document.form255.userpass1.value="";
	document.form255.userpass.focus();
	return false;
}
 if(checkspace(document.form255.linkman.value)) {
	
alert("Sorry,please write linkman！");
	document.form255.linkman.focus();
	return false;
}
 if(checkspace(document.form255.linktel.value)) {
	
alert("Sorry,please write your phone！");
	document.form255.linktel.focus();
	return false;
}
if(checkspace(document.form255.adds.value)) {
	
alert("Address is must！");
	document.form255.adds.focus();
	return false;
}

 
 if(document.form255.email.value.length!=0)
{
if (document.form255.email.value.charAt(0)=="." ||
 document.form255.email.value.charAt(0)=="@"|| 
 document.form255.email.value.indexOf('@', 0) == -1 || 
 document.form255.email.value.indexOf('.', 0) == -1 || 
 document.form255.email.value.lastIndexOf("@")==document.form255.email.value.length-1 || 
 document.form255.email.value.lastIndexOf(".")==document.form255.email.value.length-1)
 {
alert("Email format is incorrect！");
document.form255.email.focus();
return false;
}
 }
 else
{
 alert("Email not allowed empty！");
 document.form255.email.focus();
 return false;
 }
}
function checkspace(checkstr) {
var str = '';
for(i = 0; i < checkstr.length; i++) {
str = str + ' ';
}
return (str == checkstr);
}

//-->
</script>
<body>
<%
action=srequest(trim(request("action")),0)

if action="add" then
if trim(request("username"))="" or trim(request("userpass"))="" then
response.Write "<script language=javascript>alert('Its must write with *');window.location.href='reg.asp';</script>"
response.end
end if
sql="select * From webuser where username='"&trim(request("username"))&"'"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
if rs.eof then
rs.addnew
rs("username")=trim(request("username"))
rs("userpass")=md5(trim(request("userpass")))
rs("dengji")="一般客户"
rs("comname")=trim(request("comname"))
rs("linkman")=trim(request("linkman"))
rs("linktel")=trim(request("linktel"))
rs("fax")=trim(request("fax"))
rs("mobile")=trim(request("mobile"))
rs("adds")=trim(request("adds"))
rs("postcode")=trim(request("postcode"))
rs("email")=htmlencode(trim(request("email")))
rs("addtime")=now()
rs.update
else
response.Write "<script language=javascript>alert('User name already exists, please choose');window.location.href='reg.asp';</script>"
response.End()
end if
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('User Register Successfully !');window.location.href='reg.asp';</script>"
end if
%>
<table width="980" height="90" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="200"><img src="img/logo.jpg" width="214" height="81" /></td>
<td width="30" align="center"><img src="images/dline.jpg" width="3" height="43" /></td>
<td align="left" style="font-size:16px;">Register</td>
<td align="right">&nbsp;</td>
</tr>
<tr>
<td height="4" colspan="4" background="images/d1.jpg"></td>
</tr>
</table>
<div class="con_k"></div>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="32" background="images/login1.jpg" style="padding-left:15px; font-weight:bold;">Register</td>
</tr>
<tr>
<td height="200" background="images/login2.jpg" class="padall"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" style="font-size:14px; line-height:200%">
<form id="form255" name="form255" method="post" action="reg.asp?action=add">
<table width="95%" border="0" align="left" cellpadding="0" cellspacing="0">

<tr>
<td width="29%" height="50" align="right"><font style="font-size:12px">Username:</font></td>
<td width="71%">
<input name="username" type="text" class="input" id="username"  style="width:200px;height:30px" /> 
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Password:</font></td>
<td><input name="userpass" type="password" class="input" id="userpass" style="width:200px;height:30px" />
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Confirm password:</font></td>
<td><input name="userpass1" type="password" class="input" id="userpass1" style="width:200px;height:30px" />
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Company Name:</font></td>
<td><input name="comname" type="text" class="input" id="comname" style="width:200px;height:30px" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Person:</font></td>
<td><input name="linkman" type="text" class="input" id="linkman" style="width:200px;height:30px" />
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Tel:</font></td>
<td><input name="linktel" type="text" class="input" id="linktel" style="width:200px;height:30px" />
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Fax:</font></td>
<td><input name="fax" type="text" class="input" id="fax" style="width:200px;height:30px" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Mobile:</font></td>
<td><input name="mobile" type="text" class="input" id="mobile" style="width:200px;height:30px" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Address:</font></td>
<td><input name="adds" type="text" class="input" id="adds" style="width:400px;height:30px" /> 
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Zip:</font></td>
<td><input name="postcode" type="text" class="input" id="postcode" style="width:200px;height:30px" /></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">E-mail:</font></td>
<td><input name="email" type="text" class="input" id="email" style="width:200px;height:30px" /> <span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50">&nbsp;</td>
<td><input type="image" src="images/btnreg.jpg" onClick="return checkform();" /></td>
</tr>
</table>
</form></td>
</tr>
</table></td>
</tr>
<tr>
<td><img src="images/login3.jpg" width="980" height="4" /></td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>