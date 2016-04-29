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
<%call usertime_out()%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的订单</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">当前位置：首 &gt; 会员中心 &gt; 我的订单 </td>
      </tr>
    </table>
	<div class="con_k"></div>
	<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
   if(checkspace(document.form1.ordernum.value)) {
	
    alert("对不起，请输入SearchOrder Number！");
	document.form1.ordernum.focus();
	return false;
  }

}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

//-->
</script>
<%ordernum=trim(request("ordernum"))
action=trim(request("action"))
paixu=trim(request("paixu"))
if paixu="" then
paixu="desc"
else
paixu="asc"
end if
%>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="78" height="40">&nbsp;</td>
            <td align="center" background="images/search_2.gif">
			
			<table width="60%" border="0" cellspacing="0" cellpadding="0">
              <form name="form1" method="post" action="order_track.asp?action=search">
			  <tr align="center">
                <td align="right">Order Number：</td>
                <td>
                  <input name="ordernum" type="text" size="35" class="input2">                </td>
                <td align="left"><input type="submit" name="Submit" value="Search" onClick="return checkform();" /></td>
			  </tr>
			  <tr>
			    <td colspan="3" align="center"><span style="color: #FF0000">请输入完整Order Number，不支持模糊Search!</span></td>
			    </tr>
			  </form>
            </table>
			
			</td>
            <td width="16">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="DEDEDE">
          <tr>
            <td width="20%" height="25" align="center" bgcolor="EEF7FF"><b>Order Number</b></td>
            <td width="14%" align="center" bgcolor="EEF7FF"><strong>States</strong></td>
            <td width="16%" align="center" bgcolor="EEF7FF"><b>付款方式</b></td>
            <td width="13%" align="center" bgcolor="EEF7FF"><b>送货方式</b></td>
            <td width="17%" align="center" bgcolor="EEF7FF"><b>收货人</b></td>
            <td width="20%" align="center" bgcolor="EEF7FF"><b>订购日期</b></td>
          </tr>
   <%
  set rs=server.createobject("adodb.recordset")
  if action="search" then
  sql="select distinct(ordernum),orderid,fkfs,shfs,receive_name,username,addtime,zhuangtai from orders where username='"&request.Cookies("userloginname")&"'"
  
  if ordernum<>"" then
  sql=sql & " and ordernum like '"&ordernum&"'"
  end if
  sql = sql & " order by addtime "&paixu&""
  else
  sql="select distinct(ordernum),orderid,username,fkfs,shfs,receive_name,addtime,zhuangtai from orders where username='"&request.Cookies("userloginname")&"' order by zhuangtai desc, addtime "&paixu&""
  end if
    rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
	<tr><td height="25" colspan="10" bgcolor="#FFFFFF">暂无订购记录</td>
	</tr>
		<%
	else
      rs.pagesize=18
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page
    
for j=1 to rs.PageSize 
'if (j mod 2)<>0 then
'color="ffffff"
'else
'color="f0f0f0"
'end if
 %>

          <tr align="center">
            <td height="30" bgcolor="#FFFFFF"><a href="view_order.asp?ordernum=<%=rs("ordernum")%>&orderid=<%=rs("orderid")%>" style="text-decoration:underline; color:#0000FF" target="_blank"><%=rs("ordernum")%></a></td>
            <td height="30" bgcolor="#FFFFFF"><%=rs("zhuangtai")%></td>
            <td bgcolor="#FFFFFF"><%=rs("fkfs")%></td>
            <td bgcolor="#FFFFFF"><%=rs("shfs")%></td>
            <td bgcolor="#FFFFFF"><%=rs("receive_name")%></td>
            <td bgcolor="#FFFFFF"><%=rs("addtime")%></td>
          </tr>

  	  <%rs.movenext
if rs.eof then exit for
next
%>
<tr>
      <td height="35" colspan="10" align="center" bgcolor="#FFFFFF"> 
	                      <p align="center">Total Records<%=rs.recordcount%>&nbsp;                   
                    <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&ordernum=<%=ordernum%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&ordernum=<%=ordernum%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page <SELECT onChange="window.location='?action=<%=action%>&ordernum=<%=ordernum%>&page='+this.value" name=gopage>              
                    <%for x=1 to rs.pagecount%>
                    <OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
                    <%next%>      
                </SELECT>       </td>
</tr>
<%
end if
rs.close
set rs=nothing

%> 
		  
        </table>
		</td>
      </tr>
    </table></td>
  </tr>
</table>

	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>