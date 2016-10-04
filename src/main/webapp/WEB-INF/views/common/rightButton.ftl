<#assign path="${request.contextPath}">
<script type="text/javascript">
$(function(){
	$('#wechatbar_button').mouseover(function(){
		$('#wechatPic').fadeIn(500);
	});
	
	$('#wechatbar_button').mouseout(function(){
		$('#wechatPic').fadeOut(500);
	});

    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#gotopbar_button").fadeIn(1500);
        }else{
            $("#gotopbar_button").fadeOut(1500);
        }
    });

    $("#gotopbar_button").click(function(){
        $('body,html').animate({scrollTop:0},500);
        return false;
    });
    
    $('#closetopic').click(function(){
    	$('.recover').removeClass('toclick');
	    $('.zilist').removeClass('toclick');
	    $('#fbartpic').attr('href','javascript:;');
		$('#fbartpic').removeClass('topicls');
		$('.before').hide();
    	$('#fTopic').hide();
    });
});

function toclick(e,id){
	if(e.click){
	    $('.recover').removeClass('toclick');
	    $('.zilist').removeClass('toclick');
	    $('#fbartpic').attr('href','javascript:;');
		$('#fbartpic').removeClass('topicls');
		$(e).addClass('toclick');
		$('.before').hide();
		$('#zimenu'+id).show();
	}
}
function toziclick(e,id){
	if(e.click){
		$('.recover').removeClass('toclick');
		$('.zilist').removeClass('toclick');
		$(e).addClass('toclick');
		$('#fbartpic').attr('href','${path}/post/new/topic/'+id);
		$('#fbartpic').addClass('topicls');
	}
}
</script>
<ul class="right_bar">
	<!-- script -->
	<li class="fbar_button"><a id="fbar" class="fbar" href="javascript:;"></a></li>
	<li class="refreshbar_button"><a href="javascript:;" onClick="javascript:location.href=location.href;"></a></li>
	<li id="wechatbar_button"><a href="javascript:void(0);"></a></li>
	<li class="weibobar_button"><a target="_blank" href="http://weibo.com/dongbow"></a></li>
	<li id="gotopbar_button" class="gotopbar_button" style="display: none;">
		<a href="javascript:void(0);"></a>
	</li>
	<li><a id="wechatPic" style="display: none;"></a></li>
</ul>
<!-- hidden -->
<div id="fTopic" style="display: none;">
	<!-- postui -->
</div>