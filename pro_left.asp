<table width="211" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10"><img src="images/pl1.jpg" width="10" height="29"></td>
    <td background="images/pl2.jpg" class="fontw"><%=bigname%></td>
    <td width="7"><img src="images/pl3.jpg" width="7" height="29"></td>
  </tr>
</table>
<table width="211" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="tdlr padall" style="line-height:200%;">
	<%sqll="select * from pro_small where bigid="&bigid&" order by smallid"
	set rsl=conn.execute(sqll)
	if not rsl.eof then%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<%do while not rsl.eof%>
	<tr><td height="25"><a href="product.asp?action=small&bigid=<%=rsl("bigid")%>&smallid=<%=rsl("smallid")%>" style="font-weight:bold;"><%=rsl("smallname")%></a></td></tr>
	<%sqlf="select * from class3 where smallid="&rsl("smallid")&" order by paixu"
	set rsf=conn.execute(sqlf)
	if not rsf.eof then%>
	<tr><td height="25" style="padding-left:10px; line-height:200%;">
	<%
	do while not rsf.eof%>
	·<a href="product.asp?action=three&bigid=<%=rsf("bigid")%>&smallid=<%=rsf("smallid")%>&c3id=<%=rsf("c3id")%>"><%=rsf("c3name")%></a><br />
	<%rsf.movenext
	loop%>
	</td></tr>
	<%end if
	rsf.close:set rsf=nothing%>
	<%rsl.movenext
	loop%>
	</table>
	<%
	end if
	rsl.close:set rsl=nothing%>
	</td>
  </tr>
</table>
<table width="111" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/pl4.jpg" width="211" height="4"></td>
  </tr>
</table>
<div class="con_k"></div>
<table width="211" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10"><img src="images/pl1.jpg" width="10" height="29"></td>
    <td background="images/pl2.jpg" class="fontw">本分类热销排行</td>
    <td width="7"><img src="images/pl3.jpg" width="7" height="29"></td>
  </tr>
</table>
<table width="211" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" class="tdlr padall">
      <table width="95%" border="0" cellspacing="0" cellpadding="0">
        <%sql2="select top 8 proid,proname,prosmallpic,bigid,smallid,c3id,hits from product where bigid="&bigid&" order by proid desc"
		set rs2=conn.execute(sql2)
		if not rs2.eof then
		do while not rs2.eof%>
		<tr>
          <td align="center">
		  <table width="150" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding:5px;"><a href="prodetails.asp?proid=<%=rs2("proid")%>&bigid=<%=rs2("bigid")%>&smallid=<%=rs2("smallid")%>"><img src="<%=rs2("prosmallpic")%>"onload="makesmallpic(this,140,120)"></a></td>
  </tr>
</table>

		  </td>
        </tr>
        <tr>
          <td height="33" align="center"><%=rs2("proname")%></td>
        </tr>
		<%rs2.movenext
		loop
		end if
		rs2.close:set rs2=nothing%>
      </table>	</td>
  </tr>
</table>
<table width="111" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/pl4.jpg" width="211" height="4"></td>
  </tr>
</table>