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
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>My orders</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<script src="inc/calendar.js" type="text/javascript"></script>
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
<td height="34" background="images/user6.jpg" class="padleft">Position：Home &gt; User &gt; My orders </td>
</tr>
</table>
<div class="con_k"></div>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
 if(checkspace(document.form1.ordernum.value)) {

alert("Sorry ,Please input order number！");
document.form1.ordernum.focus();
return false;
}

}
function checkspace(checkstr) {
var str = '';
for(i = 0; i < checkstr.length; i++) {
str = str + ' ';
}
return (str == checkstr);
}

//-->
</script>
<%ordernum=trim(request("ordernum"))
action=trim(request("action"))

'riqi=CONVERT(varchar(100), addtime, 23)

qsrq=year(trim(request("qsrq")))&"-"&month(trim(request("qsrq")))&"-"&day(trim(request("qsrq")))
jsrq=year(trim(request("jsrq")))&"-"&month(trim(request("jsrq")))&"-"&day(trim(request("jsrq")))
tomorrow=DateAdd("d",1,jsrq) 
paixu=trim(request("paixu"))
if paixu="" then
paixu="desc"
else
paixu="asc"
end if
%>
<%if qsrq<>"" then%>
Begin：<%=qsrq%>
<%end if%>
<%if jsrq<>"" then%>
End：<%=jsrq%>
<%end if%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>

<td align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="40">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<form name="form1" method="post" action="userindex.asp?action=search">
<tr align="center">
<td width="14%" height="25" align="right">Order Number ：</td>
<td width="23%">
<input name="ordernum" type="text" size="25" class="input2"></td>
<td width="9%">Begin：</td>
<td width="16%"><input name="qsrq" type="text" class="input" id="qsrq"onClick="new Calendar().show(this.form.qsrq);" size="15"></td>
<td width="11%">End：</td>
<td width="20%"><input name="jsrq" type="text" class="input" id="jsrq"onclick="new Calendar().show(this.form.jsrq);" size="15" /></td>
<td width="7%" align="left"><input type="submit" name="Submit" value="Search" onClick="return checkform();" /></td>
</tr>
<tr>
<td height="25" colspan="7" align="center"><span style="color: #FF0000">Input order number</span></td>
</tr>
</form>
</table></td>
</tr>
</table></td>
</tr>
<tr>
<td align="center">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="DEDEDE">
<tr>
<td width="20%" height="25" align="center" bgcolor="EEF7FF"><b>Order Number</b></td>
<td width="8%" align="center" bgcolor="EEF7FF"><strong>State</strong></td>
<td width="40%" align="center" bgcolor="EEF7FF"><b>CASNo</b></td>

<td width="9%" align="center" bgcolor="EEF7FF"><b>Total</b></td>
<td width="9%" align="center" bgcolor="EEF7FF"><b>Order date</b></td>
<td width="8%" align="center" bgcolor="EEF7FF"><b>Operation</b></td>
<td width="6%" align="center" bgcolor="EEF7FF">Go Pay</td>
</tr>
 <%
set rs=server.createobject("adodb.recordset")
if action="search" then
sql="select distinct ordernum,username,fkfs,shfs,receive_name,addtime,zhuangtai,orderflag,zonge from orders where orderflag=1 and username='"&request.Cookies("userloginname")&"'"

if ordernum<>"" then
sql=sql & " and ordernum like '"&ordernum&"'"
else

if qsrq<>"" and jsrq<>""  then 
sql=sql & " and addtime >= '"&qsrq&"' and addtime<= '"&tomorrow&"' "
else
if qsrq<>"" then
sql=sql & " and addtime >= '"&qsrq&"'"

end if
if jsrq<>"" then
sql=sql & " and addtime >= '"&tomorrow&"'"
end if
'response.Write(sql)
'response.End()
end if
end if

sql = sql & " order by addtime "&paixu&""
else
sql="select distinct ordernum,username,fkfs,shfs,receive_name,addtime,zhuangtai,orderflag,zonge,proid from orders where orderflag=1 and username='"&request.Cookies("userloginname")&"' order by zhuangtai desc,fkfs asc, addtime "&paixu&""
'sql="select distinct a.ordernum,a.proid,a.shuliang,a.danjia,a.zonge,a.zhuangtai,a.beizhu,b.proid,b.proname,a.shuxing from orders a,product b where a.ordernum='"&ordernum&"' and a.proid=b.proid"

end if
rs.open sql,conn,1,1
if rs.eof and rs.bof then%>
<tr>
  <td height="25" colspan="11" bgcolor="#FFFFFF">Nothing</td>
</tr>
<%
else
rs.pagesize=18
page = cint(request("page"))
if page = "" then page = 1
if not(isnumeric(page)) then page=1
if page<1 then page=1
if page >= rs.pagecount then page = rs.pagecount
rs.absolutepage = page

for j=1 to rs.PageSize 
'if (j mod 2)<>0 then
'color="ffffff"
'else
'color="f0f0f0"
'end if
 %>

<tr align="center">
<td height="30" bgcolor="#FFFFFF"><a href="view_order.asp?ordernum=<%=rs("ordernum")%>" style="text-decoration:underline; color:#0000FF" target="_blank"><%=rs("ordernum")%></a></td>
<td height="30" bgcolor="#FFFFFF"><%=rs("zhuangtai")%></td>
<td bgcolor="#FFFFFF">
<%CASNo=conn.execute("select proid,CASNo from product where proid="&rs("proid")&"")(1)%>

<%=CASNo%></td>

<td bgcolor="#FFFFFF">$<%=rs("zonge")%></td>
<td bgcolor="#FFFFFF"><%=year(rs("addtime"))&"-"&month(rs("addtime"))&"-"&day(rs("addtime"))%></td>
<td bgcolor="#FFFFFF">
<%if rs("zhuangtai")="Unpai" then%><a href="save_order.asp?action=delxd&ordernum=<%=rs("ordernum")%>">Delete</a>
<%else%><font color="ff0000">No authority</font>
<%end if%>
</td>
<td bgcolor="#FFFFFF"><a href="view_order.asp?ordernum=<%=rs("ordernum")%>" style="text-decoration:underline; color:#0000FF" target="_blank">Go Pay</a></td>
</tr>
<%rs.movenext
if rs.eof then exit for
next%>

<%if request("ordernum")<>"" then%>
<tr>
<td height="35" colspan="11" align="center" bgcolor="#FFFFFF"> 
Total Records <%=rs.recordcount%>&nbsp; 
<%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;

<A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&ordernum=<%=ordernum%>">Privet</A> 
<A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&ordernum=<%=ordernum%>">Next</A>&nbsp;&nbsp;&nbsp; 
Turn to page <SELECT onChange="window.location='?action=<%=action%>&ordernum=<%=ordernum%>&page='+this.value" name=gopage>
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>
</SELECT> 
</td>
</tr>
<%else%>
<tr>
<td height="35" colspan="11" align="center" bgcolor="#FFFFFF"> 
Total Records<%=rs.recordcount%>&nbsp; 
<%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;
<A href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</A> 
<A href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</A>&nbsp;&nbsp;&nbsp; 
Turn to page <SELECT onChange="window.location='?page='+this.value" name=gopage>
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>
</SELECT> 
</td>
</tr>

<%end if%>

<%end if
rs.close
set rs=nothing%> 

</table>
</td>
</tr>
</table></td>
</tr>
</table>

</td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>