$(function() {
	$('.topic-data').bind('click', lookTopic);
	
	$('.topic-time').bind('click', getTimePanel);
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

function getTimePanel(event) {
	event.preventDefault();
	$.get($(this).attr('href') + '?tid=' + $(this).attr('data-id'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataTimeSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function dataTimeSave() {
	var time = $('#time').val();
	$.post($('.topic-time').attr('href'), {
		'time': time, 
		'tid': $('#data-call-id').val()
	}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog(result);
			close();
		} else if(result.rc.rc == 9999) {
			authDialog(result);
			close();
		} else if(result.rc == 1) {
			close();
			refreshLocation(result.msg);
		} else {
			failTip(result.msg);
		}
	});
}