<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("b1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理商品</title>
</head>

<body>
<%action=trim(request("action"))
proname=trim(request("proname"))
if trim(request("action"))="del" then
proid=srequest(trim(request("proid")),1)
'filepath="/cn/html/prodetails"&proid&".html"
'call deletefile(filepath)
'filepath="/en/html/prodetails"&proid&".html"
'call deletefile(filepath)

conn.execute("delete from product where proid="&trim(request("proid"))&"")
response.redirect("managepro.asp")
end if%>
<form name="form1" method="post" action="managepro.asp?action=search">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="20%">&nbsp;</td>
<td align="center">产品名称：

<input name="proname" type="text" id="proname"> 
<%set rs=server.CreateObject("adodb.recordset")
rs.open "select * from pro_big order by bigid",conn,1,1
if rs.eof and rs.bof then
response.write "请先添加商品分类。"
response.end
else
%>大类：
 <select name="bigid" size="1" id="bigid">
<option selected value="">请选择</option>
 <option value="<%=rs("bigid")%>"><%=trim(rs("bigname"))%></option>
 <%dim selclass
 selclass=rs("bigid")
rs.movenext
do while not rs.eof%>
<option value="<%=rs("bigid")%>"><%=trim(rs("bigname"))%></option>
<%rs.movenext
loop
end if
rs.close%>
</select>
<input name="Submit" type="submit" class="go" value="Search"></td>
<td width="20%">&nbsp;</td>
</tr>
</table>
</form>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr align="center">
<td width="5%" height="25" background="images/titlebg.gif" bgcolor="f0f0f0">ＩＤ</td>
<td width="23%" background="images/titlebg.gif" bgcolor="f0f0f0">Product Name </td>
<td width="18%" background="images/titlebg.gif" bgcolor="f0f0f0">CAR No </td>
<td width="21%" background="images/titlebg.gif" bgcolor="f0f0f0">Weight</td>

<td width="11%" background="images/titlebg.gif" bgcolor="f0f0f0">Home Show </td>
<td width="10%" background="images/titlebg.gif" bgcolor="f0f0f0">属性管理</td>
<td width="5%" background="images/titlebg.gif" bgcolor="f0f0f0">Editor</td>
<td width="7%" background="images/titlebg.gif" bgcolor="f0f0f0">Delete</td>
</tr>
<%select case action
case ""
sql="select * from product"
case "search"
sql="select * from product where 1=1"
if proname<>"" then
sql=sql & " and proname like '%"&proname&"%' or cnname like '%"&proname&"%'"
end if
if trim(request("bigid"))<>"" then
bigid=srequest(trim(request("bigid")),1)
sql=sql & " and bigid="&bigid&""
end if
end select
sql=sql & " order by proid desc"

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then%>
<tr>
<td height="25" bgcolor="#FFFFFF" colspan="9">暂无产品</td>
</tr>
<%else
rs.pagesize=50
page = cint(request("page"))
if page = "" then page = 1
if not(isnumeric(page)) then page=1
if page<1 then page=1
if page >= rs.pagecount then page = rs.pagecount
rs.absolutepage = page 
for j=1 to rs.PageSize %>
<tr align="center">
<td height="25" bgcolor="ffffff"><%=rs("proid")%></td>
<td align="left" bgcolor="ffffff"><a href="editpro.asp?proid=<%=rs("proid")%>"><%=rs("proname")%></a></td>
<td align="left" bgcolor="ffffff"><%=rs("CASNo")%></td>
<td bgcolor="ffffff"><%=rs("Weight")%></td>

<td bgcolor="ffffff">
<%if rs("sflag")=1 then%><font color="#FF0000">Show</font><%else%>No<%end if%>
</td>
<td bgcolor="ffffff"><a href="manageshuxing.asp?proid=<%=rs("proid")%>">属性名称</a> <a href="manageshuxingvalue.asp?proid=<%=rs("proid")%>">属性值</a> </td>
<td bgcolor="ffffff"><a href="editpro.asp?proid=<%=rs("proid")%>">Editor</a></td>
<td bgcolor="ffffff"><a href="managepro.asp?action=del&proid=<%=rs("proid")%>" onClick="return confirm('确定Delete该产品吗?')">Delete</a></td>
</tr>
<%rs.movenext
if rs.eof then exit for
next%>
<tr><td height=25 colspan="10" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&proname=<%=proname%>&bigid=<%=bigid%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&proname=<%=proname%>&bigid=<%=bigid%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
<SELECT onChange="window.location='?action=<%=action%>&proname=<%=proname%>&bigid=<%=bigid%>&page='+this.value" name=gopage>
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>
</SELECT>
</td></tr>
<%end if%>
</table>
</body>
</html>