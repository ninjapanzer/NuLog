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
	getJSON("http://localhost:3000/submit?mouse="+evt.clientX+","+evt.clientY+"&screen="+window.innerWidth+","+window.innerHeight+"&host="+window.location.origin+"&uri="+escape(window.location.pathname)+"&callbakc=?",null);
	
}

if(document.addEventListener) { // DOM standard
    document.addEventListener('click', setclick, false);
	document.addEventListener('onbeforeunload', setclick, false);
} else if(document.attachEvent) { // IE
    document.attachEvent('onclick', setclick);
	document.attachEvent('onbeforeunload', setclick);
}