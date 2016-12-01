$(function() {
	$('.gtp').bind('click', gtp);
});

function gtp(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	var tid = $('.system_option').attr('id');
	var html = '选择全局置顶时长,不选将永久置顶</br><input type="text" id="time" onClick="WdatePicker()" readOnly>';
	dialog_confirm(html, function() {
		dialog($('#time').val());
	});
}