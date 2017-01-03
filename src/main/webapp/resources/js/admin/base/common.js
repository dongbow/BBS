$(function() {
	
	$('#data-ids').click(function() {
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
	
	$('#data-search').bind('click', search);
	
	$('.data-add').bind('click', dataAdd);
	
	$('.data-update').bind('click', dataUpdate);
	
	$('.data-delete').bind('click', dataDelete);
	
	$('.close').live('click', close);
});

function search(event) {
	event.preventDefault();
	var href = $(this).attr('href');
	if(!$('.data-c-id').val()) {
		$('.data-c-id').attr('value', 0);
	}
	$('#dataForm').attr('action',href);
	$('#dataForm').submit();
}

function close() {
	$('#data-modal').children('div').remove();
	$('#data-modal').modal('hide');
}

function dataAdd(event) {
	event.preventDefault();
	$.get($(this).attr('href'), function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataAddSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function dataUpdate(event) {
	event.preventDefault();
	var url = $(this).attr('href') + '?id=' + $(this).attr('data-id');
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog(result);
		} else if(result.rc != undefined && result.rc.rc == 9999) {
			authDialog(result);
		} else {
			$('#data-modal').html(result);
			$('#data-modal').modal();
			$('.modal-footer').on('click', '.save', dataUpdateSave);
			$('.modal-footer').on('click', '.cancel', close);
		}
	});
}

function dataDelete(event) {
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