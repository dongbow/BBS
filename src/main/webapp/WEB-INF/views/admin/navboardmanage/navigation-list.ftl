<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>导航管理</title>
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
			            	<input id="name" name="name" type="text" value="${name!}" class="form-control" placeholder="导航名">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="status" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">状态</option>
						        <option <#if status??><#if status?number==0>selected</#if></#if> value="0">正常</option>
						        <option <#if status??><#if status?number==1>selected</#if></#if> value="1">已删除</option>
					        </select>
			            </div>
                		
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/navboard/navigation/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm data-add" type="button" href="${path}/system/admin/navboard/navigation/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-danger btn-sm data-delete" href="${path}/system/admin/navboard/navigation/delete" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">导航名</th>
	                            <th class="numeric">导航描述</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if roleNavs??>
	                        		<#list roleNavs as nav>
	                        			<tr>
	                        				<th>
	                        					<#if nav.navStatus == 0>
	                        						<input type="checkbox" data-id="${nav.navId}" class="data-check-id">
	                        					</#if>
	                        				</th>
				                            <td data-title="ID">${nav.navId}</td>
				                            <td class="numeric" data-title="导航名">
				                            	<a href="${path}/navigation/${nav.navId}" target="_blank" style="color:#428bca">${nav.navName}</a>
				                            </td>
				                            <td class="numeric" data-title="导航描述">${nav.navDesc}</td>
				                            <td class="numeric" data-title="排序">${nav.navSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if nav.navStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${nav.navCreateTime}</td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs data-update" data-id="${nav.navId}" href="${path}/system/admin/navboard/navigation/update" type="button"><i class="fa fa-edit"></i> 编辑 </a>
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
	<script type="text/javascript" src="${path}/resources/js/admin/nbc/nav.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>