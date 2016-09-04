var APP_ROOT = "/bbs";
var BBS_OK = 1;

var BBS_URL = {
		doLogin : function() {
			return APP_ROOT + "/system/admin/account/dologin";
		},
		check : function(order) {
			if(order == 0) {
				return APP_ROOT + "/account/name_exists";
			}else {
				return APP_ROOT + "/account/email_exists";
			}
		},
		forget : function(name) {
			return APP_ROOT + "/account/" + name + "/forget";
		}
};

$(function(){
	
	$('#name').blur(function() {
		namecheck();
	});
	
	$('#dologin').click(function(){
		login();
		return false;
	});
	
	$('#remember').click(function(){
		if($(this).hasClass('checked')){
			$(this).attr('value', '0');
			$(this).removeClass('checked');
		} else{
			$(this).attr('value', '1');
			$(this).addClass('checked');
		}
	});
	
	$('#fg_name').blur(function(){
		if(!$(this).val()) {
			return false;
		}
		check_exists($(this).val(), 0);
	});
	
	$('#email').blur(function(){
		if(!$(this).val()) {
			return false;
		}
		check_exists($(this).val(), 1);
	});
	
	$('#forget').click(function() {
		forget();
	});
});

function namecheck() {
	$('.alert').hide();
	if(!$('#name').val()){
		$('.alert').text('用户名不可以为空').show();
		return false;
	}
	$.post(BBS_URL.check(0), {"text" : $('#name').val()}, function(result) {
		if(result.rc == 1001) {
			$('.alert').text('用户名不存在').show();
			return false;
		}
	});
}

function login(){
	namecheck();
	if(!$('#password').val()){
		$('.alert').text('密码不可以为空').show();
		return false;
	}
	$('.alert').hide();
	$.ajax({
		type: "POST",
        url: BBS_URL.doLogin(),
        data: {
        	"name" : $('#name').val(), 
        	"password" : $.md5($('#password').val()), 
        	"remember" : $('#remember').val()
        },
        dataType: "json",
        beforeSend : function() {
        	close();
        },
        success : function(result) {
    		if(result.rc == BBS_OK) {
    			location.href = APP_ROOT + result.href;
    		} else if(result.rc == 1002) {
    			$('.alert').text('密码错误').show();
    			open();
    		} else{
    			$('.alert').text('表单内容不能为空').show();
    			open();
    		}
        }
	});
}

function check_exists(value, order) {
	$.post(BBS_URL.check(order), {"vaule" : value}, function(result) {
		if(result.rc == BBS_OK) {
			
		} else {
			
		}
	});
}

function forget() {
	$.ajax({
		type: "POST",
        url: BBS_URL.forget($('#fg_name').val()),
        data:  {"email" : $('#email').val()},
        dataType: "json",
        beforeSend : function() {
        	
        },
        success : function(result) {
    		if(result.rc == BBS_OK) {
    			
    		} else if(result.rc == 1005) {
    			
    		} else{
    			
    		}
        }
	});

}

function open() {
	$('#name').removeAttr('disabled', '');
	$('#password').removeAttr('disabled', '');
	$('#dologin').removeAttr('disabled', '');
	$('.fa fa-check').text('');
}

function close() {
	$('#name').attr('disabled', '');
	$('#password').attr('disabled', '');
	$('#dologin').attr('disabled', '');
	$('.fa fa-check').text('登录中...');
}