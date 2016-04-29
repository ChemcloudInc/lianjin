<!--#include file="../inc/conn.asp"-->
<%call time_out()%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>共用上传图片</title>
</head>

<body>
<script language="javascript">
<!--
function checkform()
{
document.form1.picadds.value="http://cambridgechemicals.com/" + document.form1.publicpic.value;
document.form1.picadds.select();
}
//-->
</script>

<form name="form1" method="post" action="publicupload.asp?action=up">
<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" align="center">共用上传图片</td>
  </tr>
  <tr>
    <td height="30" align="center">上传图片：</td>
    <td><input name="publicpic" type="text" id="publicpic">
      <input name="Submit22" type="button" class="go" onClick="window.open('carson52001.asp?formname=form1&editname=publicpic&uppath=bookpic&filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" value="上传图片"></td>
  </tr>
  <tr>
    <td height="35" align="center">图片地址：</td>
    <td height="35"><input name="picadds" type="text" size="40" onClick="return checkform();"></td>
  </tr>
</table>
</form>
</body>
</html>
