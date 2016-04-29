<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="10"><img src="images/pl1.jpg" width="10" height="29"></td>
<td background="images/pl2.jpg" class="fontw"><strong><font style="font-size:16px">Navigation</font></strong></td>
<td width="7"><img src="images/pl3.jpg" width="7" height="29"></td>
</tr>
</table>
 
<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td background="images/a5.jpg"><table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td height="30"><a href="About.html"><font style="font-size:12px">About Us</font></a></td>
</tr>
<tr>
<td height="30"><a href="contact.html"><font style="font-size:12px">Contact Us</font></a></td>
</tr>
<tr>
<td height="30"><a href="Service.html"><font style="font-size:12px">Special Service</font></a></td>
</tr>
<tr>
<td height="30"><a href="Custom.html"><font style="font-size:12px">Custom Synthesis</font></a></td>
</tr>
<tr>
<td height="30"><a href="Instrument.html"><font style="font-size:12px">Our Instrument</font></a></td>
</tr>
</table>
</td>
</tr>
</table>
<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><img src="images/pl4.jpg" width="240" height="4"></td>
</tr>
</table>
<br>
<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="10"><img src="images/pl1.jpg" width="10" height="29"></td>
<td background="images/pl2.jpg" class="fontw"><strong><font style="font-size:16px">Contact Us</font></strong></td>
<td width="7"><img src="images/pl3.jpg" width="7" height="29"></td>
</tr>
</table>
<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td background="images/a5.jpg">
<table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
<tr><td height="35"><strong>US Headquarter</strong></td></tr>
<tr><td height="30">


<font style="font-size:12px"><%ensaleshotline=conn.execute("select ensaleshotline from baseset")(0)%><font style="font-size:12px">Tel:<%=ensaleshotline%></font></td></tr>
<tr><td height="30"><%enfax=conn.execute("select enfax from baseset")(0)%><font style="font-size:12px">Fax:<%=enfax%></font></td></tr>
<tr><td height="30"><%enserhotline=conn.execute("select enserhotline from baseset")(0)%><font style="font-size:12px">E-mail:<%=enserhotline%></font></td></tr>
<tr><td height="30" style="line-height:200%;"><%enaddr=conn.execute("select enaddr from baseset")(0)%><font style="font-size:12px">Address:<%=enaddr%></font></td>
</tr>


<tr><td height="35"><strong>Shanghai Office</strong></td></tr>
<tr><td height="30"><%saleshotline=conn.execute("select saleshotline from baseset")(0)%><font style="font-size:12px">Tel:<%=saleshotline%></font></td></tr>
<tr><td height="30"><%fax=conn.execute("select fax from baseset")(0)%><font style="font-size:12px">Fax:<%=fax%></font></td></tr>
<tr><td height="30"><%serhotline=conn.execute("select serhotline from baseset")(0)%><font style="font-size:12px">E-mail:<%=serhotline%></font></td></tr>
<tr><td height="30" style="line-height:200%;"><%addr=conn.execute("select addr from baseset")(0)%><font style="font-size:12px">Address:<%=addr%></font></td></tr>




</table></td>
</tr>
</table>
<table width="240" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><img src="images/pl4.jpg" width="240" height="4"></td>
</tr>
</table>
