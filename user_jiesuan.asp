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
<%call usertime_out()%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Checkout</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td><img src="images/step2.jpg" width="1200" height="34"></td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
 if(checkspace(document.form1.receive_name.value)) {
alert("Sorry，Please fill in the consignee's name！");
document.form1.receive_name.focus();
return false;
}
 if(checkspace(document.form1.link_tel.value)) {

alert("Sorry，Please write tel！");
document.form1.link_tel.focus();
return false;
}


 if(document.form1.link_mail.value.length!=0)
{
if (document.form1.link_mail.value.charAt(0)=="." ||
 document.form1.link_mail.value.charAt(0)=="@"|| 
 document.form1.link_mail.value.indexOf('@', 0) == -1 || 
 document.form1.link_mail.value.indexOf('.', 0) == -1 || 
 document.form1.link_mail.value.lastIndexOf("@")==document.form1.link_mail.value.length-1 || 
 document.form1.link_mail.value.lastIndexOf(".")==document.form1.link_mail.value.length-1)
 {
alert("Email format is incorrect！");
document.form1.link_mail.focus();
return false;
}
 }
 else
{
 alert("Email now allowed empty！");
 document.form1.link_mail.focus();
 return false;
 }
 if(checkspace(document.form1.address.value)) {

alert("Sorry，Please write address！");
document.form1.address.focus();
return false;
}

 if(checkspace(document.form1.fkid.value)) {

alert("Sorry，Please chose the mothed！");
document.form1.fkid.focus();
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


<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td align="center">
<form name="form1" method="post" action="save_userjiesuan.asp?action=tijiao">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bordercolorlight="#F0F0F0" bordercolordark="ffffff" bgcolor="DEDEDE">
 <%sqlu="select * from webuser where username='"&session("userloginname")&"'"
set rsu=server.CreateObject("adodb.recordset")
rsu.open sqlu,conn,1,1
if rsu.eof and rsu.bof then
%>
<tr>
<td height="25" colspan="2" align="center" bgcolor="EEF7FF"><b>Please fill in the order details</b></td>
</tr>
<tr>
<td width="30%" height="35" align="right" bgcolor="EEF7FF">Your Name ：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="receive_name" type="text" id="receive_name" class="input2"> <font color="red">**</font></td>
</tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">Mobile：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="link_tel" type="text" class="input2"> <font color="red">**</font></td></tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">E-mail：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="link_mail" type="text" size="35" class="input2"> <font color="red">**</font></td></tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">Address：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="adds" type="text" size="35" class="input2"> <font color="red">**</font></td></tr>
<%else%>
<tr>
<td width="30%" height="35" align="right" bgcolor="EEF7FF">Consignee's name：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="receive_name" type="text" id="receive_name" value="<%=rsu("linkman")%>" class="input2">
 <font color="red">**</font></td>
</tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">Tel：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="link_tel" type="text" value="<%=rsu("linktel")%>" class="input2"> <font color="red">**</font></td></tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">E-mail：</td>
<td bgcolor="#FFFFFF">&nbsp;
<input name="link_mail" type="text" value="<%=rsu("email")%>" size="35" class="input2"> <font color="red">**</font></td></tr>
<tr>
<td height="35" align="right" bgcolor="EEF7FF">Address：</td>
<td bgcolor="#FFFFFF">&nbsp;
<table width="90%" border="0" cellspacing="0" cellpadding="0">
<%sqlv="select * from useraddr where username='"&request.Cookies("userloginname")&"' order by addrid"
set rsv=conn.execute(sqlv)
if not rsv.eof then
do while not rsv.eof%>
<tr>
<td width="25" height="25"><input name="addrid" type="radio" value="<%=rsv("addrid")%>" checked="checked" <%if rsv("firstaddr")=true then%>checked<%end if%> /></td>
<td><%=rsv("addr")%></td>
</tr>
<%rsv.movenext
loop
end if
rsv.close:set rsv=nothing%>
</table>
</td>
</tr>
<%
end if
rsu.close:set rsu=nothing%>

<tr>
<td height="25" align="right" bgcolor="EEF7FF">Payment method：<br> 
<font color="red">**</font></td>
<td bgcolor="#FFFFFF">&nbsp;
<select name="fkfs" size="5" style="width:200px;">
<%sqlv="select * from tblfkfs order by fkid"
set rsv=conn.execute(sqlv)
if not rsv.eof then
do while not rsv.eof%>
<option value="<%=rsv("fkname")%>" <%if trim(rsv("fkname"))="银行转账" then%>selected<%end if%>><%=rsv("fkname")%></option>
<%rsv.movenext
loop
end if
rsv.close:set rsv=nothing%>
</select> <a href="help.asp?action=bankinfo" style="color:#FF0000; text-decoration:underline" target="_blank">Check Banck Info</a></td>
</tr>
<tr>
<td align="right" bgcolor="EEF7FF">Postscript：</td>
<td bgcolor="#FFFFFF">&nbsp;
<textarea name="beizhu" cols="30" rows="5" id="beizhu"></textarea></td></tr>
<tr>
<td height="30" colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="Submit" onClick="return checkform();"></td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<!--#include file="copy.asp"-->
</body>
</html>