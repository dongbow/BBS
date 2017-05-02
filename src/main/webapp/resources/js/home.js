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
	},
	getCity : function(value) {
		return root + "/home/get/citys/" + value;
	}
};

var Friends = {
	init : function(type) {
		$('#homeleftmenu').css('height', $('#rhomecont').height());
		if(type == 'add') {
			$('#rhomecont ul li').removeClass('csth');
			$('.cshead').addClass('csth');
		}
	}
};

var message = {
		init : function(type) {
			$('#homeleftmenu').css('height', $('#rhomecont').height());
			if(type == 'notice') {
				$('#rhomecont ul li').removeClass('csth');
				$('.cshead').addClass('csth');
			}
		}
	};

$(function() {

	if($('#nmail').length > 0) {
		$("#nmail").changeTips({
			divTip : ".on_changes"
		});
	}

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

	$('.tipclose').click(function() {
		$('#bg').hide();
		$('#checktip').hide();
	});
	
	$('#province').change(function() {
		$.post(Setting.getCity($(this).val()), function(data) {
			$('#city').html("");
			$('#city').append('<option value="-1">城市</option>');
			for(var i = 0;i<data.length;i++) {
				var city = data[i];
				var html = '';
				html += '<option value="' + city.id + '"';
				if(i == 0) {
					html += ' selected ';
				}
				html += '>' + city.name + '</option>';
				$('#city').append(html);
			}
		});
	});
	
	$('#favids').click(function() {
		if ($(this).is(':checked')) {
			$("input[name='favId']").each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$("input[name='favId']").each(function() {
				$(this).prop("checked", false);
			});
		}
	});
	
	$('.btn-privacy').bind('click', privacy);
	
	$('.mailbutton').bind('click', upEmail);
	
	$('.btn-pwd').bind('click', upPwd);
	
	$('.profile-btn').bind('click', upProfile);
});

function favCancle(id) {
	var count = 0;
	var ids = new Array();
	if(id != -1) {
		count = 1;
		ids.push(id);
	} else {
		$("input[name='favId']").each(function() {
			if ($(this).is(':checked')) {
				count++;
				ids.push($(this).val());
			}
		});
	}
	if(parseInt(count) == 0){
	    dialog("至少选择一条数据");
	} else {
		dialog_confirm("确定删除选中的" + count + "条数据?", function() {
			$.post(root + '/home/favorite/cancel', {
				"ids": ids
			}, function(result) {
				if(result.rc.rc == 9001){
					loginDialog();
				} else if(result.rc == 0) {
					dialog(result.msg);
				} else {
					dialogWithBtn(result.msg, function() {
						window.location = window.location;
					});
				}
			});
		});
	}
}

function privacy() {
	$.post(root + '/home/setting/profile/update/privacy', {
		"ispublic": $('#ispublic').val(), 
		"isaddfriend": $('#isaddfriend').val(), 
		"ispublicfriend": $('#ispublicfriend').val(), 
		"ispublictopic": $('#ispublictopic').val(), 
		"ispublicreply": $('#ispublicreply').val()
	}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog();
		} else if(result.rc == 0) {
			dialog(result.msg);
		} else {
			dialogWithBtn(result.msg, function() {
				window.location = window.location;
			});
		}
	});
}

function upEmail() {
	var regmail = /^([\w-_]+(?:\.[\w-_]+)*)@((?:[a-z0-9]+(?:-[a-zA-Z0-9]+)*)+\.[a-z]{2,6})$/i;
	var omail = $('#omail').val();
	var nmail = $('#nmail').val();
	if(omail && nmail) {
		if(regmail.test(omail) && regmail.test(nmail)) {
			$.post(root + "/home/setting/profile/update/email", {
				'omail': omail,
				'nmail': nmail
			}, function(result) {
				if(result.rc.rc == 9001){
					loginDialog();
				} else if(result.rc == 0) {
					dialog(result.msg);
				} else {
					dialogWithBtn(result.msg, function() {
						window.location = window.location;
					});
				}
			});
		} else {
			dialog('邮箱格式不正确');
		}
	} else {
		dialog('邮箱不能为空');
	}
}

function upPwd() {
	var opwd = $('#opwd').val();
	var npwd = $('#npwd').val();
	var rnpwd = $('#rnpwd').val();
	if(opwd && npwd && rnpwd) {
		if(npwd.length < 6 || npwd.length > 16 || rnpwd.length < 6 || rnpwd.length > 16) {
			dialog('密码长度为6-16位');
		} else if(npwd != rnpwd) {
			dialog('两次密码输入不一致');
		} else {
			$.post(root + "/home/setting/profile/update/password", {
				"opwd": $.md5(opwd),
				"npwd": $.md5(npwd),
				"rnpwd": $.md5(rnpwd)
			}, function(result) {
				if(result.rc.rc == 9001){
					loginDialog();
				} else if(result.rc == 0) {
					dialog(result.msg);
				} else {
					dialogWithBtn(result.msg, function() {
						window.location = root + result.href;
					});
				}
			});
		}
	} else {
		dialog('密码不能为空');
	}
}

function initData(page, url) {
	$.get(url, {"page": page}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog();
		} else if(result.rc == 0) {
			dialog(result.msg);
		} else {
			var sHtml = '';
			for (var i = 0; i < result.data.length; i++) {
				var gold = result.data[i];
				sHtml += '<tr>';
				sHtml += '<td style="width:10%;height:30px;border:1px solid #ddd">' + gold.goldDesc + '</td>';
				sHtml += '<td style="width:10%;height:30px;border:1px solid #ddd">' + gold.goldValue + '</td>';
				sHtml += '<td style="width:10%;height:30px;border:1px solid #ddd">' + gold.createTime + '</td>';
				sHtml += '</tr>';
			}
			$('#golds-data tbody').html(sHtml);
		}
	});
}

function upProfile() {
	$('.profile-form').ajaxSubmit({
		url: $('.profile-form').attr('action'),
		success: function(result) {
			if(result.rc.rc == 9001){
				loginDialog();
			} else if(result.rc == 0) {
				dialog(result.msg);
			} else {
				dialogWithBtn(result.msg, function() {
					window.location = window.location;
				});
			}
		}
	});
}

function requestf(id, sign) {
	if (id && sign) {
		var status = sign == 2 ? 'pass' : 'refause';
		$.post(root + '/home/friends/add/' + status, {
			'id': id,
		}, function(result) {
			if(result.rc.rc == 9001){
				loginDialog();
			} else if(result.rc == 0) {
				dialog(result.msg);
			} else {
				$(this).parent().html('<a href="javascript:;">' + 已通过 + '</a>');
			}
		});
	}
}