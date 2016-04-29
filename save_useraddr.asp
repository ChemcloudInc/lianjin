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
<title>无标题文档</title>
</head>

<body>
<%
action=trim(request("action"))
addrid=trim(request("addrid"))
select case action
case "add"
if trim(request("addr"))="" then
response.Write "<script language=javascript>alert('名称和图片不能为空!');window.location.href='useraddr.asp';</script>"
response.end
end if
sql="select * from useraddr"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("addr")=triM(request("addr"))
	rs("username")=request.Cookies("userloginname")
	rs("firstaddr")=0
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("useraddr.asp")


'修改
case "edit"
sql="select * from useraddr where addrid="&addrid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("addr")=triM(request("addr"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("useraddr.asp")
'删除
case "del"
sql="select * from useraddr where addrid="&addrid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing

	response.Redirect("useraddr.asp")

end select
%>

</body>
</html>
