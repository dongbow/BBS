$(function() {
	$('#data-add').bind('click', badAdd);
	
	$('.data-import').bind('click', badImport);
});

function badAdd(event) {
	event.preventDefault();
	bootbox.setLocale("zh_CN");
	bootbox.prompt("输入敏感词", function(data) {
		if(data) {
			$.post($('#data-add').attr('href'), {
				"word": data
			}, function(result) {
				if(result.rc != undefined && result.rc.rc == 9001){
					loginDialog(result);
				} else if(result.rc != undefined && result.rc.rc == 9999) {
					authDialog(result);
				} else if(result.rc == 1){
					refreshLocation(result.msg);
				} else {
					failTip(result.msg);
				}
			});
		}
	}); 
}

function badImport(event) {
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

function uploadFile() {
	$('#upload-form').ajaxSubmit({
		type: "POST",
        url: $('#upload-form').attr('action'),
        success: function (result) {
        	if(result.rc != undefined && result.rc.rc == 9001){
    			loginDialog(result);
    		} else if(result.rc != undefined && result.rc.rc == 9999) {
    			authDialog(result);
    		} else if (result.rc == 0) {
    			failTip(result.msg);
    		} else {
	        	$('#import_url').attr('value', result.data);
    		}
        }
	});
}

function dataAddSave() {
	var path = $('#import_url').attr('value');
	$.post($('.data-import').attr('href'), {
		'path': path
	}, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else if (result.rc == 0) {
			failTip(result.msg);
		} else {
			sucTip(result.msg);
			$('.close').click();
		}
	});
}