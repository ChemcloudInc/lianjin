<%set conn=server.createobject("adodb.connection") 
    strConnString = "Provider=Sqloledb.1;Password=yuanlin;Persist Security Info=True;database=sq_yuanlin;User ID=sa;Data Source=sq_yuanlin"
  
conn.Open strConnString


dim s,sql,filename,fs,myfile,x  
 

 
Set fs = server.CreateObject("scripting.filesystemobject")  
'--假设你想让生成的EXCEL文件做如下的存放  
filename = Server.MapPath("order.xls")  
'--如果原来的EXCEL文件存在的话Delete它  
if fs.FileExists(filename) then  
    fs.DeleteFile(filename)  
end  if  
'--创建EXCEL文件  
set myfile = fs.CreateTextFile(filename,true)  
 
'Set rs = Server.CreateObject("ADODB.Recordset")  
'--从数据库中把你想放到EXCEL中的数据查出来  
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
 
'--将表的列名先写入EXCEL  
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

response.Write "生成Excel文件成功，点击"
Response.Write  "<a href='order.xls' target='_blank'>下载</a>"
response.Write "&nbsp;&nbsp;"
response.Write "<a href='#' onclick='window.history.back()'>返回</a>"

rstData.Close  
set rstData = nothing
conn.Close
Set conn = nothing
%>
