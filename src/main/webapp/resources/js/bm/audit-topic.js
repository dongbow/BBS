$(function(){
	
	$('.data-content').click(function() {
		var content = $(this).attr('data-view');
		$('#content-modal').find('.modal-title').html('预览');
		$('#content-modal').find('.modal-body').html(content);
		$('#content-modal').modal();
	});
	
	$('.topic-pass').bind('click', pass);
	
	$('.topic-delete').bind('click', refause);
});

function pass(event) {
	event.preventDefault();
	var type = $(this).attr('data-type');
	var count = 0;
	var url = $(this).attr('href');
	var ids = new Array();
	if (type == 'all') {
		$(".data-check-id").each(function() {
			if ($(this).is(':checked')) {
				count++;
				ids.push($(this).attr('data-id'));
			}
		});
		if(parseInt(count) == 0){
		    bootbox.alert({
		        message: "至少选择一条数据",
		        size: 'small'
		    });
		    return;
		}
	} else {
		ids.push($(this).attr('data-id'));
		count = 1;
	}
	bootbox.confirm({
        title: "系统提示",
        message: "确定通过选中的" + count + "条数据?",
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
        		$.post(url, {
	            	"ids": ids
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

function refause(event) {
	event.preventDefault();
	var type = $(this).attr('data-type');
	var count = 0;
	var url = $(this).attr('href');
	var ids = new Array();
	if (type == 'all') {
		$(".data-check-id").each(function() {
			if ($(this).is(':checked')) {
				count++;
				ids.push($(this).attr('data-id'));
			}
		});
		if(parseInt(count) == 0){
		    bootbox.alert({
		        message: "至少选择一条数据",
		        size: 'small'
		    });
		    return;
		}
	} else {
		ids.push($(this).attr('data-id'));
		count = 1;
	}
	bootbox.confirm({
        title: "系统提示",
        message: "确定删除选中的" + count + "条数据?",
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
        		$.post(url, {
	            	"ids": ids
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