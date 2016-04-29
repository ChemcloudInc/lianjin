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
<%webtitle=conn.execute("select sitename from baseset")(0)%>
<title><%=webtitle%></title>
<LINK href="inc/css.css" rel="stylesheet">
</head>
<LINK rel=stylesheet type=text/css href="css/lanrenxixi.css">
<SCRIPT type=text/javascript src="js/jquery.js"></SCRIPT>
<SCRIPT type=text/javascript src="js/lanrentuku.js"></SCRIPT>
<SCRIPT type=text/javascript src="inc/web.js"></SCRIPT>
<SCRIPT language=javascript src="changimages.js"></SCRIPT>

<body>
<!--#include file="top.asp"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td background="images/a2.jpg">&nbsp;</td>
<td width="1200" height="45">

<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0" background="images/index_29.jpg">
<tr>
<td width="130" height="45" align="center"><a href="index.html"><strong><font color="#FFFFFF" style="font-size:14px">Home</font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="160" height="45" align="center"><a href="about.html"><strong><font color="#FFFFFF" style="font-size:14px">About Us</font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="160" height="45" align="center"><a href="product.asp"><strong><font color="#FFFFFF" style="font-size:14px">Products</font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="170" height="45" align="center"><a href="custom.asp"><strong><font color="#FFFFFF" style="font-size:14px">Custom Synthesis </font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="170" height="45" align="center"><a href="instrument.html"><strong><font color="#FFFFFF" style="font-size:14px">Our Instrument</font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="170" height="45" align="center"><a href="service.html"><strong><font color="#FFFFFF" style="font-size:14px">Special Service</font></strong></a></td>
<td width="10" align="center"><img src="images/a3.jpg" width="1" height="23" /></td>
<td width="160" height="45" align="center"><a href="contact.html"><strong><font color="#FFFFFF" style="font-size:14px">Contact Us</font></strong></a></td>
<td width="20" align="center">&nbsp;</td>
</tr>
</table>

</td>
<td background="images/a1.jpg">&nbsp;</td>
</tr>
</table>


<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
   <td valign="top"  >
<div class="con_k"></div>
<table width="1200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="975">
<DIV id=imgADPlayer></DIV>
<SCRIPT> 
<%sql="select top 5 * from fztopads order by adsid"
set rs=conn.execute(sql)
if not rs.eof then
a=1
do while not rs.eof%>
PImgPlayer.addItem( "", "index.asp", "<%=rs("adspic")%>"); 
PImgPlayer.init( "imgADPlayer", 975, 244 );   

<%rs.movenext
a=a+1
loop
end if
rs.close:set rs=nothing%>
</SCRIPT>
</td>
<td width="225" align="right"><!--#include file="login_in.asp"--></td>
</tr>
</table>



<div class="con_k"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="8"><img src="images/index_73.jpg" width="8" height="29" alt="" /></td>
<td width="1184" background="images/index_74.jpg" class="titlestyle">Hot Products</td>
<td width="8"><img src="images/index_76.jpg" width="8" height="29" alt="" /></td>
</tr>
</table>

</td>
</tr>
<tr><td height="480" align="center" background="images/index_85.jpg" class="padtop padbot"><%call getindexpro(1,12)%></td>
</tr>
<tr><td><img src="images/index_123.jpg" width="1199" height="5" alt="" /></td>
</tr>
</table>

 
</td>
</tr>
</table>
<div class="con_k"></div>

<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td>

<table width="1200" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="100"><img src="images/index_125.jpg" width="100" height="34" alt="" /></td>
<td width="1095" background="images/index_126.jpg">&nbsp;</td>
<td width="5"><img src="images/index_128.jpg" width="5" height="34" alt="" /></td>
</tr>
</table>

</td>
</tr>
<tr><td height="251" class="tdcicle padall"><%call getindexpro(2,6)%></td>
</tr>
</table>
<!--#include file="copy.asp"-->
</body>
</html> 