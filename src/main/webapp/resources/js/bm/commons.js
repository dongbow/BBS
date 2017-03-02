$(function(){
	
	$('.data-content').click(function() {
		var content = $(this).attr('data-view');
		$('#content-modal').find('.modal-title').html('预览');
		$('#content-modal').find('.modal-body').html(content);
		$('#content-modal').modal();
	});
	
	$('#check-all').click(function() {
		if ($(this).is(':checked')) {
			$("input[type='checkbox']").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("input[type='checkbox']").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$('.data-search').bind('click', search);
	
});

function search(event) {
	event.preventDefault();
	$('#data-form').submit();
}

function loginDialog(result) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(result.rc.msg, function() {
		window.location = ROOT + result.rc.data + '?backurl=' + encodeURIComponent(window.location.href);
	});
}

function authDialog(result) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(result.msg);
}

function notBlank() {
	bootbox.setLocale("zh_CN");
	bootbox.alert('不能留空');
}

function sucTip(msg) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(msg);
}

function refreshLocation(msg) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(msg, function() {
		window.location = window.location;
	});
}

function failTip(msg) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(msg);
}

function doOptions(event) {
	event.preventDefault();
	var bid = $('#sign-bid').val();
	if (bid) {
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
		            	"ids": ids,
		            	"bid": bid
		            }, function(result) {
		            	if(result.rc != undefined && result.rc.rc == 9001){
		        			loginDialog(result);
		        		} else if(result.rc == 9999) {
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