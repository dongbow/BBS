$(function() {
	$('.reply-content').bind('click', lookReply);
	
	$('.reply-p-content').bind('click', lookReply);
});

function lookReply() {
	var title = $(this).text();
	$('.modal-title').html(title);
	var content = $(this).attr('data-value');
	if(content.indexOf('script') > 0) {
		$('.modal-body').text(content);
	} else {
		$('.modal-body').html(content);
	}
	$('#reply-content-modal').modal();
}