<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-提供商企业主页</title>
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
			.nav .nav_center .c_content ul li a{height:50px;font-size:16px;color:#fff;text-align:center;line-height:50px;padding:0 20px;display:block;}
			.nav .nav_center .c_content ul li a.sel{background:#fff;color:#e45050;border-radius:25px;-webkit-border-radius:25px;}
			.nav .nav_center .c_search{float:right;margin-top:10px;}
			.nav .nav_center .c_search input{width:200px;height:30px;line-height:30px;color:#666;padding-left:10px;display:block;float:left;border:2px solid #ccc;}
			.nav .nav_center .c_search .s_btn{width:80px;height:34px;background:#ccc;color:#444;line-height:30px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			
			.layout_all{width:900px;margin:40px auto;padding-bottom:10px;}
			.layout_all	.layout_nav{height:40px;color:#fff;background:#e45050;}
			.layout_all	.layout_nav .store_divide{position:absolute;top:40px;left:0px;width:152px;background:#fff;border:2px solid #e2383b;border-top:0px;display:none;}
			.layout_all	.layout_nav .store_divide p{height:40px;line-height:40px;color:#444; cursor:pointer;font-size:12px;text-align:left;padding-left:20px;font-weight:500;border-bottom:2px solid #f1f1f1;}
			.layout_all	.layout_nav ul li{float:left;padding:0 20px;height:40px;line-height:40px;font-size:16px;}
			.layout_all	.layout_nav ul li:first-child{font-weight:700;padding:0 30px;background:#e2383b;position:relative;}
			.layout_all	.layout_nav ul li:first-child:hover .store_divide{display:block;}
			.layout_all	.layout_nav ul li:hover{background:#a40000;}
			.layout_all	.layout_banner{height:227px;}
			.layout_all .layout_main{margin-top:20px;}
			.layout_all .layout_main .m_left{width:630px;float:left;background:#fff;height:500px;}
			.layout_all .layout_main .m_left .l_header{height:40px;background:#39393f;color:#fff;font-weight:700;line-height:40px;padding-left:20px;}
			.layout_all .layout_main .m_right{width:250px;float:right;background:#fff;height:500px;}
			.layout_all .layout_main .m_right .r_header{height:40px;background:#39393f;color:#fff;font-weight:700;line-height:40px;padding-left:20px;}
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
					<li><a href="javascript:void(0)" class="sel">某某某服务商</a></li>
				</ul>
			</div>
			<div class="c_search">
				<input type="text" placeholder="搜索本店服务"/>
				<div class="s_btn">搜索</div>
			</div>
		</div>
	</div>
	<div class="layout_all">
		<div class="layout_nav">
			<ul>
				<li>商家服务分类
					<div class="store_divide">
						<p>服务类目</p>
						<p>服务类目</p>
						<p>服务类目</p>
					</div>
				</li>
				<li>最新服务</li>
				<li>特色服务</li>
			</ul>
		</div>
		<div class="layout_banner">
			<img src="images/2.jpg" width="900" height="227" alt="广告栏"/>
		</div>
		<div class="layout_main">
			<div class="m_left">
				<div class="l_header">服务资源展示区</div>
			</div>
			<div class="m_right">
				<div class="r_header">推荐栏</div>
			</div>
			<div id="clear"></div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		function initialize(){
			
			$("input[placeholder]").placeholder();
		}
	</script>
	
</body>
</html>