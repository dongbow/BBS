$(function() {
	$('#data-add').bind('click', blackAdd);
});

function blackAdd(event) {
	event.preventDefault();
	bootbox.setLocale("zh_CN");
	bootbox.prompt("输入IP(允许正则表达式)", function(data) {
		if(data) {
			$.post($('#data-add').attr('href'), {
				"ip": data
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
		}
	}); 
}