var root = "/bbs";

var Url = {
	sign : function() {
		return root + "/sign/index";
	},
	cpost : function(id1) {
		var href = root + "/post/choose";
		if(id1 > 0) {
			href = href + "?gid=" + id1;
		}
		return href;
	},
	login : function() {
		return root + "/tip/nologin";
	},
	favorite: function() {
		return root + "/home/favorite/add";
	},
	friends: function() {
		return root + "/home/friends/add";
	},
	links: function(id) {
		return root + "/click/" + id;
	}
};

$(function(){
	
	$('#sign_btn').click(function(){
		if($('#sign_btn').hasClass('already')) {
			return false;
		}
		$.post(Url.sign(), function(result) {
			if(result.rc.rc == 1) {
				signSuc(result.uv.userPastSerialCount);
			} else if(result.rc.rc == 9001){
				loginDialog();
			} else {
				alert(result.rc.msg);
			}
		});
	});
	
	$('.fbar').bind('click', choose);
	
	$('#closetopic').live('click', function() {
		$('#ftopic_cont').remove();
		$('#fTopic').hide();
	});

	$('.tipclose').live('click', function(){
		$('#checktip').remove();
		$('#bbs-dialog').hide();
		if($('#bg').length > 0) {
			$('#bg').hide();
		}
	});
	
	$('.friendlink').bind('click', click);
});

function choose() {
	var href = GetUrlRelativePath();
	var id1 = 0, id2 = 0;
	if(href.indexOf("navigation") > 0) {
		id1 = href.replace("/bbs/navigation/", "").split("/")[0];
		if(href.indexOf("board") > 0) {
			id2 = href.replace("/bbs/navigation/", "").split("/")[2];
		}
	}
	if(href.indexOf("topic/detail") > 0) {
		id2 = href.replace("/bbs/board/", "").split("/")[0];
	}
	if(id2 > 0) {
		window.location = root + '/post/new/board/' + id2 + '/topic';
	} else {
		$.get(Url.cpost(id1), function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else {
				$('#fTopic').html(result);
				$('#fTopic').show();
			}
		});
	}
}

function loginDialog() {
	$('#bbs-dialog').load(Url.login(),'',function(){
		$('#checktip').css({
			'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
			'left': ($(window).width() - $('#checktip').width())/2+'px'
		});
		$('.dialog_login_btn').attr('href', root + '/account/login?backurl=' + encodeURIComponent(window.location.href));
		$('#bbs-dialog').show();
	});
}

function signSuc(number) {
	$('#sign_btn').width('135px');
	$('#sign_num').css({
		'display':'inline',
		'background':'#6acb8c',
		'width':'135px'
	});
	$('#sign_num').html('<p>连续签到天数</p><label id="sign_text" class="sign_text">' + number + '天</label>');
	$('#signin').css('background','#3baa62');
	$('#sign_text').html('已签到');
}

function favorite(id1, id2, name, sign) {
	$.post(Url.favorite(), {
		'id1': id1,
		'id2': id2,
		'name': name,
		'sign':sign
	}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 0){
			dialog(result.msg);
		} else if(result.rc == 3005) {
			dialog(result.msg);
		} else {
			if($('.bcf').length > 0) {
				$('.bcf').text(parseInt($('.bcf').html()) + 1);
			}
			dialog(result.msg);
		}
	});
}

function friends(id, name) {
	$.post(Url.friends(), {
		'recUid': id,
		'recName': name
	}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 0){
			dialog(result.msg);
		} else if(result.rc == 3006) {
			dialog(result.msg);
		} else {
			dialog(result.msg);
		}
	});
}

function dialog(msg) {
	var sHtml = '<div id="checktip" style="width:400px;height:150px;">';
	sHtml +=    '    <div class="tipcont">';
	sHtml +=    '        <div class="tiptitle">';
	sHtml +=    '        	<a class="titlename">系统提示</a>';
	sHtml +=    '        	<a title="关闭" class="tipclose" href="javascript:;">X</a>';
	sHtml +=    '        </div>';
	sHtml +=    '     	<p class="context">';
	sHtml += msg;
	sHtml +=    '     	</p>';
	sHtml +=    '    </div>';
	sHtml +=    '</div>';
	$('#bbs-dialog').html(sHtml);
	$('#checktip').css({
		'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
		'left': ($(window).width() - $('#checktip').width())/2+'px'
	});
	$('#bbs-dialog').show();
}

function dialog_confirm(msg, funOk) {
	var sHtml = '<div id="checktip" style="width:400px;height:150px;">';
	sHtml +=    '    <div class="tipcont">';
	sHtml +=    '        <div class="tiptitle">';
	sHtml +=    '        	<a class="titlename">系统提示</a>';
	sHtml +=    '        	<a title="关闭" class="tipclose" href="javascript:;">X</a>';
	sHtml +=    '        </div>';
	sHtml +=    '     	<p class="context">';
	sHtml += msg;
	sHtml +=    '     	</p>';
	sHtml +=    '     	<div class="tipfooter">';
	sHtml +=    '     		<a class="tipsure" href="javascript:;">确定</a>';
	sHtml +=    '     		<a  class="tipclose" href="javascript:;">取消</a>';
	sHtml +=    '     	</div>';
	sHtml +=    '    </div>';
	sHtml +=    '</div>';
	$('#bbs-dialog').html(sHtml);
	$('#checktip').css({
		'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
		'left': ($(window).width() - $('#checktip').width())/2+'px'
	});
	$('.tipsure').click(function() {
		if(typeof funOk == 'function') {
			$('#checktip').remove();
			$('#bbs-dialog').hide();
			funOk();
			return true;
		}
	});
	$('.tipclose').click(function(){
		$('#checktip').remove();
		$('#bbs-dialog').hide();
		return false;
	});
	$('#bbs-dialog').show();
}

function dialog_confirm_time(msg, funOk) {
	var sHtml = '<div id="checktip" style="width:400px;height:150px;">';
	sHtml +=    '    <div class="tipcont">';
	sHtml +=    '        <div class="tiptitle">';
	sHtml +=    '        	<a class="titlename">系统提示</a>';
	sHtml +=    '        	<a title="关闭" class="tipclose" href="javascript:;">X</a>';
	sHtml +=    '        </div>';
	sHtml +=    '     	<p class="context">';
	sHtml += msg;
	sHtml +=    '			</br><input type="text" id="time" onClick="WdatePicker()" readOnly>';
	sHtml +=    '     	</p>';
	sHtml +=    '     	<div class="tipfooter">';
	sHtml +=    '     		<a class="tipsure" href="javascript:;">确定</a>';
	sHtml +=    '     		<a  class="tipclose" href="javascript:;">取消</a>';
	sHtml +=    '     	</div>';
	sHtml +=    '    </div>';
	sHtml +=    '</div>';
	$('#bbs-dialog').html(sHtml);
	$('#checktip').css({
		'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
		'left': ($(window).width() - $('#checktip').width())/2+'px'
	});
	$('#time').css({
		'border': '1px solid #aaa',
	  	'height': '15px',
	  	'margin': '10px 0',
	  	'padding': '5px',
		'width': '180px'
	});
	$('.tipsure').click(function() {
		if(typeof funOk == 'function') {
			$('#checktip').remove();
			$('#bbs-dialog').hide();
			funOk();
			return true;
		}
	});
	$('.tipclose').click(function(){
		$('#checktip').remove();
		$('#bbs-dialog').hide();
		return false;
	});
	$('#bbs-dialog').show();
}

function dialogWithBtn(msg, funOk) {
	var sHtml = '<div id="checktip" style="width:400px;height:150px;">';
	sHtml +=    '    <div class="tipcont">';
	sHtml +=    '        <div class="tiptitle">';
	sHtml +=    '        	<a class="titlename">系统提示</a>';
	sHtml +=    '        	<a title="关闭" class="tipclose" href="javascript:;">X</a>';
	sHtml +=    '        </div>';
	sHtml +=    '     	<p class="context">';
	sHtml += msg;
	sHtml +=    '     	</p>';
	sHtml +=    '     	<div class="tipfooter">';
	sHtml +=    '     		<a class="tipsure" href="javascript:;">确定</a>';
	sHtml +=    '     	</div>';
	sHtml +=    '    </div>';
	sHtml +=    '</div>';
	$('#bbs-dialog').html(sHtml);
	$('#checktip').css({
		'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
		'left': ($(window).width() - $('#checktip').width())/2+'px'
	});
	$('.tipsure').click(function() {
		if(typeof funOk == 'function') {
			$('#checktip').remove();
			$('#bbs-dialog').hide();
			funOk();
			return true;
		}
	});
	$('#bbs-dialog').show();
}

function click() {
	var id = $(this).attr('id');
	$.post(Url.links(id), function(result) {
		if(result.rc == 1) {
			console.log('click');
		}
	});
}

function GetUrlRelativePath(){
	var url = document.location.toString();
	var arrUrl = url.split("//");
	var start = arrUrl[1].indexOf("/");
	var relUrl = arrUrl[1].substring(start);
	if(relUrl.indexOf("?") != -1){
		relUrl = relUrl.split("?")[0];
	}
	return relUrl;
}
