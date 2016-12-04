$(function() {
	$('.gtp').bind('click', gtp);
	
	$('.qgtp').bind('click', qgtp);
	
	$('.home').bind('click', home);
	
	$('.qhome').bind('click', qhome);
	
	$('.ltp').bind('click', ltp);
	
	$('.qltp').bind('click', qltp);
	
	$('.openreply').bind('click', openreply);
	
	$('.closereply').bind('click', closereply);
	
	$('.cream').bind('click', cream);
	
	$('.qcream').bind('click', qcream);
	
	$('.tmove').bind('click', tmove);
	
	$('.tdel').bind('click', tdel);
});

function gtp(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	var html = '选择全局置顶时长,不选将永久全局置顶';
	dialog_confirm_time(html, function(time) {
		dialog(time);
	});
}

function qgtp(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定取消该帖子全局置顶?', function() {
		dialog(tid);
	});
}

function home(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	var html = '选择推送首页时长,不选将永久推送首页';
	dialog_confirm_time(html, function(time) {
		dialog(time);
	});
}

function qhome(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定取消推送首页?', function() {
		dialog(tid);
	});
}

function ltp(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	var html = '选择本版置顶时长,不选将永久本版置顶';
	dialog_confirm_time(html, function(time) {
		dialog(time);
	});
}

function qltp(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定取消该帖子本版置顶?', function() {
		dialog(tid);
	});
}

function openreply(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定打开该帖子的回复?', function() {
		dialog(tid);
	});
}

function closereply(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定关闭该帖子的回复?', function() {
		dialog(tid);
	});
}

function cream(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定将该帖子加精?', function() {
		dialog(tid);
	});
}

function qcream(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	dialog_confirm('确定将该帖子取消加精?', function() {
		dialog(tid);
	});
}

function tmove() {
	
}

function tdel() {
	
}