var root = "/bbs";

var Url = {
	sign : function() {
		return root + "/sign/index";
	},
	cpost : function() {
		return root + "/post/choose";
	} 
};

$(function(){
	
	$('#sign_btn').click(function(){
		if($('#sign_btn').hasClass('already')) {
			return false;
		}
		$.post(Url.sign(), function(result) {
			if(result.rc.rc == 1) {
				$('#sign_btn').width('135px');
				$('#sign_num').css('display','inline');
				$('#sign_num').css('background','#6acb8c');
				$('#sign_num').width('135px');
				$('#sign_num').html('<p>连续签到天数</p><label id="sign_text" class="sign_text">' + result.uv.userPastSerialCount + '天</label>');
				$('#signin').css('background','#3baa62');
				$('#sign_text').html('已签到');
			} else if(result.rc.rc == 9001){
				alert(result.rc.msg);
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
});

function choose() {
	$('#fTopic').load(Url.cpost());
	$('#fTopic').show();
}