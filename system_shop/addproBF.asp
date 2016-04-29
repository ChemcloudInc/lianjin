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
if action="add" then
if trim(request("proname"))="" then
response.Write "<script language=javascript>alert('产品名称不能为空!');window.location.href='addpro.asp';</script>"
response.end
end if
sql="select * from product"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
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
rs("addtime")=now()
rs("hits")=0
rs.update
rs.close:set rs=nothing
proid=conn.execute("select top 1 proid from product order by proid desc")(0)
'call cncreateprodet(proid)
'call encreateprodet(proid)
response.Write "<script language=javascript>alert('添加成功!');window.location.href='addpro.asp';</script>"

end if
%>

<form name="form2" method="post" action="addpro.asp?action=add">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="A4B6D7">
  <tr>
    <td height="25" colspan="2" align="center" background="images/titlebg.gif" bgcolor="f0f0f0">添加产品</td>
  </tr>
  <tr>
    <td width="12%" height="25" align="center" bgcolor="#FFFFFF">产品名称：</td>
    <td width="88%" bgcolor="#FFFFFF"><input name="proname" type="text" size="50"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">所属分类：</td>
    <td bgcolor="#FFFFFF"><%
	set rs=server.CreateObject("adodb.recordset")
        rs.open "select * from pro_big order by bigid",conn,1,1
	if rs.eof and rs.bof then
	response.write "请先添加商品分类。"
	response.end
	else
%>
大类：
  <select name="bigid" size="1" id="bigid" onChange="changelocation(document.form2.bigid.options[document.form2.bigid.selectedIndex].value)">
    <option selected value="<%=rs("bigid")%>"><%=trim(rs("bigname"))%></option>
    <%      dim selclass
         selclass=rs("bigid")
        rs.movenext
        do while not rs.eof
%>
    <option value="<%=rs("bigid")%>"><%=trim(rs("bigname"))%></option>
    <%
        rs.movenext
        loop
	end if
        rs.close
%>
  </select>
小类：
<select name="smallid">
  <%rs.open "select * from pro_small where bigid="&selclass ,conn,1,1
if not(rs.eof and rs.bof) then
%>
  <option selected value="<%=rs("smallid")%>"><%=rs("smallname")%></option>
  <% rs.movenext
do while not rs.eof%>
  <option value="<%=rs("smallid")%>"><%=rs("smallname")%></option>
  <% rs.movenext
loop
end if
        rs.close
        set rs = nothing
%>
</select></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品小图：</td>
    <td bgcolor="#FFFFFF"><input name="prosmallpic" type="text" id="prosmallpic">
      <input name="Submit222" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=prosmallpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品大图：</td>
    <td bgcolor="#FFFFFF"><input name="probigpic" type="text" id="probigpic">
      <input name="Submit22" type="button" class="go" onClick="window.open('carson52001.asp?formname=form2&editname=probigpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">市场价：</td>
    <td bgcolor="#FFFFFF"><input name="marketprice" type="text" id="marketprice" value="" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">重要客户价：</td>
    <td bgcolor="#FFFFFF"><input name="svipprice" type="text" id="svipprice" value="" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">一般重要客户价：</td>
    <td bgcolor="#FFFFFF"><input name="vipprice" type="text" id="vipprice" value="" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">一般客户价：</td>
    <td bgcolor="#FFFFFF"><input name="userprice" type="text" id="userprice" value="" size="60"></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#FFFFFF">产品简介：</td>
    <td bgcolor="#FFFFFF"><textarea name="procontent" style="display:none"></textarea>
<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=procontent" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:600px"></iframe></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
      <input name="Submit" type="submit" class="go" value="提交">    </td>
  </tr>
</table>
</form>
</body>
</html>
