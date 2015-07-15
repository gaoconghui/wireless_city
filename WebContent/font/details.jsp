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
		<title>无线城市-详情页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/front_default_style.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
	</head>
<body>
	<!-- header begin-->
	<s:include value="header.jsp"></s:include>
	<!-- header end-->
	<div class="layout_hd">
		<div class="hd_reference">
			<a href="javascript:void(0)">所有分类</a>
			<a href="javascript:void(0)">&gt;无线政务</a>
			<a href="javascript:void(0)">&gt;二类目</a>
			<a href="javascript:void(0)">&gt;三类目</a>
			<a href="javascript:void(0)">&gt;四类目</a>
			<a href="javascript:void(0)">&gt;具体服务资源</a>
		</div>
		<div class="hd_body">
			<div class="hd_title">
				<div class="t_title">
					<h1>服务资源名称</h1>
					<p>
						<span>发布时间：</span>
						<span>2005-05-29</span>
					</p>
					<p>
						<span>企业名称：</span>
						<span>
							<a href="font/salor_store.jsp?salor_id=1">天喻</a>
						</span>
					</p>
				</div>
				<div class="t_show_box">
					<div class="imgs">
						<div class="img_show">
							<ul>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="300" height="229" />
								</li>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="300" height="229" />
								</li>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="300" height="229" />
								</li>
							</ul>
						</div>
						<div class="img_preview">
							<ul>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="90" height="70" />
								</li>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="90" height="70" />
								</li>
								<li>
									<img alt="服务资源图片" src="images/list_demo.jpg" width="90" height="70" />
								</li>
							</ul>
						</div>
					</div>
					<div class="b_content">
						<div class="desc">服务资源描述:</div>
						<div class="contact">
							<p>
								<span>联系人:</span>
								<span>李小姐（18202728381）</span>
							</p>
						</div>
						<div class="rating">
							<span>评分：</span>
							<span class="icon"></span>
							<span>80分</span>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="hd_details">
				<div class="d_title">
					<a name="attribute" href="javascript:void(0)"></a>
					<ul>
						<li><a href="javascript:void(0)" class="sel" >商品参数</a></li>
						<li><a href="#pic">商品图片</a></li>
					</ul>
				</div>
				<div class="d_attribute">
					<div class="a_center">
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性111：</span>
							<span title="属性值23232322444444444442222222222222222">属性值23232322444444444442222222222222222</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性111：</span>
							<span title="属性值23232322444444444442222222222222222">属性值23232322444444444442222222222222222</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性：</span>
							<span>属性值</span>
						</p>
						<p>
							<span>属性111：</span>
							<span title="属性值23232322444444444442222222222222222">属性值23232322444444444442222222222222222</span>
						</p>
						<div class="clear"></div>
					</div>
				</div>
				<div class="d_title">
					<a name="pic"></a>
					<ul>
						<li><a href="#attribute">商品参数</a></li>
						<li><a href="javascript:void(0)"  class="sel">商品图片</a></li>
					</ul>
				</div>
				<div class="d_pics">
					<img alt="" src="images/list_demo.jpg" width="100"/>
					<img alt="" src="images/list_demo.jpg" width="200"/>
					<img alt="" src="images/list_demo.jpg" width="300"/>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- end bottom -->
	<!-- login_page begin -->
	<s:include value="login_box.jsp"></s:include>
	<!-- login_page end -->
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function(){
			loginBoxShow();
			loginValidator();
			init();
		});
	</script>
</body>
</html>