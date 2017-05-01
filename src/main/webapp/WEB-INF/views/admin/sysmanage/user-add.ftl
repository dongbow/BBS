<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">新增用户</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">用户名</label>
                    <div class="col-md-6">
                        <input id="panel-name" type="text" value="<#if sysuser??>${sysuser.userAccess.userName!}</#if>" <#if op == 'update'>disabled</#if> class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4">昵称</label>
                    <div class="col-md-6">
                        <input id="panel-nick" type="text" value="<#if sysuser??>${sysuser.userAccess.userNickname!}</#if>" class="form-control">
                    </div>
                </div>
                <#if op??>
                	<#if op == 'add'>
                		<div class="form-group">
		                    <label class="control-label col-md-4">密码</label>
		                    <div class="col-md-6">
		                        <input id="panel-password" type="password" value="" class="form-control">
		                    </div>
		                </div>
                	</#if>
                </#if>
                <div class="form-group">
                    <label class="control-label col-md-4">邮箱</label>
                    <div class="col-md-6">
                        <input id="panel-email" type="text" value="<#if sysuser??>${sysuser.userAccess.userEmail!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">角色分配</label>
                    <select id="panel-roles" class="selectpicker show-tick col-md-6 col-xs-11" multiple>
                    	<#list roles as r>
	                    	<#if sys == 'user'>
	                      		<#if r.roleId gt 2>
	                      			<option value="${r.roleId}" <#if role??><#if role?number == r.roleId>selected</#if></#if>>${r.roleName}</option>
	                      		</#if>
	                    	<#else>
	                    		<#if r.roleId lte 2>
	                      			<option value="${r.roleId}" <#if role??><#if role?number == r.roleId>selected</#if></#if>>${r.roleName}</option>
	                      		</#if>
	                    	</#if>
                    	</#list>
			        </select>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="panel-status" class="selectpicker show-tick col-md-6 col-xs-11">
                    	<option <#if sysuser??><#if sysuser.userAccess.userIsLocked?number == 0>selected</#if></#if> value="0">正常</option>
				        <option <#if sysuser??><#if sysuser.userAccess.userIsLocked?number == 1>selected</#if></#if> value="1">暂不使用</option>
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