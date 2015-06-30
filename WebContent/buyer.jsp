<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-用户个人中心</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
		/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#f1f1f1;cursor:default;color:#444;}
			.title_fixed{width:100%;height:40px;}
			.title_fixed .s_right{float:right;width:400px;font-size:16px;line-height:40px;}
			.title_fixed .s_right .r_login,.r_register{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
		/*header end*/
			.nav{width:100%;height:80px;background:#e45050;}
			.nav .nav_center{width:1200px;height:80px;padding-top:15px;}
			.nav .nav_center .c_logo{width:188px;height:50px;margin:0px 10px 0px 25px; background:url(images/logo1.png) no-repeat;float:left;}
			.nav .nav_center .c_content{width:500px;height:50px;float:left;}
			.nav .nav_center .c_content ul li{float:left;margin-left:20px;}
			.nav .nav_center .c_content ul li a{height:50px;font-size:16px;color:#fff;text-align:center;line-height:50px;width:80px;display:block;}
			.nav .nav_center .c_content ul li a.sel{background:#fff;color:#e45050;border-radius:25px;-webkit-border-radius:25px;}
			.nav .nav_center .c_search{float:right;margin-top:10px;}
			.nav .nav_center .c_search input{width:200px;height:30px;line-height:30px;color:#666;padding-left:10px;display:block;float:left;border:2px solid #ccc;}
			.nav .nav_center .c_search .s_btn{width:80px;height:34px;background:#ccc;color:#444;line-height:30px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			
			.layout_all{width:900px;margin:40px auto;padding-bottom:10px;}
			.layout_all .wrapper_left{float:left;width:130px;}
			.layout_all .wrapper_left dl dt{font-size:16px;color:#000;font-weight:700;margin-top:30px;padding-bottom:10px;}
			.layout_all .wrapper_left dl dt:first-child{margin-top:0;}
			.layout_all .wrapper_left dl dd{margin-top:10px;text-indent:20px;}
			.layout_all .wrapper_right{float:left;width:770px;position:relative;height:500px;}
			.layout_all .wrapper_right .r_list{width:770px;position:absolute;left:0;top:0;}
			.layout_all .wrapper_right #info .l_details{background:#fff;padding:10px 20px;width:400px;}
			.layout_all .wrapper_right #info .l_details .title{padding-bottom:10px;font-size:16px;height:30px;line-height:30px;font-weight:700;border-bottom:1px solid #ccc;}
			.layout_all .wrapper_right #info .l_details .main ul li{height:30px;line-height:30px;text-align:left;}
			.layout_all .wrapper_right #info .l_details .main ul li span{height:30px;display:block;float:left;padding:0 10px;}
			.layout_all .wrapper_right #info .l_details .main ul li .span{width:60px;}
			.layout_all .wrapper_right #info .l_details .main ul li span a{color:#0181ec;}
			.layout_all .wrapper_right #info .l_details .foot{height:30px;line-height:30px;text-align:center;border-top:1px solid #ccc;}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
		<script type="text/javascript" src="js/yjutil.js"></script>
	</head>
<body>
	<!-- header begin-->
	<div class="title_fixed">
		<div class="s_right" id="s_right">
			<div class="r_login">登录</div>
			<div class="r_register"><a href="wireless_register.html">注册</a></div>
		</div>
	</div>
	<!-- header end -->
	<div class="nav">
		<div class="nav_center">
			<div class="c_logo">
			</div>
			<div class="c_content">
				<ul>
					<li><a href="javascript:void(0)"  class="sel">个人中心</a></li>
					<li><a href="javascript:void(0)">个人主页</a></li>
				</ul>
			</div>
			<div class="c_search">
				<input type="text" placeholder="搜索服务资源"/>
				<div class="s_btn">搜索</div>
			</div>
		</div>
	</div>
	<div class="layout_all">
		<div class="wrapper_left">
			<dl>
				<dt id="all_function">基础信息</dt>
				<dd id="information">个人信息</dd>
				<dd>交易记录</dd>
				<dd>账户</dd>
				<dt>设置</dt>
				<dd>修改密码</dd>
				<dd>修改手机</dd>
			</dl>
		</div>
		<div class="wrapper_right" >
			<div id="all" class="r_list"  style="display:none;" >全部功能展示页</div>
			<div id="info" class="r_list">
				<div class="l_details">
					<div class="title">基本资料</div>
					<div class="main">
						<ul>
							<li>
								<span class="span">用户名:</span><span>A某</span>
							</li>
							<li>
								<span class="span">密码:</span><span>***</span><span class="span"><a href="javascript:void(0)">修改密码？</a></span>
							</li>
							<li>
								<span class="span">真实姓名:</span><span>A某</span>
							</li>
							<li>
								<span class="span">手机:</span><span>***</span><span class="span"><a href="javascript:void(0)">修改手机？</a></span>
							</li>
							<li>
								<span class="span">邮箱:</span><span>***</span>
							</li>
						</ul>
					</div>
					<div class="foot">编辑个人资料&gt;</div>
				</div>
			</div>
		</div>
		<div id="clear"></div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- end bottom -->
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		function initialize(){
			$("input[placeholder]").placeholder();
			$("#all_function").click(function(){
				$("#all").show().siblings().hide();
			});
			$("#information").click(function(){
				$("#info").show().siblings().hide();
			});
		}
	</script>
</body>
</html>