<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>友情链接</title>
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
        		<form action="" method="get" id="dataForm">
	                <div class="panel-body">
	                    <div class="col-md-4 form-group">
	                		<div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd">
	                            <input id="starttime" class="form-control dpd1" name="from" value="${from!}" type="text" placeholder="开始时间">
	                            <span class="input-group-addon">-</span>
	                            <input id="endtime" class="form-control dpd2" name="to" value="${to!}" type="text"  placeholder="结束时间">
	                        </div>
	                	</div>
			            <div class="col-md-2 form-group">
		                    <input id="name" class="form-control" name="name" value="${name!}" type="text" placeholder="标题">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="sign" name="sign" class="selectpicker show-tick form-control">
		                      	<option value="0">标记</option>
						        <option <#if sign??><#if sign?number == 1>selected</#if></#if> value="1">站内</option>
						        <option <#if sign??><#if sign?number == 2>selected</#if></#if> value="2">友链</option>
					        </select>
			            </div>
			            
                		<div class="col-md-2 form-group">
		                    <select id="status" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">状态</option>
		                      	<option <#if status??><#if status?number == 0>selected</#if></#if> value="0">待审核</option>
						        <option <#if status??><#if status?number == 1>selected</#if></#if> value="1">正常</option>
					        </select>
			            </div>
			            
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/config/friendlink/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm data-add" type="button" href="${path}/system/admin/config/friendlink/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/config/friendlink/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">标题</th>
	                            <th class="numeric">链接</th>
	                            <th class="numeric">点击量</th>
	                            <th class="numeric">标记</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">联系方式</th>
	                            <th class="numeric">结束时间</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if links??>
	                        		<#list links as link>
	                        			<tr>
	                        				<th><input type="checkbox" data-id="${link.linkId}" class="data-check-id"></th>
				                            <td data-title="ID">${link.linkId}</td>
				                            <td class="numeric" data-title="标题">
				                            	<a href="${link.link}" target="_blank" style="color:#428bca">${link.linkName}</a>
				                            </td>
				                            <td class="numeric" data-title="链接">
				                            	<a href="${link.link}" target="_blank" style="color:#428bca">${link.link}</a>
				                            </td>
				                            <td class="numeric" data-title="点击量">0</td>
				                            <td class="numeric" data-title="标记">
				                            	<#if link.linkSign == 1>站内<#else>友链</#if>
				                            </td>
				                            <td class="numeric" data-title="状态">
				                            	<#if link.linkStatus == 0>待审核<#else>正常</#if>
				                            </td>
				                            <td class="numeric" data-title="联系方式">${link.linkContacts!}</td>
				                            <td class="numeric" data-title="结束时间">
				                            	<#if link.linkEndTime??>${link.linkEndTime?string('yyyy-MM-dd')}</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${link.linkCreateTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs data-update" type="button" href="${path}/system/admin/config/friendlink/update" data-id="${link.linkId}"><i class="fa fa-edit"></i> 编辑 </a>
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
	<script type="text/javascript" src="${path}/resources/js/admin/config/link.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>