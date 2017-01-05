<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">导航管理</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">导航名</label>
                    <div class="col-md-6">
                        <input id="data-p-name" type="text" value="<#if nav??>${nav.navName!}</#if>" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">导航描述</label>
                    <div class="col-md-6 col-xs-11">
                        <textarea rows="4" class="form-control" id="desc"><#if nav??>${nav.navDesc!}</#if></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-4">排序</label>
                    <div class="col-md-6 col-xs-11">
                    	<input id="sort" value="<#if nav??>${nav.navSort!}</#if>" type="text" class="form-control"/>
                    </div>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="data-p-status" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option <#if nav??><#if nav.navStatus?number==0>selected</#if></#if> value="0">正常</option>
				        <option <#if nav??><#if nav.navStatus?number==1>selected</#if></#if> value="1">暂不使用</option>
			        </select>
	            </div>
	            
	            <input type="hidden" id="data-call-id" value="<#if nav??>${nav.navId!}</#if>">

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