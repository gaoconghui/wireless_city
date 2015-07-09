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
<title>无线城市-搜索页</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<!--css,js-->
<link type="text/css" href="css/reset.css" rel="stylesheet">
<style type="text/css">
/*header beign*/
::selection {
	color: #fff;
	background: #f99750;
}

form:after {
	content: "";
	display: block;
	clear: both;
}

body {
	background: #fafafa;
	cursor: default;
	color: #444;
}

.title_fixed {
	width: 100%;
	height: 26px;
	background: #fafafa;
}

.title_fixed .s_right {
	float: right;
	width: 400px;
	font-size: 12px;
	line-height: 26px;
}

.title_fixed .s_right .r_login, .r_register {
	width: 50px;
	height: 43px;
	float: right;
	cursor: pointer;
}

.title_fixed .s_right .r_login, .r_register a {
	color: #444;
}

.header {
	width: 100%;
	background: #fff;
	height: 100px;
}

.header .h_fir {
	width: 1200px;
	height: 80px;
	margin: 0px auto;
}

.header .h_fir .f_logo {
	width: 188px;
	height: 50px;
	margin: 10px 100px 0px 25px;
	background: url(images/logo.png) no-repeat;
	float: left;
}

.header .h_fir .f_search {
	width: 600px;
	height: 60px;
	float: left;
}

.header .h_fir .f_search .s_input {
	width: 500px;
	height: 42px;
	margin-top: 8px;
}

.header .h_fir .f_search .s_input input:first-child {
	width: 400px;
	height: 40px;
	border: 2px solid #b61d1d;
	border-right: 0;
	line-height: 40px;
	color: #666;
	padding-left: 10px;
	display: block;
	float: left;
}

.header .h_fir .f_search .s_input .i_btn {
	width: 80px;
	height: 44px;
	background: #b61d1d;
	color: #fff;
	line-height: 40px;
	text-align: center;
	font-size: 16px;
	border: 0;
	float: left;
	cursor: pointer;
}

.header .h_fir .f_search .s_input .i_btn:hover {
	background: #c81623;
}

.header .h_fir .f_contact {
	float: left;
	width: 250px;
	height: 70px;
	line-height: 70px;
}

.header .h_fir .f_contact .c_fir {
	width: 250px;
	height: 70px;
	color: #b61d1d;
	font-size: 18px;
	font-weight: 400;
}

.header .h_fir .f_contact .c_fir .f_icon {
	width: 20px;
	height: 20px;
	background: url(images/wireless_icon.png) no-repeat -24px -1px;
	display: block;
	margin: 25px 5px 0px 5px;
	float: left;
}

.header .h_fir .f_contact .c_fir .f_text {
	float: left;
}
/*header end*/
.layout_hd {
	width: 900px;
	margin: 40px auto;
	background: #fff;
	border: 1px solid #dedede;
	padding: 20px 0;
}

.layout_hd .hd_reference {
	height: 20px;
	width: 860px;
	height: 20px;
	margin-left: 20px;
}

.layout_hd .hd_reference a {
	display: block;
	float: left;
	padding: 2px;
}

.layout_hd .hd_reference a:nth-child(odd):hover {
	text-decoration: underline;
}

.layout_hd .hd_attrref {
	height: 20px;
	border-top: 1px solid #005ea7;
	width: 860px;
	margin-top: 10px;
	padding-top: 20px;
	margin-left: 20px;
}

.layout_hd .hd_attrref:after {
	content: "";
	display: block;
	clear: both;
}

.layout_hd .hd_attrref p {
	float: left;
	border: 1px solid #ccc;
	background: #f1f1f1;
}

.layout_hd .hd_attrref p:first-child {
	border: 0;
	background: #fff;
}

.layout_hd .hd_attrref a {
	padding: 2px;
}

.layout_hd  .icon {
	display: block;
	float: left;
	background: url(images/more_delete.png) no-repeat;
	width: 12px;
	height: 12px;
}

.layout_hd  .delete_icon {
	background-position: -209px -407px;
}

.layout_hd  .more_icon {
	background-position: -124px -408px;
}
/*-226px -410px*/
.layout_hd .hd_attrref p a {
	display: block;
	float: left;
}

.layout_hd .hd_sort {
	width: 860px;
	margin-left: 40px;
}

.layout_hd .hd_sort .s_details {
	margin-top: 10px;
	padding-bottom: 10px;
}

.layout_hd .hd_sort .s_details  a {
	padding: 0px 5px;
}

.layout_hd .hd_sort .s_details  a:hover {
	text-decoration: underline;
}

.layout_hd .hd_sort .s_details span a:first-child {
	font-weight: 700;
	color: #000;
}

.layout_hd .hd_sort .s_details span a:hover {
	text-decoration: none;
}

.layout_hd .hd_attribute {
	width: 860px;
	margin-left: 40px;
}

.layout_hd .hd_attribute p {
	padding-top: 20px;
}

.layout_hd .hd_attribute span:first-child {
	font-weight: 700;
	color: #000;
	padding-right: 10px;
}

.layout_hd .hd_attribute p span a {
	padding-right: 10px;
}

.layout_hd .hd_attribute p span a:hover {
	text-decoration: underline;
}

.layout_hd .hd_search {
	margin-top: 20px;
	padding-left: 20px;
}

.layout_hd .hd_search input {
	width: 300px;
	height: 30px;
	border: 2px solid #b61d1d;
	border-right: 0;
	line-height: 30px;
	color: #666;
	padding-left: 10px;
	display: block;
	float: left;
}

.layout_hd .hd_search .s_btn {
	width: 80px;
	height: 34px;
	background: #b61d1d;
	color: #fff;
	line-height: 30px;
	text-align: center;
	font-size: 16px;
	border: 0;
	float: left;
	cursor: pointer;
}

.layout_hd .hd_search .s_btn:hover {
	background: #c81623;
}

.layout_body {
	width: 900px;
	margin: 40px auto;
	background: #fff;
	border: 1px solid #dedede;
	padding-bottom: 10px;
}

.layout_body .bd_title {
	width: 900px;
	height: 40px;
	background: #d1d1d1;
}

.layout_body .bd_title .bd_left {
	padding: 0px 10px;
	margin-top: 10px;
	float: right;
	line-height: 20px;
}

.layout_body .bd_title .bd_right {
	height: 40px;
	float: right;
	margin-right: 30px;
	line-height: 30px;
}

.layout_body .bd_title .bd_right span {
	display: block;
	float: left;
	margin-top: 5px;
	text-align: center;
	margin-left: 10px;
	border: 1px solid #39393f;
}

.layout_body .bd_title .bd_right span a {
	width: 60px;
	height: 30px;
	display: block;
}

.layout_body .bd_title .bd_right span:first-child a {
	background: #39393f;
	color: #fff;
}

.layout_body .bd_list {
	width: 860px;
	margin-left: 20px;
}

.layout_body .bd_list .l_content {
	width: 860px;
	height: 120px;
	border-bottom: 1px solid #999;
	padding-top: 10px;
}

.layout_body .bd_list .l_content .l_img {
	width: 100px;
	height: 100px;;
	float: left;
}

.layout_body .bd_list .l_content .l_details {
	float: left;
	width: 450px;
	height: 100px;
}

.layout_body .bd_list .l_content .l_details span {
	width: 430px;
	height: 25px;
	line-height: 25px;
	padding-left: 20px;
	float: left;;
}

.layout_body .bd_list .l_content .l_visit {
	float: left;
	margin-left: 200px;
	margin-top: 30px;
}

.layout_body .bd_list .l_content .l_visit a {
	width: 60px;
	height: 40px;
	background: #0181ec;
	display: block;
	line-height: 40px;
	text-align: center;
	color: #fff;
	border-radius: 3px;
	-webkit-border-radius: 3px;
}

.layout_body .bd_paging {
	height: 40px;
	margin: 0 auto;;
	margin-top: 10px;
	width: 400px;
	border: 1px solid red;
}

.layout_body .bd_paging a {
	color: #0181ec;
	padding: 0 8px;
	height: 20px;
	display: block;
	float: left;
	line-height: 20px;
	border: 1px solid #ccc;
	margin-left: 10px;
	margin-top: 10px;
	border-radius: 2px;
	-webkit-border-radius: 2px;
}

.layout_body .bd_paging span {
	color: #0181ec;
	padding: 0 4px;
	height: 20px;
	font-weight: 700;
	display: block;
	float: left;
	line-height: 20px;
	margin-left: 10px;
	margin-top: 10px;
}

.layout_body .bd_paging a.sel {
	border-color: #b61d1d;
	background: #b61d1d;
	color: #fff;
	font-weight: 700;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
<script type="text/javascript" src="js/tmAjax.js"></script>
<script type="text/javascript" src="js/util.js"></script>
</head>
<body>
	<!-- header begin-->
	<%
		String pid = request.getParameter("pid");
		pageContext.setAttribute("parentid", pid);
	%>
	<div id="pid" style="display: none">${parentid }</div>
	<div class="title_fixed">
		<div class="s_right" id="s_right">
			<div class="r_login">登录</div>
			<div class="r_register">
				<a href="wireless_register.html">注册</a>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="h_fir">
			<div class="f_logo"></div>
			<div class="f_search">
				<div class="s_input">
					<s:form action="SearchResourceAction_frontFindByKeyWord" id="s_all">
						<s:textfield name="frontKey" placeholder="找服务资源"></s:textfield>
						<s:hidden name="rsid"></s:hidden>
						<div class="i_btn" id="search_all">搜索</div>
					</s:form>
				</div>
			</div>
			<div class="f_contact">
				<div class="c_fir">
					<span class="f_icon"></span> <span class="f_text">问题咨询：027-01293604</span>
				</div>
			</div>
		</div>
	</div>
	<!-- header end-->
	<div class="layout_hd">
			<s:if test="page.catalogue.parent.id != 1">
			<div class="hd_reference" id="reference">
				<s:a href="javascript:void(0)">全部类目
						</s:a>
				<s:if test="page.catalogue.parent.parent.id != 1">
					<s:if test="page.catalogue.parent.parent.parent.id != 1">
						<s:a cssClass="more_icon icon"
							href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.parent.id}"></s:a>
						<s:a
							href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.parent.id}">
							<s:property value="page.catalogue.parent.parent.parent.name" />
						</s:a>
					</s:if>
					<s:a cssClass="more_icon icon"
						href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.id}"></s:a>
					<s:a
						href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.id}">
						<s:property value="page.catalogue.parent.parent.name" />
					</s:a>
				</s:if>
				<s:a cssClass="more_icon icon"
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.id}"></s:a>
				<s:a
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.id}">
					<s:property value="page.catalogue.parent.name" />
				</s:a>
				<s:a cssClass="more_icon icon"
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.id}"></s:a>
				<s:a
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.id}">
					<s:property value="page.catalogue.name" />
				</s:a>
			</div>
		</s:if>

		<s:if
			test="page.catalogue.child != null && page.catalogue.child.size >0">

			<div class="hd_sort">
				<div class="s_details" id="s_details">
					<span> <a href="javascript:void(0)">子类：</a>
					</span>
					<s:iterator value="page.catalogue.child">
						<s:a
							href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{id}">
							<s:property value="name" />
						</s:a>
					</s:iterator>
				</div>
			</div>
		</s:if>






		<div class="hd_attrref" id="hd_attrref">
			<p>
				<a href="javascript:void(0)">所有属性</a>
			</p>


			<s:iterator value="attrMap">

				<a href="javascript:void(0)" class="more_icon icon"></a>
				<p style="border-color: rgb(204, 204, 204);" class="attr_show">
					<s:a
						href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}">
						<s:property value="value" />
					</s:a>
					<s:a style="background-position: -209px -407px;"
						href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}"
						cssClass="delete_icon icon"></s:a>
				</p>
			</s:iterator>

		</div>
		<div class="hd_attribute" id="hd_attribute">
			<s:iterator value="page.attrList" status="rowst">
				<p>
					<span><s:property value="name" />:</span> <span> <s:iterator
							value="enumValue" status="st">
							<s:a
								href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
								<s:property value="enumValue[#st.index]" />
							</s:a>
						</s:iterator>
					</span>
				</p>
			</s:iterator>

		</div>
		<div class="hd_search">
			<s:form action="SearchResourceAction_inFindByKeyWord" id="s_self">
				<s:textfield name="keyWord" placeholder="找本类"></s:textfield>
				<div class="s_btn" id="search_self">找本类</div>
				<s:hidden name="rsid"></s:hidden>
			</s:form>
		</div>
	</div>
	<div class="layout_body">
		<div class="bd_title">
			<div class="bd_right" id="order_by">
				<span> <s:a
						href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=0">按时间</s:a>
				</span> <span> <s:a
						href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=1">按名称</s:a>
				</span>
			</div>
			<div class="bd_left">
				<label>默认显示条数</label> <select>
					<option>
						<s:a
							href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=10">10</s:a></option>
					<option>
						<s:a
							href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=20">20</s:a></option>
					<option>
						<s:a
							href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=50">50</s:a>
					</option>
				</select>
			</div>
		</div>
		<div class="bd_list">

			<s:iterator value="page.list" var="resource">

				<div class="l_content">
					<div class="l_img">
						<img alt="" src="images/list_demo.jpg" height="100" width="100" />
					</div>
					<div class="l_details">
						<span class="d_service"><s:property value="resource_name" /></span>
						<span class="d_desc"> <s:property value="description" /></span> <span
							class="d_time"><s:property value="create_time" /></span> <span
							class="d_company"><s:property value="id" /></span>
					</div>
					<div class="l_visit">
						<a href="font/details.jsp">查看详情</a>
					</div>
				</div>
			</s:iterator>
		</div>
		<div class="bd_paging" id="paging">
			<s:a href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=1"
				id="first">首页</s:a>
			<s:if test="pageNum -3 >0">
				<span>. . .</span>
			</s:if>
			<s:if test="pageNum-2 >0">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum -2}"
					id="first_page">
					<s:property value="pageNum -2" />
				</s:a>
			</s:if>
			<s:if test="pageNum-1 >0">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum -1}"
					id="second_page">
					<s:property value="pageNum -1" />
				</s:a>
			</s:if>
			<s:a
				href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum}"
				id="third_page" cssClass="sel">
				<s:property value="pageNum" />
			</s:a>
			<s:if test="pageNum+1 <= page.totalPageNumber">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum + 1 }"
					id="forth_page">
					<s:property value="pageNum +1" />
				</s:a>
			</s:if>
			<s:if test="pageNum+2 <= page.totalPageNumber">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum +2}"
					id="last_page">
					<s:property value="pageNum +2" />
				</s:a>
			</s:if>
			<s:if test="pageNum+3 <= page.totalPageNumber">
				<span>. . .</span>
			</s:if>

			<!-- 	<a href="javascript:void(0)" class="sel" id="first_page">1</a> <a
				href="javascript:void(0)" id="second_page">2</a> <a
				href="javascript:void(0)" id="third_page">3</a> <a
				href="javascript:void(0)" id="forth_page">4</a> <a
				href="javascript:void(0)" id="last_page">5</a> -->
			<s:a
				href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}"
				id="last">尾页</s:a>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->

	<script type="text/javascript">
		$(function() {
			init();
			initialize();
		});
		function initialize() {
			//分页
			/* $("#paging").find("a").each(function(){
				//页数
				var $this=$(this);
				var last=100;
				$this.off("click").on("click",function(){
					//$this.data("sel","1");
					
					
					for(var i=0;i<last/5;i++){
						if($this.text()==5*i){
							if($this.text()==last){
								$("#last").hide();
								$this.addClass("sel").siblings().removeClass("sel");
							}else{
								$("#last").show();
								$("#first_page").addClass("sel").siblings().removeClass("sel");
							}
							$("#last_page").text(5*(i+1));
							$("#forth_page").text(5*(i+1)-1);
							$("#third_page").text(5*(i+1)-2);
							$("#second_page").text(5*(i+1)-3);
							$("#first_page").text(5*(i+1)-4);
							
							break;
							
						}else if($this.text()==5*i-4){
							if($this.text()=="1"){
								$("#first").hide();
								$this.addClass("sel").siblings().removeClass("sel");
							}else{
								$("#first").show();
								$("#last_page").addClass("sel").siblings().removeClass("sel");
							}
							$("#last_page").text(5*(i+1));
							$("#forth_page").text(5*(i+1)-1);
							$("#third_page").text(5*(i+1)-2);
							$("#second_page").text(5*(i+1)-3);
							$("#first_page").text(5*(i+1)-4);
							break;
						}else{
							$this.addClass("sel").siblings().removeClass("sel");
						}
					}
				});
			});
			$("#first").off("click").on("click",function(){
				$("#first_page").tigger("click");
			});
			$("#last").off("click").on("click",function(){
				$("#last_page").trigger("click");
			}); */
			//提交搜索表单
			$("#search_all").off("click").click(function() {
				$("#s_all")[0].submit();
			});
			$("#search_self").off("click").click(function() {
				$("#s_self")[0].submit();
			});
			//属性筛选
			$("#hd_attrref").on(
					{
						"mouseenter" : function() {
							$(this).css("border-color", "#f00");
							$(this).find(".delete_icon").css(
									"backgroundPosition", "-226px -407px");
						},
						"mouseleave" : function() {
							$(this).css("border-color", "#ccc");
							$(this).find(".delete_icon").css(
									"backgroundPosition", "-209px -407px");
						},
						"click" : function() {
							var tag = $(this).data("tag");
							$(this).prev().remove();
							$(this).remove();

							$("#hd_attribute").find("a").each(function() {
								if ($(this).data("tag") == tag) {
									$(this).css("color", "#444");
								}
							});
						}
					}, ".attr_show");
			$("#hd_attribute")
					.off("click")
					.on(
							"click",
							"a",
							function() {
								var $this = $(this);
								$this.css({
									"color" : "#005ea7",
									"fontWeight" : "700"
								}).siblings().css("color", "#444");
								var tag = $this.data("tag");
								$("#hd_attrref").find("p").each(function() {
									if ($(this).data("tag") == tag) {
										$(this).prev().remove();
										$(this).remove();

									}
								});
								var html = "	<a href='javascript:void(0)' class='more_icon icon'></a>"
										+ "	<p class='attr_show' data-tag='"+tag+"'>"
										+ "	<a href='javascript:void(0)'>"
										+ $(this).text()
										+ "</a>"
										+ "	<a href='javascript:void(0)' class='delete_icon icon'></a>"
										+ "</p>";
								$("#hd_attrref").append(html);
							});

			//获取传递过来的id值
			var parentid = $("#pid").text();
			//reference
			var length = parentid.length;
			var time = (length - 1) / 2;
			var html = "";
			var id = parentid;
			for (var i = 0; i < time; i++) {
				var params = {
					id : id
				};
				findCategory(options);
				var end = length - (i + 1) * 2;
				id = id.substr(0, end);
				//alert(id);
			}
			$("#reference").append(html);
			//s_details
			var params = {
				parentid : parentid
			};
			var options = {
				params : params,
				callback : function(data) {
					if (data == "[]") {
					} else {
						var $data = $.parseJSON(data);
						var length = $data.length;
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<a href='font/search.jsp?pid="
									+ $data[i].id + "'>" + $data[i].name
									+ "</a>";
						}
						$("#s_details").append(html);
					}
				}
			};

			findCategory(options);

			//排序
			$("#order_by").find("span").click(function() {
				$(this).find("a").css({
					"background" : "#39393f",
					"color" : "#fff"
				});
				$(this).siblings().find("a").css({
					"background" : "#fff",
					"color" : "#444"
				});
			});
			//input placeholder 兼容
			$("input[placeholder]").placeholder();
		}
	</script>
</body>
</html>