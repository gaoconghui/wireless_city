<%@ page language="java"  pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="title_fixed">
	<div class="s_right" id="s_right">
		<div class="r_login">登录</div>
		<div class="r_register"><a href="font/register.jsp">注册</a></div>
		<!-- <div class="more iconfont">&#xe60a;</div>
		<div class="r_info">name</div>
		<div class="r_wel iconfont">&#xe608;</div>
		<div class="information_box">
			<ul>
				<li>
					<a href="font/buyer.jsp?id=1">
						<i class="iconfont">&#xe612;</i>
						个人中心
					</a>
				</li>
				<li>
					<a href="LoginAction_exit">
						<i class="iconfont">&#xe611;</i>
						退出
					</a>
				</li>
			</ul>
		</div> -->
	</div>
</div>
<div class="header">
	<div class="h_fir">
		<div class="f_logo"></div>
		<div class="f_search">
			<div class="s_input">
				<s:form action="SearchResourceAction_frontFindByKeyWord" id="s_all">
					<s:textfield name="frontKey" placeholder="找服务资源"></s:textfield>
					<s:hidden name="rsid"></s:hidden>
					<div class="i_btn" id="search_all"><i class="iconfont">&#xe60f;</i>搜索</div>
				</s:form>
			</div>
		</div>
		<div class="f_contact">
			<div class="c_fir">
				<span class="f_icon iconfont">&#xe60b;</span>
				<span class="f_text">问题咨询：027-01293604</span>
			</div>
		</div>
	</div>
</div>