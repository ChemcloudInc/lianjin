
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
smallid=trim(request("smallid"))
select case action
case "add"
if trim(request("smallname"))="" then
response.Write "<script language=javascript>alert('类别名称不能为空!');window.location.href='small_product.asp';</script>"
response.end
end if

sql="select * from pro_small"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("bigid")=bigid
	rs("smallname")=triM(request("smallname"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("small_product.asp?bigid="&bigid)

'Editor
case "edit"
sql="select * from pro_small where smallid="&smallid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("smallname")=triM(request("smallname"))
	rs.update
	rs.close
	set rs=nothing
	response.redirect "small_product.asp?bigid="&bigid

'Delete
case "del"
'Delete对应的三级分类
conn.execute("delete from class3 where smallid="&smallid&"")
sql="select * from pro_small where smallid="&smallid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.redirect "small_product.asp?bigid="&bigid

end select
%>
</body>
</html>
