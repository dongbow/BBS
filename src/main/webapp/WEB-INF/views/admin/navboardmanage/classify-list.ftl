<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>分类管理</title>
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
			            	<input id="name" name="name" value="${name!}" type="text" class="form-control" placeholder="分类名">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="bid" name="bid" value="${bid!}" class="selectpicker show-tick form-control" data-live-search="true">
		                      	<option value="0">所属版块</option>
						        <#list boards as board>
						        	<#if bid??>
								        <option value="${board.boardId}" <#if bid?number == board.boardId>selected</#if>>${board.boardName}</option>
								    <#else>
								        <option value="${board.boardId}">${board.boardName}</option>
			                      	</#if>
						        </#list>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="status" name="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">状态</option>
						        <option <#if status??><#if status?number==0>selected</#if></#if> value="0">正常</option>
						        <option <#if status??><#if status?number==1>selected</#if></#if> value="1">已删除</option>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="auth" name="auth" class="selectpicker show-tick form-control">
		                      	<option value="-1">是否公开</option>
						        <option <#if auth??><#if auth?number==0>selected</#if></#if> value="0">公开发帖</option>
						        <option <#if auth??><#if auth?number==1>selected</#if></#if> value="1">权限发帖</option>
					        </select>
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" type="button" href="${path}/system/admin/navboard/classify/search"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm data-add" type="button" href="${path}/system/admin/navboard/classify/add"><i class="fa fa-plus"></i> 添加 </a>
	            			<a class="btn btn-danger btn-sm data-delete" type="button" href="${path}/system/admin/navboard/classify/delete"><i class="fa fa-trash-o"></i> 删除 </a>
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
	                            <th class="numeric">分类名</th>
	                            <th class="numeric">分类颜色</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">是否公开</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">更多信息</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if clas??>
	                        		<#list clas as c>
	                        			<tr class="${c.classId}">
	                        				<th>
	                        					<#if c.classStatus == 0>
	                        						<input type="checkbox" data-id="${c.classId}" class="data-check-id">
	                        					</#if>
	                        				</th>
				                            <td data-title="ID">${c.classId}</td>
				                            <td class="numeric" data-title="分类名">
				                            	<a href="${path}/navigation/${c.navId}/board/${c.boardId}" target="_blank" style="color:#428bca">${c.className}</a>
				                            </td>
				                            <td class="numeric" data-title="分类颜色">${c.classColor}</td>
				                            <td class="numeric" data-title="排序">${c.classSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if c.classStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="是否公开">
				                            	<#if c.auth == 0>公开<#else>权限</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${c.classCreateTime}</td>
				                            <td class="numeric" data-title="更多信息">
				                            	<a class="btn btn-link btn-xs" type="button" href="${path}/system/admin/navboard/board/more" data-id="${c.classId}">查看更多</a>
				                            </td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs" type="button"><i class="fa fa-edit"></i> 编辑 </a>
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
	<#include "../common/footer.ftl">
</body>
</html>