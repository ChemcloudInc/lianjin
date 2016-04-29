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
<title>Password</title>
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
        <td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; Change Password </td>
      </tr>
    </table>
	<form action="save_user.asp?action=user_chkpass" method="post" name="form122" id="form122">
	  <table width="60%" border="0" align="left" cellpadding="0" cellspacing="0">
        
          <tr>
            <td width="39%" height="55" align="right">Old Password：</td>
            <td width="61%" align="left"><input name="oldpass" type="password" size="40" class="input" />
            </td>
          </tr>
          <tr>
            <td height="55" align="right">New Password：</td>
            <td align="left"><input name="userpass" type="password" size="40" class="input" /></td>
          </tr>
          <tr>
            <td height="55" align="right">Confirm new Password：</td>
            <td align="left"><input name="userpass1" type="password" size="40" class="input" /></td>
          </tr>
          <tr>
            <td height="40" colspan="2" align="center"><input type="image" onClick="return checkform();" src="images/btnsave.jpg" width="123" height="30" /></td>
          </tr>
        
	    </table>
	  </form>
	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
