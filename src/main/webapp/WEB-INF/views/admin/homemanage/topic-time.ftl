<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">修改时间</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">时间</label>
                    <div class="col-md-6">
                        <input id="time" type="text" value="<#if topic??>${topic.topicInfo.topicIsHomeEndTime!}</#if>" class="form-control default-date-picker">
                    </div>
                </div>

				<input type="hidden" id="data-call-id" value="<#if topic??>${topic.topicId!}</#if>">
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
    	$('.default-date-picker').datepicker({
    		format: 'yyyy-mm-dd',
    		onSelect: function() {
    			$('.default-date-picker').parent().focus();
    		}
    	});
    });
</script>