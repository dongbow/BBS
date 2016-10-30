$(function(){
/*	$('#login').click(function(){
		if($.cookie('user.cookie')==""){
			//var user=$.cookie('user.cookie');
			//var userName=user.split('"')[1].split(",")[0];
			//var password=user.split('"')[1].split(",")[1];
			$.ajax({
				url:"account/dologin.htm?userName=dongbo&password=123456",
				type:"post",
				success:window.location="forum.htm",
			});
		} else {
			window.location="account/login.htm";
		}
	});*/
	
	jQuery(function($){
		$('#demo1').slideBox();
	});

	filterchange();
	
	function filterchange(){
		var _top=$('#scsh').offset().top;
		var _left=$('#scsh').offset().left;
		var top=$('#sosh').offset().top;
		var left=$('#sosh').offset().left;
		$('.scsh').css('left',_left+'px');
		$('.scsh').css('top',_top+30+'px');
		$('.sosh').css('left',left+'px');
		$('.sosh').css('top',top+30+'px');
	}
	
	$(window).resize(function(){
		filterchange();
	});
	
	$('#scsh').mouseover(function(){
		$('.scsh').show();	
		$('#scsh span').html('▲');
	});	
	
	$('.scsh').mouseover(function(){
		$('.scsh').show();	
		$('#scsh span').html('▲');
	});
	
	$('#scsh').mouseout(function(){
		$('.scsh').hide();	
		$('#scsh span').html('▼');
	});
	
	$('.scsh').mouseout(function(){
		$('.scsh').hide();	
		$('#scsh span').html('▼');
	});
	
	$('#sosh').mouseover(function(){
		$('.sosh').show();	
		$('#sosh span').html('▲');
	});
	
	$('.sosh').mouseover(function(){
		$('.sosh').show();	
		$('#sosh span').html('▲');
	});
	
	$('#sosh').mouseout(function(){
		$('.sosh').hide();	
		$('#sosh span').html('▼');
	});
	
	$('.sosh').mouseout(function(){
		$('.sosh').hide();	
		$('#sosh span').html('▼');
	});
});

