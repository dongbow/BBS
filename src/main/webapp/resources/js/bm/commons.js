$(function(){
	
	$('#check-all').click(function() {
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
	
});