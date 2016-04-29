<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="inc/md5.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%webtitle=conn.execute("select sitename from baseset")(0)%>
<title><%=webtitle%></title>
</head>

<body>
<%
if request("action")="login" then
username=request("username")
userpass=request("userpass")
if not isnumeric(request("codes")) then
   response.Write "<script LANGUAGE='javascript'>alert('Verification code error！');history.go(-1);</script>"
   response.end
end if
codes=Cint(request("codes"))
if codes<>session("agennumsys") then
   response.Write "<script LANGUAGE='javascript'>alert('Failure！Verification code error！');history.go(-1);</script>"
   response.end
end if


set rs=server.createobject("adodb.recordset")
sql="select * from webuser where username='"&username&"'"
rs.open sql,conn,3,3
if rs.eof then
response.write "<br><center><font color=red>Username is wrong</font> <a href='default.asp'>Back and login</a>"
elseif md5(userpass)=rs("userpass") then
response.Cookies("userloginname")=trim(rs("username"))
response.Cookies("userdengji")=trim(rs("dengji"))
response.redirect "index.asp"
else
response.write "<br><center><font color=red>Your password is wrong</font> <a href='default.asp'>Back and login</a>"
end if
rs.close
end if
%>
</body>
</html>
