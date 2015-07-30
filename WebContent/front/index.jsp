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
	<s:if test="root == null">
		<jsp:forward page="CatalogueAction_toIndexPage.action"></jsp:forward>
	</s:if>
	<!-- header begin-->
	<s:include value="header.jsp"></s:include>
	<div class="h_sec">
		<div class="s_wrapper">
			<div class="s_left">
				<ul id="nav_ul">
					<li style="width: 60px; margin-left: 212px;" class="lidemo" data-sel="1">首页</li>
					<li>兼职招聘</li>
					<li>房屋租赁</li>
					<li>美食团购</li>
					<li>电影</li>
					<li>本地生活</li>
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
					<s:iterator value="root.child" status="st1">
						<li data-index='<s:property value="#st1.index"/>'><span
							class="i_icon iconfont">&#xe618;</span> <span class="i_desc">
								<s:a
									href="SearchResourceAction_searchResourceByCatalogue?catalogueId=%{id}">
									<s:property value="name" />
								</s:a>
						</span> <span class="i_more iconfont">&#xe614;</span></li>
					</s:iterator>
					<!-- 一类目迭代结束 -->
				</ul>
			</div>
			<ul class="left_content" id="left_content">
				<!-- 第一层类目迭代 -->
				<s:iterator value="root.child">
					<li>
						<!-- 第二层类目迭代 --> <s:iterator value="child">
							<div class='c_list'>
								<div class='l_second_item'>
									<span class='span1'> <s:a
											href="SearchResourceAction_searchResourceByCatalogue?catalogueId=%{id}">
											<s:property value="name" />
										</s:a>
									</span> <span class="span2 iconfont">&#xe614;</span>
								</div>
								<div class="l_third_item">
									<!-- 第三层类目迭代 -->
									<s:iterator value="child">
										<s:a
											href="SearchResourceAction_searchResourceByCatalogue?catalogueId=%{id}">
											<s:property value="name" />
										</s:a>
									</s:iterator>
								</div>
							</div>
						</s:iterator>
					</li>
				</s:iterator>
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