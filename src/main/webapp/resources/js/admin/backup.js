$(function() {
	$('.back-add').bind('click', add);
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