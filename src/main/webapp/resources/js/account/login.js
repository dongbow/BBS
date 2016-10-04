$(document).ready(function() {
	var err = $('#login_error').html();
	if (err != null && err != "") {
		$('#login_error').show();
	} else {
		$('#login_error').hide();
	}
});

$(function() {
	$('.rem').click(function() {
		$(this).toggleClass('selected');
	});

	$('#remember').click(function() {
		if ($(this).hasClass('selected')) {
			$('#rem_status').val(1);
		} else {
			$('#rem_status').val(0);
		}
	});

	$("#signup_name").focus(function() {
		$("#login_error").css('display', 'none');
	});

	$("#signup_password").focus(function() {
		$("#login_error").css('display', 'none');
	});

	$('#login_btn').click(function() {
		var name = $('#signup_name').val();
		var pwd = $('#signup_password').val();
		if (name == "" || name == null || pwd == "" || pwd == null) {
			$('#login_error').show();
			$('#login_error').html('用户名或密码不能为空');
			return false;
		} else {
			$('#login_btn').attr('disabled', 'disabled');
			$('#login_btn').css('background', '#969696');
			$('#login_btn').html('登&nbsp;&nbsp;&nbsp;录&nbsp;&nbsp;&nbsp;中');
			$('#myform').submit();
		}
	});

	$(document).keydown(function(e) {
		if (e.keyCode == 13) {
			$('#login_btn').click();
		}
	});

});