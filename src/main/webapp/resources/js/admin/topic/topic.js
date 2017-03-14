$(function() {
	$('.topic-data').bind('click', lookTopic);
	
	$('.data-pass').bind('click', options);
	
	$('.data-refause').bind('click', options);
	
	$('.data-cream').bind('click', options);
	
	$('.data-qxcream').bind('click', options);
	
	$('.data-hot').bind('click', options);
	
	$('.data-qxhot').bind('click', options);
	
	$('.data-qxglobal').bind('click', options);
	
	$('.data-qxlocal').bind('click', options);
	
});

function lookTopic() {
	var content = $(this).attr('data-value');
	if(content.indexOf('script') > 0) {
		$('.modal-body').text(content);
	} else {
		$('.modal-body').html(content);
	}
	$('#topic-content-modal').modal();
}

function options(event) {
	event.preventDefault();
	var count = 0;
	var url = $(this).attr('href');
	var type = $(this).attr('data-type');
	var ids = new Array();
	if ("all" == type) {
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
        message: "确定操作选中的" + count + "条数据?",
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