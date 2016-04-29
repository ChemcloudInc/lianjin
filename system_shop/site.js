function killerr() {return true}  
window.onerror=killerr 

function oCopy(str)
{
var clipBoardContent=str;
window.clipboardData.setData("Text",clipBoardContent);
alert("广告代码复制成功，代码内容为：\n\n"+str+"\n\n您可以将此代码粘贴到您想插入本广告的位置");
}

/*生成html*/
function Cre(i){
  if(i.style.display == "none"){
    i.style.display="";
  }else{
    i.style.display="none";
  }
}

/*采集*/
function Gather(i,a){
  if(i.style.display == "none"){
    i.style.display="";
    a.style.display="";
  }else{
    i.style.display="none";
    a.style.display="none";
  }
}

//选取所有
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }

//设定图片显示尺寸
var flag=false; 
function DrawImage(ImgD,w,h){ 
var image=new Image(); 
image.src=ImgD.src; 
if(image.width>0 && image.height>0){ 
flag=true; 
if(image.width/image.height>= w/h){ 
if(image.width>w){ 
ImgD.width=w; 
ImgD.height=(image.height*w)/image.width; 
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} 
/*ImgD.alt=image.width+"×"+image.height;*/ 
} 
else{ 
if(image.height>h){ 
ImgD.height=h; 
ImgD.width=(image.width*h)/image.height; 
}else{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} 
/*ImgD.alt=image.width+"×"+image.height;*/ 
} 
} 
/*else{ 
ImgD.src=""; 
ImgD.alt="" 
}*/ 
} 

function statusmove(str){
self.status = str;
}
function statusover(){
self.status = '';
}

function show(i,n,t){     
if (i.style.display == "none") {     
		i.style.display = "";
		n.style.display = "";
		t.style.background = "url('img/Menu_BG.gif')";
	}else{     
		i.style.display = "none";
		n.style.display = "none";
		t.style.background = "url('img/Menu_BG1.gif')";
	}     
}	     

function TopType(){
if(Top.style.display == ""){
Top.style.display = "none";
TopPic.src="img/p_5.gif"
}else{
Top.style.display = "";
TopPic.src="img/p_6.gif"
}
}

function MenuType(){
if(menu.style.display == ""){
menukey.innerHTML = ">> 显示菜单";
menu.style.display = "none";
}else{
menukey.innerHTML = "<< 隐藏菜单";
menu.style.display = "";
}
}

/*文章新闻添加*/
function WM_LinkCheck(){
  if(document.myform.WM_UseLinkUrl.checked==true){
    document.myform.WM_LinkUrl.disabled=false;
     ArticleContent.style.display='none';
     ArticleContent1.style.display='none';
  }
  else{
    document.myform.WM_LinkUrl.disabled=true;
    ArticleContent.style.display='';
    ArticleContent1.style.display='';
  }
}

//新闻添加
function doChange(objText, objDrop){
	if (!objDrop) return;
	var str = objText.value;
	var arr = str.split("|");
	objDrop.length=0;
	for (var i=0; i<arr.length; i++){
	objDrop.options[i] = new Option(arr[i], arr[i]);
	PicUrl=objDrop.options[i].value;
	}
	document.myform.WM_DefaultPicUrl.value = PicUrl;
	myform.WM_PicPreview.src = PicUrl;
	myform.WM_PicPreview.alt = PicUrl;
}

//菜单书签
function menudis(tit,show,font,num){
  for(g=1;g<=num;g++){
	document.all("show"+g).style.display="none";
	document.all("tit"+g).className="mLabel";
	document.all("titfont"+g).className="mLabeltit";
  }
  if(tit.style.display=="none"){
	show.style.display="none";
	tit.className="mLabel";
	font.className="mLabeltit";
	}
	else{
	show.style.display="";
	tit.className="mLabel1";
	font.className="mLabeltit1";
	}
}

//后台书签
function dis(tit,show,num,pic){
  for(g=1;g<=num;g++){
	document.all("tit"+g).background="Img/"+pic+"_1.gif";
	document.all("show"+g).style.display="none";
	document.all("tit"+g).className="Label";
  }
  if(tit.style.display=="none"){
    tit.background="Img/"+pic+"_1.gif";
	show.style.display="none";
	tit.className="Label";
	}
	else{
	tit.background="Img/"+pic+".gif";
	show.style.display="";
	tit.className="Label1";
	}
}

//System_Templates.asp
function temp(i,n){     
if (n.style.display == "none") {     
		i.src = "img/-.gif";
		n.style.display = "";
	}else{     
		i.src = "img/+.gif";
		n.style.display = "none";
	}     
}	     

// 显示无模式对话框
function ShowDialog(url, width, height) {
	var arr = showModalDialog(url, window, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
}

function preview() /* Preview for the "Compilation" */
	{
		if(document.myform.HtmlCode.value.length>0)
			{
				pr=window.open("","Preview","scrollbars=1,width=800,height=500");
				pr.document.write(document.myform.HtmlCode.value);
			}
		else alert('无任何内容可供预览!')
}

//添加广告表单
function ads(i){
  switch(i){
    case "text":
      ad1.style.display = "none";
      ad2.style.display = "";
      ad3.style.display = "";
      ad4.style.display = "none";
      ad5.style.display = "";
	  break;
    case "pic":
      ad1.style.display = "";
      ad2.style.display = "none";
      ad3.style.display = "";
      ad4.style.display = "";
      ad5.style.display = "";
	  break;
    case "swf":
      ad1.style.display = "";
      ad2.style.display = "none";
      ad3.style.display = "none";
      ad4.style.display = "";
      ad5.style.display = "none";
	  break;
  }
}

//添加频道
function Channel_Show(){     
		Channel.style.display = "";
}	     
function Channel_Close(){     
		Channel.style.display = "none"; 
}	

function Keyword(addKeyword) { 
var revisedTitle; 
var currentTitle = document.myform.WM_Keyword.value; 
if (addKeyword!=""){
if (currentTitle==""){
revisedTitle = addKeyword; 
}else{
revisedTitle = addKeyword+"|"+currentTitle; 
}
}else{
revisedTitle="";
}
document.myform.WM_Keyword.value=revisedTitle; 
}

/*标签添加输出格式选择*/
function Label(i){
  switch(i){
    case "1":
      table.style.display = "none";
      div.style.display = "none";
	  break;
    case "2":
      table.style.display = "";
      div.style.display = "none";
	  break;
    case "3":
      table.style.display = "none";
      div.style.display = "";
	  break;
  }
}

/*标签添加输出格式选择*/
function Label2(i){
  switch(i){
    case "1":
      table1.style.display = "";
      div1.style.display = "none";
      table2.style.display = "";
      div2.style.display = "none";
	  break;
    case "2":
      table1.style.display = "none";
      div1.style.display = "";
      table2.style.display = "none";
      div2.style.display = "";
	  break;
  }
}

//居中打开窗口
function openwindow( url, winName, width, height) {
xposition=0; yposition=0;
if ((parseInt(navigator.appVersion) >= 4 )){
xposition = (screen.width - width) / 2;
yposition = (screen.height - height) / 2;}
theproperty= "width=" + width + "," 
+ "height=" + height + "," 
+ "location=0," 
+ "menubar=0,"
+ "resizable=1,"
+ "scrollbars=0,"
+ "status=0," 
+ "titlebar=0,"
+ "toolbar=0,"
+ "hotkeys=0,"
+ "screenx=" + xposition + "," //仅适用于Netscape
+ "screeny=" + yposition + "," //仅适用于Netscape
+ "left=" + xposition + "," //IE
+ "top=" + yposition; //IE 
window.open( url,winName,theproperty );
}

function ShowTimingType(num){ 
   switch(num){
     case "0":     
        document.myform.WeekDay.style.display='none';
        break;
     case "1":     
        document.myform.WeekDay.style.display='';
        break;
     default:
        alert("错误参数调用！");
        break;
    }
}

//ajax提示框功能
var Obj=''
document.onmouseup=MUp
document.onmousemove=MMove

function MDown(Object){
Obj=Object.id
document.all(Obj).setCapture()
pX=event.x-document.all(Obj).style.pixelLeft;
pY=event.y-document.all(Obj).style.pixelTop;
}

function MMove(){
if(Obj!=''){
  document.all(Obj).style.left=event.x-pX;
  document.all(Obj).style.top=event.y-pY;
  }
}

function MUp(){
if(Obj!=''){
  document.all(Obj).releaseCapture();
  Obj='';
  }
}

function openWithIframe(tit,url,w,h){
massage_box.style.left = (screen.width - w) / 2-100;
massage_box.style.top = (screen.height - h) / 2-100;
massage_box.style.screenx = (screen.width - w) / 2-100;//仅适用于Netscape
massage_box.style.screeny = (screen.height - h) / 2-100;//仅适用于Netscape
massage_box.style.width = w+"px";
massage_box.style.height = h+"px";
pop_title.innerHTML=tit;
mask.style.display='';
massage_box.style.display=''
var popiframe='<iframe src="'+url+'" width="'+(w-12)+'px"  height="'+(h-37)+'px" frameborder=0 scrolling=no></iframe>';
pop_iframe.innerHTML=popiframe;
}
function closeWithIframe(){
massage_box.style.display="none";
mask.style.display="none";
}

document.write('<div id="massage_box" style="position:absolute; FILTER: progid:DXImageTransform.Microsoft.DropShadow();z-index:100;display:none">');
document.write('<div style="border-width:1 1 3 1; width:100%; height:100%; background:#fff; color:#004080; font-size:12px; line-height:150%">');
document.write('<div onmousedown=MDown(massage_box) style="background:#397FFF; height:20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px;color:#fff;cursor:move;padding:0 0 4px 0">');
document.write('<div style="display:inline; width:150px; position:absolute;padding:3px 0 0 5px" id=pop_title></div>');
document.write('<span onClick="closeWithIframe()" style="float:right; display:inline; cursor:hand;padding:5px;font-size:14px"><img src="images/close1.gif"></span>');
document.write('</div>');
document.write('<div style="padding:5px" id=pop_iframe></div>');
document.write('</div>');
document.write('</div>');
document.write('<div id="mask" style="position:absolute; top:0; left:0; width:expression(body.scrollWidth); background:#666; filter:ALPHA(opacity=60); z-index:1; display:none;height:100%"></div>');
//ajax提示框功能========================================

//上传完成后返回参数处理
function upback(Spic,str){
  closeWithIframe();
  if(str!=""){
  EditContent.appendHTML('<IMG SRC=' + str + ' onload=\"javascript:if(this.width>500){this.width=500};if(this.height>500){this.height=500;}\">');
  if(Spic!=""){
      document.myform.Pic.value = Spic;
      Add(Spic);
      PicPreview.innerHTML = "<Img src="+Spic+" onload=\'DrawImage(this, 118, 118);\'>";
    }else{
      document.myform.Pic.value = str;
      Add(str);
      PicPreview.innerHTML = "<Img src="+str+" onload=\'DrawImage(this, 118, 118);\'>";
    }
  }
}

function Add(str) {
	var sel2=document.myform.PicSelect;
	sel2.options[sel2.length]=new Option(str,str);
	sel2.selectedIndex = sel2.length-1;
}

function PicReset(str){
document.myform.Pic.value = str;
if (str == ""){
PicPreview.innerHTML = "<Img src=../Images/nopic.gif onload=\'DrawImage(this, 118, 118);\'>";
}else{
PicPreview.innerHTML = "<Img src="+str+" onload=\'DrawImage(this, 118, 118);\'>";
}
}

//用户头像回传操作
function upother(str){
  closeWithIframe();
  document.myform.Pic.value = str;
  document.images['PicShow'].src=str;
}

//广告图片回传操作
function upad(str){
  closeWithIframe();
  document.myform.Pic.value = str;
}

function sift(){
  if (myform.c.value !=""){
    var sift;
    var siftv = myform.e5.value;
    sift = myform.a.children[myform.a.selectedIndex].text + '|||' + myform.b.children[myform.b.selectedIndex].text + '|||'  + myform.c.value;
    if(siftv.indexOf(sift)!=-1){
	  alert('此过滤器规则在下面列表中已存在');
	  myform.c.focus();
	  return false;
	}
	if (siftv!=""){
	  myform.e5.value =  myform.e5.value+'\n'+sift;
	}else{
	  myform.e5.value =  sift;
	}
	myform.c.value = "";
	myform.c.focus();
  }else{
    myform.c.focus();
    alert('件不完整');
  }
}


//字数限制一
function checktext(text) 
{ 
allValid = true; 
for (i = 0; i < text.length; i++) 
{ 
if (text.charAt(i) != " ") 
{ 
allValid = false; 
break; 
} 
} 
return allValid; 
} 

function gbcount(message,total,used,remain) 
{ 
var max; 
max = total.value; 
if (message.value.length > max) { 
message.value = message.value.substring(0,max); 
used.value = max; 
remain.value = 0; 
alert("短信内容不能超过 70 个字!"); 
} 
else { 
used.value = message.value.length; 
remain.value = max - used.value; 
} 
} 
//字数限制2
function gbcount1(message1,total1,used1,remain1) 
{ 
var max1; 
max1 = total1.value; 
if (message1.value.length > max1) { 
message1.value = message1.value.substring(0,max1); 
used1.value = max1; 
remain1.value = 0; 
alert("短信内容不能超过 70 个字!"); 
} 
else { 
used1.value = message1.value.length; 
remain1.value = max1 - used1.value; 
} 
} 

//字数限制3
function gbcount2(message2,total2,used2,remain2) 
{ 
var max2; 
max2 = total2.value; 
if (message2.value.length > max2) { 
message2.value = message2.value.substring(0,max2); 
used2.value = max2; 
remain2.value = 0; 
alert("短信内容不能超过 70 个字!"); 
} 
else { 
used2.value = message2.value.length; 
remain2.value = max2 - used2.value; 
} 
} 

//字数限制4
function gbcount3(message3,total3,used3,remain3) 
{ 
var max3; 
max3 = total3.value; 
if (message3.value.length > max3) { 
message3.value = message3.value.substring(0,max3); 
used3.value = max3; 
remain3.value = 0; 
alert("短信内容不能超过 70 个字!"); 
} 
else { 
used3.value = message3.value.length; 
remain3.value = max3 - used3.value; 
} 
} 

//字数限制5
function gbcount4(message4,total4,used4,remain4) 
{ 
var max4; 
max4 = total4.value; 
if (message4.value.length > max4) { 
message4.value = message4.value.substring(0,max4); 
used4.value = max4; 
remain4.value = 0; 
alert("短信内容不能超过 70 个字!"); 
} 
else { 
used4.value = message4.value.length; 
remain4.value = max4 - used4.value; 
} 
} 