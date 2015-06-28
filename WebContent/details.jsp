<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>无线城市-详情页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#f1f1f1;cursor:default;color:#444;}
			.title_fixed{width:100%;height:40px;background:#fff;}
			.title_fixed .s_right{float:right;width:400px;font-size:16px;line-height:40px;}
			.title_fixed .s_right .r_login,.r_register{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
			.header{width:100%;background:#fff;border-bottom:2px solid #b61d1d;border-top:2px solid #b61d1d;}
			.header .h_fir{width:1200px;height:80px;margin:0px auto;}
			.header .h_fir .f_logo{width:188px;height:50px;margin:10px 100px 0px 25px; background:url(images/logo.png) no-repeat;float:left;}
			.header .h_fir .f_search{width:600px;height:60px;float:left;}
			.header .h_fir .f_search .s_hot{width:500px;height:20px;line-height:20px;color:#666;}
			.header .h_fir .f_search .s_hot a{margin-left:10px;color:#666;}
			.header .h_fir .f_search .s_hot a:hover{color:#b61d1d;}
			.header .h_fir .f_search .s_input{width:500px;height:42px;margin-top:8px;}
			.header .h_fir .f_search .s_input input:first-child{width:400px;height:40px;border:2px solid #b61d1d;border-right:0;line-height:40px;color:#666;padding-left:10px;display:block;float:left;}
			.header .h_fir .f_search .s_input .i_btn{width:80px;height:44px;background:#b61d1d;color:#fff;line-height:40px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			.header .h_fir .f_search .s_input .i_btn:hover{background:#c81623;}
			.header .h_fir .f_contact{float:left;width:250px;height:70px;line-height:70px; }
			.header .h_fir .f_contact .c_fir{width:250px;height:70px; color:#b61d1d;font-size:18px;font-weight:400;}
			.header .h_fir .f_contact .c_fir .f_icon{width:20px;height:20px;background:url(images/wireless_icon.png) no-repeat -24px -1px; display:block;margin:25px 5px 0px 5px;float:left;}
			.header .h_fir .f_contact .c_fir .f_text{float:left;}
		/*header end*/
		
			
			.layout_hd{width:900px;margin:40px auto;padding-bottom:10px;}
			.layout_hd .hd_reference{height:40px;padding-left:20px;line-height:40px;background:#fff;border:1px solid #dedede;}
			.layout_hd .hd_body{margin-top:10px; }
			.layout_hd .hd_body .hd_title{ background:#fff;border:1px solid #dedede;padding-bottom:20px;}
			.layout_hd .hd_body .hd_title h1{font-weight:500;font-size:20px;height:40px;line-height:40px;padding-left:20px;}
			.layout_hd .hd_body .hd_title .t_title p{margin-top:10px;}
			.layout_hd .hd_body .hd_title .t_title p span{padding-left:20px;}
			.layout_hd .hd_body .hd_title .t_show_box .imgs,.b_content{float:left;} 
			.layout_hd .hd_body .hd_title .t_show_box .imgs{width:300px;height:300px;margin:20px 0 0 20px;border:1px solid #dedede;}
			.layout_hd .hd_body .hd_title .t_show_box .imgs .img_show{height:229px;border-bottom:1px solid #dedede;overflow:hidden;}
			.layout_hd .hd_body .hd_title .t_show_box .imgs .img_show ul li{width:300px;height:229px;}
			.layout_hd .hd_body .hd_title .t_show_box .imgs .img_preview{height:70px;}
			.layout_hd .hd_body .hd_title .t_show_box .imgs .img_preview ul li{width:90px;height:70px;float:left;margin:0 5px;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content{margin:20px 0 0 100px;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .desc{width:400px;height:200px; text-indent:20px;background:#f1f1f1;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .contact p {margin-top:20px;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .contact p span{padding-left:20px;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .rating{width:400px;height:40px;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .rating span{ ;height:40px;padding:0 0 0 20px;line-height:40px;display:block;float:left;}
			.layout_hd .hd_body .hd_title .t_show_box .b_content .rating .icon{background:url(images/rating.jpg) no-repeat -2px -173px;width:170px;}
			.layout_hd .hd_body .hd_details{background:#fff;margin-top:10px;border:1px solid #dedede;}
			.layout_hd .hd_body .hd_details .d_title{height:40px;background:#999;color:#fff;}
			.layout_hd .hd_body .hd_details .d_title ul li{float:left;}
			.layout_hd .hd_body .hd_details .d_title ul li a{color:#fff;font-size:16px;line-height:40px;height:40px;display:block;padding:0 20px;}
			.layout_hd .hd_body .hd_details .d_title ul li a.sel{background:#39393f;}
			.layout_hd .hd_body .hd_details .d_attribute .a_center{margin:20px;}
			.layout_hd .hd_body .hd_details .d_attribute .a_center p{margin-top:20px;float:left;width:280px;overflow:hidden;}
			.layout_hd .hd_body .hd_details .d_attribute .a_center p span:first-child{width:100px;text-align:right;}
			.layout_hd .hd_body .hd_details .d_attribute .a_center p span{display:inline-block;overflow:hidden;word-break:break-all;width:176px;text-overflow:ellipsis;white-space: nowrap}
			.layout_hd .hd_body .hd_details .d_pics img{display:block; }
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
	<div class="header">
		<div class="h_fir">
			<div class="f_logo"></div>
			<div class="f_search">
				<div class="s_input">
					<input type="text" placeholder="找服务资源" />
					<div class="i_btn">搜索</div>
				</div>
				<div id="clear"></div>
				<div class="s_hot">
					<span>热词：</span>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
					<a href="javascript:void(0)">热词</a>
				</div>
			</div>
			<div class="f_contact">
				<div class="c_fir">
					<span class="f_icon"></span>
					<span class="f_text">问题咨询：027-01293604</span>
				</div>
			</div>
		</div>
	</div>
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
						<span>天喻</span>
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
					<div id="clear"></div>
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
						<div id="clear"></div>
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