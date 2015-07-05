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
		<title>无线城市-搜索页</title>
		<meta name="keywords" content="关键词,关键词">
		<meta name="description" content="">
		<!--css,js-->
		<link type="text/css" href="css/reset.css" rel="stylesheet">
		<style type="text/css">
			/*header beign*/
			::selection {color: #fff;background: #f99750;}
			body{background:#fafafa;cursor:default;color:#444;}
			.title_fixed{width:100%;height:26px;background:#fafafa;}
			.title_fixed .s_right{float:right;width:400px;font-size:12px;line-height:26px;}
			.title_fixed .s_right .r_login,.r_register{width:50px;height:43px;float:right;cursor:pointer;}
			.title_fixed .s_right .r_login,.r_register a{color:#444;}
			.header{width:100%;background:#fff;height:100px;}
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
		
			
			.layout_hd{width:900px;margin:40px auto;background:#fff;border:1px solid #dedede;padding-bottom:10px;}
			.layout_hd .hd_reference{width:860px;height:30px;margin-top:10px;margin-left:20px;line-height:30px;}
			.layout_hd .hd_reference a:hover{text-decoration:underline;}
			.layout_hd .hd_sort{width:860px;margin-left:20px;}
			.layout_hd .hd_sort .s_details{margin-top:20px;}
			.layout_hd .hd_sort .s_details  a{color:#005ea7;padding:0px 5px;}
			.layout_hd .hd_sort .s_details  a:hover{text-decoration:underline;}
			.layout_hd .hd_sort .s_details span a:first-child{font-weight:900;color:#000;}


			.layout_hd .hd_attribute{width:860px;margin-left:20px;margin-top:20px;}
			.layout_hd .hd_attribute p{padding-top:20px;}
			.layout_hd .hd_attribute p:first-child{border-top:1px solid #005ea7;}
			.layout_hd .hd_attribute p span a{color:#005ea7;}
			.layout_hd .hd_attribute p span a:first-child{font-weight:900;color:#000;}
			.layout_hd .hd_search{margin-top:20px;padding-left:20px;}
			.layout_hd .hd_search input{width:300px;height:30px;border:2px solid #b61d1d;border-right:0;line-height:30px;color:#666;padding-left:10px;display:block;float:left;}
			.layout_hd .hd_search .s_btn{width:80px;height:34px;background:#b61d1d;color:#fff;line-height:30px;text-align:center;font-size:16px; border:0;float:left;cursor:pointer;}
			.layout_hd .hd_search .s_btn:hover{background:#c81623;}

			.layout_body{width:900px;margin:40px auto;background:#fff;border:1px solid #dedede;padding-bottom:10px;}
			.layout_body .bd_title{width:900px;height:40px;background:#d1d1d1;}
			.layout_body .bd_title .bd_right{height:40px;float:right;margin-right:30px;line-height:30px;}
			.layout_body .bd_title .bd_right span{width:60px;height:30px;display:block;float:left;margin-top:5px;text-align:center;margin-left:10px;border:1px solid #39393f; }
			.layout_body .bd_title .bd_right span:first-child{background:#39393f;color:#fff;}
			.layout_body .bd_list{width:860px;margin-left:20px;}
			.layout_body .bd_list .l_content{width:860px;height:120px;border-bottom:1px solid #999;padding-top:10px;}
			.layout_body .bd_list .l_content .l_img{width:100px;height:100px; ;float:left;}
			.layout_body .bd_list .l_content .l_details{float:left;width:450px;height:100px;}
			.layout_body .bd_list .l_content .l_details span{width:430px;height:25px;line-height:25px;padding-left:20px;float:left; ;}
			.layout_body .bd_list .l_content .l_visit{float:left;margin-left:200px;margin-top:30px;}
			.layout_body .bd_list .l_content .l_visit a{width:60px;height:40px;background:#0181ec;display:block;line-height:40px;text-align:center;color:#fff;border-radius:3px;-webkit-border-radius:3px;}
			.layout_body .bd_paging{height:40px;margin:0 auto; ;margin-top:10px;width:210px;}
			.layout_body .bd_paging a{color:#0181ec;width:20px;height:20px;display:block;float:left;line-height:20px;border:1px solid #ccc;margin-left:10px;margin-top:10px;border-radius:2px;-webkit-border-radius:2px;}
			.layout_body .bd_paging a.sel{border-color:#b61d1d;background:#b61d1d;color:#fff;font-weight:700;}
			.layout_body .bd_paging .next{width:60px;}
		</style>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/placeholder.js"></script>
		<script type="text/javascript" src="js/tmAjax.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
	</head>
<body>
	<!-- header begin-->
	<%
		String pid=request.getParameter("pid");
		pageContext.setAttribute("parentid",pid );
	%>
	<div id="pid" style="display:none">${parentid }</div>
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
		<div class="hd_reference" id="reference">
			<a href="font/search.jsp?pid=1">所有分类</a>
		</div>
		<div class="hd_sort">
			<div class="s_details" id="s_details">
				<span>
					<a href="javascript:void(0)">全部</a>
					
				</span>
			</div>
		</div>
		<div class="hd_attribute">
			<p>
				<span>属性1:</span>
				<span>
					<a href="javascript:void(0)">全部</a>
					<a href="javascript:void(0)">属性值1</a>
					<a href="javascript:void(0)">属性值2</a>
					<a href="javascript:void(0)">属性值3</a>
					<a href="javascript:void(0)">属性值4</a>
				</span>
			</p>
			<p>
				<span>属性2:</span>
				<span>
					<a href="javascript:void(0)">全部</a>
					<a href="javascript:void(0)">属性值1</a>
					<a href="javascript:void(0)">属性值2</a>
					<a href="javascript:void(0)">属性值3</a>
				</span>
			</p>
		</div>
		<div class="hd_search">
			<input type="text" placeholder="找本类" />
			<div class="s_btn">找本类</div>
			<div id="clear"></div>
		</div>
	</div>
	<div class="layout_body">
		<div class="bd_title">
			<div class="bd_right">
				<span>按时间</span>
				<span>按价格</span>
			</div>
		</div>
		<div class="bd_list">
			<div class="l_content">
				<div class="l_img">
					<img alt="" src="images/list_demo.jpg" height="100" width="100" />
				</div>
				<div class="l_details">
					<span class="d_service">服务名</span>
					<span class="d_desc">服务资源描述</span>
					<span class="d_time">发布时间</span>
					<span class="d_company">服务商名称</span>
				</div>
				<div class="l_visit">
					<a href="javascript:void(0)">查看详情</a>
				</div>
			</div>
			<div class="l_content">
				<div class="l_img">
					<img alt="" src="images/list_demo.jpg" height="100" width="100" />
				</div>
				<div class="l_details">
					<span class="d_service">服务名</span>
					<span class="d_desc">服务资源描述</span>
					<span class="d_time">发布时间</span>
					<span class="d_company">服务商名称</span>
				</div>
				<div class="l_visit">
					<a href="javascript:void(0)">查看详情</a>
				</div>
			</div>
			<div class="l_content">
				<div class="l_img">
					<img alt="" src="images/list_demo.jpg" height="100" width="100" />
				</div>
				<div class="l_details">
					<span class="d_service">服务名</span>
					<span class="d_desc">服务资源描述</span>
					<span class="d_time">发布时间</span>
					<span class="d_company">服务商名称</span>
				</div>
				<div class="l_visit">
					<a href="javascript:void(0)">查看详情</a>
				</div>
			</div>
		</div>
		<div class="bd_paging">
			<a href="javascript:void(0)" class="sel">1</a>
			<a href="javascript:void(0)">2</a>
			<a href="javascript:void(0)">3</a>
			<a href="javascript:void(0)">4</a>
			<a href="javascript:void(0)" class="next">下一页&gt;</a>
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
			//获取传递过来的id值
			var parentid=$("#pid").text();
			//reference
			var length=parentid.length;
			var time=(length-1)/2;
			var html="";
			var id=parentid;
			for(var i=0;i<time;i++){
				var params={id:id};
				//对id操作
				var options={
					async:false,
					url:"CatalogueAction_getCatalogueDetailByAJAX",
					params:params,
					callback:function(data){
						if(data=="[]"){
							
						}else{
							//alert(data);
							var $data=$.parseJSON(data);
							param={id:$data.id,name:$data.name};
							html="&gt;<a href='font/search.jsp?pid="+$data.id+"'>"+$data.name+"</a>"+html;
						}
					}
				};
				findCategory(options);
				var end=length-(i+1)*2;
				id=id.substr(0,end);
				//alert(id);
			} 
			$("#reference").append(html);
			//s_details
			var params={parentid:parentid};
			var options={
				params:params,
				callback:function(data){
					if(data=="[]"){
						$("#s_details").hide();
					}else{
						var $data=$.parseJSON(data);
						var length=$data.length;
						var html="";
						for(var i=0;i<length;i++){
							html+="<a href='font/search.jsp?pid="+$data[i].id+"'>"+$data[i].name+"</a>";
						}
						$("#s_details").append(html);
					}
				}
			};
			
			findCategory(options);
			
			
			//input placeholder 兼容
			$("input[placeholder]").placeholder();
		}
	</script>
</body>
</html>