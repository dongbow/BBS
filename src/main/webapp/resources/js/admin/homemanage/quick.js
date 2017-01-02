

function dataAddSave() {
	var name = $('#name').val();
	var link = $('#link').val();
	var color = $('#color').val();
	var sort = $('#sort').val();
	var status = $('#status').val();
	if(name && link && color && sort && status) {
		$.post($('.data-add').attr('href'), {
			"name": name,
			"link": link,
			"color": color,
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
