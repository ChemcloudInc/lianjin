<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("c1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员管理</title>
</head>
<script src="site.js" type="text/javascript"></script>

<body>
<%action=trim(request("action"))
casno=trim(request("casno"))

%>
<%if trim(request("action"))="del" then
did=srequest(trim(request("did")),1)

conn.execute("delete from synthesis where did="&trim(request("did"))&"")
response.redirect("synthesis.asp")
end if

%>
<form name="form1" method="post" action="synthesis.asp?action=search">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%">&nbsp;</td>
    <td align="center">定制合成：
      
      <input name="casno" type="text" id="casno">
      <input name="Submit" type="submit" class="go" value="Search">    </td>
    <td width="20%">&nbsp;</td>
  </tr>
</table>
</form>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr align="center">
    <td width="20%" height="25" background="images/titlebg.gif" bgcolor="f0f0f0">Product name </td>
    <td width="13%" background="images/titlebg.gif" bgcolor="f0f0f0">CAS Number </td>
    <td width="11%" background="images/titlebg.gif" bgcolor="f0f0f0">Quantity </td>
    
    <td width="12%" background="images/titlebg.gif" bgcolor="f0f0f0">Purity </td>
    <td width="14%" background="images/titlebg.gif" bgcolor="f0f0f0">Addtime</td>
    <td width="9%" background="images/titlebg.gif" bgcolor="f0f0f0">Emai</td>
    <td width="13%" background="images/titlebg.gif" bgcolor="f0f0f0">Edit</td>
    <td width="8%" background="images/titlebg.gif" bgcolor="f0f0f0">Delete</td>
  </tr>
  	 <%
	 select case action
	 case ""
    sql="select * from synthesis where flag=0"
	case "search"
	sql="select * from synthesis where flag=0"
	if proname<>"" then
	sql=sql & " and casno like '%"&casno&"%'"
	end if
	end select
	sql=sql & " order by did desc"
	
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    if rs.eof and rs.bof then 
     %>
  <tr>
    <td height="25" bgcolor="#FFFFFF" colspan="9">Noting now</td>
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
    <td height="25" bgcolor="ffffff"><%=rs("proname")%></td>
    <td bgcolor="ffffff"><%=rs("casno")%></td>
    <td bgcolor="ffffff"><%=rs("quantity")%></td>
    <td bgcolor="ffffff"><%=rs("purity")%></td>
    <td bgcolor="ffffff"><%=rs("addtime")%></td>
    <td bgcolor="ffffff"><%=rs("email")%></td>
    <td bgcolor="ffffff"><a href="synthesis_edit.asp?did=<%=rs("did")%>">Ddit</a></td>
    <td bgcolor="ffffff"><a href="synthesis.asp?action=del&did=<%=rs("did")%>" onClick="return confirm('Are sure delete this info?')">Delete</a></td>
  </tr>
  	     <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
	  <tr><td height=25 colspan="10" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&proname=<%=proname%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&casno=<%=casno%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
          <SELECT onChange="window.location='?action=<%=action%>&proname=<%=proname%>&page='+this.value" name=gopage>
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

