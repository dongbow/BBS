var path = '/bbs';
var uid = 1268;

var from = uid;
var fromName = '';
var to = uid == 1 ? 2 : 1;

var websocket;
if ('WebSocket' in window) {
	websocket = new WebSocket("ws://" + window.location.host + path + "/ws?uid="+uid);
} else if ('MozWebSocket' in window) {
	websocket = new MozWebSocket("ws://" + window.location.host + path + "/ws"+uid);
} else {
	websocket = new SockJS("http://" + window.location.host + path + "/ws/sockjs"+uid);
}

websocket.onopen = function(event) {
	console.log("WebSocket:已连接");
	console.log(event);
};

websocket.onmessage = function(event) {
	var data=JSON.parse(event.data);
	console.log("WebSocket:收到一条消息",data);
	if (data.jsType == 1) {
		bbs_tip(data.text);
	} else if (data.jsType == 2) {
		$('.header-msg-num span').text(data.text);
		$('.header-msg-num span').css({'background': '#f00'});
	} else if (data.jsType == 3) {
		
	}
	//scrollToBottom();
};

websocket.onerror = function(event) {
	console.log("WebSocket:发生错误 ");
	console.log(event);
};

websocket.onclose = function(event) {
	console.log("WebSocket:已关闭");
	console.log(event);
};

function sendMsg(){
	var v = $("#msg").val();
	if (v) {
		return;
	} else {
		var data={};
		data["from"]=from;
		data["fromName"]=fromName;
		data["to"]=to;
		data["text"]=v;
		websocket.send(JSON.stringify(data));
		$("#content").append("<div class='tmsg'><label class='name'>我&nbsp;"+new Date().Format("yyyy-MM-dd hh:mm:ss")+"</label><div class='tmsg_text'>"+data.text+"</div></div>");
		//scrollToBottom();
		$("#msg").val("");
	}
}

function scrollToBottom(){
	var div = document.getElementById('content');
	div.scrollTop = div.scrollHeight;
}

Date.prototype.Format = function (fmt) { // author: meizz
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

function send(event){
	var code;
	if(window.event){
		code = window.event.keyCode; // IE
	} else {
		code = e.which; // Firefox
	}
	if(code==13){ 
		sendMsg();            
	}
}

function clearAll(){
	$("#content").empty();
}