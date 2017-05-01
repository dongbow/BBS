var root="/bbs";

$(function() {
	$('.user-add').bind('click', addPanel);
	
	$('.close').live('click', close);
});

function close() {
	$('#user-modal').children('div').remove();
	$('#user-modal').modal('hide');
}

function addPanel(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#user-modal').html(result);
			$('#user-modal').modal();
			$('.modal-footer').on('blur', 'panel-name', name);
			$('.modal-footer').on('blur', 'panel-nick', nick);
			$('.modal-footer').on('blur', 'panel-email', email);
			$('.modal-footer').on('click', '.save', save);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function name() {
	var name = $(this).val();
	if (name) {
		$.ajax({
			url:root + "/account/name_exists",
			type:"post",
			dataType:"json",
			data:{"text": $(this).val()},
			success: function(result) {
				if(result != null && result.rc == 1001){
			    }else{
			    	failTip("用户名已存在");
			    }
			}
		});
	}
}

function nick() {
}

function email() {
	var email = $(this).val();
	if (email) {
		$.ajax({
			url:root + "/account/email_exists",
			type:"post",
			dataType:"json",
			data:{"text": $(this).val()},
			success:function(result){
	        	if(result.rc == 3003){
	        	}else{
	        		failTip("该邮箱已经被占用");
	        	}
			}
		});
	}
}

function save() {
	
}