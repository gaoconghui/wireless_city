<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-用户个人中心</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/front_default_style.css" rel="stylesheet">
		<link rel="shortcut icon" href="favicon.ico"  type="image/x-icon" />
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
					<li><a href="front/buyer.jsp?id=1"  class="sel">个人中心</a></li>
					<li><a href="javascript:void(0)">个人主页</a></li>
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
					<div class="foot">编辑个人资料<i class="iconfont">&#xe614;</i></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- end bottom -->
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function(){
			init();
			initialize();
		});
		function initialize(){
		}
	</script>
</body>
</html>