<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<%call time_out()%>
<%did=srequest(trim(request("did")),1)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑会员</title>
<LINK href="images/syscome.files/Admin.css" rel=stylesheet>

</head>

<body>
<%did=request("did")
action=srequest(trim(request("action")),0)

if action="edit" then
sql="select * From synthesis where did="&did
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
 
rs("flag")=trim(request("flag"))
rs("shenren")=trim(request("shenren"))
  

rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('Info edit successfully!');window.location.href='synthesis_edit.asp?did="&did&"';</script>"
end if
%>
<%sql="select * from synthesis where did="&did
set rs=conn.execute(sql)
if not rs.eof then%>
<form name="form1" method="post" action="synthesis_edit.asp?action=edit&did=<%=rs("did")%>">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="30" colspan="2" align="center" background="images/titlebg.gif" bgcolor="#FFFFFF">Edit synthesis </td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">Product Name ：</td>
    <td bgcolor="#FFFFFF">
      <input name="proname" type="text" id="proname" size="50" value="<%=rs("proname")%>" disabled="disabled" readonly=""> </td>
  </tr>


  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">CAS Number：</td>
    <td bgcolor="#FFFFFF"><input name="casno" type="text" id="casno" value="<%=rs("casno")%>" size="50" disabled="disabled" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">Quantity  ：</td>
    <td bgcolor="#FFFFFF"><input name="quantity" type="text" id="quantity" value="<%=rs("quantity")%>" size="50" disabled="disabled" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">Purity：</td>
    <td bgcolor="#FFFFFF"><input name="purity" type="text" id="purity" value="<%=rs("purity")%>" size="50"  disabled="disabled"/></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">E-mail：</td>
    <td bgcolor="#FFFFFF"><input name="email" type="text" id="email" size="50" value="<%=rs("email")%>" disabled="disabled" /></td>
  </tr>
  
    <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">Company Name：</td>
    <td bgcolor="#FFFFFF"><input name="Companyname" type="text" id="Companyname" value="<%=rs("Companyname")%>" size="50"  disabled="disabled"/></td>
  </tr>
    <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">State：</td>
    <td bgcolor="#FFFFFF"><select name="flag" id="flag">
      <option value="0" <%if trim(rs("flag"))="0" then%>selected<%end if%>>Unpass</option>
      <option value="1" <%if trim(rs("flag"))="1" then%>selected<%end if%>>Pass</option>
    </select> </td>
  </tr>
  
  
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">Check Manage ：	</td>
    <td bgcolor="#FFFFFF">
	<select name="shenren">
     <%sql1="select * from sys_admin order by aid"
	   set rs1=conn.execute(sql1)
	   if rs1.eof and rs1.bof then%>
       <option value=""   >Chose Manager</option>
       <%else
		do while not rs1.eof%>
      <option value="<%=rs1("admin_name")%>" <%if rs("caozuoname")=rs1("admin_name") then%>selected="selected"<%end if%>><%=rs1("admin_name")%></option>
      <%rs1.movenext
		loop
		end if
		rs1.close:set rs1=nothing%>
     </select> 
 	</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="Edit" /></td>
  </tr>
</table>
</form>
<%end if
rs.close:set rs=nothing%>
</body>
</html>
