var root="/bbs";

$(function(){
	$('#name').focus(function(){
		$(this).addClass('_focus').removeClass('_error');
		$('#utip').css('display','inline');
		$('#reg_error').hide();
		$('#utip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
				+'3-20个字符，允许中文，字母、数字和符号、-_</label>');
	});
	
	$('#name').blur(function(){
		var regname=/^[A-Za-z0-9_\\-\\u4e00-\\u9fa5]+$/;
		if($(this).val()==null||$(this).val()==""){
			$(this).addClass('_error');
			$('#utip').css('display','inline');
			$('#utip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'用户名不能为空</label>');
		}else if($(this).val().length<3||$(this).val().length>20){
			$(this).toggleClass('_error');
			$('#utip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'用户名不能小于3位或大于20位</label>');
		}else if(!regname.test($(this).val())){
			$(this).toggleClass('_error');
			$('#utip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'用户名含有非法字符</label>');
		}else{
			$.ajax({
				url:root + "/account/name_exists",
				type:"post",
				dataType:"json",
				data:{"text": $(this).val()},
				beforeSend: function(){
					$('#utip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
					+'正在检测，请稍后...</label>');
				},
				success:showname
			});
		}
	});
	
	$('#pwd_1').focus(function(){
		$(this).addClass('_focus').removeClass('_error');
		$('#p_1_tip').css('display','inline');
		$('#reg_error').hide();
		$('#p_1_tip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
				+'6-16个字符，允许字母、数字和符号</label>');
	});
	
	$('#pwd_1').blur(function(){
		if($(this).val()==null||$(this).val()==""){
			$(this).addClass('_error');
			$('#p_1_tip').css('display','inline');
			$('#p_1_tip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'密码不能为空</label>');
		}else if($(this).val().length<6||$(this).val().length>16){
			$(this).toggleClass('_error');
			$('#p_1_tip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'密码不能小于6位或大于16位</label>');
		}else{
			$(this).removeAttr('class');
			$('#p_1_tip').html('<img src="' + root + '/resources/images/tip.png />');
		}
	});
	
	$('#pwd_2').focus(function(){
		$(this).addClass('_focus').removeClass('_error');
		$('#p_2_tip').css('display','inline');
		$('#reg_error').hide();
		$('#p_2_tip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
				+'6-16个字符，允许字母、数字和符号</label>');
	});
	
	$('#pwd_2').blur(function(){
		if($(this).val()==null||$(this).val()==""){
			$(this).addClass('_error');
			$('#p_2_tip').css('display','inline');
			$('#p_2_tip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'密码不能为空</label>');
		}else if($(this).val().length<6||$(this).val().length>16){
			$(this).toggleClass('_error');
			$('#p_2_tip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'密码不能小于6位或大于16位</label>');
		}else if($(this).val()!=$('#pwd_1').val()){
			$(this).toggleClass('_error');
			$('#p_2_tip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'两次密码输入不一致位</label>');
		}else{
			$(this).removeAttr('class');
			$('#p_2_tip').html('<img src="' + root + '/resources/images/tip.png />');
		}
	});
	
	$('#mail').focus(function(){
		$(this).addClass('_focus').removeClass('_error');
		$('#etip').css('display','inline');
		$('#reg_error').hide();
		$('#etip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
				+'请输入正确有效的邮箱，用于找回密码</label>');
	});
	
	$('#mail').blur(function(){
		var regmail=/[\w-]+@{1}[\w-]+\.{1}\w{2,4}(\.{0,1}\w{2}){0,1}/ig;
		if($(this).val()==null||$(this).val()==""){
			$(this).addClass('_error');
			$('#etip').css('display','inline');
			$('#etip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'邮箱不能为空</label>');
		}else if(!regmail.test($(this).val())){
			$(this).toggleClass('_error');
			$('#etip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'邮箱格式不正确</label>');
		}else{
			$.ajax({
				url:root + "/account/email_exists",
				type:"post",
				dataType:"json",
				data:{"text": $(this).val()},
				beforeSend: function(){
					$('#etip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
					+'正在检测，请稍后...</label>');
				},
				success:function(result){
	            	if(result.rc == 3003){
	        			$('#mail').removeAttr('class');
	        			$('#etip').html('<img src="' + root + '/resources/images/tip.png />');
	            	}else{
	            		$('#mail').toggleClass('_error');
	        			$('#etip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
	        					+'该邮箱已经被占用</label>');
	            	}
				}
			});
		}
	});
	
	$('#yzcode').focus(function(){
		$(this).addClass('_focus').removeClass('_error');
		$('#codew').addClass('_focus').removeClass('_error');
		$('#yztip').css('display','inline');
		$('#reg_error').hide();
		$('#yztip').html('<label style="border:1px solid #ddd;background-color:#eee;color:#666;width:auto;height:28px;padding:9px;">'
				+'请输入验证码，不区分大小写</label>');
	});
	
	$('#yzcode').blur(function(){
		if($(this).val()==null||$(this).val()==""){
			$(this).addClass('_error');
			$('#codew').addClass('_error');
			$('#yztip').css('display','inline');
			$('#yztip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'验证码不能为空</label>');
		}else if($(this).val().length!=4){
			$(this).toggleClass('_error');
			$('#codew').toggleClass('_error');
			$('#yztip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
					+'验证码只能是4位</label>');
		}else{
			$.ajax({
				url:root + "/account/validatecode",
				type:"post",
				dataType:"json",
				data:{"validatecode": $(this).val()},
				success:function(result){
					if(result.rc != 1003){
						$('#yzcode').removeAttr('class');
						$('#codew').removeAttr('class');
						$('#yztip').html('<img src="' + root + '/resources/images/tip.png />');
					}else{
						$('#yzcode').toggleClass('_error');
						$('#codew').toggleClass('_error');
						$('#yztip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
								+'验证码不正确</label>');
					}
				}
			});
		}
	});

	$('#codeimg').click(function(){
		$(this).attr('src',root + '/validateCode.img?ver='+new Date().getTime());
	});
	
	$('#goreg').click(function(){
		$('#name').trigger('blur');
		$('#pwd_1').trigger('blur');
		$('#pwd_2').trigger('blur');
		$('#mail').trigger('blur');
		$('#yzcode').trigger('blur');
		var errLength=$('._error').length;
		if(errLength!=0){
			return false;
		}else{
			$('#regform').attr('action',root + '/account/register/do');
			$('#regform').submit();
		}
	});
	
	$('#reset').click(function(){
		$('._error').removeClass('_error');
		$('._focus').removeClass('_focus');
		$('.re').css('display','none');
	});
});

function showname(result){
	if(result != null && result.rc == 1001){
		$('#name').removeAttr('class');
		$('#utip').html('<img src=' + root + '/resources/images/tip.png />');
    }else{
    	$('#name').toggleClass('_error');
		$('#utip').html('<label style="border:1px solid #ffbdbe;background-color:#ffebeb;color:#f00;width:auto;height:28px;padding:9px;">'
				+'该用户名已存在，请重新输入</label>');
    }
}















