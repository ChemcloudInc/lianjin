<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/md5.asp"-->
<%call time_out()%>
<%call chkflag("e1")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��վ������Ϣ����</title>
<LINK href="images/syscome.files/Admin.css" rel=stylesheet>

</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkform()
{
if(checkspace(document.form1.username.value)) {
	
    alert("�Բ�������д�û�����");
	document.form1.username.focus();
	return false;
  }
   if(checkspace(document.form1.userpass.value) || document.form1.userpass.value.length<6 || document.form1.userpass.value.length>18) {
	
    alert("���벻��Ϊ��,����6��18���ַ�֮�䣡");
	document.form1.userpass.focus();
	return false;
  }
   if(checkspace(document.form1.userpass1.value) || document.form1.userpass1.value.length<6 || document.form1.userpass1.value.length>18) {
	
    alert("��������һ�����ĵ�½����,����6��18���ַ�֮�䣡");
	document.form1.userpass1.focus();
	return false;
  }
   if(document.form1.userpass.value!=document.form1.userpass1.value) {
	
    alert("������������벻һ�£�");
	document.form1.userpass.value="";
	document.form1.userpass1.value="";
	document.form1.userpass.focus();
	return false;
  }
/*   if(checkspace(document.form1.realname.value)) {
	
    alert("�Բ�������д������ʵ������");
	document.form1.realname.focus();
	return false;
  }
   if(checkspace(document.form1.usertel.value)) {
	
    alert("�Բ�������д�����õ���ϵ�绰��");
	document.form1.usertel.focus();
	return false;
  }
  
   if(document.form1.email.value.length!=0)
  {
    if (document.form1.email.value.charAt(0)=="." ||        
         document.form1.email.value.charAt(0)=="@"||       
         document.form1.email.value.indexOf('@', 0) == -1 || 
         document.form1.email.value.indexOf('.', 0) == -1 || 
         document.form1.email.value.lastIndexOf("@")==document.form1.email.value.length-1 || 
         document.form1.email.value.lastIndexOf(".")==document.form1.email.value.length-1)
     {
      alert("Email��ַ��ʽ����ȷ��");
      document.form1.email.focus();
      return false;
      }
   }
 else
  {
   alert("Email����Ϊ�գ�");
   document.form1.email.focus();
   return false;
   }
   if(checkspace(document.form1.userIDC.value)) {
	
    alert("�Բ�������д�������֤���룡");
	document.form1.userIDC.focus();
	return false;
  }*/
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

//-->
</script>
<body>
<%
action=srequest(trim(request("action")),0)

if action="add" then
if trim(request("username"))="" or trim(request("userpass"))="" then
response.Write "<script language=javascript>alert('�û����Ѵ��ڣ���������ѡ��!');window.location.href='userreg.asp';</script>"
response.end
end if
sql="select * From webuser"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
rs("username")=trim(request("username"))
rs("userpass")=md5(trim(request("userpass")))
rs("dengji")=trim(request("dengji"))
rs("comname")=trim(request("comname"))
rs("linkman")=trim(request("linkman"))
rs("linktel")=trim(request("linktel"))
rs("fax")=trim(request("fax"))
rs("mobile")=trim(request("mobile"))
rs("adds")=trim(request("adds"))
rs("postcode")=trim(request("postcode"))
rs("email")=htmlencode(trim(request("email")))
rs("caozuoname")=trim(request("caozuoname"))

rs("addtime")=now()
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('��Աע��ɹ�!');window.location.href='user_add.asp';</script>"
end if
%>
<form name="form1" method="post" action="user_add.asp?action=add">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="30" colspan="2" align="center" background="images/titlebg.gif" bgcolor="#FFFFFF">��ӻ�Ա</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��Ա���ƣ�</td>
    <td bgcolor="#FFFFFF">
      <input name="username" type="text" id="username" size="50"> 
      <font color="#FF0000">*</font>     </td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��½���룺</td>
    <td bgcolor="#FFFFFF"><input name="userpass" type="password" id="userpass" size="50" />
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">ȷ�����룺</td>
    <td bgcolor="#FFFFFF"><input name="userpass1" type="password" id="userpass1" size="50" />
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��Ա�ȼ���</td>
    <td bgcolor="#FFFFFF"><select name="dengji" id="dengji">
      <option value="��Ҫ�ͻ�">��Ҫ�ͻ�</option>
      <option value="һ����Ҫ�ͻ�">һ����Ҫ�ͻ�</option>
      <option value="һ��ͻ�">һ��ͻ�</option>
    </select>
      <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��˾���ƣ�</td>
    <td bgcolor="#FFFFFF"><input name="comname" type="text" id="comname" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�ˣ�</td>
    <td bgcolor="#FFFFFF"><input name="linkman" type="text" id="linkman" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�绰��</td>
    <td bgcolor="#FFFFFF"><input name="linktel" type="text" id="linktel" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">������룺</td>
    <td bgcolor="#FFFFFF"><input name="fax" type="text" id="fax" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ�ֻ���</td>
    <td bgcolor="#FFFFFF"><input name="mobile" type="text" id="mobile" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">��ϵ��ַ��</td>
    <td bgcolor="#FFFFFF"><input name="adds" type="text" id="adds" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">�������룺</td>
    <td bgcolor="#FFFFFF"><input name="postcode" type="text" id="postcode" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">�������䣺</td>
    <td bgcolor="#FFFFFF"><input name="email" type="text" id="email" size="50" /></td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">����Ա��</td>
    <td bgcolor="#FFFFFF">
<select name="caozuoname">
<%sql1="select * from sys_admin order by aid"
set rs1=conn.execute(sql1)
if rs1.eof and rs1.bof then%>
<option value="">ѡ�����Ա</option>
<%else
do while not rs1.eof%>
<option value="<%=rs1("admin_name")%>"><%=rs1("admin_name")%></option>
<%rs1.movenext
loop
end if
rs1.close:set rs1=nothing%>
</select>
	
	
	</td>
  </tr>
  <tr>
    <td height="33" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><input name="Submit" type="submit" class="button" value="�����Ա" onClick="return checkform();" /></td>
  </tr>
</table>
</form>
</body>
</html>
