$(function() {
	$('.system-save').bind('click', systemSave);
});

function systemSave(event) {
	event.preventDefault();
	$(this).removeClass('fa-chevron-down');
	bootbox.alert('waiting');
}