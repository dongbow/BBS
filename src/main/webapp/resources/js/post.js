
$(function(){
	$('#topic_title_text').keyup(function(){
		var le=$('#topic_title_text').val().length;
		$('#e_num').html(32-le);	
	});
	
	$('.editorclear').click(function(){
		CKEDITOR.instances.editor.setData(' ');
	});
	
	$('.checklength').bind('click', checklength);
	
	$('.image-btn').click(function(){
		$('#images').click();
	});
	
	$('.file-btn').click(function(){
		$('#files').click();
	});
	
	$('.checkbox').click(function() {
		if($(this).is(':checked')) {
			$(this).val(1);
		} else {
			$(this).val(0);
		}
	});
});

function checklength() {
	var minlength = 10;
	var maxlength = 50000;
	var editorhtml = CKEDITOR.instances.editor.document.getBody().getHtml();
	var description = editorhtml.replace(/<.*?>/ig,"");
	var evenlength = maxlength - description.length;
	var context = 
		'当前输入字节为<label class="nownum">' + description.length + '</label>,系统限制为<label class="systemnum">'
		+ minlength+'~'+maxlength + '</label>字节,还可以输入<label class="evennum">' + evenlength + '</label>字节。';
	$("#bg").css({
        display: "block", height: $(document).height()
    });
	dialog(context);
}

function validate() {
	var editorhtml = CKEDITOR.instances.editor.document.getBody().getHtml();
	var description = editorhtml.replace(/<.*?>/ig,"");
	if($('#s1').val() != -1 && description != null && description != '' && description.length >= 10 && $('#topic_title_text').val()) {
		$('#postForm').submit();
	} else {
		dialog('不能留空');
		return false;
	}
}