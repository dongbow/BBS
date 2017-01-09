<#assign path="${request.contextPath}">
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">评论</h4>
        </div>
        <div class="modal-body">
            <form action="#" class="form-horizontal ">
                <textarea id="replyeditor" name="rcontext" rows="12" cols="93"><#noescape>${reply.replyContent}</#noescape></textarea>

				<input type="hidden" id="data-call-id" value="${reply.replyId}">
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
    	CKEDITOR.replace('replyeditor', { toolbar: 'full', height: '300px', width: '862px', resize_enabled: false, removePlugins: 'elementspath'});
    });
</script>