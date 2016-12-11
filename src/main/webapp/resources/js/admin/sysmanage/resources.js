$(function() {
	$('#res-add').bind('click', addPanel);
	
	$('.close').live('click', close);
	
});

function close() {
	$('#res-modal').children('div').remove();
	$('#res-modal').modal('hide');
}

function addPanel(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#res-modal').html(result);
			$('#res-modal').modal();
			$('.modal-footer').on('click', '.save', save);
			$('.modal-footer').on('click', '.cancel', close);
			$('.modal-body').on('change', '.parent', parent);
		}
	});
}

function save() {
	var name = $('#name').val();
	var link = $('#link').val();
	var sign = $('#sign').val();
	var pid = $('#pid').val().split("_")[0];
	var icon = $('#icon').val();
	var type = $('#type').val();
	var sort = $('#sort').val();
	var status = $('#status').val();
	var roles = $('#roles').val();
	if(name && link && sign && pid && icon && type && sort && status && roles) {
		$.post($('#res-add').attr('href'), {
			"name": name,
			"link": link,
			"sign": sign,
			"pid": pid,
			"icon": icon,
			"type": type,
			"sort": sort,
			"status": status,
			"roles": roles
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

function parent() {
	var val_p = $(this).val();
	var restype = val_p.split("_")[1];
	var length = val_p.split("_")[2];
	if(restype == 0) {
		$('.res-type').attr('value', 1);
		$('.res-type-text').attr('value', '菜单');
	} else if(restype == 1) {
		$('.res-type').attr('value', 2);
		$('.res-type-text').attr('value', '按钮');
	} else if(restype == 2) {
		$('.res-type').attr('value', 2);
		$('.res-type-text').attr('value', '按钮');
	} else if(restype == -1) {
		$('.res-type').attr('value', 0);
		$('.res-type-text').attr('value', '模块');
	}
	$('.res-sort').attr('value', length);
}