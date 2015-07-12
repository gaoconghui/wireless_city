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
		<meta charset="utf-8">
		<title>无线城市-后台-服务资源管理</title>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/ht_default_style.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<div class="tzht">
		<!-- header begin -->
		<s:include value="ht_header.jsp"></s:include>
		<!-- end header -->
		<!-- t_right start -->
		<div class="t_right">
			<!-- r_location start -->
			<div class="r_location" id="location">
				<i></i><span>您当前所在位置：<a href="javascript:void(0)" id="choose">服务资源管理</a></span>	
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title">
					<i></i><span class="span">服务资源管理</span>
					<div class="r_t_action">
						<span class="r_t_a2 ra" title="通过" id="submit_btn"></span>
						<span class="r_t_a3 ra" title="下架" id="offsheet_btn"></span>
						<span class="r_t_a4 ra" title="删除" id="delete_btn"></span>
					</div>	
				</div>
				<div class="r_label">
					<div class="l_label">
						<div class="l_form" id="l_form">
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" style="background:none;"></a>
								</span>
								<span class="span">服务资源</span>
								<span class="span">所属模板/类目</span>
								<span class="span">操作</span>
								<span class="span">审核</span>
								<span class="span">请求时间</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									已通过
								</span>
								<span>
									2天前						
								</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									通知修改中
								</span>
								<span>
									2天前						
								</span>
							</div>
							<div class="l_tr">
								<span class="first_span">
									<a href="javascript:void(0)" class="choose"></a>
								</span>
								<span>巴宝莉香水</span>
								<span>香水模板</span>
								<span>
									<a href="javascript:void(0)" class="ra detail" title="详情"></a>	
									<a href="javascript:void(0)" class="ra info" title="通知修改"></a>
									<a href="javascript:void(0)" class="ra submit" title="通过"></a>
									<a href="javascript:void(0)" class="ra offsheet" title="下架"></a>
									<a href="javascript:void(0)" class="ra delete" title="删除"></a>
								</span>
								<span>
									已下架
								</span>
								<span>
									2天前						
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="paging">
					<a href="javascript:void(0)" class="sel">1</a>
					<a href="javascript:void(0)">2</a>
					<a href="javascript:void(0)">3</a>
					<a href="javascript:void(0)">4</a>
					<a href="javascript:void(0)" class="next">下一页&gt;</a>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	
	<!-- dailog begin  -->
	<div id="yp_dialog" class="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<!-- end dialog  -->
	<script type="text/javascript" src="js/ht_4.js"></script>
</body>
</html>