<%set conn=server.createobject("adodb.connection") 
    strConnString = "Provider=Sqloledb.1;Password=yuanlin;Persist Security Info=True;database=sq_yuanlin;User ID=sa;Data Source=sq_yuanlin"
  
conn.Open strConnString


dim s,sql,filename,fs,myfile,x  
 

 
Set fs = server.CreateObject("scripting.filesystemobject")  
'--�������������ɵ�EXCEL�ļ������µĴ��  
filename = Server.MapPath("order.xls")  
'--���ԭ����EXCEL�ļ����ڵĻ�Delete��  
if fs.FileExists(filename) then  
    fs.DeleteFile(filename)  
end  if  
'--����EXCEL�ļ�  
set myfile = fs.CreateTextFile(filename,true)  
 
'Set rs = Server.CreateObject("ADODB.Recordset")  
'--�����ݿ��а�����ŵ�EXCEL�е����ݲ����  
'sql = "select * from Tb_Execl order by id desc"  
'rs.Open  sql,conn  
'StartTime = Request("StartTime")
'EndTime = Request("EndTime")
'StartEndTime = "AddTime between #"& StartTime &" 00:00:00# and #"& EndTime &" 23:59:59#"

strSql = "SELECT * FROM [dbo].[CLASS_USER] "
Set rstData =conn.execute(strSql)
if not rstData.EOF and not rstData.BOF then  
 
    dim  strLine,responsestr  
    strLine=""  
    For each x in rstData.fields  
        strLine = strLine & x.name & chr(9)  
   Next  
 
'--�����������д��EXCEL  
    myfile.writeline strLine  
 
    Do while Not rstData.EOF  
        strLine=""  
 
        for each x in rstData.Fields  
            strLine = strLine & x.value &  chr(9)  
        next  
        myfile.writeline  strLine  
 
        rstData.MoveNext  
    loop  
 
end if  

response.Write "����Excel�ļ��ɹ������"
Response.Write  "<a href='order.xls' target='_blank'>����</a>"
response.Write "&nbsp;&nbsp;"
response.Write "<a href='#' onclick='window.history.back()'>����</a>"

rstData.Close  
set rstData = nothing
conn.Close
Set conn = nothing
%>
