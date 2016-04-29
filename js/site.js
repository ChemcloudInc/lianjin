

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
massage_boxes.style.left = (screen.width - w) / 2-100;
massage_boxes.style.top = (screen.height - h) / 2-120;
massage_boxes.style.screenx = (screen.width - w) / 2-100;//仅适用于Netscape
massage_boxes.style.screeny = (screen.height - h) / 2-100;//仅适用于Netscape
massage_boxes.style.width = w+"px";
massage_boxes.style.height = h+"px";
pop_title.innerHTML=tit;
mask.style.display='';
massage_boxes.style.display=''
var popiframe='<iframe src="'+url+'" width="'+(w-12)+'px"  height="'+(h-37)+'px" frameborder=0 scrolling=no></iframe>';
pop_iframes.innerHTML=popiframe;
}
function closeWithIframe(){
massage_boxes.style.display="none";
mask.style.display="none";
}

document.write('<div id="massage_boxes" style="position:absolute; FILTER: progid:DXImageTransform.Microsoft.DropShadow();z-index:100;display:none">');
document.write('<div style="border-width:1 1 3 1; width:100%; height:100%; background:#fff; color:#004080; font-size:12px; line-height:150%">');
document.write('<div onmousedown=MDown(massage_boxes) style="background:#2396C3; height:20px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px;color:#fff;cursor:move;padding:0 0 4px 0">');
document.write('<div style="display:inline; width:150px; position:absolute;padding:3px 0 0 5px" id=pop_title></div>');
document.write('<span onClick="closeWithIframe()" style="float:right; display:inline; cursor:hand;padding:5px;font-size:14px"><img src="images/close1.gif"></span>');
document.write('</div>');
document.write('<div style="padding:5px" id=pop_iframes></div>');
document.write('</div>');
document.write('</div>');
document.write('<div id="mask" style="position:absolute; top:0; left:0; width:100%; background:#666666; filter:alpha(opacity=60); z-index:1; display:none;height:100%"></div>');
/*
document.write('<div id="mask" style="position:absolute; top:0; left:0; width:expression(body.scrollWidth); background:#666666; filter:alpha(opacity=60); z-index:1; display:none;height:100%"></div>');
*/
//ajax提示框功能========================================

