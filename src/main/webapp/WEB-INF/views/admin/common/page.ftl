<#macro buildPage page>
	<#if page.totalRecord gt 0>
		<div style="text-align:right">  
			<#if page.pageNo != 1 && page.totalPage != 0>  
			  	<a href="${page.searchUrl}1" class="btn btn-default btn-sm" onclick="pageClick(1)">首页</a>  
			  	<a href="${page.searchUrl}${page.pageNo - 1}" class="btn btn-default btn-sm">上一页</a>  
			<#else>  
			  	<a class="btn btn-default btn-sm">首页</a>  
			  	<a class="btn btn-default btn-sm">上一页</a>  
			</#if>  
			<#list page.pageNoDisp?split(",") as num>   
				<#if num?number == 0>  
			      	<label style="font-size: 10px; width: 20px; text-align: center;">•••</label>  
			  	<#elseif num?number != page.pageNo>  
			      	<a href="${page.searchUrl}${num}" class="btn btn-default btn-sm">${num}</a>  
			  	<#else>  
			      	<a class="btn btn-primary btn-sm" style="font-weight:bold;">${num}</a>  
			  	</#if>  
			</#list>  
			<#if page.pageNo lt page.totalPage && page.totalPage != 0>  
			  	<a href="${page.searchUrl}${page.pageNo + 1}" class="btn btn-default btn-sm">下一页</a>  
			  	<a href="${page.searchUrl}${page.totalPage}" class="btn btn-default btn-sm">尾页</a>  
			<#else>  
				<a class="btn btn-default btn-sm">下一页</a>  
			  	<a class="btn btn-default btn-sm">尾页</a>  
			</#if>  
		</div>
	</#if>
</#macro>