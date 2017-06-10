$(function() {
	$('.quartz-now').bind('click', runNow);
	
});

function runNow(e) {
	e.preventDefault();
	var id = $(this).attr('data-id');
	$.post($(this).attr('href'), {"id": id}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog(result);
			close();
		} else if(result.rc.rc == 9999) {
			authDialog(result);
			close();
		} else if(result.rc == 1) {
			close();
			sucTip(result.msg);
		} else {
			failTip(result.msg);
		}
	});
}

function dataAddSave() {
	
}

function dataUpdateSave() {
	
}