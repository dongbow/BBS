<#macro buildTree child>
	<#if child?? && child?size gt 0>
        <#list child as res>
            <tr>
        		<th><input type="checkbox" data-id="${res.resId}"></th>
        		<td class="numeric" data-title="ID">${res.resId}</td>
                <td class="numeric" data-title="资源名">
                	<#if res.resType == 0>
                		${res.resName}
                	<#elseif res.resType == 1>
                		&nbsp;&nbsp;&nbsp;${res.resName}
                	<#else>
                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${res.resName}
                	</#if>
                </td>
                <td class="numeric" data-title="资源链接">${res.resLink}</td>
                <td class="numeric" data-title="标记">${res.resSign}</td>
                <td class="numeric" data-title="类型">
                	<#if res.resType == 0>模块<#elseif res.resType == 1>菜单<#else>按钮</#if>
                </td>
                <td class="numeric" data-title="图标"><i class="fa ${res.resIcon}" title="${res.resIcon}"></i></td>
                <td class="numeric" data-title="状态">
                	<#if res.resStatus == 0>正常<#else>已删除</#if>
                </td>
                <td class="numeric" data-title="排序">${res.resSort}</td>
                <td class="numeric" data-title="上级ID">
                	<#if res.resParentId != 0>${res.resParentId}</#if>
                </td>
                <td class="numeric" data-title="创建时间">${res.resCreateTime}</td>
                <th class="numeric" data-title="操作">
                	<button class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </button>
                </th>
            </tr>
            <@buildTree child=res.resources/>
        </#list>
    </#if>                       		
</#macro>

<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>资源管理</title>
  	<link href="${path}/resources/static/admin/js/bootstrap-icon/css/icon-picker.min.css" media="all" rel="stylesheet" type="text/css" />
	<style type="text/css">.dropdown-menu {z-index: 10000;}.icon-popup .ip-search {height: 25px;}</style>
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
                <div class="panel-body">
                	<div class="col-md-2 form-group">
		            	<input id="" type="text" class="form-control" placeholder="资源名">
		            </div>
		            <div class="col-md-3 form-group">
		            	<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查询 </a>
        				<a class="btn btn-info btn-sm" type="button" href="${path}/system/admin/sysmanage/resources/add" id="res-add"><i class="fa fa-plus"></i> 添加 </a>
	            		<a class="btn btn-danger btn-sm" type="button"><i class="fa fa-trash-o"></i> 删除 </a>
		            </div>
            	</div>
            </div>
            <section class="panel">
	            <div class="panel-body">
	                <section id="no-more-tables">
	                    <table class="table table-bordered table-striped table-condensed cf">
	                        <thead class="cf">
	                        <tr>
	                        	<th><input type="checkbox" id="data-ids"></th>
	                            <th class="numeric">ID</th>
	                            <th class="numeric">资源名</th>
	                            <th class="numeric">资源链接</th>
	                            <th class="numeric">标记</th>
	                            <th class="numeric">类型</th>
	                            <th class="numeric">图标</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">上级ID</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<@buildTree child=resources/>
	                        </tbody>
	                    </table>
	                </section>
	            </div>
	        </section>
        </div>
        <!--body wrapper end-->

        <!-- Modal -->
        <div class="modal fade" id="res-modal" tabindex="-1" role="dialog" aria-labelledby="res-modal" aria-hidden="true"  data-backdrop="static"></div>
        <!-- modal -->

        <!--footer section start-->
        <footer style="bottom:0">
            2016 &copy; BBS, Model by ThemeBucket
        </footer>
        <!--footer section end-->

    </div>
    <!-- main content end-->
</section>
	<#include "../common/footer.ftl">
	<script src="${path}/resources/static/admin/js/bootstrap-icon/js/iconPicker.js"></script>
	<script type="text/javascript" src="${path}/resources/js/admin/sysmanage/resources.js"></script>
</body>
</html>