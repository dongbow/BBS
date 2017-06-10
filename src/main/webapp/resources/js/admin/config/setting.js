$(function() {
	$('.system-save').bind('click', systemSave);
});

function systemSave(event) {
	event.preventDefault();
	$(this).removeClass('fa-chevron-down');
	bootbox.confirm({
        title: "系统提示",
        message: "确定修改系统设置?",
        buttons: {
            cancel: {
                label: '取消'
            },
            confirm: {
                label: '确定'
            }
        },
        callback: function (data) {
        	if (data == true) {
        		$.post($('.system-save').attr('href'), {
            		'isOpenBbs': $('#isOpenBbs').val(),
            		'isAllowRegister': $('#isAllowRegister').val(),
            		'isOpenTopicAudit': $('#isOpenTopicAudit').val(),
            		'isOpenReplyAudit': $('#isOpenReplyAudit').val(),
            		'isOpenBadWord': $('#isOpenBadWord').val()
            	}, function(result) {
            		if(result.rc != undefined && result.rc.rc == 9001){
            			loginDialog(result);
            		} else if(result.rc != undefined && result.rc.rc == 9999) {
            			authDialog(result);
            		} else if(result.rc == 1) {
            			refreshLocation(result.msg);
                	} else {
                		failTip(result.msg);
                	}
            	});
        	}
        }
	});
}