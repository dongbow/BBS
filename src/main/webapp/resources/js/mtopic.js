$(function() {
	$('.gtp').bind('click', gtp);
	
	$('.qgtp').bind('click', qgtp);
	
	$('.home').bind('click', home);
	
	$('.qhome').bind('click', qhome);
	
	$('.ltp').bind('click', ltp);
	
	$('.qltp').bind('click', qltp);
	
	$('.openreply').bind('click', openreply);
	
	$('.closereply').bind('click', closereply);
	
	$('.cream').bind('click', cream);
	
	$('.qcream').bind('click', qcream);
	
	$('.tmove').bind('click', tmove);
	
});

function gtp(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var html = '选择全局置顶时长,不选将永久全局置顶';
	dialog_confirm_time(html, function(time) {
		$.post(root + '/manage/bmc/topic/globaltop', {
			"tid": tid,
			"time": time,
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function qgtp(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	dialog_confirm('确定取消该帖子全局置顶?', function() {
		$.post(root + '/manage/bmc/topic/qxglobaltop', {
			"tid": tid,
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function home(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var html = '选择推送首页时长,不选将永久推送首页';
	dialog_confirm_time(html, function(time) {
		$.post(root + '/manage/bmc/topic/home', {
			"tid": tid,
			"time": time,
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function qhome(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	dialog_confirm('确定取消推送首页?', function() {
		$.post(root + '/manage/bmc/topic/qxhome', {
			"tid": tid,
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function ltp(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	var html = '选择本版置顶时长,不选将永久本版置顶';
	dialog_confirm_time(html, function(time) {
		$.post(root + '/manage/bmc/topic/localtop', {
			"tid": tid,
			"time": time,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function qltp(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	dialog_confirm("确定取消该帖子本版置顶?", function() {
		$.post(root + '/manage/bmc/topic/qxlocaltop', {
			"tid": tid,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function openreply(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	dialog_confirm('确定将该帖子关闭回复?', function() {
		$.post(root + '/manage/bmc/topic/openreply', {
			"tid": tid,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function closereply(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	dialog_confirm('确定将该帖子关闭回复?', function() {
		$.post(root + '/manage/bmc/topic/closereply', {
			"tid": tid,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function cream(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	dialog_confirm('确定将该帖子加精?', function() {
		$.post(root + '/manage/bmc/topic/cream', {
			"tid": tid,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function qcream(event) {
	event.preventDefault();
	var tid = $(this).attr('data-tid');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	dialog_confirm('确定将该帖子取消加精?', function() {
		$.post(root + '/manage/bmc/topic/qxcream', {
			"tid": tid,
			"bid": bid,
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	});
}

function tmove() {
	var tid = $('.system_option').attr('id');
	var bid = $(this).attr('data-bid');
	var role = $(this).attr('data-role');
	var url = root + '/manage/bmc/topic/move?tid=' + tid + '&bid=' + bid + '&role=' + role;
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if (result.rc != undefined && result.rc == 9999) {
			noAuth();
			return false;
		} else {
			$('.bbs-report').html(result);
			$('#checktip').css({
				'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
				'left': ($(window).width() - $('#checktip').width())/2+'px'
			});
			$('#checktip p').css('margin-top', '0');
			$('.report-btn').attr('onclick', 'move(' + bid + ', ' + tid + ', "' + role +'");');
			$('.bbs-report').show();
		}
	});
}

function move(bid, tid, role) {
	var destbid = $('.move-bid').val();
	var cid = $('.move-cid').val();
	var gid = $('.move-gid').val();
	if (bid && tid && role && destbid && cid && gid) {
		$.post(root + '/manage/bmc/topic/move', {
			"tid": tid,
			"srcbid": bid, 
			"destbid": $('.move-bid').val(),
			"cid": $('.move-cid').val(),
			"gid": $('.move-gid').val(),
			"role": role
		}, function(result) {
			if(result.rc != undefined && result.rc.rc == 9001){
				loginDialog();
				return false;
			} else if(result.rc == 1){
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialogWithBtn('移动成功', function() {
					window.location = window.location;
				});
			} else {
				$('.bbs-report').html('');
				$('.bbs-report').hide();
				dialog(result.msg);
			}
		});
	} else {
		dialog('请选择相应信息');
	}
}

function tdel(bid, id, sign) {
	var url = root + '/manage/bmc/topic/delete?tid=' + id + '&bid=' + bid;
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if (result.rc != undefined && result.rc == 9999) {
			noAuth();
			return false;
		} else {
			$('.bbs-report').html(result);
			$('#checktip').css({
				'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
				'left': ($(window).width() - $('#checktip').width())/2+'px'
			});
			$('#checktip p').css('margin-top', '0');
			$('.report-btn').attr('onclick', 'mDelete(' + bid + ', ' + id + ', "' + sign +'");');
			$('.bbs-report').show();
		}
	});
}

function mDelete(bid, id, sign) {
	var rs = $('.select').val();
	if(!rs) {
		dialog('请选择一个原因');
		return false;
	}
	var other = '';
	if($('.select').hasClass('other')) {
		other = $('#report_message').val();
		if(other) {
			if(other.length < 5 || other.length > 50) {
				dialog('字符在5-50之间');
				return false;
			}
		} else {
			dialog('请输入理由');
			return false;
		}
	}
	$.post(root + '/manage/bmc/topic/delete', {
		'tid': id,
		'bid':bid, 
		'rs': rs,
		'other': other,
		'sign': sign
	}, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 1){
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialogWithBtn('删除成功', function() {
				window.location = window.location;
			});
		} else {
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialog(result.msg);
		}
	});
}

function replyDel(bid, rid, sign) {
	var url = root + '/manage/bmc/reply/delete?rid=' + rid + '&bid=' + bid;
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if (result.rc != undefined && result.rc.rc == 9999) {
			noAuth();
			return false;
		} else {
			$('.bbs-report').html(result);
			$('#checktip').css({
				'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
				'left': ($(window).width() - $('#checktip').width())/2+'px'
			});
			$('#checktip p').css('margin-top', '0');
			$('.report-btn').attr('onclick', 'doDelete(' + bid + ', ' + rid + ', "' + sign +'");');
			$('.bbs-report').show();
		}
	});
}

function doDelete(bid, rid, sign) {
	var rs = $('.select').val();
	if(!rs) {
		dialog('请选择一个原因');
		return false;
	}
	var other = '';
	if($('.select').hasClass('other')) {
		other = $('#report_message').val();
		if(other) {
			if(other.length < 5 || other.length > 50) {
				dialog('字符在5-50之间');
				return false;
			}
		} else {
			dialog('请输入理由');
			return false;
		}
	}
	$.post(root + '/manage/bmc/reply/delete', {
		'rid': rid,
		'bid': bid,
		'rs': rs,
		'other': other,
		'sign': sign
	}, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 1){
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialogWithBtn('删除成功', function() {
				window.location = window.location;
			});
		} else {
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialog(result.msg);
		}
	});
}