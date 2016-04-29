<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="inc/md5.asp"-->
<%call usertime_out()%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员保存</title>
</head>

<body>
<%action=srequest(trim(request("action")),0)
select case action
case "editinfo"
sql="select * from webuser where username='"&request.Cookies("userloginname")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("comname")=trim(request("comname"))
rs("linkman")=trim(request("linkman"))
rs("linktel")=trim(request("linktel"))
rs("fax")=trim(request("fax"))
rs("mobile")=trim(request("mobile"))
rs("adds")=trim(request("adds"))
rs("postcode")=trim(request("postcode"))
rs("email")=trim(request("email"))
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('资料编辑成功!');window.location.href='usereditinfo.asp';</script>"


'修改密码
case "user_chkpass"
oldpass=srequest(trim(request("oldpass")),0)
userpass=srequest(trim(request("userpass")),0)
userpass1=srequest(trim(request("userpass1")),0)

sql="select userid,username,userpass from webuser where username='"&request.Cookies("userloginname")&"'"
set rs=conn.execute(sql)
if rs("userpass")<>md5(oldpass) then
response.Write "<script language=javascript>alert('原始密码错误!');window.location.href='usereditpass.asp';</script>"
response.end
else

if userpass<>userpass1 then
response.Write "<script language=javascript>alert('两次输入的密码不一致!');window.location.href='usereditpass.asp';</script>"
response.end
else
conn.execute("update webuser set userpass='"&md5(userpass1)&"' where username='"&request.Cookies("userloginname")&"'") 
'response.Write("update webuser set userpass='"&md5(userpass1)&"' where username='"&request.Cookies("userloginname")&"'")
'response.End()

response.Write "<script language=javascript>alert('您的密码修改成功，建议您重新登陆!');window.location.href='usereditpass.asp';</script>"

end if
end if
rs.close:set rs=nothing

end select
%>
</body>
</html>
