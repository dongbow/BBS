$(function() {
	$('.reply-content').bind('click', lookReply);
	
	$('.reply-p-content').bind('click', lookReply);
	
	$('#data-delete').bind('click', deleteReply);
	
	$('.del-reason').bind('click', lookReason);
	
	$('.data-restore').bind('click', restore);
});

function lookReply() {
	var title = $(this).text();
	$('.modal-title').html(title);
	var content = $(this).attr('data-value');
	if(content.indexOf('script') > 0) {
		$('.modal-body').text(content);
	} else {
		$('.modal-body').html(content);
	}
	$('#reply-content-modal').modal();
}

function lookReason() {
	var title = $(this).text();
	$('.modal-title').html(title);
	var reason = $(this).attr('data-value');
	$('.modal-body').html(reason);
	$('#reply-content-modal').modal();
}

function deleteReply(event) {
	event.preventDefault();
	var url = $(this).attr('href');
	var count = 0;
	var ids = new Array();
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
	} else {
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
	        		bootbox.setLocale("zh_CN");
	        		bootbox.prompt('请输入删除原因(非必填),取消在这里依然提交', function(reason) {
	        			$.post(url, {
			            	"ids": ids,
			            	"reason": reason
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
	        		});
	        	}
	        }
	    });
	}
}

function dataUpdateSave() {
	var content = CKEDITOR.instances.content.getData();
	var id = $('#data-call-id').val();
	
	if(id && content) {
		$.post($('.data-update').attr('href'), {
			"id": id,
			"content": content
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

function restore(event) {
	event.preventDefault();
	var url = $(this).attr('href');
	var count = 0;
	var ids = new Array();
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
	} else {
		bootbox.confirm({
	        title: "系统提示",
	        message: "确定恢复选中的" + count + "条评论?",
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
}