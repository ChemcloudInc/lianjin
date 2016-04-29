<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>收货地址管理</title>
</head>

<body>
<%username=srequest(trim(request("username")),0)%>

<%action=srequest(trim(request("action")),0)
if action="edit" then
addrid=srequest(trim(request("addrid")),1)
sql="select * from useraddr order by addrid"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("addr")=trim(request("addr"))
if request("firstaddr")=1 then
conn.execute("update useraddr set firstaddr=0 where username='"&username&"'")
rs("firstaddr")=1
end if
rs.update
rs.close:set rs=nothing
response.Redirect("useraddr.asp?username="&username&"")
end if
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td height="25" align="center" bgcolor="f0f0f0">会员名</td>
    <td align="center" bgcolor="f0f0f0">地址</td>
    <td align="center" bgcolor="f0f0f0">是否默认地址</td>
  </tr>
  <%sql="select * from useraddr where username='"&username&"' order by addrid"
  set rs=conn.execute(sql)
  if not rs.eof then
  do while not rs.eof%>
  <form id="form<%=rs("addrid")%>" name="form1" method="post" action="useraddr.asp?action=edit&addrid=<%=rs("addrid")%>&username=<%=username%>">
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF"><%=rs("username")%></td>
    <td align="center" bgcolor="#FFFFFF">
      <input name="addr" type="text" id="addr" value="<%=rs("addr")%>" size="55" />
    </td>
	
    <td align="center" bgcolor="#FFFFFF">
      <select name="firstaddr" id="firstaddr">
        <option value="1" <%if rs("firstaddr")=true then%>selected<%end if%>>是</option>
        <option value="0" <%if rs("firstaddr")=false then%>selected<%end if%>>否</option>
      </select>
      <input type="submit" name="Submit" value="更改" />
    
    </td>
  </tr>
  </form>
  
  <%rs.movenext
  loop
  end if
  rs.close:set rs=nothing%>
</table>
</body>
</html>
