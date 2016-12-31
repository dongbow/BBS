var ROOT = '/bbs';

function loginDialog(result) {
	bootbox.alert(result.rc.msg, function() {
		window.location = ROOT + result.rc.data + '?backurl=' + encodeURIComponent(window.location.href);
	});
}

function authDialog(result) {
	bootbox.alert(result.rc.msg);
}

function notBlank() {
	bootbox.alert('不能留空');
}

function sucTip(msg) {
	bootbox.alert(msg);
}

function refreshLocation(msg) {
	bootbox.alert(msg, function() {
		window.location = window.location;
	});
}

function failTip(msg) {
	bootbox.alert(msg);
}