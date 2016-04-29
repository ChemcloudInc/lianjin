<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
action=trim(request("action"))
proid=trim(request("proid"))

select case action
case "add"
if trim(request("sxname"))="" then
response.Write "<script language=javascript>alert('属性名称不能为空!');window.location.href='manageshuxing.asp';</script>"
response.end
end if

sql="select * from shuxingtype"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("sxname")=triM(request("sxname"))
	rs("proid")=proid
	rs("xxtype")=triM(request("xxtype"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxing.asp?proid="&proid&"")

'Editor
case "edit"
sxid=trim(request("sxid"))
sql="select * from shuxingtype where sxid="&sxid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("sxname")=triM(request("sxname"))
	rs("xxtype")=triM(request("xxtype"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxing.asp?proid="&proid&"")
'Delete
case "del"
sxid=trim(request("sxid"))
sql="select * from shuxingtype where sxid="&sxid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxing.asp?proid="&proid&"")

'以下是属性值管理////////////////////////////////////////////////////////////////
case "addvalue"
if trim(request("sxid"))="" then
response.Write "<script language=javascript>alert('请先添加属性名称!');window.location.href='manageshuxingvalue.asp?proid="&proid&"';</script>"
response.end
end if
if trim(request("valuename"))="" then
response.Write "<script language=javascript>alert('属性值不能为空!');window.location.href='manageshuxingvalue.asp?proid="&proid&"';</script>"
response.end
end if

sql="select * from shuxingvalue"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("valuename")=triM(request("valuename"))
	rs("proid")=proid
	rs("sxid")=triM(request("sxid"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxingvalue.asp?proid="&proid&"")

'Editor
case "editvalue"
vaid=trim(request("vaid"))
sql="select * from shuxingvalue where [vaid] = " & vaid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("valuename")=triM(request("valuename"))
	rs("sxid")=triM(request("sxid"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxingvalue.asp?proid="&proid&"")
'Delete
case "delvalue"
vaid=trim(request("vaid"))
sql="select * from shuxingvalue where vaid = " & vaid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("manageshuxingvalue.asp?proid="&proid&"")
end select
%>
</body>
</html>
