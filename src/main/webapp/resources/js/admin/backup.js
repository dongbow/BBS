$(function() {
	$('.back-add').bind('click', add);
	
	$('.back-restore').bind('click', restore);
});

function add(event) {
	event.preventDefault();
	bootbox.setLocale("zh_CN");
	bootbox.prompt("输入备份文件名(非必填)", function(data){ 
		$.post($('.back-add').attr('href'), {
			"exec": "point", 
			"name": data
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog(result);
			} else if(result.rc != undefined && result.rc.rc == 9999) {
				authDialog(result);
			} else if(result.rc == 1){
				refreshLocation(result.msg);
			} else {
				failTip(result.msg);
			}
		});
	});
}

function restore(event) {
	event.preventDefault();
	bootbox.confirm({
        title: "系统提示",
        message: "确定恢复当前选中的备份文件?",
        buttons: {
            cancel: {
                label: '取消'
            },
            confirm: {
                label: '确定'
            }
        },
        callback: function (data) {
        	if(data == true) {
        		$.post($('.back-restore').attr('href'), {
	            	"id": $('.back-restore').attr('data-id')
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