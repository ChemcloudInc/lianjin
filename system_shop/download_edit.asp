<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑下载</title>
</head>

<body>
<%
action=trim(request("action"))
downid=trim(request("downid"))
if action="edit" then
if trim(request("downtitle"))="" then
response.Write "<script language=javascript>alert('下载标题不能为空!');window.location.href='download_edit.asp?downid="&downid&"';</script>"
response.end
end if
sql="select * from download where downid="&downid
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

rs("downtitle")=triM(request("downtitle"))
rs("downcontent")=trim(request("downcontent"))
rs("downtype")=triM(request("downtype"))
rs("downurl")=triM(request("downurl"))
rs("yuyan")=triM(request("yuyan"))
rs("daxiao")=triM(request("daxiao"))

rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('编辑成功!');window.location.href='download_manage.asp';</script>"
end if
sql="select * from download where downid="&downid
set rs=conn.execute(sql)
%>
<form name="form1" method="post" action="download_edit.asp?action=edit&downid=<%=downid%>">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
<tr>
<td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">编辑下载</td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">下载标题：</td>
<td bgcolor="ffffff">
<input name="downtitle" type="text" id="downtitle" value="<%=rs("downtitle")%>" size="50"></td>
</tr>
<tr>
<td width="100" height="25" align="center" bgcolor="ffffff">所属分类：</td>
<td bgcolor="ffffff"><select name="downtype" id="downtype">
<option value="Soft down" <%if trim(rs("downtype"))="Soft down" then%>selected<%end if%>>Soft down</option>
<option value="PDF down" <%if trim(rs("downtype"))="PDF down" then%>selected<%end if%>>PDF down</option>
<option value="Others" <%if trim(rs("downtype"))="Others" then%>selected<%end if%>>Others</option>
</select></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">下载地址：</td>
<td bgcolor="ffffff"><input name="downurl" type="text" id="downurl" value="<%=rs("downurl")%>" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">开发语言：</td>
<td bgcolor="ffffff"><input name="yuyan" type="text" id="yuyan" value="<%=rs("yuyan")%>" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">软件大小：</td>
<td bgcolor="ffffff"><input name="daxiao" type="text" id="daxiao" value="<%=rs("daxiao")%>" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="ffffff">下载内容：</td>
<td bgcolor="ffffff"><textarea name="downcontent" style="display:none"><%=rs("downcontent")%></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=downcontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
</tr>
<tr>
<td height="25" colspan="2" align="center" bgcolor="ffffff"><input name="Submit" type="submit" class="go" value="保存"></td>
</tr>
</table>
</form>
</body>
</html>