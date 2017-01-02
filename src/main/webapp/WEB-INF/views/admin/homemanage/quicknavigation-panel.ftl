<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">快速导航</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">名字</label>
                    <div class="col-md-6">
                        <input id="name" type="text" value="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">链接</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="link" type="text" value="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">颜色</label>
                    <div class="col-md-6 col-xs-11">
                    	<input id="color" value="#2b2b2b" type="text" class="colorpicker-default form-control"  placeholder="16进制颜色"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">顺序</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="sort" type="text" value="" class="form-control">
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