$(function() {
	$('.btn-img').bind('click', lookImage);
	
});

function lookImage() {
	var src = $(this).attr('data-img');
	$('.look-img').attr('src', src);
	$('#image-modal').modal();
}

function dataAddSave() {
	var title = $('#title').val();
	var link = $('#link').val();
	var url = $('#img-url').val();
	var sort = $('#sort').val();
	var status = $('#status').val();
	if(title && link && url && sort && status) {
		$.post($('.data-add').attr('href'), {
			"title": title,
			"link": link,
			"url": url,
			"sort": sort,
			"status": status
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
	} else {
		notBlank();
	}
}

function uploadImage() {
	$('#upload-form').ajaxSubmit({
		type: "POST",
        url: $('#upload-form').attr('action'),
        success: function (result) {
        	if(result.rc != undefined && result.rc.rc == 9001){
    			loginDialog(result);
    		} else if(result.rc != undefined && result.rc.rc == 9999) {
    			authDialog(result);
    		} else {
    			url = result.split('?')[0];
	        	$('.image-view img').attr('src', url);
	        	$('.image-view').show();
	        	$('#img-url').attr('value', url);
    		}
        }
	});
}