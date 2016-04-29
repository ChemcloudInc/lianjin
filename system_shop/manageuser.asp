<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("e1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员管理</title>
</head>
<script src="site.js" type="text/javascript"></script>

<body>
<%action=trim(request("action"))
username=trim(request("username"))

%>
<%if trim(request("action"))="del" then
userid=srequest(trim(request("userid")),1)

conn.execute("delete from webuser where userid="&trim(request("userid"))&"")
response.redirect("manageuser.asp")
end if

%>
<form name="form1" method="post" action="manageuser.asp?action=search">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%">&nbsp;</td>
    <td align="center">会员名称：
      
      <input name="username" type="text" id="username">
      <input name="Submit" type="submit" class="go" value="Search">    </td>
    <td width="20%">&nbsp;</td>
  </tr>
</table>
</form>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr align="center">
    <td width="20%" height="25" background="images/titlebg.gif" bgcolor="f0f0f0">会员名</td>
    <td width="13%" background="images/titlebg.gif" bgcolor="f0f0f0">会员等级</td>
    <td width="11%" background="images/titlebg.gif" bgcolor="f0f0f0">联系人</td>
    
    <td width="12%" background="images/titlebg.gif" bgcolor="f0f0f0">联系电话</td>
    <td width="14%" background="images/titlebg.gif" bgcolor="f0f0f0">操作员</td>
    <td width="9%" background="images/titlebg.gif" bgcolor="f0f0f0">Editor</td>
    <td width="13%" background="images/titlebg.gif" bgcolor="f0f0f0">收货地址</td>
    <td width="8%" background="images/titlebg.gif" bgcolor="f0f0f0">Delete</td>
  </tr>
  	 <%
	 select case action
	 case ""
    sql="select * from webuser"
	case "search"
	sql="select * from webuser where 1=1"
	if username<>"" then
	sql=sql & " and username like '%"&username&"%'"
	end if
	end select
	sql=sql & " order by userid desc"
	
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    if rs.eof and rs.bof then 
     %>
  <tr>
    <td height="25" bgcolor="#FFFFFF" colspan="9">暂无会员</td>
  </tr>
  <%
  else
      rs.pagesize=60
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page   
      for j=1 to rs.PageSize 
  %>
  <tr align="center">
    <td height="25" bgcolor="ffffff"><%=rs("username")%></td>
    <td bgcolor="ffffff"><%=rs("dengji")%></td>
    <td bgcolor="ffffff"><%=rs("linkman")%></td>
    <td bgcolor="ffffff"><%=rs("linktel")%></td>
    <td bgcolor="ffffff"><%if rs("caozuoname")<>"" then%><%=rs("caozuoname")%><%else%><font color="#FF0000">未分配操作员</font><%end if%></td>
    <td bgcolor="ffffff"><a href="user_edit.asp?userid=<%=rs("userid")%>">编辑会员信息</a></td>
    <td bgcolor="ffffff"><a href=# onClick="openWithIframe('收货地址管理','useraddr.asp?username=<%=rs("username")%>',600,400);" class="linkurl">管理地址</a></td>
    <td bgcolor="ffffff"><a href="manageuser.asp?action=del&userid=<%=rs("userid")%>" onClick="return confirm('确定Delete该会员吗?')">Delete</a></td>
  </tr>
  	     <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
	  <tr><td height=25 colspan="10" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&username=<%=username%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&username=<%=username%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
          <SELECT onChange="window.location='?action=<%=action%>&username=<%=username%>&page='+this.value" name=gopage>
            <%for x=1 to rs.pagecount%>
            <OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
            <%next%>
          </SELECT>
 </td></tr>
<%
 end if
%>
</table>
</body>
</html>

