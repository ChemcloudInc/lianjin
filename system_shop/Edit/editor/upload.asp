<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
on error resume next
Server.ScriptTimeOut=5000
%>
<!--#include file="UpLoadClass.asp"-->
<%
if Request.QueryString("action")="upload" then
dim MyRequest,lngUpSize,SavePath
SavePath="../uploadfile/" '����ͼƬ�ϴ�Ŀ¼�����������·����
SavePath=replace(SavePath,"\","/")
Set MyRequest=new UpLoadClass
MyRequest.SavePath=SavePath

'�ж��ϴ�Ŀ¼�Ƿ���ڣ����������Զ�����
FolderPath=server.MapPath(SavePath)
Set FSO=Server.CreateObject("Scripting.FileSystemObject")
if FSO.FolderExists(FolderPath)=false then
FSO.CreateFolder(FolderPath)
end if
Set FSO=nothing

'ȡ�õ�ǰ�ļ�����Ŀ¼
FileName=Right(Request.Servervariables("Script_Name"),len(Request.Servervariables("Script_Name"))-InstrRev(Request.Servervariables("Script_Name"),"/"))
FileFolder=replace(Request.Servervariables("Script_Name"),FileName,"") 

'��ȡͼƬ��ַ�ĸ�����·��
if left(SavePath,1)="/" then
PicturePath=SavePath
else
PicturePath=FileFolder&SavePath
end if

lngUpSize = MyRequest.Open()
  select case MyRequest.error
         case 0
		 response.Write("<script>window.parent.LoadIMG('"&PicturePath&MyRequest.form("file1")&"');</script>")
         case 1
		 response.Write("<script>alert('�ļ�����');window.parent.$('divProcessing').style.display='none';history.back();</script>")
		 case 2
		 response.Write("<script>alert('�������ϴ������͵��ļ���');window.parent.$('divProcessing').style.display='none';history.back();</script>")
         case 3
		 response.Write("<script>alert('�������ϴ������͵��ļ���');window.parent.$('divProcessing').style.display='none';history.back();</script>")
		 case else
		 response.Write("<script>alert('�ļ��ϴ�����');window.parent.$('divProcessing').style.display='none';history.back();</script>")
  end select
end if
%>