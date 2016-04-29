<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="config.asp"-->
<%call usertime_out()%>
<%serid=srequest(trim(request("serid")),1)%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>返修/退换货编辑</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">

</head>

<body>
<%action=srequest(trim(request("action")),0)
if action="edit" then
if trim(request("fxydnum"))="" or trim(request("beizhu"))="" then
response.Write "<script language=javascript>alert('带*号的必须填写');window.location.href='userservice_edit.asp?serid="&serid&"';</script>"
response.End()
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from services where serid="&serid&" order by serid"
rs.open sql,conn,1,3
rs("types")=trim(request("types"))
rs("fxydnum")=trim(request("fxydnum"))
rs("fxydcom")=trim(request("fxydcom"))
rs("beizhu")=trim(request("beizhu"))
rs.update
rs.close:set rs=nothing
response.Write "<script language=javascript>alert('您的问题编辑成功');window.location.href='userservice.asp';</script>"
end if
%>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" align="left" valign="top"><!--#include file="userleft.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="34" background="images/user6.jpg" class="padleft">当前位置：首 &gt; 会员中心 &gt; 返修/退换货编辑 </td>
      </tr>
    </table>
	<div class="con_k"></div>
	<%sql2="select * from services where serid="&serid
	set rs2=conn.execute(sql2)
	if not rs2.eof then%>
	<form id="forms" name="forms" method="post" action="userservice_edit.asp?action=edit&serid=<%=rs2("serid")%>">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="45" align="right">我要(<span class="STYLE1">*</span>)</td>
        <td>
          <select name="types" id="types">
            <option value="返修" <%If trim(rs2("types"))="返修" then%>selected<%end if%>>返修</option>
            <option value="换货" <%If trim(rs2("types"))="换货" then%>selected<%end if%>>换货</option>
            <option value="退货" <%If trim(rs2("types"))="退货" then%>selected<%end if%>>退货</option>
          </select>        </td>
      </tr>
      <tr>
        <td height="45" align="right">返回运单编号(<span class="STYLE1">*</span>)</td>
        <td><input name="fxydnum" type="text" class="input" id="fxydnum" size="50" value="<%=rs2("fxydnum")%>" /></td>
      </tr>
      <tr>
        <td height="45" align="right">承运企业(<span class="STYLE1">*</span>)</td>
        <td><input name="fxydcom" type="text" class="input" id="fxydcom" value="<%=rs2("fxydcom")%>" size="50" />
          （请填写物流公司名称）</td>
      </tr>
      <tr>
        <td height="45" align="right">返修/退换货说明(<span class="STYLE1">*</span>)</td>
        <td><textarea name="beizhu" cols="60" rows="10" class="textarea" id="beizhu"><%=rs2("beizhu")%></textarea></td>
      </tr>
      <tr>
        <td height="45" align="right">运单编号：</td>
        <td><input name="fahuoydnum" type="text" class="input" id="fahuoydnum" value="<%=rs2("fahuoydnum")%>" size="50" /> 
          （我司处理完后发给用户的运单编号） </td>
      </tr>
      <tr>
        <td height="45">&nbsp;</td>
        <td><input type="submit" name="Submit" value="保存修改" /></td>
      </tr>
    </table>
	</form>
	<%end if
	rs2.close:set rs2=nothing%>
	</td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
