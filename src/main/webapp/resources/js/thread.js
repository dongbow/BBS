var root = '/bbs';

$(function(){
  $(document).ready(function() {
	  $('body').find('.tcontent img').attr('title','点击查看大图');
  });

  $('.tcontent img').click(function(){
	  var imgsrc = this.src;
	  window.open(imgsrc);
  });
  
  $('.pr').live('click', function() {
	  if($(this).hasClass('other')) {
		  $('#report_other').show();
	  } else {
		  $('#report_other').hide();
	  }
	  $('.pr').removeClass('select');
	  $(this).addClass('select');
  });
  
});

function sReply(pid, tid) {
	var uid = $('#uid').val();
	var bid = $('#bid').val();
	var gid = $('#gid').val();
	var cid = $('#cid').val();
	var pName = $('#reply_' + pid + ' .authorname').text();
	var pTime = $('#reply_' + pid + ' .createreplytime').text();
	var pCont = $('#reply_' + pid + ' .tcontent').html();
	var pFloor = $('#reply_' + pid + ' .tmenu span').attr('id').split('_')[1];
	$.get(root + '/post/new/reply?pid=' + pid + '&tid=' + tid + '&floor=' + pFloor, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else {
			$('#sonreplyeditor').html(result);
			CKEDITOR.replace('sonreplyeditorcont', { toolbar: 'post', height: '150px', width: '515px', resize_enabled: false, removePlugins: 'elementspath'});
			$('.pinfo').html(pName + '于' + pTime + '发表：');
			$('.ctxt').html(pCont.substring(0, 100));
			$('.uid').attr('value', uid);
			$('.gid').attr('value', gid);
			$('.bid').attr('value', bid);
			$('.tid').attr('value', tid);
			$('.cid').attr('value', cid);
			$('.pid').attr('value', pid);
			$('#sonFM').attr('action', root + '/board/' + bid +'/topic/' + tid + '/new/reply/do');
			var endtop = ($(window).height() - $('#sonreplyeditor').height())/2;
			var endleft = ($(window).width() - $('#sonreplyeditor').width())/2;
			$('#sonreplyeditor').css({
				'top': endtop + 'px',
				'left': endleft + 'px'
			});
			$('.popreplyclose').click(function() {
				$('#sonreplyeditor').hide();
				$('#sonreplyeditor').html('');
			});
			$('#sonreplyeditor').show();
		}
	});
}

function report(uid, tid, rid, floor) {
	var url = root + '/post/topic/report?uid=' + uid + '&tid=' + tid;
	if(rid != 0) {
		url += '&rid=' + rid;
	}
	if(floor != 0) {
		url += '&floor=' + floor;
	}
	$.get(url, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else {
			$('.bbs-report').html(result);
			$('#checktip').css({
				'top' : ($(window).height() - $('#checktip').height())/2 + 'px',
				'left': ($(window).width() - $('#checktip').width())/2+'px'
			});
			$('#checktip p').css('margin-top', '0');
			$('.report-btn').attr('onclick', 'doReport(' + uid + ',' + tid + ',' + rid + ',' + floor + ');');
			$('.bbs-report').show();
		}
	});
}

function doReport(uid, tid, rid, floor) {
	var rs = $('.select').val();
	if(!rs) {
		dialog('请选择一个原因');
		return false;
	}
	var url = '';
	if(floor == 0) {
		url = window.location.href;
	} else {
		//FIXME 回复的链接地址
		url = window.location.href;
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
	$.post(root + '/post/topic/report/do', {
		'uid': uid,
		'tid': tid,
		'rid': rid,
		'floor': floor,
		'rs': rs,
		'other': other,
		'url': url
	}, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 1){
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialog('举报成功');
		} else {
			$('.bbs-report').html('');
			$('.bbs-report').hide();
			dialog(result.msg);
		}
	});
}

function gofloor(total, count, size, floor) {
	if(floor) {
		if(floor == 0 || (floor > count) || (floor / size > total)) {
			dialog('楼层不存在');
			return false;
		} else {
			window.location = $('#spacelocal a').attr('href') + '/gofloor?floor=' + floor + '&page=' + Math.ceil(floor / size);
		}
	}
}

function gopage(e) {
	if(e.keyCode == 13) {
		window.location = $('#spacelocal a').attr('href') + '?page=' + $('#kkpager_btn_go_input').val();
	}
}

function nt(uid) {
	$.post(root + "/system/admin/sysmanage/user/talk", {
		'uid': uid
	}, function(result) {
		if(result.rc.rc == 9001){
			loginDialog();
			return false;
		} else if(result.rc == 0){
			dialog(result.msg);
		} else if(result.rc == 3005) {
			dialog(result.msg);
		} else {
			if($('.bcf').length > 0) {
				$('.bcf').text(parseInt($('.bcf').html()) + 1);
			}
			dialog(result.msg);
		}
	});
}





