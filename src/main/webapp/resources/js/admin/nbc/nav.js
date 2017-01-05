

function dataAddSave() {
	var name = $('#data-p-name').val();
	var desc = $('#desc').val();
	var sort = $('#sort').val();
	var status = $('#data-p-status').val();
	if(name && sort && status) {
		$.post($('.data-add').attr('href'), {
			"name": name,
			"desc": desc,
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
	var name = $('#data-p-name').val();
	var desc = $('#desc').val();
	var sort = $('#sort').val();
	var status = $('#data-p-status').val();
	if(name && sort && status) {
		$.post($('.data-update').attr('href'), {
			"id": $('#data-call-id').val(), 
			"name": name,
			"desc": desc,
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
