$(function() {
	$('.sys-args').bind('click', lookArgs);
	
	$('.sys-desc').bind('click', lookDesc);
});

function lookArgs() {
	$('.modal-title').html($(this).text());
	$('.sys-content').html($('#args_' + $(this).attr('data-id')).val());
	$('#sys-modal').modal();
}

function lookDesc() {
	$('.modal-title').html($(this).text());
	$('.sys-content').html($('#desc_' + $(this).attr('data-id')).val());
	$('#sys-modal').modal();
}