function getJSON(URL,success){
    var ud = 'json'+(Math.random()*100).toString().replace(/\./g,'');
    window[ud]= function(o){
        success&&success(o);
    };
    document.getElementsByTagName('body')[0].appendChild((function(){
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.src = URL.replace('callback=?','callback='+ud);
        return s;
    })());
}

function setclick(evt){
	//evt.preventDefault();
	console.log(evt);
	
	var screenCords = window.innerWidth+","+window.innerHeight;
	var mouseCords = evt.clientX+","+evt.clientY;
	var host = window.location.origin;
	var path = escape(window.location.pathname);
	var elem = "\"element\":\""+evt.srcElement.tagName+"\"";
	var id = (evt.srcElement.id != "") ? "\"id\":'"+evt.srcElement.id+"\"," :"";
	var type = "\"type\":\""+evt.type+"\"";
	//var data = "'data':'"+evt.clipboardData.getData('text/html')+"'";
	getJSON("http://localhost:3000/submit?mouse="+mouseCords+"&screen="+screenCords+"&host="+host+"&uri="+path+"&headers="+escape("{"+elem+","+id+type+"}")+"&callbakc=?",null);
	
}

if(document.addEventListener) { // DOM standard
    document.addEventListener('click', setclick, false);
	window.addEventListener('beforeunload', setclick, false);
	//document.addEventListener('copy', setclick, false);
} else if(document.attachEvent) { // IE
    document.attachEvent('onclick', setclick);
	window.attachEvent('onbeforeunload', setclick);
	//document.attachEvent('oncopy', setclick);
}