<%@ page language="java" pageEncoding="UTF-8"%>
<!-- login_page begin -->
<div id="yy"></div>
<div class="login" id="login_page">
	<div class="l_header">
		<h2>用户登录</h2>
		<span id="login_close" class="iconfont">&#xe603;</span>
	</div>
	<div class="l_left">
		<div class="l_message" id="message">欢迎使用无线城市</div>
		<div class="l_select" id="userType">
			<label><input type="radio" name="usertype" checked value="0">消费者</label>
			<label><input type="radio" name="usertype" value="1">服务商</label>
		</div>
		<div class="l_input">
			<input id="username" class="input" type="text" placeholder="账号" class="l_username"/>
			<input id="password" class="input" type="password" placeholder="密码"  class="l_password"/>
			<label class="l_sel">
				<span id="l_box" class="l_box iconfont" data-sel="0"></span>
				<span class="l_text">下次自动登录</span>
				<a href="javascript:void(0)">忘记密码？</a>
			</label>
			<a href="javascript:void(0)" class="l_submit" id="login_submit">登录</a> 
		</div>
	</div>
	<div class="l_right">
		<p>还没账号？<a href="font/register.jsp">立即注册</a></p>
		<p>使用合作网站账号登录</p>
		<span class="weibo iconfont">&#xe60e;</span>
		<span class="QQ iconfont">&#xe60d;</span>
		<div class="clear"></div>
		<a class="r_question" href="javascript:void(0)">无法登录？点这里试试</a>
	</div>
</div>
<!-- login_page end -->