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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Change</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<%action=srequest(trim(request("action")),0)
if action="add" then
if trim(request("fxydnum"))="" or trim(request("beizhu"))="" then
response.Write "<script language=javascript>alert('带*号的必须填写');window.location.href='userservice_add.asp';</script>"
response.End()
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from services order by serid"
rs.open sql,conn,1,3
rs.addnew
rs("username")=request.Cookies("userloginname")
rs("types")=trim(request("types"))
rs("fxydnum")=trim(request("fxydnum"))
rs("fxydcom")=trim(request("fxydcom"))
rs("beizhu")=trim(request("beizhu"))
rs("fahuoydnum")=trim(request("fahuoydnum"))
rs("addtime")=now()
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('Successfully,we will call you son');window.location.href='userservice.asp';</script>"
end if
%>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; Change </td>
      </tr>
    </table>
	<div class="con_k"></div>
	<form id="forms" name="forms" method="post" action="userservice_add.asp?action=add">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="45" align="right">I want (<span class="STYLE1">*</span>)</td>
        <td>
          <select name="types" id="types">
            <option value="Change">Change</option>
            <option value="Return">Return</option>
          </select>        </td>
      </tr>
      <tr>
        <td height="45" align="right">Return Number(<span class="STYLE1">*</span>)</td>
        <td><input name="fxydnum" type="text" class="input" id="fxydnum" size="50" /></td>
      </tr>
      <tr>
        <td height="45" align="right">Shipping company(<span class="STYLE1">*</span>)</td>
        <td><input name="fxydcom" type="text" class="input" id="fxydcom" size="50" />
          （Please fill in the name of the logistics company）</td>
      </tr>
      <tr>
        <td height="45" align="right">Instructions(<span class="STYLE1">*</span>)</td>
        <td><textarea name="beizhu" cols="60" rows="10" class="textarea" id="beizhu"></textarea></td>
      </tr>
      <tr>
        <td height="45" align="right">Waybill number：</td>
        <td><input name="fahuoydnum" type="text" class="input" id="fahuoydnum" size="50" /> 
          （We'll send your number when well deal） </td>
      </tr>
      <tr>
        <td height="45">&nbsp;</td>
        <td><input type="submit" name="Submit" value="Submit" /></td>
      </tr>
    </table>
	</form>
	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
