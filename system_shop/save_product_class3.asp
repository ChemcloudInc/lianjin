<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>保存三级分类</title>
</head>

<body>
<%
action=trim(request("action"))
smallid=trim(request("smallid"))
c3id=trim(request("c3id"))
select case action
case "add"
if trim(request("c3name"))="" then
response.Write "<script language=javascript>alert('类别名称不能为空!');window.location.href='product_class3.asp';</script>"
response.end
end if

sql="select * from class3"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("bigid")=conn.execute("select bigid,smallid from pro_small where smallid="&smallid&"")(0)
	rs("smallid")=smallid
	rs("c3name")=triM(request("c3name"))
	rs("paixu")=triM(request("paixu"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("product_class3.asp?smallid="&smallid)

'Editor
case "edit"
sql="select * from class3 where c3id="&c3id
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("c3name")=triM(request("c3name"))
	rs("paixu")=triM(request("paixu"))
	rs.update
	rs.close
	set rs=nothing
	response.redirect "product_class3.asp?smallid="&smallid

'Delete
case "del"

sql="select * from class3 where c3id="&c3id
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.redirect "product_class3.asp?smallid="&smallid

end select
%>
</body>
</html>
