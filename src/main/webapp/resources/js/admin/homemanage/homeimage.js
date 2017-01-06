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
	var way = $('#way').val();
	var sort = $('#sort').val();
	var status = $('#status').val();
	if(title && link && way && url && sort && status) {
		$.post($('.data-add').attr('href'), {
			"title": title,
			"link": link,
			"url": url,
			"way": way, 
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

function dataUpdateSave() {
	var title = $('#title').val();
	var link = $('#link').val();
	var url = $('#img-url').val();
	var way = $('#way').val();
	var sort = $('#sort').val();
	var status = $('#status').val();
	if(title && link && url && way && sort && status) {
		$.post($('.data-update').attr('href'), {
			"id": $('#data-call-id').val(), 
			"title": title,
			"link": link,
			"way": way, 
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
        beforeSend: function() {
        	$('.image-view').show();
        	$('.loading').show();
        }, 
        success: function (result) {
        	if(result.rc != undefined && result.rc.rc == 9001){
    			loginDialog(result);
    		} else if(result.rc != undefined && result.rc.rc == 9999) {
    			authDialog(result);
    		} else {
    			url = result.split('?')[0];
    			$('.loading').hide();
	        	$('.image-view img').attr('src', url);
	        	$('#img-url').attr('value', url);
    		}
        }
	});
}