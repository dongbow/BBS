
$(function(){
		$('#topic_title_text').keyup(function(){
			var le=$('#topic_title_text').val().length;
			$('#e_num').html(32-le);	
		});
		
		$('.editorclear').click(function(){
			CKEDITOR.instances.editor.setData(' ');
		});
		
		$('.tipclose').click(function(){
			$('#bg').hide();
			$('#checktip').hide();
		});
		
		$('.checklength').click(function(){
			var minlength = 10;
			var maxlength = 30000;
			var editorhtml = CKEDITOR.instances.editor.document.getBody().getHtml();
			var description = editorhtml.replace(/<.*?>/ig,"");
			var evenlength = maxlength - description.length;
			var titlename = '字数检查';
			var context = 
				'当前输入字节为<label class="nownum"></label>,系统限制为<label class="systemnum">'
				+'</label>字节,还可以输入<label class="evennum"></label>字节。';
		    checktip(titlename,context);
			$('.nownum').text(description.length);
			$('.systemnum').text(minlength+'~'+maxlength);
			$('.evennum').text(evenlength);
			$("#bg").css({
	            display: "block", height: $(document).height()
	        });
			$('#checktip').show();
		});
})