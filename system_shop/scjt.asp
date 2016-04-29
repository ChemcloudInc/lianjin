<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#Include file="ad_htmlconfig.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%action=srequest(trim(request("action")),0)
select case action
case "shouye"
call htmll("","","../index.html","../main.asp","","","","")
response.Redirect("jingtai.asp")

case "danye"
call htmll("","","../about.html","../about.asp","","","","")
call htmll("","","../contact.html","../contact.asp","","","","")
call htmll("","","../Service.html","../Service.asp","","","","")
call htmll("","","../custom.html","../custom.asp","","","","")
call htmll("","","../Instrument.html","../Instrument.asp","","","","")

response.Redirect("jingtai.asp")
  
end select
%>
</body>
</html>
