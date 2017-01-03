<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>轮播图链</title>
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
            			<a class="btn btn-info btn-sm data-add" type="button" href="${path}/system/admin/home/image/add"><i class="fa fa-plus"></i> 添加 </a>
		            	<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/home/image/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th>标题</th>
	                            <th class="numeric">链接</th>
	                            <th class="numeric">图片预览</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
		                        <#if images??>
		                        	<#list images as img>
		                        		<tr>
				                        	<th>
				                        		<#if img.homeStatus == 0>
				                        			<input type="checkbox" data-id="${img.id}" class="data-check-id">
				                        		</#if>
				                        	</th>
				                            <td data-title="ID">${img.id}</td>
				                            <td data-title="标题">${img.homeTitle}</td>
				                            <td class="numeric" data-title="链接">${img.homeLink}</td>
				                            <td class="numeric" data-title="图片预览">
				                            	<a class="btn btn-link btn-xs btn-img" type="button" data-img="${img.homeImgLink}"> 查看图片 </a>
				                            </td>
				                            <td class="numeric" data-title="排序">${img.homeSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if img.homeStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${img.homeCreateTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs data-update" type="button" href="${path}/system/admin/home/image/update" data-id="${img.id}"><i class="fa fa-edit"></i> 编辑 </a>
				                            </td>
				                        </tr>
		                        	</#list>
		                        </#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
	                <div class="modal fade" id="data-modal" tabindex="-1" role="dialog" aria-labelledby="data-modal" aria-hidden="true" data-backdrop="static"></div>
	                
			        <div class="modal fade" id="image-modal" tabindex="-1" role="dialog" aria-labelledby="image-modal" aria-hidden="true">
			        	<div class="modal-dialog modal-lg">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title">查看图片</h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
						        	<img class="look-img" alt="image" src="" width="100%"/>
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
	<script type="text/javascript" src="${path}/resources/js/admin/homemanage/homeimage.js"></script>
	<script type="text/javascript" src="${path}/resources/js/jquery/jquery.form.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>