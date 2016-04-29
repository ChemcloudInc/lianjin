<link href="site_css.css" rel="stylesheet" type="text/css">
<%
function htmlencode(str)
htmlencode=replace(replace(replace(str,chr(13),"<br>"),"'","''"),chr(32),"&nbsp;")
end function
%>
<%
function modifycode(str)
modifycode=replace(replace(replace(str,"<br>",chr(13)),"'","''"),"&nbsp;",chr(32))
end function
%>
<%
function Limitwords(rstype,ziduan,znum)		'rs类型,字段名称,限制的字数目
if len(trim(rstype(""&ziduan&"")))>znum then%>
<%=left(trim(rstype(""&ziduan&"")),znum)%>
<%else%>
<%=trim(rstype(""&ziduan&""))%>
<%end if%>

<%end function%>
<%
Function OutHtml(str)	'提取html中文字函数
    dim a,re
    set re=new RegExp
    re.pattern="<.*?>"
    re.global=true
    a=str
    OutHtml=re.replace(a,"")
    OutHtml=replace(OutHtml,"&nbsp;","")
    OutHtml=replace(OutHtml," ","")
End Function

startime=timer()
UserAgent = Trim(Lcase(Request.Servervariables("HTTP_USER_AGENT")))
If InStr(UserAgent,"teleport") > 0 or InStr(UserAgent,"webzip") > 0 or InStr(UserAgent,"flashget")>0 or InStr(UserAgent,"offline")>0 Then
	Response.Write "请不要采用teleport/Webzip/Flashget/Offline等工具来浏览商城！"
	Response.End
End If

Session.Timeout=15
if request("b_rules")=1 then
Response.Buffer = True
else
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
end if

startime=timer()
Dim SqlDatabaseName,SqlPassword,SqlUsername,SqlLocalName

'SqlLocalName   ="61.152.188.148"     '本地用SQL数据库服务器
'SqlUsername    ="sq_yuanlin"          '用户名
'SqlPassword    ="yuanlin"            '用户密码
'SqlDatabaseName="sq_yuanlin"           '数据库名

SqlLocalName   ="(local)"     '本地用SQL数据库服务器
SqlUsername    ="SA"          '用户名
SqlPassword    ="qdrqflnzwuvk"            '用户密码
SqlDatabaseName="huagong"           '数据库名


ConnStr = "Provider=Sqloledb; User ID=" & SqlUsername & "; Password=" & SqlPassword & "; Initial Catalog = " & SqlDatabaseName & "; Data Source=" & SqlLocalName & ";"
	ON ERROR RESUME NEXT
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.open ConnStr

	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "data wrong!"
	
	Response.End
	End If 

	Function srequest(ParaName,ParaType) 
	Dim ParaValue 
	ParaValue=ParaName 
	If ParaType=1 then 
		If not isNumeric(ParaValue) then 
			Response.write "参数" & ParaName & "必须为数字型！" 
			Response.end 
		End if 
    else
	    ParaValue=replace(ParaValue,"'","''")
		ParaValue=replace(ParaValue,"'","’")
		ParaValue=replace(ParaValue,";","；")
		ParaValue=replace(ParaValue,">","》")
		ParaValue=replace(ParaValue,"<","《")
		ParaValue=replace(ParaValue,"=","＝")
		ParaValue=replace(ParaValue,"%","％")
		ParaValue=replace(ParaValue,",","，")
		ParaValue=replace(ParaValue,".","。")
		ParaValue=replace(ParaValue,"@","￥")
		ParaValue=replace(ParaValue,"*","＊")
		ParaValue=replace(ParaValue,"?","？")
		ParaValue=replace(ParaValue,"(","（")
		ParaValue=replace(ParaValue,")","）")
		ParaValue=replace(ParaValue,"#","＃")
		ParaValue=replace(ParaValue,"!","！")
		ParaValue=Lcase(ParaValue)
		If Instr(ParaValue,"select") or Instr(ParaValue,"<") or Instr(ParaValue,">") or Instr(ParaValue,"insert") or Instr(ParaValue,"delete") or Instr(ParaValue,"count(") or Instr(ParaValue,"table") or Instr(ParaValue,"update") or Instr(ParaValue,"truncate") or Instr(ParaValue,"asc(") or Instr(ParaValue,"mid(") or Instr(ParaValue,"char(") or Instr(ParaValue,"xp_cmdshell") or Instr(ParaValue,"exec%20master") or Instr(ParaValue,"net%20localgroup%20administrators")  or Instr(ParaValue,":") or Instr(ParaValue,"net%20user") or Instr(ParaValue,"'") or Instr(ParaValue,"%20or%20") then
            Response.write "参数" & ParaName & "有问题！" 
			Response.end 
	    end if
	    ParaValue=replace(ParaValue,"'","''")
	    ParaValue=replace(ParaValue,"%","")
	End if 
	srequest=ParaValue
	End function
%>
<%function time_out()
session("admin_name")=request.Cookies("seomanager")("admin_name")
if session("admin_name")="" then
response.Redirect("login.asp")
response.end
end if
end function

'前台会员
function usertime_out()
session("userloginname")=request.Cookies("userloginname")
if session("userloginname")="" then
response.Redirect("default.asp")
response.end
end if
end function

'权限设置 
function chkflag(flagtype)
if instr(request.Cookies("userflag"),flagtype)=0 then
response.Write "<script LANGUAGE='javascript'>alert('您无权操作该项！');history.go(-1);</script>"
   response.end
end if
end function
%>

<%
Function RegExpTest(patrn,strng)
   Dim regEx, Match, Matches   ' 建立变量。
   Set regEx = New RegExp   ' 建立正则表达式。
   regEx.Pattern = patrn   ' 设置模式。
   regEx.IgnoreCase = True   ' 设置是否区分大小写。
   regEx.Global = True   ' 设置全局替换。
   Set Matches = regEx.Execute(strng)   ' 执行搜索。
   For Each Match in Matches   ' 遍历 Matches 集合。
      RetStr = RetStr  &  Match.Value
   Next
   RegExpTest = RetStr
End Function
%>
