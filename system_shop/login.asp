<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<%
if request("action")="login" then
strTemp=trim(request("admin_name"))
If Instr(strTemp,"select%20") or Instr(strTemp,"insert%20") or Instr(strTemp,"delete%20from") or Instr(strTemp,"count(") or Instr(strTemp,"drop%20table") or Instr(strTemp,"update%20") or Instr(strTemp,"truncate%20") or Instr(strTemp,"asc(") or Instr(strTemp,"mid(") or Instr(strTemp,"char(") or Instr(strTemp,"xp_cmdshell") or Instr(strTemp,"exec%20master") or Instr(strTemp,"net%20localgroup%20administrators")  or Instr(strTemp,":") or Instr(strTemp,"net%20user") or Instr(strTemp,"'") or Instr(strTemp,"%20or%20") then
%>		<script language=vbs>
<!--
  msgbox"小样！想干嘛！"
  window.location.href="login.asp" 
-->
</script>
<%response.end
End If
admin_name=replace(strTemp,"'","''")
strTemp=trim(request("admin_pass"))
If Instr(strTemp,"select%20") or Instr(strTemp,"insert%20") or Instr(strTemp,"delete%20from") or Instr(strTemp,"count(") or Instr(strTemp,"drop%20table") or Instr(strTemp,"update%20") or Instr(strTemp,"truncate%20") or Instr(strTemp,"asc(") or Instr(strTemp,"mid(") or Instr(strTemp,"char(") or Instr(strTemp,"xp_cmdshell") or Instr(strTemp,"exec%20master") or Instr(strTemp,"net%20localgroup%20administrators")  or Instr(strTemp,":") or Instr(strTemp,"net%20user") or Instr(strTemp,"'") or Instr(strTemp,"%20or%20") then
%>		<script language=vbs>
<!--
  msgbox"小样！想干嘛！"
  window.location.href="login.asp" 
-->
</script>
<%response.end
End If
admin_name=request("admin_name")
admin_pass=request("admin_pass")
if not isnumeric(request("passcodesys")) then
   response.Write "<script LANGUAGE='javascript'>alert('登录失败！验证码必须是数字，请正确填写！');history.go(-1);</script>"
   response.end
end if
passcodesys=Cint(request("passcodesys"))
if passcodesys<>session("agennumsys") then
   response.Write "<script LANGUAGE='javascript'>alert('登录失败！验证码错误！');history.go(-1);</script>"
   response.end
end if


set rs=server.createobject("adodb.recordset")
sql="select * from sys_admin where admin_name='"&admin_name&"'"
rs.open sql,conn,3,3
if rs.eof then
response.write "<br><center><font color=red>用户名不匹配</font>"
elseif md5(admin_pass)=rs("admin_pass") then
response.Cookies("seomanager")("admin_name")=rs("admin_name")
response.Cookies("userflag")=rs("flag")
response.redirect "index.asp"
else
response.write "<br><center><font color=red>您的密码错误</font>"
end if
rs.close
end if
%>

<html>
<head>
<title>后台管理登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/mt_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #016aa9;
	margin:0px;
}
.STYLE1 {
	color: #000000;
	font-size: 12px;
}
-->
</style>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="219" background="images/login_03.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="53"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="394" height="85" background="images/login_05.gif">&nbsp;</td>
            <td width="206" background="images/login_06.gif">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form id="form1" name="form1" method="post" action="login.asp?action=login">
			  <tr>
                <td width="20%" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
                <td width="57%" height="25"><div align="left">&nbsp;<input name="admin_name" type="text" id="admin_name" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td width="27%" height="25">&nbsp;</td>
              </tr>
              <tr>
                <td height="25"><div align="right"><span class="STYLE1">密码</span></div></td>
                <td height="25"><div align="left">&nbsp;<input name="admin_pass" type="password" id="admin_pass" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                </div></td>
                <td height="25">&nbsp;</td>
              </tr>
              <tr>
                <td height="25" align="right" class="STYLE1">验证码</td>
                <td height="25">&nbsp;<input name="passcodesys" type="text" id="passcodesys" style="width:50px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff" />  <!--#include file="numcode_sys.asp"--></td>
                <td height="25">
                  <input name="image" type="image" src="images/dl.gif" width="49" height="18" border="0" />
                </td>
              </tr>
			  </form>
            </table>
			
			</td>
            <td width="362" background="images/login_07.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="196" background="images/login_08.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>