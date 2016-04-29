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

<%keywords=srequest(trim(request("keywords")),0)
if keywords="" then
response.Write "<script language=javascript>alert('Keywords not allowd empty!');window.location.href='/';</script>"
response.end
end if

sqlp="select proid,proname,prosmallpic,svipprice,vipprice,userprice,marketprice,bigid,smallid,CASNo from product where CASNo like '%"&keywords&"%' order by proid"
set rsp=conn.execute(sqlp)
if not rsp.eof then%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Search</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>
<script type="text/javascript" src="js/jquery.min.js"></script>

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>

<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="555" align="left" valign="top">

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="D7D7D7">
<tr><td height="32" background="images/tt.jpg" bgcolor="#FFFFFF" style="font-size:14px; font-weight:bold; padding-left:10px;">Search</td></tr>
</table>  
<div class="con_k"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%do while not rsp.eof%>
<form id="formk<%=rsp("proid")%>" name="formk<%=rsp("proid")%>" method="post" action="gouwu.asp?action=add&proid=<%=rsp("proid")%>" target="addtocat">
<tr onMouseOver="this.bgColor='#f0f0f0';" onMouseOut="this.bgColor='#FFFFFF';">
<td width="13%" height="100" align="center">
<a href="prodetails.asp?proid=<%=rsp("proid")%>&bigid=<%=rsp("bigid")%>&smallid=<%=rsp("smallid")%>">
<img src="http://www.chemblink.com/structures/<%=trim(rsp("CASNo"))%>.gif" border="0" onload="makesmallpic(this,174,115)"></a></td>
<td width="47%" align="left"><a href="prodetails.asp?proid=<%=rsp("proid")%>&bigid=<%=rsp("bigid")%>&smallid=<%=rsp("smallid")%>"><%=rsp("proname")%></a></td>
<td width="18%" align="center">CAS Number:<%=rsp("CASNo")%></td>
<td width="10%" align="center">Number：<input name="shuliang" type="text" style="width:50px" value="1" /></td>
<td width="12%" align="center"><input type="image" src="images/btncar.jpg" width="127" height="39" border="0" /></td>
</tr>
</form>
<tr><td colspan="5">&nbsp;</td></tr>
<%rsp.movenext
loop%>		
</table>

</td>
</tr>
</table>
<!--#include file="copy.asp"-->
</body>
</html>
<%end if
rsp.close:set rsp=nothing%>
<iframe name="addtocat" src="gouwu.asp?action=show" height="0" width="0"></iframe>