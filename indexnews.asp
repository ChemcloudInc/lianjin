<div class="tabsbox_zzjs_net">
 <ul id="zzjs__net" class="tabs_zzjs">
     <li class="zzjs">信捷快报<span></span></li>
     <li>常见问题<span></span></li>
    </ul>
    <div id="tabscon_zzjsnet" class="con_wwwzzjsnet">
     <ul>
         <%sql="select top 10 newsid,newstype,newstitle from news where newstype='信捷快报' order by newsid desc"
		 set rs=conn.execute(sql)
		 if not rs.eof then
		 do while not rs.eof%>
		 <li>·<a href="newsdetails.asp?newsid=<%=rs("newsid")%>" target="_blank"><%=limitwords(rs,"newstitle",14)%></a></li>
		 <%rs.movenext
		 loop
		 end if
		 rs.close:set rs=nothing%>
        </ul>
     <ul>
         <%sql="select top 10 newsid,newstype,newstitle from news where newstype='常见问题' order by newsid desc"
		 set rs=conn.execute(sql)
		 if not rs.eof then
		 do while not rs.eof%>
		 <li>·<a href="newsdetails.asp?newsid=<%=rs("newsid")%>" target="_blank"><%=limitwords(rs,"newstitle",14)%></a></li>
		 <%rs.movenext
		 loop
		 end if
		 rs.close:set rs=nothing%>
        </ul>

    </div>
</div>
<script type="text/javascript">
 var lis = document.getElementById("zzjs__net").getElementsByTagName("li");
 var uls = document.getElementById("tabscon_zzjsnet").getElementsByTagName("ul");
 var order = 0;
 for(var i=0; i<lis.length; i++){
  lis[i].value = i;
  lis[i].onmouseover = function(){
   ChangeTabs(this.value);
  };
  uls[i].className = "hidden";
 }
 lis[order].className = "zzjs";
 uls[order].className = "block";
 function ChangeTabs(nowTab){
  lis[order].className = "";
  uls[order].className = "hidden";
  order = nowTab
  lis[nowTab].className = "zzjs";
  uls[nowTab].className = "block";
 }
</script>