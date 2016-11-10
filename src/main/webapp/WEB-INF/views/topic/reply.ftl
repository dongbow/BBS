<#assign path="${request.contextPath}">
<div class="popreplycont">
	<div class="popreplytitle">'
    	<a class="popreplytitlename"><p>回复</p></a>
    	<a title="关闭" class="popreplyclose" href="javascript:;">X</a>
    </div>
    <div class="quotes">
		<q><span>
			<a href="" class="pinfo"></a><br>
			<p></p>
		</span></q>
	</div>
	<div class="editorcont">
		<form id="sonFm" action="">
			<textarea id="sonreplyeditorcont" cols="50" rows="10"></textarea>
			<input type="hidden" name="uid" class="uid" value="">
			<input type="hidden" name="tid" class="tid" value="">
			<input type="hidden" name="bid" class="bid" value="">
			<input type="hidden" name="gid" class="gid" value="">
			<input type="hidden" name="cid" class="cid" value="">
			<input type="hidden" name="pid" class="pid" value="">
			<button id="replybutton">回复</button>
		</form>
	</div>
</div>
