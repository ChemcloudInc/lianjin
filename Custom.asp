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
<title>Custom Synthesis</title>
<LINK href="inc/css.css" rel=stylesheet>

</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
if(checkspace(document.form1.proname.value)) {
	
alert("Sorry,please write proname！");
	document.form1.proname.focus();
	return false;
}
if(checkspace(document.form1.casno.value)) {
	
alert("Sorry,please write casno！");
	document.form1.casno.focus();
	return false;
}
 if(checkspace(document.form1.quantity.value)) {
	
alert("Sorry,please write your phone！");
	document.form1.quantity.focus();
	return false;
}
if(checkspace(document.form1.companyname.value)) {
	
alert("Address is must！");
	document.form1.companyname.focus();
	return false;
}

 
 if(document.form1.email.value.length!=0)
{
if (document.form1.email.value.charAt(0)=="." ||
 document.form1.email.value.charAt(0)=="@"|| 
 document.form1.email.value.indexOf('@', 0) == -1 || 
 document.form1.email.value.indexOf('.', 0) == -1 || 
 document.form1.email.value.lastIndexOf("@")==document.form1.email.value.length-1 || 
 document.form1.email.value.lastIndexOf(".")==document.form1.email.value.length-1)
 {
alert("Email format is incorrect！");
document.form1.email.focus();
return false;
}
 }
 else
{
 alert("Email not allowed empty！");
 document.form1.email.focus();
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
<%
action=srequest(trim(request("action")),0)

if action="add" then
if trim(request("proname"))="" or trim(request("casno"))="" then
response.Write "<script language=javascript>alert('Its must write with *');window.location.href='custom.asp';</script>"
response.end
end if
sql="select * From synthesis "
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
rs("proname")=trim(request("proname"))
rs("casno")=trim(request("casno"))
rs("quantity")=trim(request("quantity"))
rs("purity")=trim(request("purity"))
rs("email")=htmlencode(trim(request("email")))
rs("companyname")=trim(request("companyname"))
rs("addtime")=now()
rs("flag")=0
rs.update

rs.close:set rs=nothing
response.Write "<script language=javascript>alert('Your Custom Synthesis submit Successfully ! We will link you soon');window.location.href='custom.asp';</script>"
end if
%>

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
<td height="32" background="images/h1.jpg">&nbsp;<strong><font style="font-size:16px">Position： Home &gt; Custom Synthesis</font></strong>   </td>
</tr>
</table>

<form id="form1" name="form1" method="post" action="custom.asp?action=add">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

<tr>
<td width="29%" height="50" align="right"><font style="font-size:12px">Product Name:</font></td>
<td width="71%">
<input name="proname" type="text" class="input" id="proname"  style="width:200px;height:30px" /> 
<span class="STYLE1">*</span>  </td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">CAS Number:</font></td>
<td><input name="casno" type="text" class="input" id="casno" style="width:200px;height:30px" />
<span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Quantity:</font></td>
<td><input name="quantity" type="text" class="input" id="quantity" style="width:200px;height:30px" />
<span class="STYLE1">*</span>  </td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">Purity:</font></td>
<td><input name="purity" type="text" class="input" id="purity" style="width:200px;height:30px" />
  <span class="STYLE1">*</span></td>
</tr>
<tr>
<td height="50" align="right"><font style="font-size:12px">E-mail:</font></td>
<td><input name="email" type="text" class="input" id="email" style="width:200px;height:30px" /> 
  <span class="STYLE1">*</span> </td>
</tr>

<tr>


<td height="50" align="right"><font style="font-size:12px">Company Name:</font></td>
<td><input name="companyname" type="text" class="input" id="companyname" style="width:200px;height:30px" />
  <span class="STYLE1">*</span></td>
</tr>

<tr>
<td height="50">&nbsp;</td>
<td><input type="image" src="images/btnreg.jpg" onClick="return checkform();" /></td>
</tr>
</table>
</form>


</td>
</tr>
</table></td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>