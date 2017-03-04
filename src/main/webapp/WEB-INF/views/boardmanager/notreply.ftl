<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html>

<head>
	<#include "common.ftl">
    <link href="${path}/resources/static/hplus/css/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/static/dist/css/bootstrap-select.css">

</head>

<body class="gray-bg">
    <div class="wrapper">
    	<div class="panel panel-default">
    		<form action="${path}/manage/bmc/closereply/search" method="get" id="data-form">
                <input type="hidden" name="bid" value="${bid!}" id="sign-bid">
                <div class="panel-body">
		            <div class="col-md-4 form-group">
		            	<input value="${tid!}" name="tid" type="text" class="form-control" placeholder="帖子ID">
		            </div>
                	<div class="col-md-4 form-group">
            			<a class="btn btn-info btn-sm data-search" type="button" href="${path}/manage/bmc/closereply/search"><i class="fa fa-search"></i> 查找 </a>
            			<a class="btn btn-success btn-sm topic-ask" data-type="all" type="button" href="${path}/manage/bmc/closereply/open"><i class="fa fa-search"></i> 批量开启 </a>
            		</div>
            	</div>
            </form>
        </div>
        <section class="panel">
            <div class="panel-body">
                <section id="no-more-tables">
                    <table class="table table-bordered table-striped table-condensed cf">
                        <thead class="cf">
                        <tr>
                        	<th class="numeric"><input type="checkbox" id="check-all"></th>
                        	<th class="numeric">帖子ID</th>
                            <th class="numeric">标题</th>
                            <th class="numeric">发帖人</th>
                            <th class="numeric">预览</th>
                            <th class="numeric">操作</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <#if topics??>
	                        	<#list topics as t>
	                        		<tr>
	                        			<td class="numeric"><input type="checkbox" data-id="${t.topicId}" class="data-check-id"></td>
			                            <td class="numeric" data-title="帖子ID">${t.topicId}</td>
			                            <td class="numeric" data-title="标题">
			                            	<a class="btn btn-link btn-xs" type="button" target="_blank" href="${path}/board/${t.boardId}/topic/detail/${t.topicId}">${t.topicTitle}</a>
			                            </td>
			                            <td class="numeric" data-title="发帖人">
			                            	<a class="btn btn-link btn-xs" type="button" target="_blank" href="${path}/space/uid/${t.userId}">${t.user.userAccess.userNickname}</a>
			                            </td>
			                            <td class="numeric" data-title="预览">
			                            	<a class="btn btn-link btn-xs data-content" type="button" data-view="${t.topicContent}">预览</a>
			                            </td>
			                            <td class="numeric" data-title="操作">
			                            	<a class="btn btn-default btn-xs topic-ask" data-type="one" href="${path}/manage/bmc/closereply/open" type="button" data-id="${t.topicId}">开启回复</a>
			                            </td>
			                        </tr>
	                        	</#list>
	                        </#if>
                        </tbody>
                    </table>
                </section>
                <#include "page.ftl"/>
                <@buildPage page=page/>
                <div class="modal fade" id="content-modal" tabindex="-1" role="dialog" aria-labelledby="content-modal" aria-hidden="true">
		        	<div class="modal-dialog modal-lg">
					    <div class="modal-content">
					        <div class="modal-header">
					            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					            <h4 class="modal-title"></h4>
					        </div>
					        <div class="modal-body" style="text-align:center; overflow:hidden">
					        </div>
					    </div>
					</div>
		        </div>
            </div>
        </section>
    </div>

    <!-- 全局js -->
    <script src="${path}/resources/static/hplus/js/jquery.min.js?v=2.1.4"></script>
    <script src="${path}/resources/static/hplus/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="${path}/resources/static/hplus/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <!-- Peity -->
    <script src="${path}/resources/static/hplus/js/bootstrap-table-demo.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script>
    <script src="${path}/resources/js/bm/commons.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		$('.topic-ask').bind('click', doOptions);
    	})
    </script>
</body>

</html>
