$(function(){
	$('.gold-detail').bind('click', detail);
});

function detail(event) {
	event.preventDefault();
	var uid = $(this).attr('data-id');
	var href = $(this).attr('href');
	window.location = href + '?uid=' + uid;
}