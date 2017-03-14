$(function() {
	$('.download-detail').bind('click', detail);
	
	$('.file-delete').bind('click', deletefile);
});

function detail(event) {
	event.preventDefault();
	var id = $(this).attr('data-id');
	window.location = $(this).attr('href') + '?id=' + id;
}

function deletefile(event) {
	event.preventDefault();
	var count = 0;
	var url = $(this).attr('href');
	var uuids = new Array();
	var rmids = new Array();
	$(".data-check-id").each(function() {
		if ($(this).is(':checked')) {
			count++;
			uuids.push($(this).attr('data-id'));
			rmids.push($(this).attr('data-rm-id'));
		}
	});
	if(parseInt(count) == 0){
	    bootbox.alert({
	        message: "至少选择一条数据",
	        size: 'small'
	    });
	    return;
	}
	bootbox.confirm({
        title: "系统提示",
        message: "确定删除选中的" + count + "条数据(不可恢复)?",
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
	            	"uuids": uuids,
	            	"rmids": rmids
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