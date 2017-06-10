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
                        	<a href="${path}/system/admin/config/update" class="fa fa-save system-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<#if config?? && config?size gt 0>
                        		<#list config as cg>
                        			<div class="col-md-2 form-group">
		                        		<label class="control-label">${cg.zhAttrName}</label>
					                    <select id="${cg.attrName}" class="selectpicker show-tick form-control">
					                      	<option value="0" <#if cg.attrValue?number == 0>selected</#if>>开启</option>
					                      	<option value="1" <#if cg.attrValue?number == 1>selected</#if>>关闭</option>
								        </select>
						            </div>
                        		</#list>
                        	</#if>
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
                        	<a class="btn btn-info lucene-init" type="button" href="${path}/system/admin/config/lucene/init">初始化（重置）搜索索引</a>
                        	<a class="btn btn-info cache-refresh" type="button" href="${path}/system/admin/config/cache/refresh">一键刷新缓存</a>
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
                        	<a href="${path}/system/admin/config/award/update" class="fa fa-save award-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                        	<#if avs??>
                        		<#list avs as av>
                        			<div class="form-group col-sm-10">
				                        <label class="col-sm-2 control-label">${av.valueType}</label>
				                        <input type="hidden" value="${av.id}" class="av-id">
				                        <div class="col-sm-5">
				                            <input class="form-control" placeholder="金币" type="text" value="${av.goldValue}">
				                        </div>
				                        <div class="col-sm-5">
				                            <input class="form-control" placeholder="经验" type="text" value="${av.expValue}">
				                        </div>
				                    </div>
                        		</#list>
                        	</#if>
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
                        	<a href="${path}/system/admin/config/email/update" class="fa fa-save system-save" style="background:#5bc0de !important;color:#fff"> 保存更改 </a>
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