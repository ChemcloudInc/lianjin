<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ݲ�ѯ��ת</title>
</head>

<body>
<%kuaidi=trim(request("kuaidi"))
if kuaidi="" then
response.Write "<script language=javascript>alert('��ѡ���ݹ�˾');window.location.href='index.asp';</script>"
response.End()
end if

select case kuaidi
case "Բͨ"
response.Redirect("http://www.yto.net.cn")
case "��ͨ"
response.Redirect("http://www.zto.cn")
case "�ٶ�"
response.Redirect("http://www.sure56.com")
case "�ϴ�"
response.Redirect("http://www.yundaex.com")
case "˳��"
response.Redirect("http://www.sf-express.com")
case "����"
response.Redirect("http://www.cre.cn")
end select%>
</body>
</html>
