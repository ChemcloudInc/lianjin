<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>返修/退换货</title>
</head>

<body>
<%if trim(request("action"))="del" then
serid=srequest(trim(request("serid")),1)
conn.execute("delete from services where serid="&serid&"")
response.redirect("userservice.asp")
end if
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  	 <%
    sql="select * from services order by serid desc"
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    if rs.eof and rs.bof then 
     %>
  <tr>
    <td height="25" bgcolor="#FFFFFF">暂无返修/退换货记录</td>
  </tr>
  <%
  else
      rs.pagesize=15
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page   
      for j=1 to rs.PageSize 
  %>
    <tr align="center">
    <td height="25" align="left" bgcolor="CBDDE7">【类型】：<%=rs("types")%>　【运单编号】：<%=rs("fxydnum")%>　【承运企业】：<%=rs("fxydcom")%>　【提交时间】：<%=rs("addtime")%>　<a href="service_view.asp?serid=<%=rs("serid")%>" style="color:#FF0000;">[编辑]</a></td>
  </tr>

  <tr align="center">
    <td height="25" align="left" bgcolor="#FFFFFF" style="padding:5px;">说明：<%=rs("beizhu")%></td>
  </tr>
  	     <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
	  <tr><td height=25 colspan="2" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
          <SELECT onChange="window.location='?page='+this.value" name=gopage>
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

