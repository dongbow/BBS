<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">导入</h4>
        </div>
        <div class="modal-body">
            <a class="btn btn-link btn-sm" type="button" href="${path}/system/admin/config/badword/export" target="_blank"><i class="fa fa-download"></i> 下载模板 (支持xls/xlsx)</a>
        	<form id="upload-form" method="post" action="${path}/system/admin/config/badword/upload">
        		<input type="file" name="badword_import" style="display:none" id="import" onchange="uploadFile();">
        	</form>
        	<div class="form-group">
        		<a class="btn btn-warning btn-sm col-md-2" type="button" href="javascript:$('#import').click()" style="height:33px"><i class="fa fa-folder-open"></i> 上传文件 </a>
                <div class="col-md-10">
                	<input type="text" name="import_url" disabled class="form-control" id="import_url">
                </div>
            </div>
        </div>
        <div class="modal-footer" style="text-align:center">
        	<button class="btn btn-primary save" type="button">保存</button>
            <button class="btn btn-primary cancel" type="button">取消</button>
        </div>
    </div>
</div>