<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%action=trim(Request("action"))
select case action
case "aboutus"
shouming="About Us"
case "contactus"
shouming="Contact Us"
case "tousu"
shouming="Custom Synthesis"
case "yinsi"
shouming="Special Service"

end select

sql="select "&action&" from webhelp"
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,3
  rs(""&action&"")=trim(Request("content"))
  rs.update
  rs.close:set rs=nothing
  response.Write "<script language=javascript>alert('"&shouming&"Editor成功!');window.location.href='help.asp?action="&action&"';</script>"
%>
</body>
</html>
