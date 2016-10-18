<#macro buildPage page>
	<#if page??>
		<div id="kkpages">
	    	<div id="kkpager">
		    	<div>
		    		<span class="infoTextAndGoPageBtnWrap">
						<span class="goPageBox">&nbsp;转到
							<span id="kkpager_gopage_wrap">
								<input type="text" value="2" onkeypress="return kkpager.keypress_gopage(event);"  id="kkpager_btn_go_input">
							</span>
						</span>
					</span>
					<span class="pageBtnWrap">
						<#if page.pageNo != 1 && page.totalPage != 0>  
						  	<a href="${page.searchUrl}?p=1">首页</a>  
						  	<a href="${page.searchUrl}?p=${page.pageNo - 1}">上一页</a>  
						<#else>  
						  	<span class="disabled">首页</span>
							<span class="disabled">上一页</span>
						</#if> 
						<#list page.pageNoDisp?split(",") as num>   
							<#if num?number == 0>  
						      	<span class="spanDot">...</span>  
						  	<#elseif num?number != page.pageNo>  
						      	<a href="${page.searchUrl}?p=${num}">${num}</a>  
						  	<#else>  
						      	<span class="curr">${num}</span> 
						  	</#if>  
						</#list>  
						<#if page.pageNo lt page.totalPage && page.totalPage != 0>  
						  	<a href="${page.searchUrl}?p=${page.pageNo + 1}">下一页</a>  
						  	<a href="${page.searchUrl}?p=${page.totalPage}">尾页</a>  
						<#else>  
							<a class="disabled">下一页</a>  
						  	<a class="disabled">尾页</a>  
						</#if>
					</span>
				</div>
				<div style="clear:both;"></div>
			</div>
	    </div>
	</#if>
</#macro>