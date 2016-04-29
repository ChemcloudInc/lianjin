<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
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
<title>List</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; Change </td>
      </tr>
    </table>
	<div class="con_k"></div>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="DEDEDE">
      
      <%set rs=server.createobject("adodb.recordset")
  sql="select * from services where username='"&request.Cookies("userloginname")&"' order by serid desc"
    rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	
      <tr>
        <td height="25" colspan="4" bgcolor="#FFFFFF">Nothing</td>
      </tr>
      <%
	else
      rs.pagesize=10
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page
    
for j=1 to rs.PageSize 
 %>
 		<tr>
        <td height="25" align="left" bgcolor="EEF7FF" style="padding:5px;">【Type】：<%=rs("types")%>　【Return Number】：<%=rs("fxydnum")%>　【Shipping company】：<%=rs("fxydcom")%>　【Add time】：<%=rs("addtime")%>　<a href="userservice_edit.asp?serid=<%=rs("serid")%>" style="color:#FF0000;">[Edit]</a></td>
        </tr>
      <tr align="center">
        <td height="30" align="left" bgcolor="#FFFFFF" class="padall">Explain：<%=rs("beizhu")%></td>
        </tr>
      <%rs.movenext
if rs.eof then exit for
next
%>
      <tr>
        <td height="35" colspan="4" align="center" bgcolor="#FFFFFF"><p align="center">Total records <%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</a> <a href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</a>&nbsp;&nbsp;&nbsp; Turn to page
          <select onChange="window.location='?page='+this.value" name="gopage">
                  <%for x=1 to rs.pagecount%>
                  <option <%if x=page then%>selected<%end if%> value="<%=x%>"><%=x%></option>
                  <%next%>
                </select>
  </p></td>
      </tr>
      <%
end if
rs.close
set rs=nothing

%>
    </table></td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
