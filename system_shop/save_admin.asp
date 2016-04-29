<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<!--#include file="../inc/md5.asp"-->
<%call chkflag("a1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%action=trim(Request("action"))
aid=trim(Request("aid"))
select case action
case "add"
if trim(request("admin_name"))="" or trim(request("admin_pass"))="" then
response.Write "<script language=javascript>alert('用户名和密码都不能为空!');window.location.href='manage_admin.asp';</script>"
response.end
end if
set rs=server.createobject("adodb.recordset")
    sql="select * From sys_admin"
	rs.open sql,conn,1,3
	rs.addnew
	rs("admin_name")=trim(request("admin_name"))
	rs("admin_pass")=md5(trim(request("admin_pass")))
	rs("flag")=trim(request("flag"))
	rs("zt")=1
rs.update
rs.close:set rs=nothing
response.Redirect("manage_admin.asp")

case "edit"
if trim(request("admin_name"))="" then
response.Write "<script language=javascript>alert('用户名和密码都不能为空!');window.location.href='manage_admin.asp';</script>"
response.end
end if

set rs=server.createobject("adodb.recordset")
    sql="select * From sys_admin where aid="&aid
	rs.open sql,conn,1,3
	rs("admin_name")=trim(request("admin_name"))
	if trim(request("admin_pass"))<>"" then
	rs("admin_pass")=md5(trim(request("admin_pass")))
	end if
rs.update
rs.close:set rs=nothing
response.Redirect("manage_admin.asp")

case "del"
conn.execute("delete from sys_admin where aid="&aid)
response.Redirect("manage_admin.asp")

case "changezt"
sql="select * from sys_admin where aid="&aid
set rs=conn.execute(sql)
if not rs.eof then
zt=rs("zt")
'response.Write(zt)
'response.End()
if zt=False then
conn.execute("update sys_admin set zt=1 where aid="&aid&"")
elseif zt=True then
conn.execute("update sys_admin set zt=0 where aid="&aid&"")
end if
end if
rs.close:set rs=nothing
response.Redirect("manage_admin.asp")

end select
%>	
</body>
</html>
