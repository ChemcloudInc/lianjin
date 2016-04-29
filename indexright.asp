<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right">
	<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="reg.asp"><img src="images/index_35.jpg" alt="" width="105" height="34" border="0" /></a></td>
        <td><a href="login.asp"><img src="images/index_36.jpg" alt="" width="106" height="34" border="0" /></a></td>
      </tr>
    </table>
	</td>
  </tr>
  <tr>
    <td align="right">
	<table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
	<!--#include file="indexnews.asp"-->
	</td></tr></table>
	</td>
  </tr>
  <tr>
    <td align="right">
	<table width="211" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="images/index_78.jpg" width="211" height="49" alt="" /></td>
      </tr>
      <tr>
        <td align="center" background="images/index_92.jpg">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <%sql3="select top 6 proid,proname,prosmallpic,svipprice,vipprice,userprice,marketprice,hits,bigid,smallid from product order by hits desc"
		  set rs3=conn.execute(sql3)
		  if not rs3.eof then
		  do while not rs3.eof%>
		  <tr>
            <td align="center"><table width="179" border="0" cellspacing="0" cellpadding="0">
              <tr>
<td width="179" height="152" align="center" background="images/index_95.jpg">
<div class="pic">
<a href="prodetails.asp?proid=<%=rs3("proid")%>&bigid=<%=rs3("bigid")%>&smallid=<%=rs3("smallid")%>" target="_blank">
<img src="<%=rs3("prosmallpic")%>" border="0" onload="makesmallpic(this,140,130)"></a></div>
</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="25" align="center"><%=rs3("proname")%></td>
          </tr>
          <tr>
            <td height="55" align="center"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="114" height="38" align="center" background="images/index_113.jpg" class="prices">￥<%select case request.Cookies("userdengji")
		case ""
		response.Write(rs3("marketprice"))
		case "重要客户"
		response.Write(rs3("svipprice"))
		case "一般重要客户"
		response.Write(rs3("vipprice"))
		case "一般客户"
		response.Write(rs3("userprice"))
		end select%></td>
                <td><a href="prodetails.asp?proid=<%=rs3("proid")%>&bigid=<%=rs3("bigid")%>&smallid=<%=rs3("smallid")%>" target="_blank"><img src="images/index_114.jpg" alt="" width="58" height="38" border="0"></a></td>
              </tr>
            </table></td>
          </tr>
		  <%rs3.movenext
		  loop
		  end if
		  rs3.close:set rs3=nothing%>
        </table>
		
		</td>
      </tr>
      <tr>
        <td><img src="images/index_153.jpg" width="211" height="5" alt="" /></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
