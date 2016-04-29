<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="function.asp"-->
<!--#include file="config.asp"-->
<%action=srequest(trim(request("action")),0)
if request("bigid")<>"" then
bigid=srequest(trim(request("bigid")),1)
else
bigid=1
end if
bigname=conn.execute("select * from pro_big where bigid="&bigid&"")("bigname")
if trim(request("smallid"))<>"" then
smallid=srequest(trim(request("smallid")),1)
smallname=conn.execute("select * from pro_small where smallid="&smallid&"")("smallname")
end if
if trim(request("c3id"))<>"" then
c3id=srequest(trim(request("c3id")),1)
c3name=conn.execute("select * from class3 where c3id="&c3id&"")("c3name")
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%webtitle=conn.execute("select sitename from baseset")(0)%>
<title><%=webtitle%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>

<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="250" align="left" valign="top"><!--#include file="left.asp"--></td>
<td valign="top" width="950">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="D7D7D7">
<tr>
<td height="32" background="images/tt.jpg" bgcolor="#FFFFFF" style="font-size:14px; font-weight:bold; padding-left:10px;">Products</td>
</tr>
</table>

<div class="con_k"></div>

<!--分开始////////////////////////////////////////////////-->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
<%select case action
case ""
sql="select proid,proname,bigid,smallid,prosmallpic,svipprice,vipprice,userprice,marketprice,cnname,CASNo from product order by proid desc"
case "big"
sql="select proid,proname,bigid,smallid,prosmallpic,svipprice,vipprice,userprice,marketprice,cnname,CASNo from product where bigid="&bigid&" order by proid desc"
case "small"
sql="select proid,proname,bigid,smallid,prosmallpic,svipprice,vipprice,userprice,marketprice,cnname,CASNo from product where smallid="&smallid&" order by proid desc"
case "three"
sql="select proid,proname,bigid,smallid,c3id,prosmallpic,svipprice,vipprice,userprice,marketprice,cnname,CASNo from product where c3id="&c3id&" order by proid desc"
end select
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then%>
<tr><td height="25" colspan="3">Nothing</td>
</tr>
<%else
rs.pagesize=50
page = cint(request("page"))
if page = "" then page = 1
if not(isnumeric(page)) then page=1
if page<1 then page=1
if page >= rs.pagecount then page = rs.pagecount
rs.absolutepage = page%>
<tr>
<%for j=1 to rs.PageSize%>
<td align="center" width="20%" style="padding::5px;">
<%'插入整体部分开始//////////////////%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="center">
<table width="180" height="125" border="0" cellpadding="0" cellspacing="1" bgcolor="D3D3D3">
<tr>
<td align="center" bgcolor="#FFFFFF"><a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=rs("bigid")%>&smallid=<%=rs("smallid")%>" target="_blank"><img src="http://www.chemblink.com/structures/<%=trim(rs("CASNo"))%>.gif" border="0" onload="makesmallpic(this,174,115)"></a></td>
</tr>
</table>


</td>
</tr>
<tr>
<td height="25" align="center">
<a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=rs("bigid")%>&smallid=<%=rs("smallid")%>" target="_blank">
<%if len(trim(rsr1("proname")))>28 then%>
<%=left(trim(rsr1("proname")),28)%>
<%else%>
<%=trim(rsr1("proname"))%>
<%end if%>
</a></td>
</tr>
<tr>
<td align="center"><table width="190" border="0" cellpadding="0" cellspacing="0">
<tr>
<td height="33" align="center">CAS Number:<%=rs("CASNo")%></td>
</tr>
<tr>
<td height="44" align="center"><a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=rs("bigid")%>&smallid=<%=rs("smallid")%>" target="_blank"><img src="images/index_106.jpg" border="0"></a></td>
</tr>
</table></td>
</tr>
</table>
<%'插入整体部分结束//////////////////%>
</td>
<%if (j mod 5)=0 then%>
</tr>
<%end if
rs.movenext
if rs.eof then exit for
next
end if%>
<%'分开始//////////////////////////%>
<tr><td colspan="4">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td height="10"></td></tr>
<tr><td align="center" height="30">Total records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&bigid=<%=bigid%>&smallid=<%=smallid%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&bigid=<%=bigid%>&smallid=<%=smallid%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
<SELECT onChange="window.location='?action=<%=action%>&bigid=<%=bigid%>&smallid=<%=smallid%>&page='+this.value" name=select>
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>
</SELECT>
</td>
</tr></table>
</td></tr>
<%'分结束////////////////%>
</table>

<!--分结束-->

</td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>