<table width="211" border="0" cellspacing="0" cellpadding="0">
<tr><td><img src="images/a6.jpg" width="211" height="50" alt=""></td>
</tr>
<tr>
<td height="184" align="center" background="images/index_99.jpg"><table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="21%" height="35" align="center"><img src="images/a13.jpg" width="24" height="25" /></td>
    <td width="79%" align="left"><a href="usereditinfo.asp">Self Info</a></td>
  </tr>
  <tr>
    <td height="35" align="center"><img src="images/a14.jpg" width="23" height="25" /></td>
    <td align="left">Shopping car 
<a href="gouwu.asp?action=show">
<font color="#FF0000"><%=conn.execute("select count(*) from orders where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'")(0)%></font></a>	</td>
  </tr>
  <tr>
    <td height="35" align="center"><img src="images/a15.jpg" width="25" height="22" /></td>
    <td align="left">My favorites <a href="gouwu.asp?action=show">
<font color="#FF0000"><%=conn.execute("select count(*) from orders where username='"&request.Cookies("userloginname")&"' and zhuangtai='untreated'")(0)%></font>
</a> </td>
  </tr>
  <tr>
    <td height="10" align="center">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  
  
</table>
  <table width="86%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="51%" align="left"><a href="login.asp"><img src="images/a11.jpg" width="78" height="34" border="0" /></a></td>
      <td width="49%" align="right"><a href="reg.asp"><img src="images/a12.jpg" width="78" height="34" border="0" /></a></td>
    </tr>
  </table></td>
</tr>
<tr>
<td><img src="images/index_111.jpg" width="211" height="4" alt=""></td>
</tr>
</table>
