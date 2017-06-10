<#assign path="${request.contextPath}">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">任务调度</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <div class="form-group">
                    <label class="control-label col-md-4">任务名</label>
                    <div class="col-md-6">
                        <input id="job-name" type="text" value="<#if job??>${job.jobName!}</#if>" class="form-control">
                    </div>
                </div>

				<div class="form-group">
                    <label class="control-label col-md-4">任务分组</label>
                    <div class="col-md-6">
                        <input id="job-group" type="text" value="<#if job??>${job.jobGroup!}</#if>" class="form-control">
                    </div>
                </div>
				<div class="form-group">
                    <label class="control-label col-md-4">描述</label>
                    <div class="col-md-6 col-xs-11">
                        <textarea id="job-desc" class="form-control"><#if job??>${job.description!}</#if></textarea>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">执行周期</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="job-cron" type="text" value="<#if job??>${job.cronExpression!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">类地址</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="job-class" type="text" value="<#if job??>${job.beanClass!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">方法</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="job-method" type="text" value="<#if job??>${job.methodName!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-md-4">SpringId</label>
                    <div class="col-md-6 col-xs-11">
                        <input id="job-spring" type="text" value="<#if job??>${job.springId!}</#if>" class="form-control">
                    </div>
                </div>
                
                <div class="form-group">
               		<label class="control-label col-md-4">状态</label>
                    <select id="job-current" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option <#if job??><#if job.isConcurrent?number == 0>selected</#if></#if> value="0">否</option>
				        <option <#if job??><#if job.isConcurrent?number == 1>selected</#if></#if> value="1">是</option>
			        </select>
	            </div>
	            
                <div class="form-group">
               		<label class="control-label col-md-4">任务状态</label>
                    <select id="job-status" class="selectpicker show-tick col-md-6 col-xs-11">
				        <option <#if job??><#if job.jobStatus?number == 0>selected</#if></#if> value="0">暂停</option>
				        <option <#if job??><#if job.jobStatus?number == 1>selected</#if></#if> value="1">运行</option>
			        </select>
	            </div>

				<input type="hidden" id="data-call-id" value="<#if job??>${job.jobId!}</#if>">
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