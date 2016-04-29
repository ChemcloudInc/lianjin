<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("b1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Third classification</title>
<link href="site_css.css" rel="stylesheet" type="text/css">

</head>
<link href="css.css" rel="stylesheet" type="text/css">
<body>
<%
smallid=request.QueryString("smallid")
smallname=request.QueryString("smallname")
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="22%" height="30" align="center">Secondary classification：</td>
    <td width="78%">
	<select name="select" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
      <option >Chose</option>
      <%set rs=server.createobject("adodb.recordset")
		rs.Open "select * from pro_small order by smallid",conn,1,1
		do while not rs.eof %>
      <option value="product_class3.asp?smallid=<%=rs("smallid")%>&smallname=<%=rs("smallname")%>" <%if rs("smallid")=cint(request.QueryString("smallid")) then %>selected<%end if%>><%=conn.execute("select bigid,bigname from pro_big where bigid="&rs("bigid")&"")(1)%> - <%=trim(rs("smallname"))%></option>
       <%rs.movenext
		loop
		rs.close
		set rs=nothing
		%>
     </select>
	</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="35%" height="25" align="center" bgcolor="F1F5FA">Third classification</td>
    <td width="35%" align="center" bgcolor="F1F5FA">Sort</td>
    <td align="center" bgcolor="F1F5FA">Editor</td>
    <td align="center" bgcolor="F1F5FA">Delete</td>
  </tr>
        <%
        if smallid="" then
        response.Write "<div align=center><font color=red>Chose classification</font></div>"
        else
        set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from class3 where smallid="&smallid&" order by paixu",conn,1,1
         if rs.EOF and rs.BOF then
		  response.Write "<div align=center><font color=red>Nothing</font></center>"
		  else
         do while not rs.EOF
         %>

<form name="form1" method="post" action="save_product_class3.asp?action=edit&smallid=<%=smallid%>&c3id=<%=rs("c3id")%>">

  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="c3name" type="text" class="input" value="<%=rs("c3name")%>">    </td>
    <td align="center" bgcolor="#FFFFFF"><input name="paixu" type="text" class="input" value="<%=rs("paixu")%>"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="go" value="Editor"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_product_class3.asp?action=del&smallid=<%=smallid%>&c3id=<%=rs("c3id")%>" onClick="return confirm('Are you sure Delete？')">Delete</a></td>
  </tr>
  </form>
       <%rs.movenext
        loop
        rs.close
        set rs=nothing
        end if
        end if
		%>
</table>

<form name="form2" method="post" action="save_product_class3.asp?action=add&smallid=<%=smallid%>">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="35%" height="25" align="center" bgcolor="F1F5FA">Name</td>
    <td width="35%" align="center" bgcolor="F1F5FA">Sort</td>
    <td width="30%" align="center" bgcolor="F1F5FA">Operate</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="c3name" type="text" class="input" id="c3name">    </td>
    <td align="center" bgcolor="#FFFFFF">
	<%
	if smallid<>"" then
	sql3="select c3id,smallid from class3 where smallid="&smallid
	set rs3=conn.execute(sql3)
	if not (rs3.eof and rs3.bof) then
	c2num=conn.execute("select count(*) from class3 where smallid="&smallid&"")(0)
	else
	c2num=0
	end if
	rs3.close:set rs3=nothing
	else
	c2num=0
	end if
	%>
	<input name="paixu" type="text" class="input" value="<%=c2num+1%>"></td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit2" type="submit" class="go" value="Add"></td>
  </tr>
</table>
</form>
</body>
</html>
