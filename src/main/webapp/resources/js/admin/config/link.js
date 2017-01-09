function dataAddSave() {
	var name = $('#panel-name').val();
	var link = $('#link').val();
	var contact = $('#contact').val();
	var endtime = $('#panel-endtime').val();
	var sign = $('#panel-sign').val();
	var status = $('#panel-status').val();
	if(name && link && sign && status) {
		$.post($('.data-add').attr('href'), {
			"name": name,
			"link": link,
			"contact": contact,
			"endtime": endtime,
			"sign": sign,
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
	var name = $('#panel-name').val();
	var link = $('#link').val();
	var contact = $('#contact').val();
	var endtime = $('#panel-endtime').val();
	var sign = $('#panel-sign').val();
	var status = $('#panel-status').val();
	if(name && link && sign && status) {
		$.post($('.data-update').attr('href'), {
			"id": $('#data-call-id').val(),
			"name": name,
			"link": link,
			"contact": contact,
			"endtime": endtime,
			"sign": sign,
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