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