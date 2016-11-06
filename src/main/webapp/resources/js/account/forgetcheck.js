var root = "/bbs";

$(document).ready(function(){
	var err=$('#error').html();
	if(err!=null&&err!=""){
		$('#error').show();
	}else{
		$('#error').hide();
	}
});

$(function() {
	
	$('#user').blur(function(){
		if($(this).val()){
			$.ajax({
				url: root + "/account/name_exists",
				type:"post",
				dataType:"json",
				data:{"text": $(this).val()},
				beforeSend: function(){
					$('#error').show();
					$('#error').html('正在检测该用户是否存在...');
				},
				success:function(result){
					if(result && result.rc == 1001) {
						$('#error').show();
						$('#error').html(result.msg);
					} else {
				    	$('#error').hide();
				    }
				}
			});
		}
	});
	
	$('#email').blur(function(){
		if($(this).val() && $('#user').val()){
			$.ajax({
				url: root + "/account/email_exists",
				type:"post",
				dataType:"json",
				data:{"text": $(this).val()},
				beforeSend: function(){
					$('#error').show();
					$('#error').html('正在检测用户名与邮箱是否匹配...');
				},
				success:function(result){
					if(result && result.rc == 3003) {
						$('#error').show();
						$('#error').html(result.msg);
					} else {
				    	$('#error').hide();
				    }
				}
			});
		}
	});
	
	$('#valid').blur(function(){
		if($(this).val() && isNaN($(this).val())) {
			$.ajax({
				url:root + "/account/validatecode",
				type:"post",
				dataType:"json",
				data:{"validatecode": $(this).val()},
				success:function(msg){
					if(msg && msg.rc == 1003){
						$('#error').show();
						$('#error').html(msg.msg);
					}else{
						$('#error').hide();
					}
				}
			});
		}
	});
	
	$('#codeimg').click(function() {
		$('#codeimg').attr('src', root + '/validateCode.img?ver='+new Date().getTime()); 
	});
	
	$('.fullBtnBlue').click(function() {
		if($('#user').val() && $('#email').val() && $('#valid').val() && isNaN($('#valid').val())) {
			$('#mainForm').attr('action', root + '/account/forget/do');
			$('#mainForm').submit();
		} else {
			$('#error').show();
			$('#error').html('不可以留空');
			return false;
		}
	});
	
	$('#resend').click(function(){
		var fname=$('#fname').val();
		var fmail=$('#femail').val();
		$.ajax({
			url: root + "/account/forget/sendmail/re",
			type:"post",
			dataType:"json",
			data:{"fname": fname, "femail": fmail},
			beforeSend: function(){
				$('#resendtip').html('邮件正在重新发送，请稍后...');
			},
			success:function(result){
				if(result.rc == 1){
					$('#resendtip').html('邮件重新发送成功，如果依然长时间未收到，请重新发送，或者联系管理员');
			    }else{
			    	$('#resendtip').html('<label style="color:#f00;">邮件重新发送失败，请重新发送，或者联系管理员</label>');
			    }
			}
		});
	});

});
	
	
	
	
	
	
	
	
	
	
	