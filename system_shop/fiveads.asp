<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("a2")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>五副切换广告管理</title>
<link href="site_css.css" rel="stylesheet" type="text/css">

</head>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="20%" height="25" align="center" bgcolor="F1F5FA">广告链接地址</td>
    <td align="center" bgcolor="F1F5FA">排序</td>
    <td width="20%" align="center" bgcolor="F1F5FA">广告图片</td>
    <td align="center" bgcolor="F1F5FA">Editor</td>
    <td align="center" bgcolor="F1F5FA">Delete</td>
  </tr>
        <%
		set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from FZtopAds order by paixu",conn,1,1
		if not rs.eof then
		  s=1
         do while not rs.EOF
         %>

<form name="form1<%=s%>" method="post" action="save_fiveads.asp?action=edit&adsid=<%=rs("adsid")%>">

  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="adslink" type="text" class="input" value="<%=rs("adslink")%>">    </td>
    <td align="center" bgcolor="#FFFFFF"><input name="paixu" type="text" class="input" value="<%=rs("paixu")%>" size="8"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="adspic" type="text" id="adspic" value="<%=rs("adspic")%>" size="20" />
      <input name="Submit222" type="button" class="go" onClick="window.open('carson52001.asp?formname=form1<%=s%>&editname=adspic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" /></td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="go" value="Editor"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_fiveads.asp?action=del&fzid=<%=fzid%>&adsid=<%=rs("adsid")%>" onClick="return confirm('确定Delete？')">Delete</a></td>
  </tr>
  </form>
       <%rs.movenext
	   s=s+1
        loop
        rs.close
        set rs=nothing
        end if
		%>
</table>

<form name="form2" method="post" action="save_fiveads.asp?action=add">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="20%" height="25" align="center" bgcolor="F1F5FA">广告链接地址</td>
    <td width="15%" align="center" bgcolor="F1F5FA">排序</td>
    <td width="20%" align="center" bgcolor="F1F5FA">广告图片</td>
    <td align="center" bgcolor="F1F5FA">操作</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="adslink" type="text" class="input" id="adslink">    </td>
    <td align="center" bgcolor="#FFFFFF">
	<%
	if fzid<>"" then
	sql3="select adsid,fzid from FZtopAds where fzid="&fzid
	set rs3=conn.execute(sql3)
	if not (rs3.eof and rs3.bof) then
	c2num=conn.execute("select count(*) from FZtopAds where fzid="&fzid&"")(0)
	else
	c2num=0
	end if
	rs3.close:set rs3=nothing
	else
	c2num=0
	end if
	%>
	<input name="paixu" type="text" class="input" value="<%=c2num+1%>" size="8"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="adspic" type="text" id="adspic" size="20" />
      <input name="Submit22" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=adspic&uppath=bookpic&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传" /></td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit2" type="submit" class="go" value="新增"></td>
  </tr>
</table>
</form>
</body>
</html>
