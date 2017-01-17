<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>附件管理</title>
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
        		<form action="" method="post">
	                <div class="panel-body">
	                    <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
	                	<div class="col-md-2 form-group">
			            	<input id="uid" type="text" class="form-control" placeholder="用户ID">
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="name" type="text" class="form-control" placeholder="用户昵称">
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th class="numeric">名字</th>
	                            <th class="numeric">地址</th>
	                            <th class="numeric">类型</th>
	                            <th class="numeric">大小</th>
	                            <th class="numeric">下载量</th>
	                            <th class="numeric">上传人</th>
	                            <th class="numeric">上传时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if files??>
	                        		<#list files as file>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${file.uuid}"></th>
				                            <td class="numeric" data-title="名字">${file.fileName}</td>
				                            <td class="numeric" data-title="地址">${file.fileLink}</td>
				                            <td class="numeric" data-title="类型">${file.fileType}</td>
				                            <td class="numeric" data-title="大小">${file.fileSize}</td>
				                            <td class="numeric" data-title="下载量">${file.downCount}</td>
				                            <td class="numeric" data-title="上传人">
				                            	<a href="${path}/space/uid/${file.uid}" target="_blank" style="color:#428bca">${file.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="上传时间">${file.uploadTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs download-detail" type="button" href="${path}/system/admin/upload/file/downloaddetail" data-id="${file.uuid}"> 下载详情 </a>
				                            </td>
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
	<script type="text/javascript" src="${path}/resources/js/admin/uploadmanage/file.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>