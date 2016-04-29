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
fkid=trim(request("fkid"))
select case action
case "add"
if trim(request("fkname"))="" then
response.Write "<script language=javascript>alert('付款方式名称不能为空!');window.location.href='fkfs.asp';</script>"
response.end
end if

sql="select * from tblfkfs"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("fkname")=triM(request("fkname"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("fkfs.asp")

'Editor
case "edit"
sql="select * from tblfkfs where fkid="&fkid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("fkname")=triM(request("fkname"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("fkfs.asp")
'Delete
case "del"

sql="select * from tblfkfs where fkid="&fkid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("fkfs.asp")

end select
%>
</body>
</html>
