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
function Limitwords(rstype,ziduan,znum)		'rs����,�ֶ�����,���Ƶ�����Ŀ
if len(trim(rstype(""&ziduan&"")))>znum then%>
<%=left(trim(rstype(""&ziduan&"")),znum)%>
<%else%>
<%=trim(rstype(""&ziduan&""))%>
<%end if%>

<%end function%>
<%
Function OutHtml(str)	'��ȡhtml�����ֺ���
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
	Response.Write "�벻Ҫ����teleport/Webzip/Flashget/Offline�ȹ���������̳ǣ�"
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

'SqlLocalName   ="61.152.188.148"     '������SQL���ݿ������
'SqlUsername    ="sq_yuanlin"          '�û���
'SqlPassword    ="yuanlin"            '�û�����
'SqlDatabaseName="sq_yuanlin"           '���ݿ���

SqlLocalName   ="(local)"     '������SQL���ݿ������
SqlUsername    ="SA"          '�û���
SqlPassword    ="qdrqflnzwuvk"            '�û�����
SqlDatabaseName="huagong"           '���ݿ���


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
			Response.write "����" & ParaName & "����Ϊ�����ͣ�" 
			Response.end 
		End if 
    else
	    ParaValue=replace(ParaValue,"'","''")
		ParaValue=replace(ParaValue,"'","��")
		ParaValue=replace(ParaValue,";","��")
		ParaValue=replace(ParaValue,">","��")
		ParaValue=replace(ParaValue,"<","��")
		ParaValue=replace(ParaValue,"=","��")
		ParaValue=replace(ParaValue,"%","��")
		ParaValue=replace(ParaValue,",","��")
		ParaValue=replace(ParaValue,".","��")
		ParaValue=replace(ParaValue,"@","��")
		ParaValue=replace(ParaValue,"*","��")
		ParaValue=replace(ParaValue,"?","��")
		ParaValue=replace(ParaValue,"(","��")
		ParaValue=replace(ParaValue,")","��")
		ParaValue=replace(ParaValue,"#","��")
		ParaValue=replace(ParaValue,"!","��")
		ParaValue=Lcase(ParaValue)
		If Instr(ParaValue,"select") or Instr(ParaValue,"<") or Instr(ParaValue,">") or Instr(ParaValue,"insert") or Instr(ParaValue,"delete") or Instr(ParaValue,"count(") or Instr(ParaValue,"table") or Instr(ParaValue,"update") or Instr(ParaValue,"truncate") or Instr(ParaValue,"asc(") or Instr(ParaValue,"mid(") or Instr(ParaValue,"char(") or Instr(ParaValue,"xp_cmdshell") or Instr(ParaValue,"exec%20master") or Instr(ParaValue,"net%20localgroup%20administrators")  or Instr(ParaValue,":") or Instr(ParaValue,"net%20user") or Instr(ParaValue,"'") or Instr(ParaValue,"%20or%20") then
            Response.write "����" & ParaName & "�����⣡" 
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

'ǰ̨��Ա
function usertime_out()
session("userloginname")=request.Cookies("userloginname")
if session("userloginname")="" then
response.Redirect("default.asp")
response.end
end if
end function

'Ȩ������ 
function chkflag(flagtype)
if instr(request.Cookies("userflag"),flagtype)=0 then
response.Write "<script LANGUAGE='javascript'>alert('����Ȩ�������');history.go(-1);</script>"
   response.end
end if
end function
%>

<%
Function RegExpTest(patrn,strng)
   Dim regEx, Match, Matches   ' ����������
   Set regEx = New RegExp   ' ����������ʽ��
   regEx.Pattern = patrn   ' ����ģʽ��
   regEx.IgnoreCase = True   ' �����Ƿ����ִ�Сд��
   regEx.Global = True   ' ����ȫ���滻��
   Set Matches = regEx.Execute(strng)   ' ִ��������
   For Each Match in Matches   ' ���� Matches ���ϡ�
      RetStr = RetStr  &  Match.Value
   Next
   RegExpTest = RetStr
End Function
%>
