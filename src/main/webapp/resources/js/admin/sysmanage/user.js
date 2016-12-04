$(function() {
	$('.user-search').bind('click', search);
});

function search(e) {
	e.preventDefault();
	var href = $(this).attr('href');
	if(!$('#user-id').val()) {
		$('#user-id').attr('value', 0);
	}
	$('#user').attr('action',href);
	$('#user').submit();
}
