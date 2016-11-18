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
		            <div class="col-md-4 form-group">
		            	<input id="" type="text" class="form-control" placeholder="标题">
		            </div>
		            <div class="col-md-2 form-group">
	                    <select id="sex" class="selectpicker show-tick form-control">
	                      	<option value="-1">选择导航</option>
					        <option value="0">男</option>
					        <option value="1">女</option>
				        </select>
		            </div>
		            <div class="col-md-2 form-group">
	                    <select id="lock" class="selectpicker show-tick form-control">
	                      	<option value="-1">选择版块</option>
					        <option value="0">正常</option>
					        <option value="1">锁定</option>
				        </select>
		            </div>
                	<div class="col-md-4 form-group">
            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
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
                            <th class="numeric">导航</th>
                            <th class="numeric">版块</th>
                            <th class="numeric">标题</th>
                            <th class="numeric">操作</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <#if topics??>
	                        	<#list topics as t>
	                        		<tr>
			                            <td class="numeric" data-title="导航">${t.s}</td>
			                            <td class="numeric" data-title="版块">${r.roleDesc}</td>
			                            <td class="numeric" data-title="标题">${r.roleCreateTime}</td>
			                            <th class="numeric" data-title="操作">
			                            	<button class="btn btn-default btn-xs" type="button">打开回复</button>
			                            </th>
			                        </tr>
	                        	</#list>
	                        </#if>
                        </tbody>
                    </table>
                </section>
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
	<script src="${path}/resources/static/dist/js/bootstrap-select.js"></script>
</body>

</html>
