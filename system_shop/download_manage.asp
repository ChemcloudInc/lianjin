<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("f1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理下载</title>
</head>

<body>
<%if trim(request("action"))="del" then
downid=srequest(trim(request("downid")),1)
conn.execute("delete from downloads where downid="&downid&"")
response.redirect("download_manage.asp")
end if%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr align="center">
<td height="25" background="images/titlebg.gif" bgcolor="f0f0f0">ＩＤ</td>
<td background="images/titlebg.gif" bgcolor="f0f0f0">下载标题</td>
<td background="images/titlebg.gif" bgcolor="f0f0f0">所属类别</td>
<td background="images/titlebg.gif" bgcolor="f0f0f0">Editor</td>
<td background="images/titlebg.gif" bgcolor="f0f0f0">Delete</td>
</tr>
<%sql="select * from downloads order by downid desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then 
 %>
<tr>
<td height="25" bgcolor="#FFFFFF" colspan="5">暂无下载</td>
</tr>
<%else
rs.pagesize=18
page = cint(request("page"))
if page = "" then page = 1
if not(isnumeric(page)) then page=1
if page<1 then page=1
if page >= rs.pagecount then page = rs.pagecount
rs.absolutepage = page 
for j=1 to rs.PageSize %>
<tr align="center">
<td height="25" bgcolor="ffffff"><%=rs("downid")%></td>
<td bgcolor="ffffff"><a href="download_edit.asp?downid=<%=rs("downid")%>"><%=rs("downtitle")%></a></td>
<td bgcolor="ffffff"><%=rs("downtype")%></td>
<td bgcolor="ffffff"><a href="download_edit.asp?downid=<%=rs("downid")%>">Editor</a></td>
<td bgcolor="ffffff"><a href="download_manage.asp?action=del&downid=<%=rs("downid")%>" onClick="return confirm('确定Delete该下载吗?')">Delete</a></td>
</tr>
<%rs.movenext
if rs.eof then exit for
next%>
<tr><td height=25 colspan="6" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
<SELECT onChange="window.location='?page='+this.value" name=gopage>
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>
</SELECT>
</td></tr>
<%end if%>
</table>
</body>
</html>