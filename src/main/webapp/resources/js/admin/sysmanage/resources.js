$(function() {
	$('#res-add').bind('click', addPanel);
	
	$('.close').live('click', close);
});

function close() {
	$('#res-modal').children('div').remove();
	$('#res-modal').modal('hide');
}

function addPanel(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else {
			$('#res-modal').html(result);
			$('#res-modal').modal();
			$('.modal-footer').on('click', '.save', save);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}