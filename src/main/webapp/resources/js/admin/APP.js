var ROOT = '/bbs';

function loginDialog() {
	bootbox.alert(result.msg, function() {
		window.location = result.data;
	});
}