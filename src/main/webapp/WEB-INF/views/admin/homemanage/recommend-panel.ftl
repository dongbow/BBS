<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">首页推荐</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">名字</label>
                    <div class="col-md-6">
                        <input id="name" type="text" value="<#if rec??>${rec.rcName!}</#if>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">链接</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="link" type="text" value="<#if rec??>${rec.rcHref!}</#if>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">位置</label>
                    <select id="data-location" class="selectpicker show-tick col-md-6 col-xs-11">
                    	<#if rec??>
                    		<option value="1" <#if rec.location?number == 1>selected</#if>>文章推荐 </option>
				        	<option value="2" <#if rec.location?number == 2>selected</#if>>社区动态</option>
                    	<#else>
                    		<option value="1">文章推荐 </option>
				        	<option value="2">社区动态</option>
                    	</#if>
			        </select>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">顺序</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="sort" type="text" value="<#if rec??>${rec.rcSort!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="data-status" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option <#if rec??><#if rec.rcStatus?number == 0>selected</#if></#if> value="0">正常</option>
				        <option <#if rec??><#if rec.rcStatus?number == 1>selected</#if></#if> value="1">暂不使用</option>
			        </select>
	            </div>

				<input type="hidden" id="data-call-id" value="<#if rec??>${rec.rcId!}</#if>">
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