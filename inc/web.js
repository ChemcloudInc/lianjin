


function makesmallpic(obj,w,h){ 
var srcImage = new Image(); 
srcImage.src=obj.src; 
var srcW=srcImage.width; 
var srcH=srcImage.height; 
if(srcW>srcH){ 
if(srcW>w){ 
obj.width=newW=w; 
obj.height=newH=(w/srcW)*srcH; 
}else{ 
obj.width=newW=srcW; 
obj.height=newH=srcH; 
} 
}else{ 
if(srcH>h){ 
obj.height=newH=h; 
obj.width=newW=(h/srcH)*srcW; 
}else{ 
obj.width=newW=srcW; 
obj.height=newH=srcH; 
} 
} 
if(newW>w){ 
obj.width=w; 
obj.height=newH*(w/newW); 
}else if(newH>h){ 
obj.height=h; 
obj.width=newW*(h/newH); 
} 
} 
