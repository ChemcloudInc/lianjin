<%
sqlc="select * from baseset"
set rsc=conn.execute(sqlc)
if not rsc.eof then
websitename=trim(rsc("sitename"))
websiteurl=trim(rsc("siteurl"))
weblinkman=trim(rsc("linkman"))
websaleshotline=trim(rsc("saleshotline"))
webserhotline=trim(rsc("serhotline"))
webfax=trim(rsc("fax"))
webaddr=trim(rsc("addr"))
webbeianhao=trim(rsc("beianhao"))
end if
rsc.close:set rsc=nothing
%>