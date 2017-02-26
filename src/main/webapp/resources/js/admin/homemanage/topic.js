$(function() {
	$('.topic-data').bind('click', lookTopic);
	
	$('.topic-time').bind('click', getTimePanel);
	
	$('.qx').bind('click', qx);
	
	$('.qx-all').bind('click', qx);
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

function getTimePanel(event) {
	event.preventDefault();
	$.get($(this).attr('href') + '?tid=' + $(this).attr('data-id'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataTimeSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function dataTimeSave() {
	var time = $('#time').val();
	$.post($('.topic-time').attr('href'), {
		'time': time, 
		'tid': $('#data-call-id').val()
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
}

function qx(event) {
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
        message: "确定取消选中的" + count + "条数据?",
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