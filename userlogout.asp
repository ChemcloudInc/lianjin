<%
session("userloginname")=""
response.Cookies("userloginname")=""
response.Redirect("index.asp")
%>