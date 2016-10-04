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
		var params=$(this).serialize();
		if($(this).val()==null||$(this).val()==""){
			$('#error').show();
			$('#error').html('用户名不能为空');
		}else{
			$.ajax({
				url:"account/exits.htm",
				type:"post",
				dataType:"json",
				data:params,
				beforeSend: function(){
					$('#error').show();
					$('#error').html('正在检测该用户是否存在...');
				},
				success:function(result){
					var json = eval("("+result+")");
					if(json.exits!='true'){
						$('#error').show();
						$('#error').html('该用户不存在，请重新输入');
				    }else{
				    	$('#error').hide();
				    	$('#sum').html(1);
				    }
				}
			});
		}
	});
	
	$('#email').blur(function(){
		var params=$(this).serialize();
		var name=$('#user').serialize();
		if($(this).val()==null||$(this).val()==""){
			$('#error').show();
			$('#error').html('邮箱不能为空');
		}else if($('#user').val()==""||$('#user').val()==null){
			$('#error').show();
			$('#error').html('请填过用户名之后再填邮箱');
		}else{
			$.ajax({
				url:"account/isnameMatchmail.htm",
				type:"post",
				dataType:"json",
				data:params+"&"+name,
				beforeSend: function(){
					$('#error').show();
					$('#error').html('正在检测用户名与邮箱是否匹配...');
				},
				success:function(result){
					var json = eval("("+result+")");
					if(json.exits!='true'){
						$('#error').show();
						$('#error').html('用户名与邮箱不匹配，请检查之后重新输入');
				    }else{
				    	$('#error').hide();
				    	$('#sum').html(2);
				    }
				}
			});
		}
	});
	
	$('#valid').blur(function(){
		var params=$(this).serialize();
		if($(this).val()==null||$(this).val()==""){
			$('#error').show();
			$('#error').html('验证码不能为空');
		}else if($(this).val().length!=4){
			$('#error').show();
			$('#error').html('验证码只能为4位');
		}else{
			$.ajax({
				url:"account/validateCode.htm",
				type:"post",
				dataType:"json",
				data:params,
				success:function(msg){
					var json = eval("("+msg+")");
					if(json.number=='true'){
						$('#error').hide();
						$('#sum').html(3);
					}else{
						$('#error').show();
						$('#error').html('验证码错误，请重新输入');
					}
				}
			});
		}
	});
	
	$('#codeimg').click(function() {
		$('#codeimg').attr('src', root + '/validateCode.img?ver='+new Date().getTime()); 
	});
	
	$('.fullBtnBlue').click(function(){
		$('#user').trigger('blur');
		$('#email').trigger('blur');
		$('#valid').trigger('blur');
		
		if($('#sum').html()!=3){
			$('#error').show();
			$('#error').html('不可以留空');
			return false;
		}else{
			$('#mainForm').attr('action','account/doforget.htm');
			$('#mainForm').submit();
		}
	});
	
	$('#resend').click(function(){
		var fname=$('#fname').serialize();
		var fmail=$('#fmail').serialize();
		//alert(fname+"/"+fmail);
		$.ajax({
			url:"reSendMail.htm",
			type:"post",
			dataType:"json",
			data:fname+"&"+fmail,
			beforeSend: function(){
				$('#resendtip').html('邮件正在重新发送，请稍后...');
			},
			success:function(result){
				var json = eval("("+result+")");
				if(json.exits!='false'){
					$('#resendtip').html('邮件重新发送成功，如果依然长时间未收到，请重新发送，或者联系管理员');
			    }else{
			    	$('#resendtip').html('<label style="color:#f00;">邮件重新发送失败，请重新发送，或者联系管理员</label>');
			    }
			}
		});
	});

});
	
	
	
	
	
	
	
	
	
	
	