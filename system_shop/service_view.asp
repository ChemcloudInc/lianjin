<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑记录</title>
</head>

<body>
<%
action=trim(request("action"))
serid=trim(request("serid"))
if action="edit" then
if trim(request("fahuoydnum"))="" then
response.Write "<script language=javascript>alert('运单编号不能为空!');window.location.href='service_view.asp?serid="&serid&"';</script>"
response.end
end if
sql="select * from services where serid="&serid
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3

rs("fahuoydnum")=trim(request("fahuoydnum"))
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('编辑成功!');window.location.href='userservice.asp';</script>"
end if
%>
<%sql="select * from services where serid="&serid
set rs=conn.execute(sql)
%>
<form name="form1" method="post" action="service_view.asp?action=edit&serid=<%=serid%>">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">查看返修/退换货记录</td>
  </tr>
  <tr>
    <td width="120" height="35" align="right" bgcolor="ffffff">类型：</td>
    <td bgcolor="ffffff">&nbsp;<%=rs("types")%></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="ffffff">返回运单编号：</td>
    <td bgcolor="ffffff">&nbsp;<%=rs("fxydnum")%></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="ffffff">承运企业：</td>
    <td bgcolor="ffffff">&nbsp;<%=rs("fxydcom")%></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="ffffff">返修/退换货说明：</td>
    <td bgcolor="ffffff">&nbsp;<%=rs("beizhu")%></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="ffffff">运单编号：</td>
    <td bgcolor="ffffff">&nbsp;<input name="fahuoydnum" type="text" value="<%=rs("fahuoydnum")%>"></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" bgcolor="ffffff"><input name="Submit" type="submit" class="go" value="保存"></td>
  </tr>
</table>
</form>
</body>
</html>

