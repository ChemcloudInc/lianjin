<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑新闻</title>
</head>

<body>
<%
action=trim(request("action"))
newsid=trim(request("newsid"))
if action="edit" then
if trim(request("newstitle"))="" then
response.Write "<script language=javascript>alert('新闻标题不能为空!');window.location.href='editnews.asp?newsid="&newsid&"';</script>"
response.end
end if
sql="select * from news where newsid="&newsid
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

rs("newstitle")=triM(request("newstitle"))
rs("newscontent")=trim(request("newscontent"))
rs("newstype")=triM(request("newstype"))
rs.update
rs.close:set rs=nothing
'call cncreatenewsdet(newsid)
'call encreatenewsdet(newsid)
response.Write "<script language=javascript>alert('编辑成功!');window.location.href='managenews.asp';</script>"
end if
sql="select * from news where newsid="&newsid
set rs=conn.execute(sql)%>
<form name="form1" method="post" action="editnews.asp?action=edit&newsid=<%=newsid%>">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr>
<td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">编辑新闻</td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">新闻标题：</td>
<td bgcolor="ffffff">
<input name="newstitle" type="text" id="newstitle" value="<%=rs("newstitle")%>" size="50"></td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">所属分类：</td>
<td bgcolor="ffffff"><select name="newstype" id="newstype">
<option value="company news" <%if trim(rs("newstype"))="company news" then%>selected<%end if%>>Company news</option>
<option value="Common Problem" <%if trim(rs("newstype"))="Common Problem" then%>selected<%end if%>>Common Problem</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">新闻内容：</td>
<td bgcolor="ffffff"><textarea name="newscontent" style="display:none"><%=rs("newscontent")%></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=newscontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
</tr>
<tr>
<td height="25" colspan="2" align="center" bgcolor="ffffff"><input name="Submit" type="submit" class="go" value="保存"></td>
</tr>
</table>
</form>
</body>
</html>