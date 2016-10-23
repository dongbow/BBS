var Setting = {
	init : function(type) {
		$('#homeleftmenu').css('height', $('#rhomecont').height());
		if(type == 'headimg') {
			$('#rhomecont ul li').removeClass('csth');
			$('.cshead').addClass('csth');
		} else if(type == 'password') {
			$('#rhomecont ul li').removeClass('csth');
			$('.cspwd').addClass('csth');
		} else if(type == 'email') {
			$('#rhomecont ul li').removeClass('csth');
			$('.csmail').addClass('csth');
		} else if(type == 'privacy') {
			$('#rhomecont ul li').removeClass('csth');
			$('.cscy').addClass('csth');
		}
	}
};

$(function() {

	$("#nmail").changeTips({
		divTip : ".on_changes"
	});

	$('#nickname').focus(function() {
		$('#nicktip').html('默认昵称为登录名，改后的昵称不能用于登录');
	});

	$('#nickname').blur(function() {
		$('#nicktip').html('');
	});

	$('#birthday').focus(function() {
		$('#birthtip').html('格式：yyyy-MM-dd,例如：2016-03-10');
	});

	$('#birthday').blur(function() {
		$('#birthtip').html('');
	});

	$('#opwd').blur(function() {
		var password = $('#opwd').val();
		var uid = $('#nowname').val();
		if (password != null && password != '') {
			$.ajax({
				url : "account/user_exits.htm",
				type : "post",
				data : "password=" + password + "&uid=" + uid,
				datetype : "json",
				beforeSend : function() {
					$('#otip').html('正在检测，请稍后...');
				},
				success : function(result) {
					var json = eval("(" + result + ")");
					if (json.exits != 'true') {
						$('#otip').html('密码错误，请重新输入');
					} else {
						$('#otip').html('<img src="images/tip.png" />');
					}
				}
			});
		} else {
			$('#otip').html('原密码不能为空');
		}
		;
	});

	$('#npwd').blur(function() {
		var npwd = $('#npwd').val();
		if (npwd != '' && npwd != null) {
			if (npwd.length >= 6 && npwd.length <= 16) {
				$('#ntip').html('<img src="images/tip.png" />');
			} else {
				$('#ntip').html('密码需要在6-16位之间');
			}
		} else {
			$('#ntip').html('新密码不能为空');
		}
	});

	$('#rnpwd').blur(function() {
		var npwd = $('#npwd').val();
		var rnpwd = $('#rnpwd').val();
		if (rnpwd != '' && rnpwd != null) {
			if (rnpwd.length >= 6 && rnpwd.length <= 16) {
				if (npwd == rnpwd) {
					$('#rntip').html('<img src="images/tip.png" />');
				} else {
					$('#rntip').html('两次密码不一致');
				}
			} else {
				$('#rntip').html('密码需要在6-16位之间');
			}
		} else {
			$('#rntip').html('密码不能为空');
		}
	});

	$('#nmail').blur(function() {
		var params = $("#nmail").serialize();
		var regmail = /[\w-]+@{1}[\w-]+\.{1}\w{2,4}(\.{0,1}\w{2}){0,1}/ig;
		if ($(this).val() == null || $(this).val() == "") {
			$('#mailtip').html('邮箱不能为空');
			$('#result').attr('value', '0');
		} else if (!regmail.test($(this).val())) {
			$('#mailtip').html('邮箱格式不正确');
			$('#result').attr('value', '0');
		} else {
			$.ajax({
				url : "account/mail_exits.htm",
				type : "post",
				dataType : "json",
				data : params,
				beforeSend : function() {
					$('#mailtip').html('正在检测，请稍后...');
				},
				success : function(result) {
					var json = eval("(" + result + ")");
					if (json.exits == 'no') {
						$('#mailtip').html('<img src="images/tip.png" />');
						$('#result').attr('value', '1');
					} else {
						$('#mailtip').html('该邮箱已经被占用');
						$('#result').attr('value', '0');
					}
				}
			});
		}
	});

	$('.tipclose').click(function() {
		$('#bg').hide();
		$('#checktip').hide();
	});

	$('.mailbutton').click(function() {
		var params = $("#nmail").serialize();
		var uid = $('#nowname').serialize();
		$('#nmail').trigger('blur');
		var tip = $('#result').val();
		if (tip != 0) {
			$.ajax({
				url : "account/user_updateMail.htm",
				type : "post",
				dataType : "json",
				data : params + '&' + uid,
				beforeSend : function() {
					var titlename = '系统提示';
					var context = '正在更新请稍后...';
					checktip(titlename, context);
					$('#checktip').show();
				},
				success : function(result) {
					var json = eval("(" + result + ")");
					if (json.exits != 'no') {
						var titlename = '系统提示';
						var context = '邮箱修改成功';
						checktip(titlename, context);
						$('#checktip').show();
						$('#mailtip').html('');
						$('#result').attr('value', '0');
						$("#nmail").attr('value', '');
					} else {
						var titlename = '系统提示';
						var context = '邮箱修改失败';
						checktip(titlename, context);
						$('#checktip').show();
					}
				}
			});
		} else {
			return false;
		}
	});
});
