<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
	<link href="${path}/resources/css/shCoreDefault.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${path}/resources/js/shCore.js"></script>
	<script type="text/javascript" src="${path}/resources/js/syntaxhighlighter.js"></script>
  	<title>置顶帖子</title>
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
		                    <input id="uid" class="form-control" name="uid" value="${uid!}" type="text" placeholder="用户ID">
			            </div>
			            <div class="col-md-2 form-group">
		                    <input id="tid" class="form-control" name="tid" value="${tid!}" type="text" placeholder="帖子ID">
			            </div>
                		<div class="col-md-2 form-group">
		                    <select id="t-nav" name="navid" class="selectpicker show-tick form-control">
		                      	<option value="0">所属导航</option>
						        <#list navs as nav>
						        	<#if navid??>
						        		<option value="${nav.navId}" <#if navid?number == nav.navName>selected</#if>>${nav.navName}</option>
						        	<#else>
						        		<option value="${nav.navId}">${nav.navName}</option>
						        	</#if>
						        </#list>
					        </select>
			            </div>
			            <div class="col-md-2 form-group">
		                    <select id="t-board" name="bid" class="selectpicker show-tick form-control">
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
		                    <select id="spec-type" name="type" class="selectpicker show-tick form-control">
		                      	<option value="-1">类型</option>
		                      	<option <#if type??><#if type?number == 1>selected</#if></#if> value="1">版块置顶</option>
		                      	<option <#if type??><#if type?number == 2>selected</#if></#if> value="2">全局置顶</option>
					        </select>
			            </div>
			            
	                	<div class="col-md-4 form-group">
	            			<a class="btn btn-success btn-sm" id="data-search" href="${path}/system/admin/topicmanage/topsign/search" type="button"><i class="fa fa-search"></i> 查找 </a>
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
	                            <th>ID</th>
	                            <th class="numeric">帖子标题</th>
	                            <th class="numeric">发表人</th>
	                            <th class="numeric">阅读数</th>
	                            <th class="numeric">回复数</th>
	                            <th class="numeric">置顶类型</th>
	                            <th class="numeric">截止时间</th>
	                            <th class="numeric">发表时间</th>
	                            <th class="numeric">发表IP</th>
	                            <th class="numeric">更多</th>
	                            <th class="numeric">操作</th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        	<#if topics??>
	                        		<#list topics as topic>
	                        			<tr>
				                            <td data-title="ID">${topic.topicId}</td>
				                            <td class="numeric" data-title="帖子标题">
				                            	<a href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}" target="_blank" style="color:#428bca">${topic.topicTitle}</a>
				                            </td>
				                            <td class="numeric" data-title="发表人">
				                            	<a href="${path}/space/uid/${topic.userId}" target="_blank" style="color:#428bca">${topic.user.userAccess.userNickname}</a>
				                            </td>
				                            <td class="numeric" data-title="阅读数">${topic.topicData.topicViewCount}</td>
				                            <td class="numeric" data-title="回复数">${topic.topicData.topicReplyCount}</td>
				                            <td class="numeric" data-title="置顶类型">
				                            	<#if topic.topicInfo.topicIsLocalTop == 1>版块置顶</#if>
				                            	<#if topic.topicInfo.topicIsGlobalTop == 1>全局置顶</#if>
				                            </td>
				                            <td class="numeric" data-title="截止时间">
				                            	<#if topic.topicInfo.topicIsLocalTop == 1>
				                            		<#if topic.topicInfo.topicIsLocalTopEndTime??>${topic.topicInfo.topicIsLocalTopEndTime?substring(0, 10)}</#if>
				                            	</#if>
				                            	<#if topic.topicInfo.topicIsGlobalTop == 1>
				                            		<#if topic.topicInfo.topicIsGlobalTopEndTime??>${topic.topicInfo.topicIsGlobalTopEndTime?substring(0, 10)}</#if>
				                            	</#if>
				                            </td>
				                            <td class="numeric" data-title="发表时间">${topic.topicCreateTime}</td>
				                            <td class="numeric" data-title="发表IP">${topic.topicCreateIp}</td>
				                            <td class="numeric" data-title="更多">
				                            	<a class="btn btn-link btn-xs topic-data" type="button" data-value="${topic.topicContent}"> 预览 </a>
				                            </td>
				                            <td class="numeric" data-title="操作">
				                            	<a class="btn btn-default btn-xs" href="${path}/board/${topic.boardId}/topic/detail/${topic.topicId}/update" type="button" target="_blank"><i class="fa fa-edit"></i> 编辑内容 </a>
				                            	<div class="btn-group">
													<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
													  修改状态 <span class="caret"></span>
													</button>
													<ul class="dropdown-menu" role="menu">
														<#if topic.topicInfo.topicIsLocalTop == 1>
															<li><a class="data-qxlocal" href="${path}/system/admin/topicmanage/topsign/qxlocal" data-type="one" data-id="${topic.topicId}">取消版块置顶</a></li>
													    	<li><a class="data-editlocal" href="${path}/system/admin/topicmanage/topsign/editlocal" data-type="one" data-id="${topic.topicId}">修改置顶时间</a></li>
														</#if>
														<#if topic.topicInfo.topicIsGlobalTop == 1>
															<li><a class="data-qxglobal" href="${path}/system/admin/topicmanage/topsign/qxglobal" data-type="one" data-id="${topic.topicId}">取消全局置顶</a></li>
													    	<li><a class="data-editglobal" href="${path}/system/admin/topicmanage/topsign/editglobal" data-type="one" data-id="${topic.topicId}">修改置顶时间</a></li>
				                            			</#if>
													</ul>
												</div>
				                            </td>
				                        </tr>
	                        		</#list>
	                        	</#if>
	                        </tbody>
	                    </table>
	                </section>
	                <@buildPage page=page/>
	                <!-- Modal -->
			        <div class="modal fade" id="topic-content-modal" tabindex="-1" role="dialog" aria-labelledby="topic-content-modal" aria-hidden="true">
			        	<div class="modal-dialog modal-lg">
						    <div class="modal-content">
						        <div class="modal-header">
						            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						            <h4 class="modal-title">帖子查看</h4>
						        </div>
						        <div class="modal-body" style="text-align:center; overflow:hidden">
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
	<#include "../common/footer.ftl">
	<script type="text/javascript" src="${path}/resources/js/admin/topic/topic.js"></script>
</body>
</html>