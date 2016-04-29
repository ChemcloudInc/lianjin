<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a1")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>权限设置</title>
</head>
<body>
<%aid=srequest(trim(request("aid")),1)
action=srequest(trim(request("action")),0)
if action="edit" then
sql1="select * from sys_admin where aid="&aid
set rs1=server.CreateObject("adodb.recordset")
rs1.open sql1,conn,1,3
rs1("flag")=trim(request("flag"))
rs1.update
rs1.close:set rs1=nothing
response.Redirect("updateflag.asp?aid="&aid&"")
end if

sql="select * from sys_admin where aid="&aid
set rs=conn.execute(sql)
if not rs.eof then%>
<form action="updateflag.asp?action=edit&aid=<%=aid%>" method="post">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<td width="100" height="30" align="center" bgcolor="f0f0f0">系统管理员</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="a1" <%if instr(rs("flag"),"a1")<>0 then%>checked<%end if%>> 管理员设置
<input name="flag" type="checkbox" id="flag" value="a2" <%if instr(rs("flag"),"a2")<>0 then%>checked<%end if%>> 基本信息设置
</td>
</tr>
<tr>
<td height="30" align="center" bgcolor="f0f0f0">商品管理</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="b1" <%if instr(rs("flag"),"b1")<>0 then%>checked<%end if%> /> 商品管理 
</td>
</tr>
<tr>
<td height="30" align="center" bgcolor="f0f0f0">定制合成</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="c1" <%if instr(rs("flag"),"c1")<>0 then%>checked<%end if%> /> 定制合成
</td>
</tr>
<tr>
<td height="30" align="center" bgcolor="f0f0f0">新闻管理</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="d1" <%if instr(rs("flag"),"d1")<>0 then%>checked<%end if%> /> 新闻管理
</td>
</tr>

<tr>
<td height="30" align="center" bgcolor="f0f0f0">会员管理</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="e1" <%if instr(rs("flag"),"e1")<>0 then%>checked<%end if%> /> 会员管理
</td>
</tr>

<tr>
<td height="30" align="center" bgcolor="f0f0f0">下载管理</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="f1" <%if instr(rs("flag"),"f1")<>0 then%>checked<%end if%> /> 下载管理
</td>
</tr>

<tr>
<td height="30" align="center" bgcolor="f0f0f0">订单管理</td>
<td bgcolor="#FFFFFF">
<input name="flag" type="checkbox" id="flag" value="h1" <%if instr(rs("flag"),"h1")<>0 then%>checked<%end if%> /> 订单管理
</td>
</tr>
<tr>
<td height="30" align="center" bgcolor="f0f0f0">&nbsp;</td>
<td bgcolor="#FFFFFF"><input name="Submit" type="submit" class="go" value="提交" /></td>
</tr>
</table>
</form>
<%end if
rs.close:set rs=nothing%>
</body>
</html>