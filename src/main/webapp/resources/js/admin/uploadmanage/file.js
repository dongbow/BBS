$(function() {
	$('.download-detail').bind('click', detail);
});

function detail(event) {
	event.preventDefault();
	var id = $(this).attr('data-id');
	window.location = $(this).attr('href') + '?id=' + id;
}