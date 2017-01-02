

function dataAddSave() {
	var name = $('#name').val();
	var link = $('#link').val();
	var location = $('#data-location').val();
	var sort = $('#sort').val();
	var status = $('#data-status').val();
	if(name && link && location && sort && status) {
		$.post($('.data-add').attr('href'), {
			"name": name,
			"link": link,
			"location": location,
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
	var name = $('#name').val();
	var link = $('#link').val();
	var location = $('#data-location').val();
	var sort = $('#sort').val();
	var status = $('#data-status').val();
	if(name && link && location && sort && status) {
		$.post($('.data-update').attr('href'), {
			"id": $('#data-call-id').val(),
			"name": name,
			"link": link,
			"location": location,
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
