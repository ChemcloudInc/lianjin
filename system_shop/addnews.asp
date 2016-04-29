<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("d1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加新闻</title>
</head>
<body>
<%action=trim(request("action"))
if action="add" then
if trim(request("newstitle"))="" then
response.Write "<script language=javascript>alert('标题不能为空!');window.location.href='addnews.asp';</script>"
response.end
end if
sql="select * from news"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
rs("newstitle")=triM(request("newstitle"))
rs("newscontent")=trim(request("newscontent"))
rs("newstype")=triM(request("newstype"))
rs("hits")=0
rs("addtime")=now()
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('添加成功!');window.location.href='addnews.asp';</script>"
end if%>
<form name="form1" method="post" action="addnews.asp?action=add">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr><td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">添加新闻</td></tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">新闻标题：</td>
<td bgcolor="ffffff"><input name="newstitle" type="text" id="newstitle" size="50"></td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">所属分类：</td>
<td bgcolor="ffffff"><select name="newstype" id="newstype">
<option value="company news">Company News</option>
<option value="Common Problem">Common Problem</option>
</select>
</td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">新闻内容：</td>
<td bgcolor="ffffff"><textarea name="newscontent" style="display:none"></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=newscontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe>
</td>
</tr>
<tr>
<td height="25" colspan="2" align="center" bgcolor="ffffff"><input name="Submit" type="submit" class="go" value="保存"></td>
</tr>
</table>
</form>
</body>
</html>