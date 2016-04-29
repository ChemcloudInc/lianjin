<%
response.Cookies("seomanager")("admin_name")=""
response.Cookies("userflag")=""
session("admin_name")=""
response.Redirect("login.asp")
%>