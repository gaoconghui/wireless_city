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
		<meta charset="utf-8"/>
		<title>无线城市-后台-服务类目管理</title>
		<link href="css/reset.css"  rel="stylesheet" />
		<link href="css/ht_default_style.css"  rel="stylesheet" />
		<link rel="shortcut icon" href="favicon.ico"  type="image/x-icon" />
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
			<div class="r_location" id="location" style="position:fixed;top:56px;left:200px;">
				<i></i>
				<span>您当前所在位置：
					<a href="javascript:void(0)" id="choose" id="location_1">服务类目管理</a>
					<a href="javascript:void(0)" id="location_1"></a>
					<a href="javascript:void(0)" id="location_2"></a>
					<a href="javascript:void(0)" id="location_3"></a>
					<a href="javascript:void(0)" id="location_4"></a>
					<a href="javascript:void(0)" id="location_5"></a>
				</span>
				<div class="r_t_action" id="r_action">
					<span class="r_t_a3 ra" id="details_btn" title="详情"></span>
					<span class="r_t_a4 ra" id="delete_btn" title="删除"></span>
				</div>	
			</div>
			<!-- end r_location -->
			<div class="r_table"  data-index="0" style="margin-top:51px;">
				<div class="r_title"><i></i><span>一类类目</span></div>
				<div class="r_label" id="fir_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="1">
				<div class="r_title"><i></i><span>二类目</span></div>
				<div class="r_label" id="sec_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="2">
				<div class="r_title"><i></i><span>三类目</span></div>
				<div class="r_label" id="thi_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="3">
				<div class="r_title"><i></i><span>四类目</span></div>
				<div class="r_label" id="for_category">
					<ul></ul>
				</div>
			</div>
			<div class="r_table"  data-index="4">
				<div class="r_title"><i></i><span>五类目</span></div>
				<div class="r_label"  id="fif_category">
					<ul></ul>
				</div>
			</div>
		</div>
		<!-- end t_right -->
	</div>
	<!-- dialog beigin -->
	<div id="yy"></div>
	<div id="yp_dialog" class="yp_dialog">
		<p class="dialog_title">确定删除吗？<span class="close iconfont">&#xe603;</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<div class="yp_dialog" id="fill_module" style="width:280px;">
		<p class="dialog_title">现在开始填写相应模板？<span class="close">X</span></p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a>
			<a href="javascript:void(0)" class="close">使用默认模板</a>
		</div>
	</div>
	<!-- end dialog -->
	<!-- add_category begin -->
	<div class="add_category" id="add_category">
		<div class="a_d_header">增加类目</div>
		<div class="a_d_main">
			<p>
				<span>上级：</span>
				<span class="parent_name">无</span></p>
			<p>
				<span>名称：</span>
				<input type="text" id="category_name"/>
			</p>
			<p>
				<span>描述：</span>
			</p>
			<textarea id="category_desc"></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">下一步</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end add_category -->
	<!-- update_module begin -->
	<div class="add_category" id="update_category">
		<div class="a_d_header">修改类目 </div>
		<div class="a_d_main">
			<p>
				<span>名称：</span>
				<input id="update_cate_name"/>
			</p>
			<p>
				<span>描述：</span>
			</p>
			<textarea id="update_cate_desc"></textarea>
		</div>
		<div class="a_d_footer">
			<span class="sure">确定</span>
			<span class="close">取消</span>
		</div>
	</div>
	<!-- end update_module -->
	<!-- add_resource begin -->
	<div class="add_module" id="add_module">
		<div class="a_d_header">增加资源模板</div>
		<div class="a_d_main">
			<p>
				<span>模板名称：</span>
				<input  id="module_name"/>
			</p>
			<p>
				<span>模板描述：</span>
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
	<!-- end add_resource -->
	<!-- begin info -->
	<div class="info">
		<span class="i_icon"></span>
		<span class="i_content"></span>
	</div>
	<!-- end info -->
	<!-- details begin -->
	<div class="add_category" id="details_show">
		<div class="a_d_header">类目详情</div>
		<div class="a_d_main">
			<p>
				<span>id：</span>
				<span class="parent_name input" id="cate_id"></span>
			</p>
			<p>
				<span>名称：</span>
				<span class="input" id="cate_name"></span>
			</p>
			<p>
				<span>描述：</span>
			</p>
			<div class="textarea" id="cate_desc"></div>
			<div class="a_d_footer">
			<span class="sure">更改</span>
			<span class="close">取消</span>
		</div>
		</div>
	</div>
	<!-- end details -->
	<script type="text/javascript" src="js/tmAjax.js"></script>
	<script type="text/javascript" src="js/ht_1.js"></script>
</body>
</html>