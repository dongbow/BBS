$(function() {
	$('.topic-data').bind('click', lookTopic);
});

function lookTopic() {
	var content = $(this).attr('data-value');
	if(content.indexOf('script') > 0) {
		$('.modal-body').text(content);
	} else {
		$('.modal-body').html(content);
	}
	$('#topic-content-modal').modal();
}