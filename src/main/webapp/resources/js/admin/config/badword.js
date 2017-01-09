$(function() {
	$('#data-add').bind('click', badAdd);
});

function badAdd(event) {
	event.preventDefault();
	bootbox.setLocale("zh_CN");
	bootbox.prompt("输入敏感词", function(data) {
		if(data) {
			$.post($('#data-add').attr('href'), {
				"word": data
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