<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>版块管理</title>
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
			            	<input id="bid" type="text" class="form-control" placeholder="版块ID">
			            </div>
			            <div class="col-md-2 form-group">
			            	<input id="name" type="text" class="form-control" placeholder="版块名">
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="status" class="selectpicker show-tick form-control">
		                      	<option value="-1">状态</option>
						        <option value="0">正常</option>
						        <option value="1">已删除</option>
					        </select>
			            </div>
                		<div class="col-md-2 form-group">
		                    <select id="navid" class="selectpicker show-tick form-control">
		                      	<option value="0">所属导航</option>
						        <#list navs as nav>
						        	<option value="${nav.navId}">${nav.navName}</option>
						        </#list>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="isopen" class="selectpicker show-tick form-control">
		                      	<option value="-1">是否开放</option>
						        <option value="0">开放</option>
						        <option value="1">暂未开放</option>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="access" class="selectpicker show-tick form-control">
		                      	<option value="-1">是否公开</option>
						        <option value="0">公开访问</option>
						        <option value="1">权限访问</option>
					        </select>
			            </div>
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" type="button"><i class="fa fa-search"></i> 查找 </a>
	            			<a class="btn btn-info btn-sm" type="button"><i class="fa fa-plus"></i> 添加 </a>
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
	                        	<th><input type="checkbox"></th>
	                            <th>ID</th>
	                            <th class="numeric">版块名</th>
	                            <th class="numeric">版块描述</th>
	                            <th class="numeric">排序</th>
	                            <th class="numeric">状态</th>
	                            <th class="numeric">是否开放</th>
	                            <th class="numeric">是否公开</th>
	                            <th class="numeric">创建时间</th>
	                            <th class="numeric">更多信息</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if boards??>
	                        		<#list boards as board>
	                        			<tr class="${board.navId}">
	                        				<th><input type="checkbox"></th>
				                            <td data-title="ID">${board.boardId}</td>
				                            <td class="numeric" data-title="版块名">
				                            	<a href="${path}/navigation/${board.navId}/board/${board.boardId}" target="_blank" style="color:#428bca">${board.boardName}</a>
				                            </td>
				                            <td class="numeric" data-title="版块描述">${board.boardDesc}</td>
				                            <td class="numeric" data-title="排序">${board.boardSort}</td>
				                            <td class="numeric" data-title="状态">
				                            	<#if board.boardStatus == 0>正常<#else>已删除</#if>
				                            </td>
				                            <td class="numeric" data-title="是否开放">
				                            	<#if board.boardIsOpen == 0>开放<#else>未开放</#if>
				                            </td>
				                            <td class="numeric" data-title="是否公开">
				                            	<#if board.isAccess == 0>公开<#else>权限</#if>
				                            </td>
				                            <td class="numeric" data-title="创建时间">${board.boardCreateTime}</td>
				                            <td class="numeric" data-title="更多信息">
				                            	<a class="btn btn-link btn-xs" type="button" href="${path}/system/admin/navboard/board/more" data-id="${board.boardId}">查看更多</a>
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