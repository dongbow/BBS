<div class="wp">
    <form method="get" autocomplete="off" action="search">
    	<p style="text-align: center; color: red">暂未完成，敬请期待...</p>
        <div class="searchAdForm">
            <div class="row">
                <div class="td1">关键词</div>
                <div class="td2">
                    <input class="keyword" placeholder="关键词查找" name="kw" id="srchtxt_1" value="" maxlength="50" type="text">
                </div>
            </div>
            <div class="row">
                <div class="td1">作者</div>
                <div class="td2"><input class="author" placeholder="作者查找" name="srchuname" id="srchname" value="" type="text"></div>
            </div>
            <div class="row">
                <div class="td1">主题范围</div>
                <div class="td2">
                    <span class="radio active" data-type="all"><input type="radio" name="filter" value="all" checked> 全部主题</span>
                    <span class="radio" data-type="digest"><input type="radio" name="filter" value="cream"> 精华主题</span>
                    <span class="radio" data-type="top"><input type="radio" name="filter" value="top"> 置顶主题</span>
                </div>
            </div>
            <div class="row">
                <div class="td1">搜索时间</div>
                <div class="td2">
                    <a class="select timeRange" id="timeRange" href="javascript:void(0);">
                        <p>全部时间</p>
                        <input name="srchfrom" value="0" type="hidden">
                    </a>
                    <span class="radio" data-type="0"><input type="radio" name="time" value="inner" checked> 以内</span>
                    <span class="radio" data-type="1"><input type="radio" name="time" value="before"> 以前</span>
                </div>
            </div>
            <div class="row">
                <div class="td1">排序类型</div>
                <div class="td2">
                    <span class="radio" data-type="desc"><input type="radio" name="sort" value="desc" checked> 降序</span>
                    <span class="radio" data-type="asc"><input type="radio" name="sort" value="asc"> 升序</span>
                </div>
            </div>
            <div class="row">
                <div class="td1">搜索范围</div>
                <div class="td2">
                    <select id="srchfid" name="srchfid[]" multiple="multiple" size="10" style="width: 26em;">
                        <option value="all" selected="selected">全部版块</option>
                        <#if navs??>
                        	<#list navs as nav>
                        		<optgroup label="--${nav.navName}">
                        		<#list nav.boards as board>
                        			<#if board.isAccess == 0>
                        				<option value="${board.boardId}">${board.boardName}</option>
                        			</#if>
                        		</#list>
                        	</#list>
                        </#if>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="td1"></div>
                <div class="td2">
                    <input name="searchsubmit" value="yes" type="hidden">
                    <button type="submit">搜索</button>
                </div>
            </div>
        </div>
    </form>
</div>