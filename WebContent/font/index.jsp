<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>无线城市-主页（含登录页面）</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<link href="css/reset.css" rel="stylesheet">
<link href="css/front_default_style.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/util.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
</head>
<body>
	<!-- header begin-->
	<s:include value="header.jsp"></s:include>
	<div class="h_sec">
		<div class="s_wrapper">
			<div class="s_left">
				<ul id="nav_ul">
					<li style="width:60px;margin-left:212px;" class="lidemo">首页</li>
					<li>求职就业</li>
					<li>购物</li>
					<li>教育培训</li>
					<li>旅游频道</li>
					<li>便民服务</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- header end-->
	<!-- center begin-->
	<div class="banner">
		<div class="b_content">
			<div class="c_info">
				<ul id="left_nav" class="left_nav">
					<li><span class="i_desc">全部服务资源分类</span></li>
					<!-- TODO 一类目迭代开始 需要data-index从0开始 -->
					<li data-index="0">
						<span class="i_icon iconfont">&#xe618;</span>
						<span class="i_desc">
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=101">无线政务</a>
						</span>
						<span class="i_more iconfont">&#xe614;</span>
					</li>
					<!-- repeat data-index变为1 -->
					<li data-index="1">
						<span class="i_icon iconfont" >&#xe618;</span>
						<span class="i_desc">
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=101">无线政务</a>
						</span>
						<span class="i_more iconfont">&#xe614;</span>
					</li>
					<!-- 一类目迭代结束 -->
				</ul>
			</div>
			<ul class="left_content" id="left_content">
				<!--TODO 一类目对应的li 1 -->
				<li>
					<!--TODO 二类目迭代开始 -->
					<div class='c_list'>
						<div class='l_second_item'>
							<span class='span1'>
								<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=10101">政府办事导航</a>
							</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=1010101">市农林局</a>
						</div>
					</div>
					<!-- repeat  -->
					<div class='c_list'>
						<div class='l_second_item'>
							<span class='span1'>
								<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=10101">政府办事导航</a>
							</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<!--TODO 三类目迭代开始 -->
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=1010101">市农林局</a>
							<!-- repeat -->
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=1010101">市农林局</a>
							<!-- 三类目迭代结束 -->
						</div>
					</div>
					<!-- 二类目迭代结束 -->
				</li>
				<!-- 一类目对应的li 2  以此类推  repeat-->
				<li>
					<div class='c_list'>
						<div class='l_second_item'>
							<span class='span1'>
								<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=10101">政府办事导航</a>
							</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=1010101">市农林局</a>
						</div>
					</div>
					<div class='c_list'>
						<div class='l_second_item'>
							<span class='span1'>
								<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=10101">政府办事导航</a>
							</span>
							<span class="span2">&gt;</span>
						</div>
						<div class="l_third_item">
							<a href="SearchResourceAction_searchResourceByCatalogue?catalogueId=1010101">市农林局</a>
						</div>
					</div>
				</li>
			</ul>
			<ul class="img_ul">
				<li><img src="images/banner1.jpg" alt="" height="471" /></li>
			</ul>
		</div>
	</div>
	<div class="center"></div>
	<!-- center end -->
	<!-- bottom beign -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<!-- login_page begin -->
	<s:include value="login_box.jsp"></s:include>
	<!-- login_page end -->
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function() {
			loginBoxShow();
			loginValidator();
			init();
			navOperation();
		});
	</script>
</body>
</html>