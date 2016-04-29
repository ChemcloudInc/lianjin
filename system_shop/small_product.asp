<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<%call chkflag("b1")%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Secondary classification</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<link href="css.css" rel="stylesheet" type="text/css">
<body>
<%
bigid=request.QueryString("bigid")
bigname=request.QueryString("bigname")
%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="22%" height="30" align="center">First classification:</td>
    <td width="78%">
	<select name="select" onChange="var jmpURL=this.options[this.selectedIndex].value ; if(jmpURL!='') {window.location=jmpURL;} else {this.selectedIndex=0 ;}" >
      <option >Chose First classification</option>
      <%set rs=server.createobject("adodb.recordset")
		rs.Open "select * from pro_big order by bigid",conn,1,1
		do while not rs.eof %>
      <option value="small_product.asp?bigid=<%=rs("bigid")%>&bigname=<%=rs("bigname")%>" <%if rs("bigid")=cint(request.QueryString("bigid")) then %>selected<%end if%>><%=trim(rs("bigname"))%></option>
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
    <td width="35%" height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Name</td>
    <td align="center" background="images/titlebg.gif" bgcolor="#6699cc">Editor</td>
    <td align="center" background="images/titlebg.gif" bgcolor="#6699cc">Delete</td>
  </tr>
        <%
        if bigid="" then
        response.Write "<div align=center><font color=red>Chose classification</font></div>"
        else
        set rs=server.CreateObject("adodb.recordset")
        rs.Open "select * from pro_small where bigid="&bigid,conn,1,1
         if rs.EOF and rs.BOF then
		  response.Write "<div align=center><font color=red>还没有分类</font></center>"
		  else
         do while not rs.EOF
         %>

<form name="form1" method="post" action="save_small.asp?action=edit&bigid=<%=bigid%>&smallid=<%=rs("smallid")%>">

  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="smallname" type="text" class="inputc" value="<%=rs("smallname")%>" size="30">    </td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit" type="submit" class="go" value="Editor"></td>
    <td align="center" bgcolor="#FFFFFF"><a href="save_small.asp?action=del&bigid=<%=bigid%>&smallid=<%=rs("smallid")%>" onClick="return confirm('Delete该二级分类将自动Delete该二级分类下所有的三级分类，确定Delete吗？')">Delete</a></td>
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

<form name="form2" method="post" action="save_small.asp?action=add&bigid=<%=bigid%>">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#527EDD" bordercolordark="#FFFFFF" bgcolor="A4B6D7">
  <tr bgcolor="#6699cc">
    <td width="35%" height="25" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Name</td>
    <td width="30%" align="center" background="images/titlebg.gif" bgcolor="#6699cc">Operate</td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">
      <input name="smallname" type="text" class="inputc" id="smallname" size="30">    </td>
    <td align="center" bgcolor="#FFFFFF"><input name="Submit2" type="submit" class="go" value="Add"></td>
  </tr>
</table>
</form>
</body>
</html>
