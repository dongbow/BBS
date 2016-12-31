<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>任务列表</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="get" id="user">
	                <div class="panel-body">
	                	<div class="col-md-2 form-group">
			            	<input id="name" name="name" type="text" value="" class="form-control" placeholder="任务名">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="user-lock" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">选择状态</option>
						        <option value="0" <#if status??><#if status?number == 0>selected</#if></#if>>暂停</option>
						        <option value="1" <#if status??><#if status?number == 1>selected</#if></#if>>运行</option>
					        </select>
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm user-search" type="button" href="${path}/system/admin/sysmanage/user/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-plus"></i> 添加 </a>
			            	<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                        	<th><input type="checkbox" id="data-ids"></th>
	                            <th>ID</th>
	                            <th>任务名</th>
	                            <th class="numeric">任务状态</th>
	                            <th class="numeric">执行周期</th>
	                            <th class="numeric">类地址</th>
	                            <th class="numeric">方法</th>
	                            <th class="numeric">描述</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        <#if jobs??>
	                        	<#list jobs as job>
	                        		<tr>
			                        	<th><input type="checkbox" data-id="${job.jobId}"></th>
			                            <td data-title="ID">${job.jobId}</td>
			                            <td data-title="任务名">${job.jobName}</td>
			                            <td class="numeric" data-title="任务状态">
			                            	<#if job.jobStatus == '1'>运行<#else>暂停</#if>
			                            </td>
			                            <td class="numeric" data-title="执行周期">${job.cronExpression}</td>
			                            <td class="numeric" data-title="类地址">${job.beanClass}</td>
			                            <td class="numeric" data-title="方法">${job.methodName}</td>
			                            <td class="numeric" data-title="描述">${job.description!}</td>
			                            <td class="numeric" data-title="创建时间">${job.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
			                            <th class="numeric" data-title="操作">
			                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
			                            	<#if job.jobStatus == '1'>
			                            		<a class="btn btn-default btn-xs" type="button"><i class="fa fa-lock"></i> 暂停 </a>
			                            	<#else>
			                            		<a class="btn btn-default btn-xs" type="button"><i class="fa fa-unlock-alt"></i> 启动</a>
			                            	</#if>
			                            	<a class="btn btn-default btn-xs quartz-now" type="button" href="${path}/system/admin/quartz/runnow" data-id="${job.jobId}"><i class="fa fa-edit"></i> 立即执行 </a>
			                            </th>
			                        </tr>
	                        	</#list>
	                        </#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	            </div>
	        </section>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer style="bottom:0">
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
	<#include "../common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/quartz.js"></script>
</body>
</html>