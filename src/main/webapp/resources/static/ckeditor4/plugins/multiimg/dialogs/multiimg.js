(function() {  
    CKEDITOR.dialog.add("multiimg",  
        function(a) {  
            return {  
                title: "批量上传图片",  
                minWidth: "660px",  
                minHeight:"400px",  
                contents: [{  
                    id: "tab1",  
                    label: "",  
                    title: "",  
                    expand: true,  
                    width: "420px",  
                    height: "300px",  
                    padding: 0,  
                    elements: [{  
                        type: "html",  
                        style: "width:660px;height:400px",  
                        html: '<iframe id="uploadFrame" src="/bbs/resources/static/ckeditor4/plugins/multiimg/dialogs/upload.html?v=' +new Date().getSeconds() + '" frameborder="0"></iframe>'  
                    }]  
                }],  
                onOk: function() {  
                	//点击确定按钮后的操作  
                    var html = '';
                    var length = $('#image-cont', parent.document).length;
                    if(length > 0) {
                    	html = $("#uploadFrame").contents().find('#uploadInf').html();
                    	$('#image-cont', parent.document).append(html);
                        $('#image-cont', parent.document).show();
                    } else {
                    	html = $("#uploadFrame").contents().find('#uploadInf2').html();
                    	a.insertHtml(html);
                    }
                },  
                onShow: function () {  
                    document.getElementById("uploadFrame").setAttribute("src","/bbs/resources/static/ckeditor4/plugins/multiimg/dialogs/upload.html?v=' +new Date().getSeconds() + '");  
                }  
            };
        });
})(); 