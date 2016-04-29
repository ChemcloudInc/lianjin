<%
Randomize
for ihsys=1 to 100
myasys=int((10000-1+1)*Rnd+1)
next
if len(myasys)<4 then
for xh=1 to 4-len(myasys)
myasys=int(myasys & "0")
next
end if
if len(myasys)>4 then
myasys=mid(myasys,1,4)
end if
myasys=int(myasys)
for xjsys=1 to len(myasys)
response.write "<img src='images/" & mid(myasys,xjsys,1) & ".gif" & "'>"
next
session("agennumsys")=myasys
%>