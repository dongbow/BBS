var root = '/bbs';

$(function(){
  $(document).ready(function(){
	  $('body').find('.tcontent img').attr('title','点击查看大图');
  });

	
  $('.tcontent img').click(function(){
	  var imgsrc = this.src;
	  window.open(imgsrc);
  });
  
});

function sReply(pid, tid) {
	var uid = $('#uid').val();
	var bid = $('#bid').val();
	var gid = $('#gid').val();
	var cid = $('#cid').val();
	var pName = $('#reply_' + pid + ' .authorname').text();
	var pTime = $('#reply_' + pid + ' .createreplytime').text();
	var pCont = $('#reply_' + pid + ' .tcontent').text();
	var pFloor = $('#reply_' + pid + ' .tmenu span').id.split('_')[1];
	$.get(root + '/post/new/reply?pid=' + pid + '&tid=' + tid + '&floor=' + pFloor, function(result) {
		if(result.rc != undefined && result.rc.rc == 9001){
			loginDialog();
			return false;
		} else {
			$('#sonreplyeditor').html(result);
			CKEDITOR.replace('sonreplyeditorcont', { toolbar: 'reply', height: '240px', width: '760px', resize_enabled: false, removePlugins: 'elementspath'});
			$('.pinfo').html(pName + '于' + pTime + '发表：');
			$('.quotes p').html(pCont.substring(0, 100));
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






