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
    		<form action="${path}/manage/bmc/user/notspeak/search" method="get" id="data-form">
                <div class="panel-body">
		            <div class="col-md-3 form-group">
		            	<input value="${uid!}" name="uid" type="text" class="form-control" placeholder="用户ID">
		            </div>
		            <div class="col-md-3 form-group">
		            	<input value="${nickname!}" name="nickname" type="text" class="form-control" placeholder="用户昵称">
		            </div>
                	<div class="col-md-4 form-group">
            			<a class="btn btn-info btn-sm data-search" href="${path}/manage/bmc/user/notspeak/search" type="button"><i class="fa fa-search"></i> 查找 </a>
            			<a class="btn btn-success btn-sm user-speak" data-type="all" href="${path}/manage/bmc/user/notspeak/open" type="button"><i class="fa fa-search"></i> 批量解禁 </a>
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
                        	<th class="numeric">用户ID</th>
                            <th class="numeric">用户昵称</th>
                            <th class="numeric">操作</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <#if users??>
	                        	<#list users as u>
	                        		<tr>
	                        			<td class="numeric"><input type="checkbox" data-id="${u.userAccess.userId}" class="data-check-id"></td>
			                            <td class="numeric" data-title="用户ID">${u.userAccess.userId}</td>
			                            <td class="numeric" data-title="用户昵称">
			                            	<a class="btn btn-link btn-xs" type="button" target="_blank" href="${path}/space/uid/${u.userAccess.userId}">${u.userAccess.userNickname}</a>
			                            </td>
			                            <td class="numeric" data-title="操作">
			                            	<a class="btn btn-default btn-xs user-speak" data-type="one" href="${path}/manage/bmc/user/notspeak/open" type="button" data-id="${u.userAccess.userId}">解禁</a>
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
    <script type="text/javascript" src="http://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script>
    <script src="${path}/resources/js/bm/commons.js"></script>
    
    <script type="text/javascript">
    	$(function() {
    		$('.user-speak').bind('click', doOptions2);
    	})
    </script>
</body>

</html>
