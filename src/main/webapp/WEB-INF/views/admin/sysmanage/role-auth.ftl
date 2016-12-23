<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">角色授权</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
            	<div class="panel-body">
        			<a class="btn btn-info btn-sm role-checked" type="button"><i class="fa fa-check-circle"></i> 全选 </a>
	            	<a class="btn btn-info btn-sm role-o-checked" type="button"><i class="fa fa-circle"></i> 反选 </a>
            	</div>
				 <ul id="tree" class="ztree"></ul>
            </form>
        </div>
        <div class="modal-footer" style="text-align:center">
        	<button class="btn btn-primary save" type="button">保存</button>
            <button class="btn btn-primary cancel" type="button">取消</button>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		zTreeNodes.init(${rid});
	});
</script>