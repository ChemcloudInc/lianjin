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
<%
proid=srequest(trim(request("proid")),1)
bigid=srequest(trim(request("bigid")),1)
bigname=conn.execute("select * from pro_big where bigid="&bigid&"")("bigname")
smallid=srequest(trim(request("smallid")),1)
smallname=conn.execute("select * from pro_small where smallid="&smallid&"")("smallname")
sqlp="select * from product where proid="&proid
set rsp=conn.execute(sqlp)
if not rsp.eof then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsp("proname")%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>
function $(e){
return document.getElementById(e);
}
function abdc(){
var sl=$('shuliang').value;
sl=parseInt(sl)+1;
$('shuliang').value=sl;
//$('ccc').innerHTML=sl*150;
}
function abdce(){
var sl=$('shuliang').value;
if (sl>0){
sl=parseInt(sl)-1;
}
$('shuliang').value=sl;
//$('ccc').innerHTML=sl*150;
}
</script>
</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="7"><img src="images/wz1.jpg" width="7" height="29" /></td>
<td background="images/wz2.jpg"><font style="font-size:12px">Position：Home &gt; Product > <%=bigname%>> <%=smallname%> > <%=rsp("proname")%></font>
</td>
<td width="5"><img src="images/wz3.jpg" width="5" height="29" /></td>
</tr>
</table>
<div class="web_k" align="center"></div>

<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="250" height="555" align="left" valign="top"><!--#include file="left.asp"--></td>
<td width="950" align="center" valign="top">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="32" background="images/det1.jpg">&nbsp;<font style="font-size:12px"><strong>Catalog No. : </strong> <%=rsp("catalogno")%></font></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="282" height="260" align="center" style="border:1px solid #E9E9E9;"><img src="http://www.chemblink.com/structures/<%=trim(rsp("CASNo"))%>.gif" /></td>
<td width="701">
<form id="form222" name="form222" method="post" action="gouwu.asp?action=add&proid=<%=rsp("proid")%>">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="30" colspan="2" class="font14"><font style="font-size:12px"><strong>Price and Availability</strong></font></td>
</tr>
<tr><td width="82%" height="25" class="font14"><font style="font-size:12px">Product Name：<%=rsp("proname")%></font></td>
<td width="18%" class="font14"><font style="font-size:12px">Weight：<%=rsp("Weight")%></font></td>
</tr>
 
<tr><td height="25" colspan="2" class="font14"> 
<table width="686" border="0" cellpadding="0" cellspacing="1" bgcolor="#F8F5EF">
<tr>
<td width="217" rowspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>CAS No.<%=rsp("CASNo")%></strong></font></td>
<td height="25" colspan="3" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>Availability</strong></font></td>
<td width="92" rowspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>Price (USD)</strong></font></td>
<td width="56" rowspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>Qty**</strong></font></td>
<td width="65" rowspan="2" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>Favorites</strong></font></td>
</tr>

<tr>
<td width="77" height="25" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>USA</strong></font></td>
<td width="83" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>China(1)*</strong></font></td>
<td width="88" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><strong>China(2)*</strong></font></td>
</tr>

<tr>
<td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><%=rsp("catalogno")%>-<%=rsp("quantity1")%><%=rsp("unit1")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">Inquire</font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">$<%=rsp("marketprice")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><input name="price" type="radio" value="<%=rsp("marketprice")%>" checked="checked"  /></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/butt4.jpg" width="14" height="12" /></td>
</tr>
<%if rsp("quantity2")<>"" then%>
<tr>
<td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><%=rsp("catalogno")%>-<%=rsp("quantity2")%><%=rsp("unit2")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">Inquire</td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">$<%=rsp("svipprice")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><input type="radio" name="price" value="<%=rsp("svipprice")%>"  /></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/butt4.jpg" width="14" height="12" /></td>
</tr>
<%end if%>
<%if rsp("quantity3")<>"" then%>
<tr>
<td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><%=rsp("catalogno")%>-<%=rsp("quantity3")%><%=rsp("unit3")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">Inquire</td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">$<%=rsp("vipprice")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><input type="radio" name="price" value="<%=rsp("vipprice")%>"  /></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/butt4.jpg" width="14" height="12" /></td>
</tr>
<%end if%>
<%if rsp("quantity4")<>"" then%>
<tr>
<td height="25" align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px"><%=rsp("catalogno")%>-<%=rsp("quantity4")%><%=rsp("unit4")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">Inquire</font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><a href="mailto:sales@cambridgechemicals.com"><font style="font-size:12px">In Stock</font></a></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><font style="font-size:12px">$<%=rsp("userprice")%></font></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><input type="radio" name="price" value="<%=rsp("userprice")%>"  /></td>
<td align="center" valign="middle" bgcolor="#FFFFFF"><img src="img/butt4.jpg" width="14" height="12" /></td>
</tr>
<%end if%>
</table>


</td></tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="ECD283">
<tr>
<td bgcolor="FEFCE5" class="padall">

<table width="100%" border="0" cellspacing="1" cellpadding="0">
<%sqlb="select * from shuxingtype where proid="&proid&" order by sxid"
set rsb=conn.execute(sqlb)
if not rsb.eof then
q=1
do while not rsb.eof%>
<tr>
<td width="70" height="30" align="right"><%=rsb("sxname")%>：</td>
<td align="left">
<%sqlbb="select * from shuxingvalue where sxid="&rsb("sxid")&" order by vaid"
set rsbb=conn.execute(sqlbb)
if not rsbb.eof then
qq=1
do while not rsbb.eof%>

<%if rsb("xxtype")=true then%>
<input name="vaid<%=q%>" type="checkbox"id="vaid<%=q%>" value="<%=rsbb("valuename")%>"> 
<%=rsbb("valuename")%> 
<%else%>
<input type="radio" name="vaid<%=q%>" <%if qq=1 then%> checked="checked" <%end if%> value="<%=rsbb("valuename")%>"> 
<%=rsbb("valuename")%> 
<%end if%>
<%rsbb.movenext
qq=qq+1
loop
end if
rsbb.close:set rsbb=nothing%></td>
</tr>
<%rsb.movenext
q=q+1
loop
end if
rsb.close:set rsb=nothing%>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="90" height="30" align="right">I want ：</td>
<td width="124"><a href="javascript:abdce();">-</a>
<input id="shuliang" name="shuliang" value="1" size="4" />
<a href="javascript:abdc();" style="font-family:'宋体'">+</a></td>
<td width="441">&nbsp;</td>
</tr>
</table>

</td>
</tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="30" style="line-height:200%;"><font style="font-size:12px">Note*: Items from stock in China(1) in 2-3 days, ship from USA normally. China(2) availability need to be confirmed via email at sales@cambridgechemicals.com.<br />
Note**: Quantity discount: 5-9 (5% off) and 10 or more (10% off) (same item only).</font></td>
</tr>
<tr>
<td height="60" align="right"><!--<img src="images/btnbuy.jpg" width="127" height="39" />-->
  <input type="image" src="images/a17.jpg" width="169" height="39" border="0" /></td>
</tr>
</table>
</form>
</td>
</tr>
</table>
<div class="con_k"></div>
	

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="82"><img src="images/p1.jpg" width="82" height="35" /></td>
<td background="images/p2.jpg">&nbsp;</td>
<td width="9"><img src="images/p3.jpg" width="9" height="35" /></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="border-left:1px solid #D3D3D3; border-right:1px solid #D3D3D3; padding:10px; line-height:200%"><font style="font-size:12px"><%=rsp("Synonyms")%></font></td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><img src="images/p4.jpg" width="950" height="6" /></td>
</tr>
</table>
</td>
</tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
<%end if
rsp.close:set rsp=nothing%>