<%
hps=50

dim sU_r 
dim sS_r
sS_r = "http://"
sU_r = Split(Request.ServerVariables("SERVER_NAME")&Request.ServerVariables("script_name"),"/")

for i=0 to ubound(sU_r)
	if i<ubound(sU_r) then
		sS_r = sS_r + sU_r(i) + "/"
	end if
next

indexmulu="."  

Function DeleteHtml(FileName)
FilePath=Server.MapPath(indexmulu)&"\"&FileName
Set objFSO = Server.CreateObject("Scripting.FileSystemObject") 
If objFSO.FileExists(FilePath) Then
    objFSO.DeleteFile FilePath,True
end if

Set objFSO = Nothing

end function 

    
Function htmll(mulu,htmlmulu,FileName,filefrom,vena,venb,venc,vend)

if htmlmulu="" then htmlmulu=""

if mulu="" then 
mulu=indexmulu&mulu
FilePath=Server.MapPath(mulu)&"\"&FileName
else
mulu=Server.MapPath(indexmulu)&mulu
FilePath=mulu&"\"&FileName
end if

htmlmulu=indexmulu&htmlmulu

Do_Url=sS_r&filefrom
Do_Url=Do_Url&"?"&vena&venb&"&"&venc&vend
strUrl=Do_Url

set objXmlHttp=Server.createObject("Microsoft.XMLHTTP")
objXmlHttp.open "GET",strUrl,false
objXmlHttp.send()
binFileData=objXmlHttp.responseBody
Set objXmlHttp=Nothing
set objAdoStream=Server.createObject("ADODB.Stream")
objAdoStream.Type=1
objAdoStream.Open()
objAdoStream.Write(binFileData)
objAdoStream.SaveToFile FilePath,2
objAdoStream.Close()
set objAdoStream=nothing
End Function


function Readfile(filepath)
on error resume next 
dim srmObj 
set srmObj =server.createobject("ADODB.Stream")
srmObj.type=1 
srmObj.mode=3 
srmObj.open 
srmObj.Position=0 
srmObj.LoadFromFile filepath 

srmObj.Position = 0 
srmObj.type=2 
srmObj.charset="gb2312"  
Readfile=srmObj.readtext() 

srmObj.Close()
set srmObj = nothing

end function 

function Writefile(filepath,binFileData) 
on error resume next 
set objAdoStream=Server.createObject("ADODB.Stream")
objAdoStream.type=1 
objAdoStream.mode=3 
objAdoStream.open 
objAdoStream.Position=0 
objAdoStream.LoadFromFile binFileData 

'objAdoStream.Type=1
'objAdoStream.charset="uft-8" 
objAdoStream.Open()
'objAdoStream.Write(binFileData)
objAdoStream.SaveToFile filepath,2
objAdoStream.Close()
set objAdoStream=nothing
end function 

%>