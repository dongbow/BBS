<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>首页推荐</title>
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
		                    <select id="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">状态</option>
						        <option value="0">正常</option>
						        <option value="1">已删除</option>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="location" class="selectpicker show-tick form-control">
		                      	<option value="0">选择位置</option>
						        <option value="1">文章推荐</option>
						        <option value="2">社区动态</option>
					        </select>
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm data-add" type="button" href="${path}/system/admin/home/recommend/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/home/recommend/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">名字</th>
	                            <th class="numeric">链接</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">位置</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if recommends??>
	                        		<#list recommends as rc>
	                        			<tr>
	                        				<th>
	                        					<#if rc.rcStatus == 0>
	                        						<input type="checkbox" data-id="${rc.rcId}" class="data-check-id">
	                        					</#if>
	                        				</th>
				                            <td data-title="ID">${rc.rcId}</td>
				                            <td class="numeric" data-title="导航名">
				                            	<a href="${rc.rcHref}" target="_blank" style="color:#428bca">${rc.rcName}</a>
				                            </td>
				                            <td class="numeric" data-title="链接">${rc.rcHref}</td>
				                            <td class="numeric" data-title="排序">${rc.rcSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if rc.rcStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="位置">
				                            	<#if rc.location == 1>文章推荐<#else>社区动态</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${rc.createTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs data-update" type="button" href="${path}/system/admin/home/recommend/update" data-id="${rc.rcId}"><i class="fa fa-edit"></i> 编辑 </a>
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
	<script type="text/javascript" src="${path}/resources/js/admin/homemanage/recommend.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>