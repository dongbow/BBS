$(function(){
  $(document).ready(function(){
	  $('body').find('.tcontent img').attr('title','点击查看大图');
  });

	
  $('.tcontent img').click(function(){
    var imgsrc = this.src;
    window.open(imgsrc);
  });
  
  //CKEDITOR.replace('sonreplyeditorcont', { toolbar: 'reply', height: '240px', width: '700px' });
  
});

function sonreply(e){
	var father_rid = e.id.split('_')[1];
	var tid = e.id.split('_')[3];
	var replyauthor = $('.replylist_'+father_rid+' .authorname').text();
	var replytime = $('.replylist_'+father_rid+' .createreplytime').text();
	var replycontent = $('.replylist_'+father_rid+' .tcontent').text();
	$('#sonreplyeditor .popreplycont').html(
			'<div class="popreplytitle">'
        		+'<a class="popreplytitlename"><p>RE:</p></a>'
        		+'<a title="关闭" onclick="closereply();" class="popreplyclose" href="javascript:;">X</a>'
           +'</div>'
           +'<div class="quotes">'
		   +'<q>'
				+'<span><a href="">'+replyauthor+' 于 '+replytime +'发表：</a><br>'
						+'<p>'+replycontent.substring(0,100)+'<p></span>'
			+'</q>'
		+'</div>'
		+'<div class="editorcont">'
			+'<textarea id="sonreplyeditorcont" cols="50" rows="10"></textarea>'
		+'</div>');
	sonreplysize();
	ckeditor();
	$('#sonreplyeditor').show();
}

function sonreplysize(){
	var width = $(window).width();
	var height = $(window).height();
	var contwidth = $('#sonreplyeditor').width();
	var contheight = $('#sonreplyeditor').height();
	var endtop = ( height - contheight )/2;
	var endleft = ( width - contwidth)/2;
	$('#sonreplyeditor').css('top',endtop+'px');
	$('#sonreplyeditor').css('left',endleft+'px');
}

function closereply(){
	 $('#sonreplyeditor').hide();
	 $('#sonreplyeditor .popreplycont').html('');
}

function ckeditor(){
	CKEDITOR.replace('sonreplyeditorcont', { toolbar: 'reply', height: '200px', width: '778px' });
}






