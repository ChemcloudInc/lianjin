<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="function.asp"-->
<!--#include file="config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>信捷电气订货系统</title>
<LINK href="inc/css.css" rel="stylesheet">
<LINK href="images/qq/qq.css" type=text/css rel=stylesheet>
</head>
<LINK rel=stylesheet type=text/css href="css/lanrenxixi.css">
<SCRIPT type=text/javascript src="js/jquery.js"></SCRIPT>
<SCRIPT type=text/javascript src="js/lanrentuku.js"></SCRIPT>
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>

<body>
<!--#include file="top.asp"-->
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212"><img src="images/index_28.jpg" width="212" height="45" alt="" /></td>
    <td background="images/index_29.jpg"><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="menupadleft menupadright"><a href="index.asp" class="menulink">首</a></td>
        <td><img src="images/menuline.jpg" width="2" height="45" /></td>
		<%sql="select * from pro_big order by bigid"
		set rs=conn.execute(sql)
		if not rs.eof then
		do while not rs.eof%>
		<td class="menupadleft menupadright"><a href="product.asp?action=big&bigid=<%=rs("bigid")%>" class="menulink"><%=rs("bigname")%></a></td>
        <td><img src="images/menuline.jpg" width="2" height="45" /></td>
		<%rs.movenext
		loop
		end if
		rs.close:set rs=nothing%>
        <td class="menupadleft menupadright"><a href="userservice.asp" class="menulink">售后服务</a></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="221" align="left" valign="top"><!--#include file="indexleft.asp"--></td>
    <td valign="top">
	<div class="con_k"></div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  	 <%
    sql="select * from product order by proid"
	
    set rs=server.createobject("adodb.recordset")
    rs.open sql,conn,1,1
    if rs.eof and rs.bof then 
     %>
  <tr>
    <td height="25" bgcolor="#FFFFFF" colspan="2">暂无产品</td>
  </tr>
  <%
  else
      rs.pagesize=25
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page   
      for j=1 to rs.PageSize 
  %>
  <tr align="center">
    <td height="25" style="border-bottom:1px solid #f0f0f0; padding:10px 0;" onMouseOver="this.bgColor='#FEF5E6';" onMouseOut="this.bgColor='#FFFFFF';"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100"><img src="<%=rs("prosmallpic")%>" onload="makesmallpic(this,80,60)" /></td>
        <td width="300"><a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=rs("bigid")%>&smallid=<%=rs("smallid")%>"><b><%=rs("proname")%></b></a>		</td>
        <td><%=getbigname(rs("bigid"))%> - <%=getsmallname(rs("smallid"))%></td>
        <td><%select case request.Cookies("userdengji")
		case ""
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("marketprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("marketprice")&" />")
		case "重要客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("svipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("svipprice")&" />")
		case "一般重要客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("vipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("vipprice")&" />")
		case "一般客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("userprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("userprice")&" />")
		end select%></td>
        <td width="100" align="center">
          订购
            <input name="textfield" type="text" value="1" size="5" /> 
          件        </td>
        <td width="100" align="center"><img src="images/index_106.jpg" /></td>
      </tr>
    </table></td>
    </tr>
  	     <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
	  <tr><td height=25 colspan="3" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
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

	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->
<SCRIPT src="images/qq/ServiceQQ.htm"></SCRIPT>

</body>
</html>
