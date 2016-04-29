<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("f1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加下载</title>
</head>

<body>
<%
action=trim(request("action"))
if action="add" then
if trim(request("downtitle"))="" then
response.Write "<script language=javascript>alert('标题不能为空!');window.location.href='download_add.asp';</script>"
response.end
end if
sql="select * from download"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
rs("downtitle")=triM(request("downtitle"))
rs("downcontent")=trim(request("downcontent"))
rs("downtype")=triM(request("downtype"))
rs("downurl")=triM(request("downurl"))
rs("yuyan")=triM(request("yuyan"))
rs("daxiao")=triM(request("daxiao"))

rs("hits")=0
rs("addtime")=now()
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('添加成功!');window.location.href='download_add.asp';</script>"
end if
%>
<form name="form1" method="post" action="download_add.asp?action=add">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr>
<td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">添加下载</td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">下载标题：</td>
<td bgcolor="ffffff">
<input name="downtitle" type="text" id="downtitle" size="50"></td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">所属分类：</td>
<td bgcolor="ffffff"><select name="downtype" id="downtype">
<option value="Soft down">Soft down</option>
<option value="PDF down">PDF down</option>
<option value="Others">Others</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">下载地址：</td>
<td bgcolor="ffffff"><input name="downurl" type="text" id="downurl" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">开发语言：</td>
<td bgcolor="ffffff"><input name="yuyan" type="text" id="yuyan" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">软件大小：</td>
<td bgcolor="ffffff"><input name="daxiao" type="text" id="daxiao" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">下载内容：</td>
<td bgcolor="ffffff"><textarea name="downcontent" style="display:none"></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=downcontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
</tr>
<tr>
<td height="25" colspan="2" align="center" bgcolor="ffffff"><input name="Submit" type="submit" class="go" value="保存"></td>
</tr>
</table>
</form>
</body>
</html>

