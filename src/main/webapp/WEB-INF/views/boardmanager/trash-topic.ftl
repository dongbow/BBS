<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html>

<head>
	<#include "common.ftl">
    <link href="${path}/resources/static/hplus/css/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/static/dist/css/bootstrap-select.css">

</head>

<body class="gray-bg">
    <div class="wrapper">
    	<div class="panel panel-default">
    		<form action="" method="post">
                <div class="panel-body">
		            <div class="col-md-3 form-group">
		            	<input value="${tid!}" type="text" class="form-control" placeholder="帖子ID">
		            </div>
		            <div class="col-md-3 form-group">
		            	<input value="${uid!}" type="text" class="form-control" placeholder="用户ID">
		            </div>
                	<div class="col-md-4 form-group">
            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 批量恢复 </a>
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
                        	<th class="numeric"><input type="checkbox"></th>
                        	<th class="numeric">帖子ID</th>
                            <th class="numeric">标题</th>
                            <th class="numeric">发帖人</th>
                            <th class="numeric">更多</th>
                            <th class="numeric">操作</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <#if topics??>
	                        	<#list topics as t>
	                        		<tr>
	                        			<td class="numeric"><input type="checkbox" data-id="${t.topicId}"></td>
			                            <td class="numeric" data-title="帖子ID">${t.topicId}</td>
			                            <td class="numeric" data-title="标题">
			                            	<a class="btn btn-link btn-xs" type="button" target="_blank" href="${path}/board/${t.boardId}/topic/detail/${t.topicId}">${t.topicTitle}</a>
			                            </td>
			                            <td class="numeric" data-title="发帖人">
			                            	<a class="btn btn-link btn-xs" type="button" target="_blank" href="${path}/space/uid/${t.userId}">${t.user.userAccess.userNickname}</a>
			                            </td>
			                            <td class="numeric" data-title="更多">
			                            	<a class="btn btn-link btn-xs topic-content" type="button">预览</a>
			                            	<a class="btn btn-link btn-xs topic-content" type="button">删除原因</a>
			                            </td>
			                            <td class="numeric" data-title="操作">
			                            	<a class="btn btn-default btn-xs" type="button" data-id="${t.topicId}">恢复</a>
			                            	<a class="btn btn-default btn-xs" type="button" data-id="${t.topicId}">编辑</a>
			                            </td>
			                        </tr>
	                        	</#list>
	                        </#if>
                        </tbody>
                    </table>
                </section>
                <#include "page.ftl"/>
                <@buildPage page=page/>
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
</body>

</html>
