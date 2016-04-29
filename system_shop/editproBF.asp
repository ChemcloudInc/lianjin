<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加产品</title>
</head>

<body>
<%dim count
set rs=server.createobject("adodb.recordset")
rs.open "select * from pro_small order by smallid ",conn,1,1%>
<script language = "JavaScript">
var onecount;
onecount=0;
subcat = new Array();
<%
   count = 0
   do while not rs.eof 
%>
subcat[<%=count%>] = new Array("<%= trim(rs("smallname"))%>","<%= rs("bigid")%>","<%= rs("smallid")%>");
<%
        count = count + 1
        rs.movenext
        loop
        rs.close
%>
		
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.form2.smallid.length = 0; 

    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { //这句不是很理解
             document.form2.smallid.options[document.form2.smallid.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
        
    }    
</script>

<%
action=srequest(trim(request("action")),0)
proid=srequest(trim(request("proid")),1)

if action="edit" then
if trim(request("proname"))="" then
response.Write "<script language=javascript>alert('产品名称不能为空!');window.location.href='editpro.asp?proid="&proid&"';</script>"
response.end
end if
sql="select * from product where proid="&proid
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs("bigid")=trim(request("bigid"))
if trim(request("smallid"))<>"" then
rs("smallid")=trim(request("smallid"))
else
rs("smallid")=0
end if
rs("proname")=triM(request("proname"))
rs("prosmallpic")=triM(request("prosmallpic"))
rs("probigpic")=trim(Request("probigpic"))
rs("svipprice")=trim(Request("svipprice"))
rs("vipprice")=trim(Request("vipprice"))
rs("userprice")=trim(Request("userprice"))
rs("marketprice")=trim(Request("marketprice"))
rs("procontent")=trim(Request("procontent"))
rs.update
rs.close:set rs=nothing
'call cncreateprodet(proid)
'call encreateprodet(proid)
response.Write "<script language=javascript>alert('编辑成功!');window.location.href='managepro.asp';</script>"

end if
%>
<%sql="select * from product where proid="&proid
set rs=conn.execute(sql)%>

<form name="form2" method="post" action="editpro.asp?action=edit&proid=<%=proid%>">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">编辑产品</td>
  </tr>
  <tr>
    <td width="12%" height="25" align="center" bgcolor="#FFFFFF">产品名称：</td>
    <td width="88%" bgcolor="#FFFFFF"><input name="proname" value="<%=rs("proname")%>" type="text" size="50"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">所属分类：</td>
    <td bgcolor="#FFFFFF">大类:
      <%    
		set rs3=server.CreateObject("adodb.recordset")
	rs3.open "select * from pro_big order by bigid",conn,1,1
	if rs3.eof and rs3.bof then
	response.write "请先添加栏目。"
	response.end
	else
%>
      <select name="bigid" class="wenbenkuang" size="1" id="bigid" onChange="changelocation(document.form2.bigid.options[document.form2.bigid.selectedIndex].value)">
        <% 
        do while not rs3.eof
%>
        <option value="<%=rs3("bigid")%>" <%if rs3("bigid")=rs("bigid") then%>selected<%end if%>><%=trim(rs3("bigname"))%></option>
        <%
        rs3.movenext
        loop
	end if
        rs3.close
%>
      </select>
小类：
<select name="smallid" class="wenbenkuang">
  <%rs3.open "select * from pro_small where bigid="&rs("bigid") ,conn,1,1
do while not rs3.eof%>
  <option value="<%=rs3("smallid")%>" <%if rs3("smallid")=rs("smallid") then%>selected<%end if%>><%=rs3("smallname")%></option>
  <% rs3.movenext
loop
        rs3.close
        set rs3 = nothing
        
%>
</select></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品小图：</td>
    <td bgcolor="#FFFFFF"><input name="prosmallpic" type="text" id="prosmallpic" value="<%=rs("prosmallpic")%>">
        <input name="Submit222" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=prosmallpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品大图：</td>
    <td bgcolor="#FFFFFF"><input name="probigpic" type="text" id="probigpic" value="<%=rs("probigpic")%>">
        <input name="Submit22" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=probigpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">市场价：</td>
    <td bgcolor="#FFFFFF"><input name="marketprice" type="text" id="marketprice" value="<%=rs("marketprice")%>" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">重要客户价：</td>
    <td bgcolor="#FFFFFF"><input name="svipprice" type="text" id="svipprice" value="<%=rs("svipprice")%>" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">一般重要客户价：</td>
    <td bgcolor="#FFFFFF"><input name="vipprice" type="text" id="vipprice" value="<%=rs("vipprice")%>" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">一般客户价：</td>
    <td bgcolor="#FFFFFF"><input name="userprice" type="text" id="userprice" value="<%=rs("userprice")%>" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品简介：</td>
    <td bgcolor="#FFFFFF"><textarea name="procontent" style="display:none"><%=rs("procontent")%></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=procontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
      <input name="Submit" type="submit" class="go" value="提交">    </td>
  </tr>
</table>
</form>
<%rs.close:set rs=nothing%>
</body>
</html>
