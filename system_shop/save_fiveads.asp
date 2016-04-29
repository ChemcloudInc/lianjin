<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>保存广告</title>
</head>

<body>
<%
action=trim(request("action"))
adsid=trim(request("adsid"))
select case action
case "add"
if trim(request("adspic"))="" then
response.Write "<script language=javascript>alert('标题和图片不能为空!');window.location.href='fiveads.asp';</script>"
response.end
end if

sql="select * from FZtopAds"
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs.addnew
	rs("adslink")=triM(request("adslink"))
	rs("paixu")=triM(request("paixu"))
	rs("adspic")=triM(request("adspic"))
	rs.update
	rs.close
	set rs=nothing
	response.Redirect("fiveads.asp?fzid="&fzid)

'Editor
case "edit"
sql="select * from FZtopAds where adsid="&adsid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("adslink")=triM(request("adslink"))
	rs("paixu")=triM(request("paixu"))
	rs("adspic")=triM(request("adspic"))
	rs.update
	rs.close
	set rs=nothing
	response.redirect "fiveads.asp?fzid="&fzid

'Delete
case "del"

sql="select * from FZtopAds where adsid="&adsid
    set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
    rs.delete
	rs.update
	rs.close
	set rs=nothing
	response.redirect "fiveads.asp?fzid="&fzid

end select
%>
</body>
</html>
