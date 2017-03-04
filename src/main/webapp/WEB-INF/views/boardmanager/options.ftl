<#assign path="${request.contextPath}">
<!DOCTYPE html>
<html>

<head>
	<#include "common.ftl">
    <link href="${path}/resources/static/hplus/css/bootstrap-table.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper">
    	<div class="panel panel-default">
    		<form action="${path}/manage/bmc/option/search" method="get" id="data-form">
                <div class="panel-body">
		            <div class="col-md-3 form-group">
		            	<input id="from" value="${from!}" name="from" type="text" class="laydate-icon form-control layer-date" placeholder="开始日期">
		            </div>
		            <div class="col-md-3 form-group">
		            	<input id="to" value="${to!}" name="to" type="text" class="laydate-icon form-control layer-date" placeholder="结束日期">
		            </div>
                	<div class="col-md-4 form-group">
            			<a class="btn btn-info btn-sm data-search" href="${path}/manage/bmc/option/search" type="button"><i class="fa fa-search"></i> 查找 </a>
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
                        	<th>ID</th>
                            <th class="numeric">模块</th>
                            <th class="numeric">执行状态</th>
                            <th class="numeric">执行人</th>
                            <th class="numeric">执行时间</th>
                            <th class="numeric">参数</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <#if logs??>
	                        	<#assign sid = page.pageSize * (page.pageNo - 1) + 1/>
	                        	<#list logs as log>
	                        		<tr>
	                        			<td data-title="ID">${sid}</td>
			                            <td class="numeric" data-title="模块"><#noescape>${log.modules}</#noescape></td>
			                            <td class="numeric" data-title="执行状态">
			                            	<#if log.status == 1>成功<#else><font color="red">失败</font></#if></td>
			                            <td class="numeric" data-title="执行人">
			                            	<a href="${path}/space/uid/${log.userId}" target="_blank" style="color:#428bca">${log.userNickname}</a>
			                            </td>
			                            <td class="numeric" data-title="执行时间">${log.createTime?string("yyyy-MM-dd HH:mm")}</td>
			                            <td class="numeric" data-title="参数">
			                            	<a class="btn btn-link btn-xs bmc-args" type="button" data-id="${log.id}">查看参数</a>
			                            	<input type="hidden" id="args_${log.id}" value="${log.args}">
			                            </td>
			                        </tr>
			                        <#assign sid = sid + 1/>
	                        	</#list>
	                        </#if>
                        </tbody>
                    </table>
                </section>
                <#include "page.ftl"/>
                <@buildPage page=page/>
                <div class="modal fade" id="sys-modal" tabindex="-1" role="dialog" aria-labelledby="sys-modal" aria-hidden="true">
			        	<div class="modal-dialog">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title"></h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
						        	<p class="sys-content"></p>
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
	<script src="${path}/resources/static/hplus/js/plugins/layer/layer.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/layer/laydate/laydate.js"></script>
    <!-- 自定义js -->
    <script src="${path}/resources/static/hplus/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${path}/resources/static/hplus/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <!-- Peity -->
    <script src="${path}/resources/static/hplus/js/bootstrap-table-demo.js"></script>
    <script src="${path}/resources/js/bm/commons.js"></script>
    <script type="text/javascript">
    	$(function() {
    		laydate({
	            elem: '#from', 
	            event: 'focus' 
	        });
	        
	        laydate({
	            elem: '#to', 
	            event: 'focus' 
	        });
        
    		$('.bmc-args').bind('click', lookArgs);
    	})
    </script>
</body>

</html>
