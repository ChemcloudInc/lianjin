<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<form id="form2" name="form2" method="post" action="loginCHK.asp?action=login">
		<table width="95%" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td height="40" colspan="2" align="center" class="fontw">会员登录</td>
            </tr>
          <tr>
            <td width="43%" height="50" align="right">用户名：</td>
            <td width="57%">
              <input name="username" type="text" class="input" id="username" size="30" />
            
            </td>
          </tr>
          <tr>
            <td height="50" align="right">密　码：</td>
            <td><input name="userpass" type="password" class="input" id="userpass" size="30" /></td>
          </tr>
          <tr>
            <td height="50" align="right">验证码：</td>
            <td><input name="codes" type="text" class="input" id="codes" size="15" /> 
              <!--#include file="numcode_sys.asp"--></td>
          </tr>
          <tr>
            <td height="50">&nbsp;</td>
            <td><input type="image" src="images/loginbtn.jpg" width="98" height="34" /></td>
          </tr>
        </table>
		</form>
</body>
</html>
