<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>下载详情</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

		<div class="page-heading">
            <ul class="breadcrumb">
                <li>
                    <a href="${path}/system/admin/upload/file">附件管理</a>
                </li>
                <li class="active">下载详情</li>
            </ul>
        </div>
        
        <!--body wrapper start-->
        <div class="wrapper">
        	<div class="panel panel-default">
        		<form action="" method="get" id="dataForm">
	                <div class="panel-body">
	                	<div class="col-md-2 form-group">
			            	<input id="uid" type="text" value="${uid!}" class="form-control" placeholder="用户ID">
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/upload/file/downlaoddetail/detail/search"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">ID</th>
	                            <th class="numeric">用户ID</th>
	                            <th class="numeric">用户昵称</th>
	                            <th class="numeric">下载时间</th>
	                            <th class="numeric">下载IP</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if files??>
	                        		<#assign fid = page.pageSize * (page.pageNo - 1) + 1/>
	                        		<#list files as file>
	                        			<tr>
				                            <td class="numeric" data-title="ID">${fid}</td>
				                            <td class="numeric" data-title="用户ID">${file.uid}</td>
				                            <td class="numeric" data-title="用户昵称">
				                            	<a href="${path}/space/uid/${file.uid}" target="_blank" style="color:#428bca">${file.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="下载时间">${file.downTime}</td>
				                            <td class="numeric" data-title="下载IP">${file.ip}</td>
				                        </tr>
				                        <#assign fid = fid + 1/>
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
</body>
</html>