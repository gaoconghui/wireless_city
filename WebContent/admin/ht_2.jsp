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
		<title>无线城市-后台-资源模板管理</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/ht_default_style.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<div class="tzht">
		<!-- header begin -->
		<%-- <s:include value="ht_header.jsp"></s:include> --%>
		<jsp:include page="ht_header.jsp" />
		<!-- end header -->
		<!-- t_right start -->
		<div class="t_right">
			<!-- r_location start -->
			<div class="r_location" id="location">
				<i></i><span>您当前所在位置：<a href="javascript:void(0)" id="choose">资源模板管理</a></span>
			</div>
			<!-- end r_location -->
			<div class="r_table">
				<div class="r_title">
					<i></i><span>资源模板管理</span>
					<div class="s_input">
						<input class="input" type="text" placeholder="找资源模板" />
						<div class="i_btn">搜索</div>
					</div>
				</div>
				<div class="r_label">
					<div class="l_select">
						<p>
                            <label>一级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_1">
	                            	<option value="">-请选择-</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>二级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_2">
	                            	<option value="">-请选择-</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>三级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_3">
	                            	<option value="">-请选择-</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>四级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_4">
	                            	<option value="">-请选择-</option>
	                            </select>
                            </span>
                        </p>
                        <p>
                            <label>五级类目</label>
                            <span class="field">
	                            <select name="select" class="uniformselect" id="category_5">
	                            	<option value="">-请选择-</option>
	                            </select>
                            </span>
                        </p>
					</div>
					<div class="l_show">
						<div class="s_title"  id="l_show">
							<span>资源名称</span>
							<span class="span">操作</span>
							<span class="span">更新时间</span>
							<span class="span">详情</span>
						</div>
						<!-- script -->
						<div id="show_template_details" class="details">
							
							<div class="s_title" id="module_show">
								<span id="current_module_name">-</span>
								<span class="span">
									<a style="display:none;" class="r_t_a2" href="javascript:void(0)"></a>
								</span>
								<span class="span">-</span>
								<span class="span"><a style="display:none;" class="r_t_a3" href="javascript:void(0)"></a></span>
							</div>
							<div class="s_content">
								<div class="c_desc">
									<span>描述:</span>
									<span class="normal" id="current_module_desc"></span>
								</div>
								<div class="attr_color">
									<p>
										<span></span>
										<span>本属性</span>
									</p>
									<p>
										<span></span>
										<span>上级属性(需在上级模板中修改)</span>
									</p>
									
								</div>
								<div class="c_attribute" id="mod_attribute">
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	<!-- add_resource begin -->
	<div id="yy"></div>
	
	<div class="add_module" id="add_module">
		<div class="a_d_header">增加资源模板</div>
		<div class="a_d_main">
			<p>
				<span>模板名称:</span>
				<input  id="module_name"/>
			</p>
			<p>
				<span>模板描述:</span>
			</p>
			<textarea id="module_desc"></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">下一步</span>
			<span class="close">取消</span>
		</div>
	</div>
	<div class="add_module_attribute" id="add_module_attribute">
		<div class="add_module">
			<div class="a_d_header">资源模板属性</div>
			<div class="a_d_main">
				<p>
					<span>属性名称：</span>
					<input type="text" id="module_attribute_name"/>
				</p>
				<p>
					<span>属性描述：</span>
				</p>
				<textarea id="module_attribute_desc"></textarea>
				<p>
					<span>属性类型：</span>
					<select id="module_attribute_type">
						<option selected="selected" value="1">文本</option>
						<option value="2">小数</option>
						<option value="3">整形</option>
						<option value="4">时间</option>
						<option value="5">枚举</option>
					</select>
				</p>
				<p id="enmu_type"  class="dis_none last_p">
					<span>枚举内容：(注：枚举以英文状态","隔开 如：1,2,3)</span>
					<input type="text" id="module_attribute_content"/>
				</p>
			</div>
			<div class="a_d_footer">
				<span class="back_step span">上一步</span>
				<span class="sure span" >保存</span>
				<span class="close span">取消</span>
				
			</div>
		</div>
		<div class="add_delete">
			<div class="next_btn" id="next_btn"></div>
			<div class="back_btn" id="back_btn"></div>
		</div>
		<div class="attribute_show">
			<div class="s_title s_title1">
				<span>属性名称</span>
				<span>属性描述</span>
				<span>属性类型</span>
				<span>枚举内容</span>
			</div>
			<div class="s_scroll" id="s_scroll">
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!-- begin info -->
	<div class="info">
		<span class="i_icon"></span>
		<span class="i_content"></span>
	</div>
	<!-- end info -->
	<!-- end add_resource -->
	<script type="text/javascript" src="js/tmAjax.js"></script>
	<script type="text/javascript" src="js/ht_2.js"></script>
</body>
</html>