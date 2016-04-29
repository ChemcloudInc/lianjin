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

<%
proid=srequest(trim(request("proid")),1)
bigid=srequest(trim(request("bigid")),1)
bigname=conn.execute("select * from pro_big where bigid="&bigid&"")("bigname")
smallid=srequest(trim(request("smallid")),1)
smallname=conn.execute("select * from pro_small where smallid="&smallid&"")("smallname")
sqlp="select * from product where proid="&proid
set rsp=conn.execute(sqlp)
if not rsp.eof then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsp("proname")%></title>
<link href="inc/css.css" type="text/css" rel="stylesheet">
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>
function $(e){
return document.getElementById(e);
}
function abdc(){
	var sl=$('shuliang').value;
		sl=parseInt(sl)+1;
		$('shuliang').value=sl;
		//$('ccc').innerHTML=sl*150;
}
function abdce(){
	var sl=$('shuliang').value;
		if (sl>0){
			sl=parseInt(sl)-1;
		}
		$('shuliang').value=sl;
		//$('ccc').innerHTML=sl*150;
}
</script>
</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="7"><img src="images/wz1.jpg" width="7" height="29" /></td>
    <td background="images/wz2.jpg">当前位置：首 &gt; 产品中心 > <%=bigname%>  > <%=smallname%> > <%=rsp("proname")%>
	</td>
    <td width="5"><img src="images/wz3.jpg" width="5" height="29" /></td>
  </tr>
</table>
<div class="web_k"></div>

<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="226" height="555" align="left" valign="top"><!--#include file="pro_left.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/det1.jpg" width="983" height="32" /></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="350" height="260" align="center" style="border:1px solid #E9E9E9;"><img src="<%=rsp("probigpic")%>" onload="makesmallpic(this,300,300)" /></td>
          <td>
		  <form id="form222" name="form222" method="post" action="gouwu.asp?action=add&proid=<%=rsp("proid")%>">
		  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="35" class="font14">产品名称：<span style="font-size:18px; font-weight:bold;"><%=rsp("proname")%></span></td>
            </tr>
            <tr>
              <td height="35" class="font14">所属类别：<%=bigname%> - <%=smallname%></td>
            </tr>
            <tr>
              <td height="35" class="font14">市 场 价：<span style="color:#FF6600; font-weight:bold;">￥<%=rsp("marketprice")%></span></td>
            </tr>
			<%if request.Cookies("userdengji")<>"" then%>
            <tr>
              <td height="35" class="font14">您的价格：<%select case request.Cookies("userdengji")
		case ""
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("marketprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("marketprice")&" />")
		case "重要客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("svipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("svipprice")&" />")
		case "一般重要客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("vipprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("vipprice")&" />")
		case "一般客户"
		response.Write("<span style='color:#FF6600; font-weight:bold;'>￥"&rsp("userprice")&"</span><input name=""yourprice"" type=""hidden"" id=""yourprice"" value="&rsp("userprice")&" />")
		end select%>
	            		</td>
            </tr>
			<%end if%>
          </table>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="ECD283">
              <tr>
                <td bgcolor="FEFCE5" class="padall"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="60">我要购买</td>
                    <td width="70"><a href="javascript:abdce();">-</a>
<input id="shuliang" name="shuliang" value="1" size="4" />
<a href="javascript:abdc();">+</a></td>
                    <td>件</td>
                  </tr>
                </table></td>
              </tr>
            </table>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100"><!--<img src="images/btnbuy.jpg" width="127" height="39" />--><input type="image" src="images/btncar.jpg" width="127" height="39" border="0" /></td>
              </tr>
            </table>
			</form>
			</td>
        </tr>
      </table>
	  <div class="con_k"></div>
	  

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="82"><img src="images/p1.jpg" width="82" height="35" /></td>
          <td background="images/p2.jpg">&nbsp;</td>
          <td width="9"><img src="images/p3.jpg" width="9" height="35" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="border-left:1px solid #D3D3D3; border-right:1px solid #D3D3D3; padding:10px; line-height:200%"><%=rsp("procontent")%></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/p4.jpg" width="983" height="6" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
<%end if
rsp.close:set rsp=nothing%>