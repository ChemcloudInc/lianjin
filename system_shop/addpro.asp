<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("b1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加产品</title>
</head>

<body>
<!-- 三级联动菜单 开始 -->
<script language="JavaScript">
<!--
<%
'二级数据保存到数组
Dim count2,rsClasc2id,sqlClasc2id
set rsClasc2id=server.createobject("adodb.recordset")
sqlClasc2id="select * from pro_small order by smallid" 
rsClasc2id.open sqlClasc2id,conn,1,1
%>
var subval2 = new Array();
//数组结构：一级根值,二级根值,二级显示值
<%
count2 = 0
do while not rsClasc2id.eof
%>
subval2[<%=count2%>] = new Array('<%=rsClasc2id("bigid")%>','<%=rsClasc2id("smallid")%>','<%=rsClasc2id("smallname")%>')
<%
count2 = count2 + 1
rsClasc2id.movenext
loop
rsClasc2id.close
%>

<%
'三级数据保存到数组
Dim count3,rsClass3,sqlClass3
set rsClass3=server.createobject("adodb.recordset")
sqlClass3="select * from class3 order by paixu" 
rsClass3.open sqlClass3,conn,1,1
%>
var subval3 = new Array();
//数组结构：二级根值,三级根值,三级显示值
<%
count3 = 0
do while not rsClass3.eof
%>
subval3[<%=count3%>] = new Array('<%=rsClass3("smallid")%>','<%=rsClass3("c3id")%>','<%=rsClass3("c3name")%>')
<%
count3 = count3 + 1
rsClass3.movenext
loop
rsClass3.close
%>

function changeselect1(locationid)
{
document.form2.smallid.length = 0;
document.form2.smallid.options[0] = new Option('二级分类','');
document.form2.c3id.length = 0;
document.form2.c3id.options[0] = new Option('三级分类','');
for (i=0; i<subval2.length; i++)
{
if (subval2[i][0] == locationid)
{document.form2.smallid.options[document.form2.smallid.length] = new Option(subval2[i][2],subval2[i][1]);}
}
}

function changeselect2(locationid)
{
document.form2.c3id.length = 0;
document.form2.c3id.options[0] = new Option('三级分类','');
for (i=0; i<subval3.length; i++)
{
if (subval3[i][0] == locationid)
{document.form2.c3id.options[document.form2.c3id.length] = new Option(subval3[i][2],subval3[i][1]);}
}
}
//-->
</script>

<%
action=srequest(trim(request("action")),0)
if action="add" then
if trim(request("proname"))="" then
response.Write "<script language=javascript>alert('产品名称不能为空!');window.location.href='addpro.asp';</script>"
response.end
end if
sql="select * from product"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew

rs("proname")=triM(request("proname"))
rs("CatalogNo")=triM(request("CatalogNo"))
rs("CASNo")=triM(request("CASNo"))

if trim(request("bigid"))<>"" then
rs("bigid")=trim(request("bigid"))
else
rs("bigid")=0
end if

if trim(request("smallid"))<>"" then
rs("smallid")=trim(request("smallid"))
else
rs("smallid")=0
end if

if trim(request("c3id"))<>"" then
rs("c3id")=trim(request("c3id"))
else
rs("c3id")=0
end if

if request("cnname")<>"" then
rs("cnname")=triM(request("cnname"))
else
rs("cnname")=triM(request("proname"))
end if

rs("prosmallpic")=triM(request("prosmallpic"))
rs("probigpic")=trim(Request("probigpic"))
rs("Purity")=trim(Request("Purity"))
rs("Formula")=trim(Request("Formula"))
rs("Weight")=trim(Request("Weight"))

if Request("marketprice")<>"" then
rs("marketprice")=Request("marketprice")
rs("Quantity1")=Request("Quantity1")
rs("unit1")=Request("unit1")
end if

if Request("svipprice")<>"" then
rs("svipprice")=Request("svipprice")
rs("Quantity2")=Request("Quantity2")
rs("unit2")=Request("unit2")
end if

if Request("vipprice")<>"" then
rs("vipprice")=Request("vipprice")
rs("Quantity3")=Request("Quantity3")
rs("unit3")=Request("unit3")
end if

if Request("userprice")<>"" then
rs("userprice")=Request("userprice")
rs("Quantity4")=Request("Quantity4")
rs("unit4")=Request("unit4")
end if

rs("Synonyms")=trim(Request("Synonyms"))
rs("addtime")=now()
rs("hits")=0
rs("sflag")=trim(Request("sflag"))

rs.update
rs.close:set rs=nothing
'proid=conn.execute("select top 1 proid from product order by proid desc")(0)
'call cncreateprodet(proid)
'call encreateprodet(proid)
response.Write "<script language=javascript>alert('添加成功!');window.location.href='addpro.asp';</script>"

end if%>

<form name="form2" method="post" action="addpro.asp?action=add">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr>
<td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">添加产品</td>
</tr>
<tr>
<td width="12%" height="25" align="center" bgcolor="#FFFFFF">Product Name：</td>
<td width="88%" bgcolor="#FFFFFF"><input name="proname" type="text" size="50"></td>
</tr>

<tr>
<td height="25" width="12%" align="center" bgcolor="ffffff">Catalog No：</td>
<td bgcolor="ffffff"><input name="CatalogNo" type="text" id="CatalogNo" style="width:300px"></td>
</tr>

<tr>
<td height="25" align="center" bgcolor="ffffff">CAS No：</td>
<td bgcolor="ffffff"><input name="CASNo" type="text" id="CASNo"  style="width:300px"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">List：</td>
<td bgcolor="#FFFFFF"><%
Dim count1,rsClass1,sqlClass1
set rsClass1=server.createobject("adodb.recordset")
sqlClass1="select * from pro_big order by bigid" 
rsClass1.open sqlClass1,conn,1,1%>
<select name="bigid" onChange="changeselect1(this.value)">
<option value="">一级分类</option>
<%count1 = 0
do while not rsClass1.eof
response.write"<option value="&rsClass1("bigid")&">"&rsClass1("bigname")&"</option>"
count1 = count1 + 1
rsClass1.movenext
loop
rsClass1.close%>
</select>

<select name="smallid"onChange="changeselect2(this.value)"> 
<option value="">二级分类</option>
</select>

<select name="c3id"> 
<option value="">三级分类</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">中文名称：</td>
<td bgcolor="#FFFFFF"><input name="cnname" type="text" id="cnname" value="" size="60"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Small Picture：</td>
<td bgcolor="#FFFFFF"><input name="prosmallpic" type="text" id="prosmallpic">
<input name="Submit222" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=prosmallpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Big Picture：</td>
<td bgcolor="#FFFFFF"><input name="probigpic" type="text" id="probigpic">
<input name="Submit22" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=probigpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
</tr>

<tr>
<td height="25" align="center" bgcolor="ffffff">Purity:</td>
<td bgcolor="ffffff"><input name="Purity" type="text" id="Purity"  style="width:300px"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">Molecular Formula:</td>
<td bgcolor="ffffff"><input name="Formula" type="text" id="Formula"  style="width:300px"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">Mol Weight Structure:</td>
<td bgcolor="ffffff"><input name="Weight" type="text" id="Weight"  style="width:300px"></td>
</tr>

<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Price1：</td>
<td bgcolor="#FFFFFF">&nbsp;$<input name="marketprice" type="text" id="marketprice" value="" size="10">
 / <input name="Quantity1" type="text" id="Quantity1"  style="width:30px">
<select name="unit1">
<option value="mg" selected>mg</option>
<option value="g">g</option>
<option value="Kg">Kg</option>
<option value="Ton">Ton</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Price2：</td>
<td bgcolor="#FFFFFF">&nbsp;$<input name="svipprice" type="text" id="svipprice" value="" size="10">
 / <input name="Quantity2" type="text" id="Quantity2"  style="width:30px">
<select name="unit2">
<option value="mg" selected>mg</option>
<option value="g">g</option>
<option value="Kg">Kg</option>
<option value="Ton">Ton</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Price3：</td>
<td bgcolor="#FFFFFF">&nbsp;$<input name="vipprice" type="text" id="vipprice" value="" size="10">
  / <input name="Quantity3" type="text" id="Quantity3"  style="width:30px">
<select name="unit3">
<option value="mg" selected>mg</option>
<option value="g">g</option>
<option value="Kg">Kg</option>
<option value="Ton">Ton</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Price4：</td>
<td bgcolor="#FFFFFF">&nbsp;$<input name="userprice" type="text" id="userprice" value="" size="10">
 /  <input name="Quantity4" type="text" id="Quantity4"  style="width:30px">
<select name="unit4">
<option value="mg" selected>mg</option>
<option value="g">g</option>
<option value="Kg">Kg</option>
<option value="Ton">Ton</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Synonyms：</td>
<td bgcolor="#FFFFFF"> 
<textarea name="Synonyms" id="Synonyms" style="display:none"></textarea>
<iframe src="Edit/editor.htm?id=Synonyms&ReadCookie=0" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" width="621" height="457"></iframe></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#FFFFFF">Home Show： </td>
<td height="25" align="left" bgcolor="#FFFFFF">
<select name="sflag">
<option value="1" selected>Show</option>
<option value="0">No</option>
</select> 
</td>
</tr>
<tr>
<td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
<input name="Submit" type="submit" class="go" value="Submit"></td>
</tr>
</table>
</form>
</body>
</html>
