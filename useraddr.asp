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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Address</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
if(checkspace(document.form122.oldpass.value)) {
	
    alert("请填写原始密码");
	document.form122.oldpass.focus();
	return false;
  }
   if(checkspace(document.form122.userpass.value)) {
	
    alert("请填写登录密码！");
	document.form122.userpass.focus();
	return false;
  }
     if(document.form122.userpass.value!=document.form122.userpass1.value) {
	
    alert("两次输入的密码不一致！");
	document.form122.userpass.value="";
	document.form122.userpass1.value="";
	document.form122.userpass.focus();
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
</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; Addres  </td>
      </tr>
    </table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td height="25" align="center" bgcolor="F1F5FA">Addres</td>
    <td align="center" bgcolor="F1F5FA">Edit</td>
    <td align="center" bgcolor="F1F5FA">Delete</td>
  </tr>
  <%sql="select * from useraddr where username='"&request.Cookies("userloginname")&"' order by addrid desc"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	s=s+1
	if rs.eof and rs.bof then%>
  <tr>
    <td height="25" colspan="5" align="center" bgcolor="#FFFFFF">Nothing</td>
  </tr>
  <%else
	  do while not rs.eof%>
  <form name="dform<%=s%>" method="post" action="save_useraddr.asp?action=edit&addrid=<%=rs("addrid")%>">
    <tr>
      <td height="25" align="center" bgcolor="#FFFFFF"><input name="addr" type="text" class="input" value="<%=rs("addr")%>" size="60"></td>
      <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit2" value="Change" class="go"></td>
      <td align="center" bgcolor="#FFFFFF"><a href="save_useraddr.asp?action=del&addrid=<%=rs("addrid")%>" onClick="return confirm('Are you sure delete？')">Delete</a></td>
    </tr>
  </form>
  <%rs.movenext
  s=s+1
    loop
	end if
	rs.close
	set rs=nothing%>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="25%" height="25" align="center" bgcolor="F1F5FA">Address</td>
    <td width="15%" align="center" bgcolor="F1F5FA">Add</td>
  </tr>

	  <form name="dformadd" method="post" action="save_useraddr.asp?action=add">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><input name="addr" type="text" class="input" size="60"></td>
    <td align="center" bgcolor="#FFFFFF"><label>
      <input type="submit" name="Submit" value="Add" class="go">
    </label></td>
    </tr>
  </form>
</table>
	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
