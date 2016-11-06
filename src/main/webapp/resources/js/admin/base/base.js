var ADMIN_ROOT = '/bbs';

var AUTH_URL = {
	getUserInfo : function() {
		return ADMIN_ROOT + "/system/auth/getuser";
	},
	getRoleMenu : function() {
		return ADMIN_ROOT + "/system/auth/getmenu";
	}
};

$(document).ready(function() {
	getUser();
	activeClass();
	resetWindow();
//	getMenu();
	
//	$('.menu-list').live('click', function() {
//		$('#bbs-menu').find('li').removeClass('active');
//		if($(this).hasClass('active-hover')) {
//			$(this).find('ul').css('display','none');
//			$(this).removeClass('active-hover');
//			$(this).removeClass('active');
//		} else {
//			$('#bbs-menu').find('li').removeClass('active-hover');
//			$('#bbs-menu').find('ul.sub-menu-list').css('display','none');
//			$(this).addClass('active');
//			$(this).addClass('active-hover');
//			$(this).find('ul').css('display','block');
//		}
//	});
	
});

function getUser() {
	$.post(AUTH_URL.getUserInfo(), function(result) {
		$('#headimg').attr('src', result.img);
		$('#nickname').html(result.name);
		$('#menu_headimg').attr('src', result.img);
		$('#menu_name').html(result.name);
	});
}

function getMenu() {
	$.post(AUTH_URL.getRoleMenu(),function(result) {
		for(var i = 0; i < result.length; i++) {
			var data = result[i];
			if(data.resources == null || data.resources == '') {
				$('#bbs-menu').append(
					'<li><a href="' + ADMIN_ROOT + data.resLink + '"><i class="fa ' + data.resIcon + '"></i>' 
					+ '<span>' + data.resName + '</span></a></li>'
				);
			} else {
				var html = '<li class="menu-list"><a href="#"><i class="fa ' + data.resIcon + '"></i>' 
				 + '<span>' + data.resName + '</span></a>'
				 + '<ul class="sub-menu-list">';
				for(var j = 0; j < data.resources.length; j ++) {
					var res = data.resources[j];
					html += '<li><a href="' + ADMIN_ROOT + res.resLink + '"><i class="fa ' + res.resIcon + '"></i><span>' + res.resName + '</span></a></li>';
				}
				html += '</ul></li>';
				$('#bbs-menu').append(html);
			}
		}
	});
}

function activeClass() {
	var url = window.location.pathname;
	$('#bbs-menu a').each(function(){
		var href = $(this).attr('href');
		if(href == url && href != '/bbs/system/admin/index') {
			$('.bbs-home').removeClass('active');
			$(this).parent().addClass('active');
			$(this).parent().parent().css('display','block');
			$(this).parent().parent().parent().attr('style','');
			$(this).parent().parent().parent().addClass('nav-active');
		}
	});
}

function resetWindow() {
	var height = $(window).height();
	$('.main-content').css('min-height', height + 'px')
}