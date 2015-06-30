<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-后台-运营商登陆页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<style type="text/css">
			::selection{background-color:#61cbd7;}
			*{margin:0px;padding:0px;}
			input{outline:none;border:0;}
			img{border:none;*zoom:1;outline:none;display:block;}
			html,body{overflow:hidden;background:#e1e2e4;cursor:default;}
			.login_wrapper .w_center{width:100%;position:relative;}
			.login_wrapper .w_center .w_login{border:1px solid #505055;width:400px;position:absolute;top:120px;right:100px;background:#fdfdfd;box-shadow:0px 0px 15px #333;}
			.login_wrapper .w_center .w_login .login_header{width:400px;height:85px;}
			.login_wrapper .w_center .w_login .login_header .header_pic{background:url(images/login.png) no-repeat;width:25px;height:25px;margin:30px 22px;float:left;}
			.login_wrapper .w_center .w_login .login_header .header_text{float:left;height:85px;line-height:85px;font-size:22px;font-weight:bold;}
			.login_wrapper .w_center .w_login #l_message{width:360px;height:40px;position:absolute;top:60px;left:20px;color:red;background:#faffbd;border-radius:5px;line-height:40px;text-align:center;font-size:12px;display:none;}
			.login_wrapper .w_center .w_login .login_body{width:360px;margin:22px;}
			.login_wrapper .w_center .w_login .login_body .input{height:63px;border:1px solid #666;}
			.login_wrapper .w_center .w_login .login_body input{background:#fdfdfd;width:312px;height:62px;float:left;line-height:62px;}
			.login_wrapper .w_center .w_login .login_body .input span{display:block;width:18px;height:18px;float:left;margin:22px 3px;background:url(images/sprite_1.png) no-repeat;}
			.login_wrapper .w_center .w_login .login_body .input .span1{background-position:0 -460px;}
			.login_wrapper .w_center .w_login .login_body .input .span2{background-position:-35px -460px;}
			.login_wrapper .w_center .w_login .login_body label{font-size:12px;width:360px;height:48px;display:block;line-height:48px;}
			.login_wrapper .w_center .w_login .login_body label .select{width:14px;height:14px;margin:16px 5px 0px 0px;display:block;border:1px solid #666;float:left;background:url(images/icon.gif) no-repeat -113px 0px;float:left;cursor:pointer;}
			.login_wrapper .w_center .w_login .login_body label .login_free{float:left;}
			.login_wrapper .w_center .w_login .login_body label .forget{cursor:pointer;float:right;text-decoration:underline;color:#007aa6;display:none;}
			.login_wrapper .w_center .w_login .login_body .login{cursor:pointer;height:52px;width:340px;margin-left:11px;background:url(images/sprite_1.png) no-repeat 0 0;}
			.login_wrapper .w_center .w_login .login_body .login:hover{background-position:0 -52px;}
			

		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
	</head>
<body>
	<div class="login_wrapper">
		<div class="w_center">
			<img width="100%" height="322" alt="" src="images/login_bottom.jpg"/>
			<img width="100%" height="322" alt="" src="images/login_top.jpg"/>
			<div class="w_login">
				<div class="login_header">
					<div class="header_pic"></div>
					<div class="header_text">无线城市-后台登陆</div>
				</div>
				<div id="l_message"></div>
				<form id="l_form">
					<div class="login_body">
						<div class="input" style="border-bottom:0px;">
							<span class="span1"></span><input id="l_username" name="username" type="text" placeholder="用户名"/>
						</div>
						<div class="input" style="border-top:0px;">
							<span class="span2"></span><input id="l_password" name="password" style="border-top:1px solid #666;" type="password" placeholder="密码"/>
						</div>
						<label>
							<span class="select" data-sel="0" id="sel"></span>
							<span class="login_free">七天免登录</span>
							<span class="forget">忘记密码？</span>
						</label>
						<div class="login" id="l_sure"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#l_username").focus();
			$("#sel").on("click",function(){
				var sel=$(this).data("sel");
				if(sel==0){
					$(this).css("backgroundPosition","-113px -19px");$(this).data("sel","1");
				}else{
					$(this).data("sel","0");$(this).css("backgroundPosition","-113px 0px");
				}
			});
		});
	</script>
</body>
</html>