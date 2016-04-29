<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>订单管理</title>
</head>
<script src="../inc/calendar.js" type="text/javascript"></script>
<body>
<%zhuangtai=request.QueryString("zhuangtai")
action=trim(Request("action"))
ordernum=trim(Request("ordernum"))
username=trim(Request("username"))
qsrq=year(trim(Request("qsrq")))&"-"&month(trim(Request("qsrq")))&"-"&day(trim(Request("qsrq")))
jsrq=year(trim(request("jsrq")))&"-"&month(trim(request("jsrq")))&"-"&day(trim(request("jsrq")))
tomorrow=DateAdd("d",1,jsrq) 
'if trim(Request("ordernum"))<>"" then
'response.Write(trim(request("ordernum")))
'response.End()
'end if
%>
<!--
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right">
                                      <select name="select" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" ><base target=Right> 
                                        <option value="manage_order.asp?zhuangtai=untreated" selected>--选择SearchStates--</option>
                                        <option value="manage_order.asp?zhuangtai=untreated" <%if zhuangtai="untreated" then%>selected<%end if%>>全部订单States</option>
                                        <option value="manage_order.asp?zhuangtai=用户已下单" <%if zhuangtai="用户已下单" then%>selected<%end if%>>用户已下单</option>
                                        <option value="manage_order.asp?zhuangtai=用户已经划出款" <%if zhuangtai="用户已经划出款" then%>selected<%end if%>>用户已经划出款</option>
                                        <option value="manage_order.asp?zhuangtai=服务商已经收到款" <%if zhuangtai="服务商已经收到款" then%>selected<%end if%>>服务商已经收到款</option>
                                        <option value="manage_order.asp?zhuangtai=服务商已经发货" <%if zhuangtai="服务商已经发货" then%>selected<%end if%>>服务商已经发货</option>
                                        <option value="manage_order.asp?zhuangtai=用户已经收到货" <%if zhuangtai="用户已经收到货" then%>selected<%end if%>>用户已经收到货</option>
    </select>	</td>
  </tr>
</table>
-->
<%if qsrq<>"" then%>
<font style="font-size:12px">Begin：<%=qsrq%></font>
 <%end if%>
 <%if jsrq<>"" then%>
<font style="font-size:12px">End：<%=jsrq%></font>
 <%end if%>
 <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td align="center" background="images/titlebg.gif">Search</td>
  </tr>
  <form name="form2" method="post" action="manage_order.asp?action=search">
  <tr>
    <td align="center" bgcolor="#FFFFFF">
	
	<table width="97%" border="0" cellspacing="0" cellpadding="0">
      <tr align="center">
        <td width="7%" height="25">Order Number：</td>
        <td width="9%"><input name="ordernum" type="text" id="ordernum" size="12"></td>
        <td width="7%">User Name：</td>
        <td width="10%"><input name="username" type="text" id="username" size="12"></td>
        <td width="9%">Begin：</td>
        <td width="14%"> 
		<input name="qsrq" type="text" class="input" id="qsrq"  onClick="new Calendar().show(this.form.qsrq);" size="15">		</td>
    
        <td width="9%">End：</td>
        <td width="13%"><input name="jsrq" type="text" class="input" id="jsrq"  onClick="new Calendar().show(this.form.jsrq);" size="15"></td>
        <td width="6%">Operator：</td>
        <td width="7%"><input name="admin_name" type="text" id="admin_name" size="12"></td>
        <td width="9%">
          <input type="submit" name="Submit" value="Search">        </td>
      </tr>
    </table></td>
  </tr></form>
</table>
 
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
    <tr align="center" bgcolor="#6699cc">
      <td width="12%" height="25" background="images/titlebg.gif" bgcolor="#6699cc">Order Number<a href="manage11.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="18%" background="images/titlebg.gif" bgcolor="#6699cc">States<a href="manage12.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="20%" background="images/titlebg.gif" bgcolor="#6699cc">User Name<a href="manage13.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="10%" background="images/titlebg.gif" bgcolor="#6699cc">Payment method<a href="manage14.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="15%" background="images/titlebg.gif" bgcolor="#6699cc">Time<a href="manage15.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="14%" background="images/titlebg.gif" bgcolor="#6699cc">Operator<a href="manage16.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
      <td width="11%" background="images/titlebg.gif" bgcolor="#6699cc">Operator<a href="manage17.asp"><img src="../images/xia.jpg" width="12" height="6" border="0"></a></td>
    </tr>
<%
'if zhuangtai="" or zhuangtai="untreated" then
'sql="select ordernum,username,fkfs,shfs,addtime,admin_name,shren,zhuangtai from orders where ordernum is not null order by zhuangtai asc, addtime desc"
'else
'sql="select ordernum,username,fkfs,shfs,addtime,admin_name,shren,zhuangtai from orders where zhuangtai='"&zhuangtai&"' order by zhuangtai asc , addtime desc"
'end if
sql="select distinct ordernum,zhuangtai,username,fkfs,addtime,admin_name,shren,orderflag from orders where orderflag >0   "
if Request("ordernum")<>"" then
sql=sql & " and ordernum like '%"&Request("ordernum")&"%'"
end if
if Request("username")<>"" then
sql=sql & " and username like '%"&Request("username")&"%'"
end if
if Request("admin_name")<>"" then
sql=sql & "and admin_name like '%"&Request("admin_name")&"%' "
end if
if qsrq<>"" then
sql=sql & "  and addtime >='"&qsrq&"'"
end if
if jsrq<>"" then
sql=sql & " and addtime <'"&tomorrow&"' "
end if
sql=sql &" order by addtime desc"
 
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
%>
  <tr>
    <td colspan="7" bgcolor="#FFFFFF">No Order</td>
  </tr>
<%	else
      rs.pagesize=100
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page
    
for j=1 to rs.PageSize 
if (j mod 2)<>0 then
bgcolor="ffffff"
else
bgcolor="CBDDE7"
end if
  
  %>
	
    <tr align="center" bgcolor="<%=bgcolor%>">
      <td height="25">
	  <a href="javascript:;" onClick="javascript:window.open('view_order.asp?ordernum=<%=rs("ordernum")%>','','width=550,height=400,toolbar=no, status=no, menubar=no, resizable=yes, scrollbars=yes');return false;">
	  <%=rs("ordernum")%></a></td>
      <td height="25">
 	  <%=rs("zhuangtai")%>
	  <%=rzhuangtai%></td>
      <td><%=rs("username")%></td>
      <td><%=rs("fkfs")%></td>
      <td><%=year(rs("addtime"))&"-"&month(rs("addtime"))&"-"&day(rs("addtime"))%></td>
      <td><%=rs("admin_name")%></td>
      <td><%=rs("shren")%></td>
    </tr>
    	  <%rs.movenext
if rs.eof then exit for
next
%>
<tr>
      <td height="25" colspan="7" align="center" bgcolor="#FFFFFF"> 
	                      <p align="center">Total Records<%=rs.recordcount%>&nbsp;                   
                    <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&zhuangtai=<%=zhuangtai%>&action=<%=action%>&ordernum=<%=ordernum%>&username=<%=username%>&admin_name=<%=admin_name%>&jsrq=<%=jsrq%>&qsrq=<%=qsrq%>&tomorrow=<%=tomorrow%>">Privet</A> 
<A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&zhuangtai=<%=zhuangtai%>&action=<%=action%>&ordernum=<%=ordernum%>&username=<%=username%>&admin_name=<%=admin_name%>&jsrq=<%=jsrq%>&qsrq=<%=qsrq%>&tomorrow=<%=tomorrow%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page <SELECT onChange="window.location='?zhuangtai=<%=zhuangtai%>&action=<%=action%>&ordernum=<%=ordernum%>&username=<%=username%>&page='+this.value" name=gopage>              
<%for x=1 to rs.pagecount%>
<OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
<%next%>      
</SELECT>       
</td>
</tr>
<%
end if
rs.close
set rs=nothing

%>
</table>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td align="center" background="images/titlebg.gif">Search</td>
  </tr>
  <form name="form1" method="post" action="manage_order.asp?action=search">
  <tr>
    <td align="center" bgcolor="#FFFFFF">
	
	<table width="97%" border="0" cellspacing="0" cellpadding="0">
      <tr align="center">
        <td width="7%" height="25">Order Number：</td>
        <td width="9%"><input name="ordernum" type="text" id="ordernum" size="12"></td>
        <td width="7%">User Name：</td>
        <td width="10%"><input name="username" type="text" id="username" size="12"></td>
        <td width="9%">Begin：</td>
        <td width="14%"> 
		<input name="qsrq" type="text" class="input" id="qsrq"  onClick="new Calendar().show(this.form.qsrq);" size="15">		</td>
    
        <td width="9%">End：</td>
        <td width="13%"><input name="jsrq" type="text" class="input" id="jsrq"  onClick="new Calendar().show(this.form.jsrq);" size="15"></td>
        <td width="6%">Operator：</td>
        <td width="7%"><input name="admin_name" type="text" id="admin_name" size="12"></td>
        <td width="9%">
          <input type="submit" name="Submit" value="Search">        </td>
      </tr>
    </table></td>
  </tr></form>
</table>
<br>
</body>
</html>
