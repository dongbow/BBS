<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>图片管理</title>
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
	                            <th class="numeric">上传人</th>
	                            <th class="numeric">上传时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if images??>
	                        		<#list images as img>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${img.uuid}"></th>
				                            <td class="numeric" data-title="名字">${img.fileName}</td>
				                            <td class="numeric" data-title="地址">${img.fileLink}</td>
				                            <td class="numeric" data-title="类型">${img.fileType}</td>
				                            <td class="numeric" data-title="大小">${img.fileSize}</td>
				                            <td class="numeric" data-title="上传人">
				                            	<a href="${path}/space/uid/${img.uid}" target="_blank" style="color:#428bca">${img.nickname}</a>
				                            </td>
				                            <td class="numeric" data-title="上传时间">${img.uploadTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-link btn-xs btn-img" type="button" data-img="${img.fileLink}"> 查看图片 </a>
				                            </td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
			        <div class="modal fade" id="image-modal" tabindex="-1" role="dialog" aria-labelledby="image-modal" aria-hidden="true">
			        	<div class="modal-dialog modal-lg">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title">查看图片</h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
						        	<img class="look-img" alt="image" src="" style="width:50%"/>
						        </div>
						    </div>
						</div>
			        </div>
			        <!-- modal -->
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
	<script type="text/javascript" src="${path}/resources/js/admin/uploadmanage/image.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>