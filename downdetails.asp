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

<%downid=srequest(trim(request("downid")),1)
sqlh="select * from downloads where downid="&downid
set rsh=conn.execute(sqlh)
if not rsh.eof then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsh("downtitle")%></title>
<LINK href="inc/css.css" rel=stylesheet>

</head>

<body>
<!--#include file="top.asp"-->
<!--#include file="menu.asp"-->
<div class="web_k"></div>
<table width="1204" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="221" align="left" valign="top"><!--#include file="news_left.asp"--></td>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DADADA">
      <tr>
        <td height="113" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="32" background="images/h1.jpg">　当前位置：首 &gt; 下载中心 &gt; <%=rsh("downtitle")%></td>
          </tr>
        </table>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="91" align="center" background="images/h2.jpg" style="border-bottom:1px solid #D4D4D4; font-size:24px; font-weight:bold;"><%=rsh("downtitle")%></td>
            </tr>
            <tr>
              <td style="padding:10px; font-size:14px; line-height:200%;">下载地址：<a href="<%=rsh("downurl")%>" style="color:#0000CC; text-decoration:underline;">点击下载</a></td>
            </tr>
            <tr>
              <td style="padding:10px; font-size:14px; line-height:200%;">开发语言：<%=rsh("yuyan")%></td>
            </tr>
            <tr>
              <td style="padding:10px; font-size:14px; line-height:200%;">软件大小：<%=rsh("daxiao")%></td>
            </tr>
            <tr>
              <td style="padding:10px; font-size:14px; line-height:200%;"><%=rsh("downcontent")%></td>
            </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<!--#include file="copy.asp"-->

</body>
</html>
<%end if
rsh.close:set rsh=nothing%>