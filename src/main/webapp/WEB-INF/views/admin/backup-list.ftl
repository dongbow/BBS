<#include "common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "common/import.ftl">
  	<title>系统备份</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="post">
	                <div class="panel-body">
			            <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
			            	<a class="btn btn-info btn-sm back-add" type="button" href="${path}/system/admin/backup/add"><i class="fa fa-plus"></i> 添加 </a>
			            	<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/backup/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">ID</th>
	                            <th class="numeric">文件地址</th>
	                            <th class="numeric">备份人</th>
	                            <th class="numeric">备份时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if backs??>
	                        		<#assign bid = page.pageSize * (page.pageNo - 1) + 1/>
	                        		<#list backs as back>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${back.id}" class="data-check-id"></th>
				                            <td class="numeric" data-title="ID">${bid}</td>
				                            <td class="numeric" data-title="文件地址">${back.url}</td>
				                            <td class="numeric" data-title="备份人">
				                            	<#if back.uid == 99999>
				                            		${back.nickname}
				                            	<#else>
				                            		<a href="${path}/space/uid/${back.uid}" target="_blank" style="color:#428bca">${back.nickname}</a>
				                            	</#if>
				                            </td>
				                            <td class="numeric" data-title="备份时间">${back.backTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs back-down" type="button" target="_blank" href="${path}/system/admin/backup/download?id=${back.id}">下载</a>
				                            	<a class="btn btn-link btn-xs back-restore" type="button" data-id="${back.id}" href="${path}/system/admin/backup/restore">恢复</a>
				                            </td>
				                        </tr>
				                        <#assign bid = bid + 1/>
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
	<#include "common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/logmanage/experience.js"></script>
	<script type="text/javascript" src="${path}/resources/js/admin/backup.js"></script>
</body>
</html>