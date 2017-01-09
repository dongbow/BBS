<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">友情链接</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">标题</label>
                    <div class="col-md-6">
                        <input id="panel-name" type="text" value="<#if link??>${link.linkName!}</#if>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">链接</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="link" type="text" value="<#if link??>${link.link!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">联系方式</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="contact" type="text" value="<#if link??>${link.linkContacts!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">结束时间</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="panel-endtime" class="form-control default-date-picker" type="text" value="<#if link??><#if link.linkEndTime??>${link.linkEndTime?string('yyyy-MM-dd')}</#if></#if>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">标记</label>
                    <select id="panel-sign" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option <#if link??><#if link.linkSign?number == 1>selected</#if></#if> value="1">站内</option>
				        <option <#if link??><#if link.linkSign?number == 2>selected</#if></#if> value="2">友链</option>
			        </select>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="panel-status" class="selectpicker show-tick col-md-6 col-xs-11">
                    	<option <#if link??><#if link.linkStatus?number == 0>selected</#if></#if> value="0">待审核</option>
				        <option <#if link??><#if link.linkStatus?number == 1>selected</#if></#if> value="1">正常</option>
			        </select>
	            </div>

				<input type="hidden" id="data-call-id" value="<#if link??>${link.linkId!}</#if>">
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
        $('.selectpicker').selectpicker('refresh');
    });
</script>