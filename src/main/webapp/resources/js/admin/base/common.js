$(function() {
	
	$('#data-ids').click(function() {
		if ($(this).is(':checked')) {
			$("input[type='checkbox']").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("input[type='checkbox']").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$('#data-search').bind('click', search);
	
	$('.data-add').bind('click', dataAdd);
	
	$('.data-update').bind('click', dataUpdate);
	
	$('.close').live('click', close);
});

function search(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	if(!$('.data-c-id').val()) {
		$('.data-c-id').attr('value', 0);
	}
	$('#dataForm').attr('action',href);
	$('#dataForm').submit();
}

function close() {
	$('#data-modal').children('div').remove();
	$('#data-modal').modal('hide');
}

function dataAdd(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataAddSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function dataUpdate(event) {
	event.preventDefault();
	var url = $(this).attr('href') + '?id=' + $(this).attr('data-id');
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataUpdateSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}