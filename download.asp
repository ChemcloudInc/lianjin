<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="config.asp"-->

<%newstype=srequest(trim(request("newstype")),0)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��������</title>
<LINK href="inc/css.css" rel=stylesheet>

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="221" align="left" valign="top"><!--#include file="news_left.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DADADA">
      <tr>
        <td height="113" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="32" background="images/h1.jpg">����ǰλ�ã��� &gt; ��Ϣ���� &gt; ��������</td>
          </tr>
        </table>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <%
    sql="select * from downloads order by downid desc"
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    if rs.eof and rs.bof then 
     %>
        <tr>
          <td height="25" colspan="6">��������</td>
        </tr>
        <%
  else
      rs.pagesize=16
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page   
      for j=1 to rs.PageSize 
  %>
        <tr>
          <td width="22" align="left"><img src="images/icon.jpg" width="11" height="9" /></td>
          <td height="35" align="left" style="background:url(images/icon1.jpg) no-repeat left center; padding-left:10px; border-bottom:1px dashed #CCCCCC;">��[<%=rs("downtype")%>] <a href="downdetails.asp?downid=<%=rs("downid")%>" target="_blank" style="font-size:14px;"><%=rs("downtitle")%></a> </td>
          <td width="150" align="center" style="border-bottom:1px dashed #CCCCCC"><font color="#BCA88F"><%=year(rs("addtime"))&"-"&month(rs("addtime"))&"-"&day(rs("addtime"))%></font></td>
        </tr>
        <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
        <tr>
          <td height="25" colspan="7" align="center">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</a> <a href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</a>&nbsp;&nbsp;&nbsp; Turn to page
            <select onchange="window.location='?page='+this.value" name="gopage">
                <%for x=1 to rs.pagecount%>
                <option <%if x=page then%>selected<%end if%> value="<%=x%>"><%=x%></option>
                <%next%>
              </select>
             </td>
        </tr>
        <%
 end if
 rs.close:set rs=nothing
%>
      </table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
