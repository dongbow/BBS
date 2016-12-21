<#assign path="${request.contextPath}">
<#macro buildMenu child>
	<#if child?? && child?size gt 0>
		<#list child as res>
    		<#if res.resources?? && res.resources?size gt 0 && res.resType lt 1 && res.resStatus == 0>
    			<#assign subChild = 0/>
    			<#list res.resources as sub>
            		<#if sub.resType gte 2>
            			<#assign subChild = 1/><#break>
            		</#if>
				</#list>
				<#if subChild = 1>
					<li><a href="${path}${res.resLink}" <#if res.turnWay == 1>target="_blank"</#if>><i class="fa ${res.resIcon}"></i><span>${res.resName}</span></a></li>
				<#else>
					<li class="menu-list"><a href="${path}${res.resLink}"><i class="fa ${res.resIcon}"></i><span>${res.resName}</span></a>
	                    <ul class="sub-menu-list">
	                    	<#list res.resources as sub>
	                    		<#if sub.resType lt 2>
	                    			<li><a href="${path}${sub.resLink}" <#if sub.turnWay == 1>target="_blank"</#if>><i class="fa ${sub.resIcon}"></i>${sub.resName}</a></li>
	                    		</#if>
							</#list>
	                    </ul>
	            	</li>
				</#if>
    		<#elseif res.resType lt 1 && res.resStatus == 0>
    			<li><a href="${path}${res.resLink}" <#if res.turnWay == 1>target="_blank"</#if>><i class="fa ${res.resIcon}"></i><span>${res.resName}</span></a></li>
    		</#if>
            <@buildMenu child=res.resources/>
        </#list>
    </#if>                       		
</#macro>
<!-- left side start-->
<div class="left-side sticky-left-side">

    <!--logo and iconic logo start-->
    <div class="logo">
        <a href="${path}/system/admin/index.html"><img src="images/logo.png" alt=""></a>
    </div>

    <div class="logo-icon text-center">
        <a href="index.html"><img src="images/logo_icon.png" alt=""></a>
    </div>
    <!--logo and iconic logo end-->

    <div class="left-side-inner">

        <!-- visible to small devices only -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">
            <div class="media logged-user">
                <img id="menu_headimg" alt="" src="" class="media-object">
                <div class="media-body">
                    <h4><a id="menu_name" href="#"></a></h4>
                    <span>"Hello World"</span>
                </div>
            </div>

            <h5 class="left-nav-title">账户信息</h5>
            <ul class="nav nav-pills nav-stacked custom-nav">
              <li><a href="${path}/system/admin/self"><i class="fa fa-user"></i> <span>个人信息</span></a></li>
              <li><a href="${path}/system/admin/config/setting"><i class="fa fa-cog"></i> <span>系统设置</span></a></li>
              <li><a href="${path}/account/logout?from=system"><i class="fa fa-sign-out"></i> <span>退出系统</span></a></li>
            </ul>
        </div>

        <!--sidebar nav start-->
        <ul id="bbs-menu" class="nav nav-pills nav-stacked custom-nav">
            <li class="bbs-home active"><a href="${path}/system/admin/index"><i class="fa fa-home"></i> <span>系统首页</span></a></li>
        	<@buildMenu child=resources/>
        </ul>
        <!--sidebar nav end-->

    </div>
</div>
<!-- left side end-->

<script src="${path}/resources/js/admin/base/base.js"></script>