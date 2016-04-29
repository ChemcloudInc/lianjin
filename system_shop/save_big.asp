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
bigid=trim(request("bigid"))
select case action
case "add"
if trim(request("bigname"))="" then
response.Write "<script language=javascript>alert('类别名称不能为空!');window.location.href='big_product.asp';</script>"
response.end
end if

sql="select * from pro_big"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("bigname")=triM(request("bigname"))
	rs("bigpic")=triM(request("bigpic"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("big_product.asp")

'Editor
case "edit"
sql="select * from pro_big where bigid="&bigid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("bigname")=triM(request("bigname"))
	rs("bigpic")=triM(request("bigpic"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("big_product.asp")
'Delete
case "del"
'Delete三级分类
conn.execute("delete from class3 where bigid="&bigid&"")
conn.execute("delete from pro_small where bigid="&bigid&"")

sql="select * from pro_big where bigid="&bigid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("big_product.asp")

end select
%>
</body>
</html>
