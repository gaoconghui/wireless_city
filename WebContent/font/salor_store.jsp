<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>无线城市-提供商企业主页</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<link href="css/reset.css" rel="stylesheet">
<link href="css/front_default_style.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/placeholder.js"></script>
</head>
<body>
	<!-- header begin-->
	<s:include value="logined_header.jsp"></s:include>
	<div class="nav">
		<div class="nav_center">
			<div class="c_logo">
			</div>
			<div class="c_content">
				<ul>
					<li><a href="font/salor.jsp">管理中心</a></li>
					<li><a href="font/salor_store.jsp"  class="sel">企业主页</a></li>
				</ul>
			</div>
			<div class="c_search">
				<s:form action="SearchResourceAction_frontFindByKeyWord" id="s_all">
					<s:textfield name="frontKey" placeholder="找服务资源"></s:textfield>
					<s:hidden name="rsid"></s:hidden>
					<div class="s_btn" id="search_all"><i class="iconfont">&#xe60f;</i>搜索</div>
				</s:form>
			</div>
		</div>
	</div>
	<!-- header end -->
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
			<img src="images/2.jpg" width="900" height="227" alt="广告栏" />
		</div>
		<div class="layout_main">
			<div class="m_left">
				<div class="l_header">服务资源展示区</div>
			</div>
			<div class="m_right">
				<div class="r_header">推荐栏</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function() {
			init();
		});
	</script>
</body>
</html>