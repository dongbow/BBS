<#assign index = -1/>
<#macro buildParent parent>
	<#if parent?? && parent?size gt 0>
		<#assign index = index + 1/>
		<#assign n = parent?size/>
		<#list parent as res>
			<#assign resl = res.resources?size/>
			<option value="${res.resId}_${res.resType}_${resl + 1}">
				<#list 0..index as i>
					<#if i lte index>
						----
					</#if>
				</#list>
				${res.resName}
			</option>
			<#if res.resources?? && res.resources?size gt 0>
				<@buildParent parent = res.resources/>
			</#if>
		</#list>
		<#assign index = index - 1/>
	</#if>
</#macro>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">新增资源</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">资源名称</label>
                    <div class="col-md-6">
                        <input id="name" type="text" value="" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">资源链接</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="link" class="form-control" type="text" value="" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">资源标记</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="sign" class="form-control" type="text" value="" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">上一级</label>
                    <select id="pid" class="selectpicker show-tick col-md-6 col-xs-11 parent" data-live-search="true">
                    	<#assign s = resources?size/>
                    	<option value="0_-1_${s + 1}">顶级目录</option>
				        <@buildParent parent = resources/>
			        </select>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">资源图标</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="icon" class="form-control icon-picker" type="text" value="" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">资源类型</label>
                    <div class="col-md-6 col-xs-11">
                    	<input id="type" type="hidden" value="0" class="res-type"/>
                        <input class="form-control res-type-text" type="text" value="模块" disabled/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">资源顺序</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="sort" class="form-control res-sort" type="text" value="${s + 1}"/>
                    </div>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">资源状态</label>
                    <select id="status" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option value="0">正常</option>
				        <option value="1">暂不使用</option>
			        </select>
	            </div>
	            
	            <div class="form-group">
               		<label class="control-label col-md-4">跳转类型</label>
                    <select id="way" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option value="0">当前页</option>
				        <option value="1">新窗口</option>
			        </select>
	            </div>
	            
	            <div class="form-group">
               		<label class="control-label col-md-4">分配角色</label>
                    <select id="roles" class="selectpicker show-tick col-md-6 col-xs-11" multiple>
                    	<#list roles as role>
                    		<#if role.isAccess == 1>
                    			<#if role.roleId == 1>
	                    			<#if su == 1>
	                    				<option value="${role.roleId}">${role.roleName}</option>
	                    			</#if>
	                    		<#else>
	                    			<option value="${role.roleId}">${role.roleName}</option>
	                    		</#if>
                    		</#if>
                    	</#list>
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
        $(".icon-picker").iconPicker();
        $('.selectpicker').selectpicker('refresh');
    });
</script>