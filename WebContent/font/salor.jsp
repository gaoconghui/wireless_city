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
<title>无线城市-提供商管理页</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<link href="css/reset.css" rel="stylesheet">
<link href="css/front_default_style.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/placeholder.js"></script>
<script src="js/tmAjax.js"></script>
<script src="js/util.js"></script>
</head>
<body>
	<!-- header begin-->
	<s:include value="logined_header.jsp"></s:include>
	<div class="nav">
		<div class="nav_center">
			<div class="c_logo"></div>
			<div class="c_content">
				<ul>
					<li><a href="font/salor.jsp" class="sel">管理中心</a></li>
					<li><a href="font/salor_store.jsp">企业主页</a></li>
				</ul>
			</div>
			<div class="c_search">
				<s:form action="SearchResourceAction_frontFindByKeyWord" id="s_all">
					<s:textfield name="frontKey" placeholder="找服务资源"></s:textfield>
					<s:hidden name="rsid"></s:hidden>
					<div class="s_btn" id="search_all">
						<i class="iconfont">&#xe60f;</i>搜索
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<!-- header end -->
	<div class="layout_all">
		<div class="wrapper_left">
			<dl>
				<dt>服务中心</dt>
				<dd>服务资源</dd>
				<dt>交易中心</dt>
				<dd>订单</dd>
				<dd>资产</dd>
				<dt>设置</dt>
				<dd>企业信息</dd>
			</dl>
		</div>
		<div class="wrapper_right">
			<div class="r_select">
				<div class="hd_reference" id="reference">
					<a href="font/salor.jsp?pid=1">已有大类</a> <a
						href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
					<s:iterator value="#session.catalogues" var="c">
						<s:a
							href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{id}">
							<s:property value="name" />
						</s:a>
					</s:iterator>
				</div>
				<!-- 类目导航 -->
				<div>
					<s:if test="page.catalogue.parent.id!=1">
						<s:a href="javascript:void(0)">类目导航</s:a>
						<s:if test="page.catalogue.parent.parent.id!=1">
							<s:if test="page.catalogue.parent.parent.parent.id!=1">
								<s:if test="page.catalogue.parent.parent.parent.parent.id!=1">
									<s:a
										href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.parent.parent.id}&rsid=%{rsid}">
										<s:property
											value="page.catalogue.parent.parent.parent.parent.name" />
									</s:a>
								</s:if>
								<s:a
									href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.parent.id}&rsid=%{rsid}">
									<s:property value="page.catalogue.parent.parent.parent.name" />
								</s:a>
							</s:if>
							<s:a
								href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.id}&rsid=%{rsid}">
								<s:property value="page.catalogue.parent.parent.name" />
							</s:a>
						</s:if>
						<s:a
							href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.id}&rsid=%{rsid}">
							<s:property value="page.catalogue.parent.name" />
						</s:a>
						<s:a
							href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.id}&rsid=%{rsid}">
							<s:property value="page.catalogue.name" />
						</s:a>
					</s:if>
				</div>
				<div class="hd_sort">
					<div class="s_details" id="s_details">
						<span> <a href="javascript:void(0)">子类：</a>
						</span>
						<!-- 这里是一类目迭代 -->
						<!-- <a href="font/search.jsp?id=101">无线政务</a> -->
						<s:if
							test="page.catalogue.child!=null&&page.catalogue.child.size()!=0">
							<s:iterator value="page.catalogue.child">
								<s:a
									href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{id}&rsid=%{rsid}">
									<s:property value="name" />
								</s:a>
							</s:iterator>
						</s:if>
						<s:else>
						   该类目下暂时没有子类
						</s:else>
						<!-- 这里是一类目迭代-->
					</div>
				</div>
				<div class="hd_attrref" id="hd_attrref">
					<p>
						<a href="javascript:void(0)">所有属性</a>
					</p>
					<s:iterator value="attrMap">
						<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
						<p style="border-color: rgb(204, 204, 204);" class="attr_show">
							<s:a
								href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}">
								<s:property value="value" />
							</s:a>
							<s:a style="background-position: -209px -407px;"
								href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}"
								cssClass="delete_icon icon iconfont">&#xe613;</s:a>
						</p>
					</s:iterator>
				</div>
				<div class="hd_attribute" id="hd_attribute">
					<p>
						<a href="javascript:void(0)">所有属性</a>
					</p>
					<s:iterator value="page.attrList" status="rowst">
						<p>
							<span><s:property value="name" />:</span> <span> <s:iterator
									value="enumValue" status="st">
									<s:a
										href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
										<s:property value="enumValue[#st.index]" />
									</s:a>
								</s:iterator>
							</span>
						</p>
					</s:iterator>
					<%-- <p>
						<span>属性1:</span> <span> <a href="javascript:void(0)"
							data-tag="0">属性值1</a> <a href="javascript:void(0)" data-tag="0">属性值2</a>
							<a href="javascript:void(0)" data-tag="0">属性值3</a> <a
							href="javascript:void(0)" data-tag="0">属性值4</a>
						</span>
					</p>
					<p>
						<span>属性2:</span> <span> <a href="javascript:void(0)"
							data-tag="1">属性值11</a> <a href="javascript:void(0)" data-tag="1">属性值22</a>
							<a href="javascript:void(0)" data-tag="1">属性值33</a>
						</span>
					</p> --%>
				</div>
			</div>
			<div class="r_list_salor">
				<div class="servic_title">
					<div class="t_left">全部服务</div>
					<div class="t_right">
						<div class="r_search">
							<s:form action="SearchProviderResourceAction_nextKeyWordSearch">
								<s:textfield name="keyWord" id="search_service_form"></s:textfield>
								<s:hidden name="rsid"></s:hidden>
								<div class="s_btn" id="search_service">查询</div>
							</s:form>
						</div>
						<div class="r_add">
							<span class="span_text" id="add_service_btn">增加服务资源</span>
						</div>
					</div>
				</div>
				<div class="content_title">
					<div>图片</div>
					<div>
						名称
						<s:a id="name_sort"
							href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=1"></s:a>
					</div>
					<div>描述</div>
					<div>
						审核状态
						<s:a href="SearchProviderResourceAction_changeState?rsid=%{rsid}"></s:a>
					</div>
					<div>
						时间
						<s:a id="time_sort"
							href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=0"></s:a>
					</div>
					<div>操作</div>
				</div>
				<div id="l_content">
					<s:iterator value="page.list" var="resource">
						<div class="l_content" data-rid="<s:property value="id"/>">
							<!-- ① 
							-->
							<div class="l_img">
								<img alt="" src="images/list_demo.jpg" height="100" width="100" />
							</div>
							<div class="l_name">
								<s:property value="resource_name" />
							</div>
							<div class="l_desc">
								<s:property value="description" />
							</div>
							<div class="l_state">
								<s:if test="checkState==0">
							        该资源已下架
							   </s:if>
								<s:elseif test="checkState==1">
							    该资源审核通过
							   </s:elseif>
								<s:elseif test="checkState==2">
							       该资源正在审核中
							    </s:elseif>
							</div>
							<div class="l_time">
								<s:property value="create_time" />
							</div>
							<div class="l_operation">
								<a href="javascript:void(0)" class="update">修改</a> <a
									href="javascript:void(0)" class="delete">删除</a> <a
									href="javascript:void(0)">查看详情</a>
							</div>
						</div>
					</s:iterator>
				</div>
				<div class="bd_paging" id="paging">
					<div id="center_page">
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=1">首页</s:a>
						<s:if test="pageNum-3>0">
							<span>...</span>
						</s:if>
						<s:if test="pageNum-2>0">
							<s:a
								href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum-2}">
								<s:property value="%{pageNum-2}" />
							</s:a>
						</s:if>
						<s:if test="pageNum-1>0">
							<s:a
								href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum-1}">
								<s:property value="%{pageNum-1}" />
							</s:a>
						</s:if>
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum}">
							<s:property value="%{pageNum}" />
						</s:a>
						<s:if test="pageNum+1<=page.totalPageNumber">
							<s:a
								href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum+1}">
								<s:property value="%{pageNum+1}" />
							</s:a>
						</s:if>
						<s:if test="pageNum+2<=page.totalPageNumber">
							<s:a
								href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum+2}">
								<s:property value="%{pageNum+2}" />
							</s:a>
						</s:if>
						<s:if test="pageNum+3<=page.totalPageNumber">
							<span>...</span>
						</s:if>
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}">
						     尾页
						</s:a>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="yy"></div>
	<div class="add_services" id="add_services">
		<div class="a_s_title">
			增加服务资源
			<div class="t_icon iconfont" id="close_1">&#xe603;</div>
		</div>
		<div class="a_s_1" id="a_s_1">
			<div class="a_s_main">
				<div class="a_s_choose">服务资源类型选择：</div>
				<div class="a_s_sel">
					<div class="s_sort" id="s_sort">
						<div class="s_main">
							<span>一类</span> <select id="category1">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>二类</span> <select id="category2">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>三类</span> <select id="category3">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>四类</span> <select id="category4">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>五类</span> <select id="category5">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<select id="category6" class="dis_none">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="a_s_name">
					<span>名称：</span><input type="text" id="service_name" />
				</div>
				<div class="a_s_pic">
					<div class="p_upload">上传图片</div>
					<div class="p_preview">
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
					</div>
				</div>
				<div class="a_s_desc">
					<div>描述：</div>
					<textarea id="service_desc"></textarea>
				</div>
			</div>
			<div class="next_step" id="next_step">下一步</div>
		</div>
		<div class="a_s_2" id="a_s_2">
			<div class="a_s_main">
				<div class="a_s_choose">属性填写：</div>
				<div class="a_s_attribute">
					<div class="at_fill" id="at_fill">
						<%-- <p>
							<span>属性1:</span><input type="text" placeholder="填写属性"/>
						</p>
						<p>
							<span>属性2:</span><input type="text" placeholder="填写属性"/>
						</p> --%>
					</div>
					<div class="at_fill">
						<div class="at_add_newattribute" id="new_attribute">添加属性</div>
						<div class="at_new" id="at_new"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="pre_step" id="pre_step">上一步</div>
			<div class="next_step" id="submit">提交</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<div id="yp_dialog" class="yp_dialog">
		<p class="dialog_title">
			确定删除吗？<span class="close iconfont">&#xe603;</span>
		</p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a> <a
				href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<script src="js/default_fn.js"></script>
	<script type = "text/javascript" > 
	$(function() {
		init();
		initialize();
	});
	function getChildCategory(idName, nextIdName) {
		$("#" + idName).off("change").on("change",function() {
			var h = "<option value=''>-请选择-</option>";
			var nextId = nextIdName.substr(8, 1);
			$("#category" + nextId).parents(".s_main").show();
			for (var i = nextId; i < 7; i++) {
				$("#category" + i).html(h);
				if (i < 6) {
					$("#category" + (i * 1 + 1)).parents(".s_main").hide();
				}
			}
			var pid = $(this).val();
			if (isEmpty(pid)) {
				return;
			}
			if (nextId != 6) {
				var options = {
					beforeSend: function() {},
					params: {
						parentid: pid
					},
					callback: function(data) {
						if (data == "[]") {} else {
							var $data = $.parseJSON(data);
							var length = $data.length;
							var html = "";
							for (var i = 0; i < length; i++) {
								html += "<option value='" + $data[i].id + "'>" + $data[i].name + "</option>";
							}
							$("#" + nextIdName).append(html);
						}
					}
				};
				findCategory(options);
			}
		});
	}
	function initialize() {
		//页码居中
		var width = $("#paging").width();
		$("#center_page").css("marginLeft", -width / 2);
		//查询服务资源
		$("#search_service").click(function() {
			$("#search_service_form")[0].submit();
		});
		//属性筛选
		$("#hd_attrref").on({
			"mouseenter": function() {
				$(this).css("border-color", "#f00");
				$(this).find(".delete_icon").css("color", "#f00");
			},
			"mouseleave": function() {
				$(this).css("border-color", "#ccc");
				$(this).find(".delete_icon").css("color", "#444");
			},
		},".attr_show");
		/*添加服务按钮*/
		$("#add_service_btn").off("click").on("click",
		function() {
			var height = $("#add_services").height() + 42;
			$("#add_services").css("marginTop", "-" + height / 2 + "px");
			$("#add_services,#yy").show();
			//查询一类目
			var options = {
				params: {parentid: "1"},
				callback: function(data) {
					alert(data);
					if (data == "[]") {} else {
						var $data = $.parseJSON(data);
						var length = $data.length;
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<option value='" + $data[i].id + "'>" + $data[i].name + "</option>";
						}
						$("#category1").append(html);
					}
				}
			};
			findCategory(options);
			//查询2类目
			getChildCategory("category1", "category2");
			//查询3类目
			getChildCategory("category2", "category3");
			//查询4类目
			getChildCategory("category3", "category4");
			//查询5类目
			getChildCategory("category4", "category5");
			//定制block
			getChildCategory("category5", "category6");
			
			$("#close_1").on("click",function() {
				$("#add_services,#yy").hide();
				$("#a_s_2").hide();
				$("#a_s_1").show();
				$("#at_new").html("");
				$("#service_name").val("");
				$("#service_desc").val("");
				$("#category1").html("<option value=''>-请选择-</option>");
				$("#category2").parents(".s_main").hide();
				$("#category3").parents(".s_main").hide();
				$("#category4").parents(".s_main").hide();
				$("#category5").parents(".s_main").hide();
			});
			
			/*下一步 begin*/
			$("#next_step").off("click").on("click",function() {
				var n = -2;
				$("#s_sort").find(".s_main").each(function() {
					if ($(this).css("display") == "block") n++;
				});
				if (n < 0) {
					alert("请选择类目！");
					return false;
				}
				var pid = $("#s_sort").find(".s_main:eq(" + n + ")").find("select").val();
				var param = {tid: pid};
				$.ajax({
					data: param,
					type: "post",
					url: "AttributeAction_getAttributesByAJAX",
					/* 查询服务资源模板属性名称action */
					/* 修改2 */
					success: function(data) {
						var html = "";
						var $data = $.parseJSON(data);
						var length = $data.length;
						for (var i = 0; i < length; i++) {
							var type = "";
							switch ($data[i].type) {
							case 1:
								type = "文本";
								break;
							case 2:
								type = "小数";
								break;
							case 3:
								type = "整形";
								break;
							case 4:
								type = "时间";
								break;
							case 5:
								type = "枚举";
								break;
							default:
								type = "-";
								break;
							}
							if ($data[i].type != 5) {
								html += "<p data-attrid='" + $data[i].id + "'>" + "	<span title='" + $data[i].name + "'>" + $data[i].name + ":</span><input type='text' placeholder='" + type + "'/>" + "</p>";
							} else {
								var args = [];
								args = $data[i].value.split(",");
								var h = "";
								var optionlength = args.length;
								for (var j = 0; j < optionlength; j++) {
									h += "<option value='" + args[j] + "'>" + args[j] + "</option>";
								}
								html += "<p data-attrid='" + $data[i].id + "'>" + "	<span title='" + $data[i].name + "'>" + $data[i].name + ":</span>" + "<select>" + "	<option value='0'>-请选择-</option>" + h + "</select>" + "</p>";
							}
						}
						$("#at_fill").html(html);
					}
				});
				$("#a_s_1").hide();
				$("#a_s_2").show();
				var height = $("#add_services").height() + 42;
				$("#add_services").css("marginTop", "-" + height / 2 + "px");
				$("#pre_step").on("click",
				function() {
					$("#a_s_2").hide();
					$("#a_s_1").show();
					var height = $("#add_services").height() + 42;
					$("#add_services").css("marginTop", "-" + height / 2 + "px");
					$("#at_new").html("");
				});
				$("#submit").off("click").on("click",function() {
					var service_name = $("#service_name").val();
					var service_desc = $("#service_desc").val();
					var param = {
						cid: pid,
						resource_name: service_name,
						description: service_desc
					};
					$("#at_fill").find("p").each(function(index) {
						var value = $(this).find("input").val() || $(this).find("select").val();
						alert(value);
						var id = $(this).data("attrid");
						param["resourceAttrs[" + index + "].value"] = value;
						param["resourceAttrs[" + index + "].attribute.id"] = id;
					});
					$.ajax({
						beforeSend: function() {},
						error: function() {
							alert("非常抱歉,服务器出错！");
						},
						data: param,
						url: "AddResourceAction_addResource",
						type: "post",
						success: function(data) {
							if (data == 0) {} else {
								var html = "<div class='l_content' style='display:none;'>" + "<div class='l_img'>" + "	<img alt='' src='images/list_demo.jpg' height='100' width='100' />" + "</div>" + "<div class='l_name'>" + service_name + "</div>" + "<div class='l_desc'>" + service_desc + "</div>" + "<div class='l_time'>" + new Date().format("yyyy-MM-dd HH:mm:ss") + " (" + getTimeFormat(new Date()) + ")" + "</div>" + "<div class='l_operation'>" + "	<a href='javascript:void(0)' class='update'>修改</a>" + "	<a href='javascript:void(0)' class='delete'>删除</a>" + "	<a href='javascript:void(0)'>查看详情</a>" + "</div>" + "</div>";
								$("#l_content").prepend(html);
								$("#l_content").find(".l_content:first").slideDown("slow");
							}
						}
					});
					$("#add_services,#yy").hide();
					$("#a_s_2").hide();
					$("#a_s_1").show();
					$("#at_new").html("");
					$("#service_name").val("");
					$("#service_desc").val("");
					$("#category1").html("<option value=''>-请选择-</option>");
					$("#category2").parents(".s_main").hide();
					$("#category3").parents(".s_main").hide();
					$("#category4").parents(".s_main").hide();
					$("#category5").parents(".s_main").hide();
				});
				$("#new_attribute").off("click").on("click",
				function() {
					var html = "<p>" + "<input placeholder='属性' type='text'/><input type='text' placeholder='属性值'/>" + "<i class='iconfont dis_none'>&#xe616;</i>" + "</p>";
					$(this).next().append(html);
				});
				$("#at_new").on("click", "i",
				function() {
					$(this).closest("p").fadeOut("slow",
					function() {
						$(this).remove();
					});
				});
				$("#at_new").on({
					"mouseenter": function() {
						$(this).find("i").show();
						$(this).css("background", "#e45050");
					},
					"mouseleave": function() {
						$(this).find("i").hide();
						$(this).css("background", "#fff");
					}
				},"p");
			});
		});
		/*添加服务按钮*/
		/*删除服务按钮*/
		$("#l_content").off("click").on("click", ".delete",
		function() {
			$("#yy").show();
			dialogShow($(this));
		});
		/*删除服务按钮*/
	}
	/*dialog show*/
	function dialogShow(obj) {
		var $dialog = $("#yp_dialog");
		var dW = $dialog.width();
		var dH = $dialog.height();
		var newTop = -dH / 2;
		var newLeft = -dW / 2;
		$dialog.css({
			"marginLeft": newLeft,
			"marginTop": newTop,
			"top": "50%",
			"left": "50%"
		}).show();
		$dialog.find(".close").click(function() {
			$dialog.hide();
			$("#yy").hide();
		});
		$dialog.find(".sure").off("click").on("click",
		function() {
			var deleteid = $(obj).closest(".l_content").data("rid");
			$.ajax({
				data: {
					rid: deleteid
				},
				url: "AddResourceAction_deleteResource",
				type: "post",
				success: function(data) {
					if (data == "1") {
						$(obj).closest(".l_content").slideUp("slow",
						function() {
							$(this).remove();
						});
						$dialog.hide();
						$("#yy").hide();
					} else {
						alert("后台异常！");
					}
	
				}
			});
		});
	}
/*dialog show*/
</script>
</body>
</html>