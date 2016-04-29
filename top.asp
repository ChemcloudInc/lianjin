<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="33" align="center" background="images/index_02.jpg"><table width="1150" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="25" align="left">Welecom to <%=webtitle%></td>
<td align="right">
<%if request.Cookies("userloginname")="" then%>
<a href="login.asp">Login</a>&nbsp;&nbsp;<a href="reg.asp">Register</a>
<%else%>
<a href="userindex.asp" style="color:#cc0000; text-decoration:underline;"><%=request.Cookies("userloginname")%></a>, Hello Welecom to <%=webtitle%> !
<a href="userindex.asp" style="text-decoration:underline">My orders</a>
<%end if%>
</td>
</tr>
</table></td>
</tr>
</table>
<table width="1204" height="90" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="250" align="left"><img src="img/logo.jpg" width="214" height="81" /></td>
<td width="613" align="center" valign="middle">
<table width="476" height="34" border="0" cellpadding="0" cellspacing="1" bgcolor="#E81500">
<form name="form1" method="post" action="search.asp" target="_blank">
<tr>
 
<td width="404" align="center" valign="middle"><input name="keywords" type="text" class="inputsearch"  style="background-color:#FFFFFF;width:400px;height:30px; font-size:12px" value="Input CAS Number" onfocus="if (value =='Input CAS Number'){value =''}" onblur="if (value ==''){value='Input CAS Number'}"></td>
<td width="69" align="center"><input type="image" src="images/index_12.jpg" width="63" height="26"></td>
</tr>
</form>
</table>
</td>

<td width="3" valign="middle"></td>
<td width="338" align="right">

<table width="322" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="33" align="right" valign="middle"><font color="#FF0000"><strong>Email:salescn@cambridgechem.com</strong></font></td>
</tr>
</table>
<table width="282" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="33"><img src="images/index_16.jpg" width="33" height="31" alt=""></td>
<td background="images/index_17.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="144" align="left">There is 
<a href="gouwu.asp?action=show">
<font color="#FF0000"><%=conn.execute("select count(*) from orders where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'")(0)%></font>
</a> in car</td>
<td width="99" align="right"><a href="gouwu.asp?action=show"><img src="images/index_21.jpg" alt="" width="99" height="23" border="0"></a></td>
</tr>
</table></td>
<td width="6"><img src="images/index_19.jpg" width="6" height="31" alt=""></td>
</tr>
</table></td>
</tr>
</table></td>
</tr>
</table>
