<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--#include file="../inc/conn.asp"-->
<%call time_out()%>
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>Cambridge Chemicals</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="images/style.css" type=text/css rel=stylesheet>
<STYLE>.main_left {
TABLE-LAYOUT: auto; BACKGROUND: url(images/left_bg.gif)
}
.main_left_top {
BACKGROUND: url(images/left_menu_bg.gif); PADDING-TOP: 5px
}
.main_left_title {
PADDING-LEFT: 15px; FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #fff; TEXT-ALIGN: left
}
.left_iframe {
BACKGROUND: none transparent scroll repeat 0% 0%; VISIBILITY: inherit; WIDTH: 180px; HEIGHT: 92%
}
.main_iframe {
Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 92%
}
TABLE {
FONT-SIZE: 12px; font-family:Times New Roman, Times, serif;
}
TD {
FONT-SIZE: 12px; font-family:Times New Roman, Times, serif;
}
</STYLE>

<SCRIPT language=javaScript src="images/admin.js" type=text/javascript></SCRIPT>

<SCRIPT language=javascript src="images\Admin(1).js"></SCRIPT>

<SCRIPT>
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
 if (1 == window.status){
window.status = 0;
switchPoint.innerHTML = '<img src="images/left.gif">';
document.all("frmTitle").style.display="none"
 }
 else{
window.status = 1;
switchPoint.innerHTML = '<img src="images/right.gif">';
document.all("frmTitle").style.display=""
 }
}
</SCRIPT>
<%
sqlf="select count(*) from orders where zhuangtai='用户已下单' group by ordernum"
set rsf=conn.execute(sqlf)
if not rsf.eof then
nums=conn.execute("select count(distinct(ordernum)) from orders where zhuangtai='用户已下单'")(0)
else
nums=0
end if
%>
<SCRIPT language=Javascript>
document.writeln("<div id=\"msn\" style=\"BORDER-RIGHT:#455690 1px solid; BORDER-TOP:#a6b4cf 1px solid; Z-INDEX:99999; LEFT:0px;BORDER-LEFT:#a6b4cf 1px solid; WIDTH:180px; BORDER-BOTTOM:#455690 1px solid; POSITION:absolute; TOP:0px; HEIGHT:116px; BACKGROUND-COLOR:#c9d3f3\">");
document.writeln("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"BORDER-TOP:#ffffff 1px solid; BORDER-LEFT:#ffffff 1px solid\" bgcolor=\"#cfdef4\">");
document.writeln("<tr><td height=\"24\" width=\"26\" style=\"FONT-SIZE:12px;BACKGROUND-IMAGE:url(images/msgTopBg.gif);COLOR:#0f2c8c\" valign=\"middle\"><img src=\"images/msgLogo.gif\" hspace=\"5\" align=\"absMiddle\" vspace=\"1\"\/><\/td>");
document.writeln("<td style=\"FONT-WEIGHT:normal;FONT-SIZE:9pt;BACKGROUND-IMAGE:url(/jscss/demoimg/200904/msgTopBg.gif);COLOR:#1f336b;PADDING-TOP:4px\" valign=\"middle\" width=\"100%\"><\/td>");
document.writeln("<td style=\"BACKGROUND-IMAGE:url(/jscss/demoimg/200904/msgTopBg.gif);PADDING-TOP:2px\" valign=\"middle\" width=\"19\" align=\"right\"><img src=\"images/msgClose.gif\" hspace=\"3\" style=\"CURSOR:pointer\" onclick=\"closeDiv()\" title=\"Close\"\/><\/td>");
document.writeln("<\/tr><tr><td colspan=\"3\" height=\"90\" style=\"PADDING-RIGHT:1px;BACKGROUND-IMAGE:url(images/msgBottomBg.jpg);PADDING-BOTTOM:1px\">");
document.writeln("<div style=\"BORDER-RIGHT: #b9c9ef 1px solid; PADDING-RIGHT: 13px; BORDER-TOP: #728eb8 1px solid; PADDING-LEFT: 13px; FONT-SIZE: 9pt; PADDING-BOTTOM: 13px; BORDER-LEFT: #728eb8 1px solid; WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 18px; BORDER-BOTTOM: #b9c9ef 1px solid; HEIGHT: 100%\"><a href=\"index.asp\" style=\"FONT-WEIGHT:bold;COLOR:red\">>>Welcome !<\/a><br><br><a href=\"manage_order.asp\" target=\"frmright\" style=\"FONT-WEIGHT:bold;COLOR:blue\">>>New Orders（<%=nums%>）<\/a><\/div><\/div><\/tr><\/table><\/div>");
msn.style.top=document.body.clientHeight-174;
msn.style.left=document.body.clientWidth-225;
moveR();
function moveR() {
msn.style.top=document.body.scrollTop+document.body.clientHeight-116;
msn.style.left=document.body.scrollLeft+document.body.clientWidth-180;
setTimeout("moveR();",80)
}
function closeDiv(){
msn.style.visibility='hidden';
}
</SCRIPT>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY style="MARGIN: 0px">
<!--导航部分-->
<DIV class=top_table>
<DIV class=top_table_leftbg>
<DIV class=system_logo><IMG src="images/logo_up.gif"></DIV>
<DIV class=menu>
<UL>
<LI id=menu_0 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="#">Products</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="big_product.asp" target=frmright>First classification</A></LI>
<LI><A href="small_product.asp" target=frmright>Secondary classification</A></LI>
<LI><A href="product_class3.asp" target=frmright>Third classification</A></LI>
<LI><A href="addpro.asp" target=frmright>Add Product</A></LI>
<LI><A href="managepro.asp" target=frmright>Products List</A></LI>
</UL>
</DIV>

<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>
<LI id=menu_1 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="#">Orders List</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="manage_order.asp" target=frmright>All Orders</A></LI>
<LI><A href="manage_order2.asp" target=frmright>Unpay Orders</A></LI>
<LI><A href="manage_order1.asp" target=frmright>Payed Orders</A></LI>
<LI><A href="manage_order3.asp" target=frmright>Delete Orders</A></LI>
<LI><A href="fkfs.asp" target=frmright>Payment mode</A></LI>

</UL>
</DIV>

<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>
<LI id=menu_2 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="#">Users Manage</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="manageuser.asp" target=frmright>Users List</A></LI>
<LI><A href="user_add.asp" target=frmright>Add User</A></LI>
</UL>
</DIV>

<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>

<LI id=menu_3 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="#">News Manage</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="addnews.asp" target=frmright>Add News</A></LI>
<LI><A href="managenews.asp" target=frmright>News Manage</A></LI>
</UL>
</DIV>
 


<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>

<LI id=menu_4 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="#">Custom</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="synthesis.asp" target=frmright>Undeal Custom</A></LI>
<LI><A href="passsynthesis.asp" target=frmright>Dealed Custom</A></LI>
</UL>
</DIV>



<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>
<LI id=menu_5 onmouseover=Menus.Show(this,0) onclick=getleftbar(this);><A href="Finance.asp">System set</A> 
<DIV class=menu_childs onmouseout=Menus.Hide(0);>
<UL>
<LI><A href="manage_admin.asp" target=frmright>Set Administrator</A></LI>
<LI><A href="baseset.asp" target=frmright>Base Info</A></LI>
<LI><A href="about.asp" target=frmright>About Us</A></LI>
<LI><A href="service.asp" target=frmright>Special Service</A></LI>
<LI><A href="contact.asp" target=frmright>Contact Us</A></LI>
<LI><A href="instrument.asp" target=frmright>Our Instrument</A></LI>
<LI><A href="bankinfo.asp" target=frmright>Bank Info</A></LI>
<LI><A href="fiveads.asp" target=frmright>Three Picture in home</A></LI>
<LI><A href="jingtai.asp" target=frmright>Creat Html</A></LI>

</UL>
</DIV>
<DIV class=menu_div><IMG style="VERTICAL-ALIGN: bottom" src="images/menu01_right.gif"></DIV></LI>
 
</UL>

</DIV></DIV></DIV>
<DIV style="BACKGROUND: #337abb; HEIGHT: 24px"></DIV>

<!--导航部分结束-->
<TABLE style="BACKGROUND: #337abb" height="92%" cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD class=main_left id=frmTitle vAlign=top align=middle name="fmTitle">
<TABLE class=main_left_top cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR height=32>
<TD vAlign=top></TD>
<TD class=main_left_title id=leftmenu_title>Common shortcut function</TD>
<TD vAlign=top align=right></TD></TR></TBODY></TABLE><IFRAME class=left_iframe id=frmleft name=frmleft src="left.htm" frameBorder=0 allowTransparency></IFRAME>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR height=32>
<TD vAlign=top></TD>
<TD vAlign=bottom align=middle></TD>
<TD vAlign=top align=right></TD></TR></TBODY></TABLE></TD>
<TD style="WIDTH: 10px" bgColor=#337abb>
<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
<TBODY>
<TR>
<TD style="HEIGHT: 100%" onclick=switchSysBar()>
<SPAN class=navPoint id=switchPoint title=Close/Open Left><IMG src="images/right.gif"></SPAN> 
</TD>
</TR>
</TBODY>
</TABLE>

</TD>
<TD vAlign=top width="100%" bgColor=#337abb>
<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed 
border=0><TBODY>
<TR height=32>
<TD vAlign=top width=10 
background=images/bg2.gif><IMG alt="" 
src="images/teble_top_left.gif"></TD>
<TD width=28 
background=images/bg2.gif></TD>
<TD align="center" background=images/bg2.gif><SPAN style="FLOAT: left">Cambridge Chemicals - <%=request.Cookies("seomanager")("admin_name")%> &nbsp;&nbsp; Orders List-->My orders</SPAN>

<SPAN id=dvbbsannounce style="FONT-WEIGHT: bold; FLOAT: left; WIDTH: 300px; COLOR: #ff0000"></SPAN></TD>
<TD style="COLOR: #135294; TEXT-ALIGN: right" background=images/bg2.gif><a href="publicupload.asp" target="_blank">Total Picture</a> | <A href="#" target=_top>Home</A> 
| <A href="logout.asp" target=_top>Quit</A> </TD>
<TD vAlign=top align=right width=28 background=images/bg2.gif><IMG alt="" src="images/teble_top_right.gif"></TD>
<TD align=right width=16 bgColor=#337abb></TD>
</TR>
</TBODY>
</TABLE>
<IFRAME class=main_iframe id=frmright name=frmright src="images/syscome.htm" frameBorder=0 scrolling=yes></IFRAME>
<TABLE style="BACKGROUND: #c4d8ed" cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR>
<TD><IMG height=6 alt="" src="images/teble_bottom_left.gif" width=5></TD>
<TD align=right><IMG height=6 alt="" src="images/teble_bottom_right.gif" width=5></TD>
<TD align=right width=16 bgColor=#337abb>
</TD>
</TR>
</TBODY>
</TABLE>

</TD>
</TR>
</TBODY>
</TABLE>
<DIV id=dvbbsannounce_true style="DISPLAY: none"></DIV>
<SCRIPT language=JavaScript>
<!--
document.getElementById("dvbbsannounce").innerHTML = document.getElementById("dvbbsannounce_true").innerHTML;
//-->
</SCRIPT>
</BODY>
</HTML>