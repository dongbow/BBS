var ROOT = '/bbs';

function loginDialog(result) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(result.rc.msg, function() {
		window.location = ROOT + result.rc.data + '?backurl=' + encodeURIComponent(window.location.href);
	});
}

function authDialog(result) {
	bootbox.setLocale("zh_CN");
	bootbox.alert(result.rc.msg);
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