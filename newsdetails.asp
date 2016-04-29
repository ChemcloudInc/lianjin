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

<%newsid=srequest(trim(request("newsid")),1)
sqlh="select * from news where newsid="&newsid
set rsh=conn.execute(sqlh)
if not rsh.eof then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=rsh("newstitle")%></title>
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
            <td height="32" background="images/h1.jpg">　当前位置：首 &gt; 信息中心 &gt; <%=rsh("newstitle")%></td>
          </tr>
        </table>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="91" align="center" background="images/h2.jpg" style="border-bottom:1px solid #D4D4D4; font-size:24px; font-weight:bold;"><%=rsh("newstitle")%></td>
            </tr>
            <tr>
              <td style="padding:10px; font-size:14px; line-height:200%;"><%=rsh("newscontent")%></td>
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