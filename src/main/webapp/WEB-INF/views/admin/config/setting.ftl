<#include "../common/page.ftl">
<!DOCTYPE html>
<html lang="en">
<head>
	<#include "../common/import.ftl">
  	<title>系统设置</title>
</head>

<body class="sticky-header">

<section>
    
    <#include "../common/menu.ftl">
    
    <!-- main content start-->
    <div class="main-content" >

        <#include "../common/header.ftl">

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                          	  系统功能
                        <span class="tools pull-right">
                        	<a href="${path}" class="fa fa-save system-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<div class="col-md-2 form-group">
                        		<label class="control-label">论坛访问</label>
			                    <select id="isOpenBbs" class="selectpicker show-tick form-control">
			                      	<option value="0">开启</option>
			                      	<option value="1">关闭</option>
						        </select>
				            </div>
				            
				            <div class="col-md-2 form-group">
                        		<label class="control-label">论坛注册</label>
			                    <select id="isAllowRegister" class="selectpicker show-tick form-control">
			                      	<option value="0">开启</option>
			                      	<option value="1">关闭</option>
						        </select>
				            </div>
				            
				            <div class="col-md-2 form-group">
                        		<label class="control-label">帖子审核</label>
			                    <select id="isOpenTopicAudit" class="selectpicker show-tick form-control">
			                      	<option value="0">开启</option>
			                      	<option selected value="1">关闭</option>
						        </select>
				            </div>
				            
				            <div class="col-md-2 form-group">
                        		<label class="control-label">评论审核</label>
			                    <select id="isOpenReplyAudit" class="selectpicker show-tick form-control">
			                      	<option value="0">开启</option>
			                      	<option selected value="1">关闭</option>
						        </select>
				            </div>
				            
				            <div class="col-md-2 form-group">
                        		<label class="control-label">敏感词</label>
			                    <select id="isOpenBadWord" class="selectpicker show-tick form-control">
			                      	<option value="0">开启</option>
			                      	<option selected value="1">关闭</option>
						        </select>
				            </div>
				            
                        </div>
                    </section>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                          	  功能性按钮
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<a class="btn btn-info" type="button">重置搜索索引</a>
                        	<a class="btn btn-info" type="button">一键刷新缓存</a>
                        </div>
                    </section>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                          	  金币经验
                        <span class="tools pull-right">
                        	<a href="${path}" class="fa fa-save system-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">每日限制(除注册)</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
                        	<div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">注册</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
                        	<div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">每日登录</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">签到</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">发帖</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">回帖</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
		                    <div class="form-group col-sm-10">
		                        <label class="col-sm-2 control-label">首次下载(同一附件)</label>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="金币" ype="text">
		                        </div>
		                        <div class="col-sm-5">
		                            <input class="form-control" placeholder="经验" ype="text">
		                        </div>
		                    </div>
                        </div>
                    </section>
                </div>
            </div>
            
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                          	  其他操作
                        <span class="tools pull-right">
                        	<a href="${path}" class="fa fa-save system-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<form class="form-horizontal adminex-form" method="get">
			                    <div class="form-group">
			                        <label class="col-sm-2 col-sm-2 control-label">找回密码链接有效时间</label>
			                        <div class="col-sm-10">
			                            <input class="form-control tooltips" data-original-title="分钟" data-toggle="tooltip" data-placement="top" value="30" type="text">
			                        </div>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-2 col-sm-2 control-label">找回密码邮件标题</label>
			                        <div class="col-sm-10">
			                            <input class="form-control" ype="text">
			                        </div>
			                    </div>
			                </form>
                        </div>
                    </section>
                </div>
            </div>
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
	<script type="text/javascript" src="${path}/resources/js/admin/config/setting.js"></script>
	<#include "../common/footer.ftl">
</body>
</html>