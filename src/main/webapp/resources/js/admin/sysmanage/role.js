$(function() {
	$('.role-add').bind('click', addPanel);
	
	$('.role-auth').bind('click', roleAuth);
	
	$('.close').live('click', close);
	
});

function close() {
	$('#role-modal').children('div').remove();
	$('#role-modal').modal('hide');
}

function addPanel(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#role-modal').html(result);
			$('#role-modal').modal();
			$('.modal-footer').on('click', '.save', saveRole);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function saveRole() {
	var name = $('#name').val();
	var desc = $('#desc').val();
	var color = $('#color').val();
	var type = $('#type').val();
	var status = $('#status').val();
	if(name && color && type && status) {
		$.post($('.role-add').attr('href'), {
			"name": name,
			"desc": desc,
			"color": color,
			"type": type,
			"status": status,
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

function roleAuth(event) {
	event.preventDefault();
	$.get($(this).attr('href'), {"rid": $(this).attr('data-role')}, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#role-modal').html(result);
			$('#role-modal').modal();
			$('.modal-footer').on('click', '.save', saveAuth);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function saveAuth() {
	
}

var zTreeNodes = {
	init: function(id) {
		$.get(ROOT + '/system/admin/sysmanage/role/tree', {"rid": id}, function(zNodes) {
			tree = $.fn.zTree.init($("#tree"), setting, zNodes);  
	        tree.expandAll(true);
		});
	}
};

var setting = {
    check: {
        enable: true, 
        chkboxType: { "Y" : "ps", "N" : "ps" }
    },
    data: {
        simpleData: {
            enable: true
        }
    }
};