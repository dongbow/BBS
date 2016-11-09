var root = "/bbs";

var Url = {
	sign : function() {
		return root + "/sign/index";
	},
	cpost : function() {
		return root + "/post/choose";
	},
	login : function() {
		return root + "/tip/nologin";
	},
	favorite: function() {
		return root + "/home/favorite/add";
	},
	friends: function() {
		return root + "/home/friends/add";
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
	});
});

function choose() {
	$.get(Url.cpost(), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else {
			$('#fTopic').html(result);
			$('#fTopic').show();
		}
	});
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
			alert(result.msg);
		} else if(result.rc == 3005) {
			alert(result.msg);
		} else {
			if($('.bcf').length > 0) {
				$('.bcf').text(parseInt($('.bcf').html()) + 1);
			}
			alert(result.msg);
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
			alert(result.msg);
		} else if(result.rc == 3006) {
			alert(result.msg);
		} else {
			alert(result.msg);
		}
	});
}