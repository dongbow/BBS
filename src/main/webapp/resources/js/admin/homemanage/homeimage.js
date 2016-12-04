$(function() {
	$('.btn-img').bind('click', lookImage);
});

function lookImage() {
	var src = $(this).attr('data-img');
	$('.look-img').attr('src', src);
	$('#image-modal').modal();
}