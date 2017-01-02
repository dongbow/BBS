<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">添加滚动图</h4>
        </div>
        <div class="modal-body">
        	<form action="${path}/upload/image" method="post" enctype="multipart/form-data" id="upload-form">
            	<input id="upload" name="homeimage" class="form-control" type="file" style="display:none" onchange="uploadImage()"/>
        	</form>
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">标题</label>
                    <div class="col-md-6">
                        <input id="title" type="text" value="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">链接</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="link" class="form-control" type="text" value="" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">上传图片</label>
                    <div class="col-md-6 col-xs-11">
                        <a class="btn btn-warning up-btn" type="button" onclick="javascript:$('#upload').click()">选择图片</a>
                        <label class="control-label">图片大小：640 x 300</label>
                    </div>
                </div>
                
                <div class="form-group image-view" style="display:none">
                    <label class="control-label col-md-4">图片预览</label>
                    <div class="col-md-6 col-xs-11">
                    	<img alt="upload" width="100%">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">图片地址</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="img-url" class="form-control" type="text" value="" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">顺序</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="sort" class="form-control res-sort" type="text" value=""/>
                    </div>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="status" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option value="0">正常</option>
				        <option value="1">暂不使用</option>
			        </select>
	            </div>

            </form>
        </div>
        <div class="modal-footer" style="text-align:center">
        	<button class="btn btn-primary save" type="button">保存</button>
            <button class="btn btn-primary cancel" type="button">取消</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('.selectpicker').selectpicker('refresh');
    });
</script>