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
<title>Change info</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; Change  </td>
      </tr>
    </table>
	<%sql="select * from webuser where username='"&request.Cookies("userloginname")&"'"
	set rs=conn.execute(sql)
	if not rs.eof then%>
	<form id="form2" name="form2" method="post" action="save_user.asp?action=editinfo">
      <table width="90%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" align="right">User Name：</td>
          <td>
            <input name="username" type="text" class="input" id="username" value="<%=rs("username")%>" readonly="" size="50" /> 
            No change          </td>
        </tr>
        <tr>
          <td height="45" align="right">Company Name：</td>
          <td><input name="comname" type="text" class="input" id="comname" value="<%=rs("comname")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Your Name：</td>
          <td><input name="linkman" type="text" class="input" id="linkman" value="<%=rs("linkman")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Tel：</td>
          <td><input name="linktel" type="text" class="input" id="linktel" value="<%=rs("linktel")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Fax：</td>
          <td><input name="fax" type="text" class="input" id="fax" value="<%=rs("fax")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Mobile：</td>
          <td><input name="mobile" type="text" class="input" id="mobile" value="<%=rs("mobile")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Add：</td>
          <td><input name="adds" type="text" class="input" id="adds" value="<%=rs("adds")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="45" align="right">Zip：</td>
          <td><input name="postcode" type="text" class="input" id="postcode" value="<%=rs("postcode")%>" size="20" /></td>
        </tr>
        <tr>
          <td height="45" align="right">E-MAIL：</td>
          <td><input name="email" type="text" class="input" id="email" size="50" value="<%=rs("email")%>" /></td>
        </tr>
        <tr>
          <td height="45">&nbsp;</td>
          <td><input type="image" src="images/btnsave.jpg" width="123" height="30" /></td>
        </tr>
      </table>
	  </form>
	  <%end if
	  rs.close:set rs=nothing%>
	  </td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
