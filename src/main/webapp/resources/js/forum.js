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
	
	filterchange();
	
	resetLink();
});

function filterchange(){
	if($('#scsh').length > 0) {
		var _top=$('#scsh').offset().top;
		var _left=$('#scsh').offset().left;
		var top=$('#sosh').offset().top;
		var left=$('#sosh').offset().left;
		$('.scsh').css('left',_left+'px');
		$('.scsh').css('top',_top+30+'px');
		$('.sosh').css('left',left+'px');
		$('.sosh').css('top',top+30+'px');
	}
}

function resetLink() {
	if($('#scsh').length > 0) {
		var url = window.location.href;
		if(url.indexOf('?') > 0) {
			if(url.indexOf('orderby') > 0) {
				if(url.indexOf('orderby=lastpost') > 0) {
					$('.replytime').attr('href', url);
					$('.replytime').addClass('schover');
					$('.posttime').removeClass('schover');
					url = url.replace(/orderby=lastpost/, 'orderby=dateline');
					$('.posttime').attr('href', url);
				} else {
					$('.posttime').attr('href', url);
					$('.posttime').addClass('schover');
					$('.replytime').removeClass('schover');
					url = url.replace(/orderby=dateline/, 'orderby=lastpost');
					$('.replytime').attr('href', url);
				}
			} else {
				$('.replytime').attr('href', url + '&orderby=lastpost');
				$('.posttime').attr('href', url + '&orderby=dateline');
			}
			url = window.location.href;
			if(url.indexOf('filter') > 0) {
				if(url.indexOf('filter=cream') > 0) {
					$('.fcream').attr('href', url);
					url = url.replace(/filter=cream/, 'filter=hot');
					$('.fhot').attr('href', url);
				} else {
					$('.fhot').attr('href', url);
					url = url.replace(/filter=hot/, 'filter=cream');
					$('.fcream').attr('href', url);
				}
			} else {
				$('.fhot').attr('href', url + '&filter=hot');
				$('.fcream').attr('href', url + '&filter=cream');
			}
		} else {
			$('.replytime').attr('href', url + '?orderby=lastpost');
			$('.posttime').attr('href', url + '?orderby=dateline');
			$('.fcream').attr('href', url + '?filter=cream');
			$('.fhot').attr('href', url + '?filter=hot');
		}
	}
}

