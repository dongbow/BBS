
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
	
	$('.img-add').live('click', imgadd);
	
	$('.img-del').live('click', imgdel);
	
	$('.delete-all').click(function() {
		$('#files').remove();
		$('#filelist').attr('value', '');
		$('.file-list').html('');
		$('.file-cont').hide();
		$('#upload-form').html('<input name="files" id="files" multiple="multiple" type="file" style="display:none" onchange="showFiles(this)">');
	});
	
	$('.delete').live('click', function() {
		$(this).parent().remove();
		var length = $('.file-list li').length;
		if(length < 1) {
			$('.delete-all').click();
		}
	});
	
	$('.upload-all').bind('click', uploadFile);
	
	$('.file-insert').live('click', insert);
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
	} else if(description.length < 10){
		dialog('帖子内容过短');
		return false;
	} else {
		dialog('不能留空');
		return false;
	}
}

function imgadd() {
	var src = $(this).parent().parent().find('img').attr('data-cke-saved-src');
	var html = '<img alt="" data-cke-saved-src="' + src + '" src="' + src + '"style="width:50%"><br/>';
	CKEDITOR.instances.editor.insertHtml(html);
}

function imgdel() {
	$(this).parent().parent().remove();
}

function showFiles(e) {
	var fs = e.files;
	for(var i=0;i<fs.length;i++) {
		var size = fs[i].size / 1024;
		var km = 'KB';
		if(size > 1024) {
			size = size / 1024;
			km = 'MB';
		}
		
		var sHtml = '<li>';
		sHtml += '<a class="file-name file-pre" href="javascript:;">' + fs[i].name + '</a>';
		sHtml += '<a class="file-size" href="javascript:;">' + size.toFixed(2) + km + '</a>';
		//sHtml += '<a class="file-btn-pre delete delete-one" href="javascript:;">删除</a>';
		//sHtml += '<a class="file-btn-pre upload upload-one" href="javascript:;">上传</a>';
		sHtml += '</li>';
		$('.file-list').append(sHtml);
	}
	$('.file-cont').show();
}

function uploadFile() {
	$('#upload-form').ajaxSubmit({
		type: "POST",
        url: $('#upload-form').attr('action'),
        beforeSend: function() {},
        success: function (result) {
        	if(result.rc != undefined && result.rc.rc == 9001){
        		loginDialog();
    		} else {
    			if(result.rc == 1) {
    				var length = $('.file-insert').length;
    				if(length < 1) {
    					$('.file-list').html('');
    				}
    				$('.file-pre').parent().remove();
    				$('#upload-form').html('<input name="files" id="files" multiple="multiple" type="file" style="display:none" onchange="showFiles(this)">');
    				var data = result.data;
    				for (var i = 0; i < data.length; i++) {
    					var filelist = $('#filelist').val();
    					if(filelist) {
    						filelist += ',' + data[i].uuid;
    						$('#filelist').attr('value', filelist);
    					} else {
    						$('#filelist').attr('value', data[i].uuid);
    					}
    					var sHtml = '<li>';
    					sHtml += '<a class="file-name" href="javascript:;">' + data[i].filename + '</a>';
    					sHtml += '<a class="file-btn-pre delete delete-one" href="javascript:;">删除</a>';
    					sHtml += '<a class="file-btn-pre file-insert" href="javascript:;" data-uuid="' + data[i].uuid + '" data-name="' + data[i].filename + '">插入</a>';
    					sHtml += '</li>';
    					$('.file-list').append(sHtml);
					}
    			}
    		}
        }
	});
}

function insert() {
	var uuid = $(this).attr('data-uuid');
	var filename = $(this).attr('data-name');
	var html = '<a href="' + root + '/download?file=' + uuid + '" style="color:#19b4ea !important">' + filename + '</a>';
	CKEDITOR.instances.editor.insertHtml(html);
}