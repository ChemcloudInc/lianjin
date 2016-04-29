<div class="con_k"></div>
<table width="211" border="0" cellspacing="0" cellpadding="0">
<tr><td><img src="images/index_93.jpg" width="211" height="50" alt=""></td></tr>
<tr>
<td align="center" background="images/index_99.jpg">

<table border="0" cellspacing="0" cellpadding="0">
<form name="form1" method="post" action="searchredirect.asp" target="_blank">
<tr><td align="center"><textarea name="yundanhao" cols="27" rows="6" class="textarea" id="yundanhao"></textarea></td></tr>
<tr>
<td height="45" align="left">
<select name="kuaidi">
<option value="">----Chose Express----</option>
<option value="圆通">圆通快递</option>
<option value="中通">中通快递</option>
<option value="速尔">速尔快递</option>
<option value="韵达">韵达快递</option>
<option value="顺风">顺风快递</option>
<option value="中铁">中铁快递</option>
</select>
</td>
</tr>
<tr><td height="45" align="right"><input type="image" src="images/index_102.jpg" width="58" height="23" alt=""></td></tr>
</form>
</table>

</td>
</tr>
<tr>
<td><img src="images/index_111.jpg" width="211" height="4" alt=""></td>
</tr>
</table>
<div class="con_k"></div>
<table width="211" border="0" cellpadding="0" cellspacing="1" bgcolor="CCCCCC">
<tr>
<td height="27" background="images/index_119.jpg" class="padleft fontw">News</td>
</tr>
<tr>
<td height="250" align="center" valign="top" bgcolor="#FFFFFF"><table width="95%" border="0" cellspacing="0" cellpadding="0">
<%sql="select top 10 newsid,newstitle,newstype from news  order by newsid desc"
set rs=conn.execute(sql)
if not rs.eof then
do while not rs.eof%>
<tr title="<%=limitwords(rs,"newstitle",48)%>">
<td height="25" align="left">·<a href="newsdetails.asp?newsid=<%=rs("newsid")%>" target="_blank"><%=limitwords(rs,"newstitle",28)%></a></td>
</tr>
<%rs.movenext
loop
end if
rs.close:set rs=nothing%>
</table></td>
</tr>
</table>
<div class="con_k"></div>
<table width="211" border="0" cellpadding="0" cellspacing="1" bgcolor="CCCCCC">
<tr>
<td height="27" background="images/index_119.jpg" class="padleft fontw">Download</td>
</tr>
<tr>
<td height="250" align="center" valign="top" bgcolor="#FFFFFF">
<table width="95%" border="0" cellspacing="0" cellpadding="0">
<%sql="select top 10 downid,downtitle from downloads order by downid desc"
set rs=conn.execute(sql)
if not rs.eof then
do while not rs.eof%>
<tr>
<td height="25" align="left">·<a href="downdetails.asp?downid=<%=rs("downid")%>" target="_blank"><%=limitwords(rs,"downtitle",25)%></a></td>
</tr>
<%rs.movenext
loop
end if
rs.close:set rs=nothing%>
</table>
</td>
</tr>
</table>
<div class="con_k"></div>
<table width="211" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="34"><img src="images/index_141.jpg" width="211" height="34" /></td>
</tr>
<tr>
<td align="center" background="images/index_142.jpg"><table width="200" border="0" cellspacing="0" cellpadding="0">
<tr><td height="25">Shanghai Office</td>
</tr>
<tr><td height="25">Tel：
  <%saleshotline=conn.execute("select saleshotline from baseset")(0)%><%=saleshotline%></td>
</tr>
<tr><td height="25">Fax：
  <%fax=conn.execute("select fax from baseset")(0)%><%=fax%></td>
</tr>
<tr><td height="27">Add：<%addr=conn.execute("select addr from baseset")(0)%><%=addr%></td></tr>


<tr><td height="25">US Headquarter </td>
</tr>
<tr><td height="25">Tel：
  <%ensaleshotline=conn.execute("select ensaleshotline from baseset")(0)%><%=ensaleshotline%></td>
</tr>
<tr><td height="25">Fax：
  <%enfax=conn.execute("select enfax from baseset")(0)%><%=enfax%></td>
</tr>
<tr><td height="27">Add：<%enaddr=conn.execute("select enaddr from baseset")(0)%><%=enaddr%></td></tr>
<tr>
  <td height="12">&nbsp;</td>
</tr>


</table></td>
</tr>
<tr>
<td><img src="images/index_155.jpg" width="211" height="6" alt="" /></td>
</tr>
</table>
