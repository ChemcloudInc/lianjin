<%function getindexpro(bigid,num)
sqlr1="select top "&num&" proid,proname,bigid,smallid,prosmallpic,svipprice,vipprice,userprice,marketprice,CASNo from product where bigid="&bigid&" order by proid desc"
set rsr1=conn.execute(sqlr1)
if not rsr1.eof then%>

<table width="98%" border="0" cellspacing="0" cellpadding="0">
<tr>
<%b=1
do while not rsr1.eof%>
<td width="25%" style="padding-top:10px;">
<!--整体开始-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align="center">

<table width="184" height="125" border="0" cellpadding="0" cellspacing="1" bgcolor="D3D3D3">
<tr>
<td align="center" bgcolor="#FFFFFF"><a href="prodetails.asp?proid=<%=rsr1("proid")%>&bigid=<%=rsr1("bigid")%>&smallid=<%=rsr1("smallid")%>" target="_blank"><img src="http://www.chemblink.com/structures/<%=trim(rsr1("CASNo"))%>.gif" border="0" onload="makesmallpic(this,174,115)"></a></td>
</tr>
</table>

</td>
</tr>
<tr title="<%=trim(rsr1("proname"))%>"><td height="38" align="center">
<a href="prodetails.asp?proid=<%=rsr1("proid")%>&bigid=<%=rsr1("bigid")%>&smallid=<%=rsr1("smallid")%>" target="_blank">
<font style="font-size:12px">
<%if len(trim(rsr1("proname")))>28 then%>
<%=left(trim(rsr1("proname")),28)%>
<%else%>
<%=trim(rsr1("proname"))%>
<%end if%></font>
</a>
</td>
</tr>
<tr>
<td align="center">

<table width="194" border="0" cellpadding="0" cellspacing="0" bgcolor="EAF3FE">
<tr>
<td height="30" align="center"><font style="font-size:12px" color="#0000FF">CAS Number:<%=rsr1("CASNo")%></font></td>
</tr>
<tr>
<td height="40" align="center"><a href="prodetails.asp?proid=<%=rsr1("proid")%>&bigid=<%=rsr1("bigid")%>&smallid=<%=rsr1("smallid")%>" target="_blank"><img src="images/index_106.jpg" border="0"></a></td>
</tr>
</table>

</td>
</tr>
</table>
<!--整体结束-->
</td>
<%rsr1.movenext
if (b mod 6)=0 then%>
</tr>
<%end if
b=b+1
loop%>
</table>
<%end if
rsr1.close:set rsr1=nothing
end function%>

<%'按照大类名称查找类别
function getbigname(bigid)
sqlb="select bigid,bigname from pro_big where bigid="&bigid
set rsb=conn.execute(sqlb)
if not rsb.eof then
response.Write(rsb("bigname"))
end if
rsb.close:set rsb=nothing
end function%>

<%'按照小类名称查找类别
function getsmallname(smallid)
sqlb="select smallid,smallname from pro_small where smallid="&smallid
set rsb=conn.execute(sqlb)
if not rsb.eof then
response.Write(rsb("smallname"))
end if
rsb.close:set rsb=nothing
end function%>