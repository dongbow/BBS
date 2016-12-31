<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">新增角色</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">角色名称</label>
                    <div class="col-md-6">
                        <input id="name" type="text" value="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">角色描述</label>
                    <div class="col-md-6 col-xs-11">
                        <textarea rows="4" class="form-control" id="desc"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">角色颜色</label>
                    <div class="col-md-6 col-xs-11">
                    	<input id="color" value="#FF9900" type="text" class="colorpicker-default form-control"  placeholder="16进制颜色"/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">角色类型</label>
                    <select id="type" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option value="0">前台角色</option>
				        <option value="1" selected>后台角色</option>
			        </select>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">角色状态</label>
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