<style type='text/css'>
	* {font:16px 'microsoft yahie';color:#333;}
	#mailcontent {border:1px solid #ccc;width:900px; height:auto;margin:0 auto;background:#fff;padding:20px 50px 35px 50px;}
	#mailcontent a {text-align:center;display:block;width:900px;height:auto;padding:20px 0;color:#000;}
	#mailcontent .resetpwd {display:block;width:100px;height:20px;padding:5px;font:16px 'microsoft yahei';background:#f2f2f2;border:1px solid #bbb;
							       text-align:center;margin-top:24px;border-radius:2px;color:#666;text-decoration:none;margin-left:30px;}
	#mailcontent .resetpwd:hover {text-decoration:none;color:#fff;box-shadow:0 0 5px rgba(20,20,20,0.3);background:#19b4ea;}
	#mailcontent .from {text-align:right;margin-top:40px;}
</style>
<div id='mailcontent'>
	<a href='${server}'><img alt='logo' src='${server}/resources/images/biglogo.png'/></a>
	<p>亲爱的 ${username}用户：</p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一封来自<a style='display:inline' href='${server}'>JAVA技术论坛</a>的邮件，
		本邮件用于找回密码，请先确定这是否是您本人操作，如果不是，请忽略此邮件，如果是您本人操作，那么请注意以下事项：
	</p>
	<ol>
		<li>本邮件有效期为${validtime}分钟，请在有效时间内点击下方按钮进行密码重置</li>
	    <li>如果按钮无法点击，请复制下方链接粘贴至浏览器地址栏</li>
	    <li>此邮件为系统自动发送，请勿回复</li>
    </ol>
    <a class='resetpwd' href='${resetUrl}'>点击重置密码</a>
    <p>密码重置链接： ${resetUrl} </p>
    <p>如果有任何疑问，请联系网站管理员，邮箱地址：<a style='display:inline' href='mailto:${email}'>${email}</a></p>
    <div class='from'>
    	<span>来自BBS</span>
        <p>${nowTime}</p>
    </div> 
</div>;