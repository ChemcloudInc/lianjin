<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="inc/conn.asp"-->
<style type="text/css">
<!--
body,td,th {
font-family: Arial,;
}
-->
</style>
<!--#include file="function.asp"-->
<!--#include file="config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�˹��µ�</title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<%action=srequest(trim(request("action")),0)
superkey=srequest(trim(request("superkey")),0)%>
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="7"><img src="images/wz1.jpg" width="7" height="29" /></td>
    <td background="images/wz2.jpg">��ǰλ�ã��� &gt; �˹��µ�</td>
    <td width="5"><img src="images/wz3.jpg" width="5" height="29" /></td>
  </tr>
</table>
<div class="web_k"></div>
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="100" align="left" valign="top">	

	<form id="form2" name="form2" method="post" action="superorder.asp?action=quick">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="45%" height="55" align="right">�������Ʒ�ͺţ�</td>
        <td width="200" align="center">
          <input name="superkey" type="text" class="input" id="superkey" /></td>
        <td><input type="submit" name="Submit" value="����" /></td>
      </tr>
    </table>
	</form>
	<%
	if action="quick" then%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="cccccc">
  <tr align="center">
    <td width="17%" height="25" bgcolor="f0f0f0">�ͺ�</td>
    <td width="45%" bgcolor="f0f0f0">����</td>
    <td width="11%" bgcolor="f0f0f0">����</td>
    <td width="10%" bgcolor="f0f0f0">����</td>
    <td width="9%" bgcolor="f0f0f0">С��</td>
    <td width="8%" bgcolor="f0f0f0">ѡ��</td>
  </tr>
 <form name="formqq" method="post" action=""> 
  	 <%
	 set rs=server.createobject("adodb.recordset")
  if action="" then
sql="select proname,bigid,smallid,c3id,marketprice,svipprice,vipprice,userprice,classname,addtime,cnname from product,proid order by proid desc"
else
sql="select proname,bigid,smallid,c3id,marketprice,svipprice,vipprice,userprice,classname,addtime,proid,cnname from product where 1=1"
if superkey<>"" then
sql=sql & " and proname like '%"&superkey&"%' or cnname like '%"&superkey&"%' "
end if
sql=sql & " order by proid desc"

end if
    rs.open sql,conn,1,1
	if rs.eof and rs.bof then%>
  <tr>
    <td height="25" bgcolor="#FFFFFF" colspan="6">���޼�¼</td>
   </tr>
  <%
  else
      rs.pagesize=200
      page = cint(request("page"))
      if page = "" then page = 1
      if not(isnumeric(page)) then page=1
      if page<1 then page=1
      if page >= rs.pagecount then page = rs.pagecount
      rs.absolutepage = page
      for j=1 to rs.PageSize 
  %>
<tr align="center" bgcolor="ffffff">
<td height="25">
<a href="prodetails.asp?proid=<%=rs("proid")%>&bigid=<%=rs("bigid")%>&smallid=<%=rs("smallid")%>" target="_blank" title="<%=rs("cnname")%>"><%=rs("proname")%></a></td>
<td height="25">
	
<table width="100%" border="0" cellspacing="1" cellpadding="0">
<%proid=rs("proid")%>
<%sqlb="select * from shuxingtype where proid="&proid&" order by sxid"
set rsb=conn.execute(sqlb)
if not rsb.eof then
q=1
do while not rsb.eof%>
<tr title="�ͺ�ΪĬ��ֵ����ȷ�ϻ���ѡ��Ϊ�Լ�����Ҫ�ͺ�">
<td width="70" height="35" align="right"><%=rsb("sxname")%>��</td>
<td align="left">
<%sqlbb="select * from shuxingvalue where sxid="&rsb("sxid")&" order by vaid"
set rsbb=conn.execute(sqlbb)
if not rsbb.eof then
qq=1
do while not rsbb.eof%>
<%if rsb("xxtype")=true then%>
<input name="vaid<%=q%>a<%=proid%>" type="checkbox" id="vaid<%=q%>a<%=proid%>" value="<%=rsbb("valuename")%>"> 
<%=rsbb("valuename")%> 
<%else%>
<input type="radio" name="vaid<%=q%>a<%=proid%>" <%if qq=1 then%> checked="checked" <%end if%> value="<%=rsbb("valuename")%>"> 
<%=rsbb("valuename")%> 
<%end if%>
<%rsbb.movenext
qq=qq+1
loop
end if
rsbb.close:set rsbb=nothing%>
</td>
</tr>
<%rsb.movenext
q=q+1
loop
end if
rsb.close:set rsb=nothing%>
</table>	
	
</td>
<td><%select case request.Cookies("userdengji")
		case ""
		response.Write("<span style='color:#FF6600; font-weight:bold;'>��"&RS("marketprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("marketprice")&" />")
		case "��Ҫ�ͻ�"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>��"&RS("svipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("svipprice")&" />")
		case "һ����Ҫ�ͻ�"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>��"&RS("vipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("vipprice")&" />")
		case "һ��ͻ�"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>��"&RS("userprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("userprice")&" />")
		end select%></td>
    <td>Ĭ�ϣ�1��</td>
    <td><%select case request.Cookies("userdengji")
		case ""
		response.Write("��"&RS("marketprice")&"<input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("marketprice")&" />")
		case "��Ҫ�ͻ�"
		response.Write("��"&RS("svipprice")&"<input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("svipprice")&" />")
		case "һ����Ҫ�ͻ�"
		response.Write("��"&RS("vipprice")&"<input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("vipprice")&" />")
		case "һ��ͻ�"
		response.Write("��"&RS("userprice")&"<input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&RS("userprice")&" />")
		end select%></td>
    <td>
      <input type="checkbox" name="proid" value="<%=rs("proid")%>">    </td>
  </tr>
  	     <%
        rs.movenext
        if rs.eof then exit for
        next
       
      %>
	  <tr><td height="30" align="right" bgcolor="ffffff" colspan="6"><input type="checkbox" name="chkall" value="on" onClick="checkall(this)">&nbsp;ȫѡ &nbsp;&nbsp;<input name="btnDelete" type="button" class="go" onClick="del()" value="һ������">&nbsp;</td>
	  </tr>
</form>	  
	  <tr><td height=25 colspan="7" align=center bgcolor="ffffff">Total Records<%=rs.recordcount%>&nbsp; <%=page%>/<%=rs.pagecount%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A href="<%request.servervariables("document_name")%>?page=<%=page-1%>&action=<%=action%>&superkey=<%=superkey%>">Privet</A> <A href="<%request.servervariables("document_name")%>?page=<%=page+1%>&action=<%=action%>&superkey=<%=superkey%>">Next</A>&nbsp;&nbsp;&nbsp; Turn to page
          <SELECT onChange="window.location='?action=<%=action%>&superkey=<%=superkey%>&page='+this.value" name=gopage>
            <%for x=1 to rs.pagecount%>
            <OPTION <%if x=page then%>selected<%end if%> value=<%=x%>><%=x%></OPTION>
            <%next%>
          </SELECT>
 </td></tr>
<%
 end if
%>
</table>
	<br />
	<%end if%>	</td>
  </tr>
</table>
	<table width="1179" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="cccccc">
      <tr>
        <td height="30" bgcolor="#F0F0F0" style="font-weight:bold;">&nbsp;�Ѷ�����Ʒ�б�</td>
      </tr>
<tr>
<td height="560" align="center" bgcolor="#FFFFFF" style="padding:5px;">
<iframe frameBorder="0" id="left" name="left" scrolling=auto src="supergouwu.asp?action=addall" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 1160px; Z-INDEX: 2">
</iframe></td>
      </tr>
</table>
<!--#include file="copy.asp"-->
<script>
����function del () //�����жϼ�¼��û��ѡ�еĺ���
����{
����var flag=true;
����var temp="";
����var tmp;
����if((document.formqq.proid.length+"")=="undefined") {tmp=1}else{tmp=document.formqq.proid.length}
����if (tmp==1){
����if (document.formqq.proid.checked){
����flag=false;
����temp=document.formqq.proid.value
����}
����}else{
����for (i=0;i<document.formqq.proid.length;i++) {
����if (document.formqq.proid[i].checked){
����if (temp==""){
����flag=false;
����temp=document.formqq.proid[i].value
����}else{
����flag=false;
����temp = temp +","+ document.formqq.proid[i].value
����}
����}
����}
����}
����if (flag){ alert("�Բ����㻹û��ѡ���κμ�¼��")}
����else{ name=document.formqq.name.value
����//alert(name)
����if (confirm("һ������Ĭ�ϵ�����Ʒ����������1�����뵽���ﳵ��ȥ�޸�")){

document.formqq.action="save_super.asp?action=addall&id=" + temp;
 
document.formqq.submit();

��//��window.location="save_super.asp?action=addall&id=" + temp;
����}
����}
����return !flag;
����}
����</script>
<script language=Javascript>
function checkall(all)//�����ж�ȫѡ��¼�ĺ���
{
var a = document.getElementsByName("proid");
for (var i=0; i<a.length; i++) a[i].checked = all.checked;
}
</script>

</body>
</html>