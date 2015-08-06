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
<title>无线城市-提供商管理页</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<link href="css/reset.css" rel="stylesheet">
<link href="css/front_default_style.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
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
					<li><a href="front/salor.jsp" class="sel">管理中心</a></li>
					<li><a href="front/salor_store.jsp">企业主页</a></li>
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
				<div class="allcategory">
					<a href="front/salor.jsp?pid=1" class="fir">已有大类:</a>
					<s:iterator value="#session.catalogues" var="c">
						<s:a
							href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{id}">
							<s:property value="name" />
						</s:a>
					</s:iterator>
				</div>
				<!-- 类目导航 -->
				<div class="hd_reference">
					<s:a href="javascript:void(0)" cssClass="iconfont f14"
						style="line-height:8px;">&#xe617;</s:a>
					<s:if test="page.catalogue.parent.id!=1">
						<s:if test="page.catalogue.parent.parent.id!=1">
							<s:if test="page.catalogue.parent.parent.parent.id!=1">
								<s:if test="page.catalogue.parent.parent.parent.parent.id!=1">
									<s:a
										href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.parent.parent.id}&rsid=%{rsid}">
										<s:property
											value="page.catalogue.parent.parent.parent.parent.name" />
									</s:a>
									<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
								</s:if>
								<s:a
									href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.parent.id}&rsid=%{rsid}">
									<s:property value="page.catalogue.parent.parent.parent.name" />
								</s:a>
								<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
							</s:if>
							<s:a
								href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.parent.id}&rsid=%{rsid}">
								<s:property value="page.catalogue.parent.parent.name" />
							</s:a>
							<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
						</s:if>
						<s:a
							href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.parent.id}&rsid=%{rsid}">
							<s:property value="page.catalogue.parent.name" />
						</s:a>
						<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
					</s:if>
					<s:a
						href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=%{page.catalogue.id}&rsid=%{rsid}">
						<s:property value="page.catalogue.name" />
					</s:a>
				</div>
				<div class="hd_sort">
					<div class="s_details" id="s_details">
						<span> <a href="javascript:void(0)">子类：</a>
						</span>
						<!-- 这里是一类目迭代 -->
						<!-- <a href="front/search.jsp?id=101">无线政务</a> -->
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
						<a href="javascript:void(0)">全部</a>
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
					<s:iterator value="page.attrList" status="rowst">
						<div class="p">
							<span><s:property value="name" />:</span> <span
								class="attr_value"> <s:iterator value="enumValue"
									status="st">
									<s:if test="attrMap.containsKey(id+'_'+#st.index)">
								<s:a cssClass="colorgradient"
									href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
									<s:property value="enumValue[#st.index]" />
								</s:a>
							</s:if>
							<s:else>
								<s:a
									href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
									<s:property value="enumValue[#st.index]" />
								</s:a>
							</s:else>
								</s:iterator>
							</span> <span class="more_attr" data-state="more">更多<i
								class="iconfont">&#xe60b;</i></span>
							<div class="clear"></div>
						</div>
					</s:iterator>
				</div>
				<script>
					$(function() {
						more_less();
					});
				</script>
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
						<select id="changeState">
							<option
								value="SearchProviderResourceAction_changeState?rsid=<s:property value="rsid"/>&state=0"
								<s:if test="state==0">selected</s:if>>所有状态</option>
							<option
								value="SearchProviderResourceAction_changeState?rsid=<s:property value="rsid"/>&state=1"
								<s:if test="state==1">selected</s:if>>已通过</option>
							<option
								value="SearchProviderResourceAction_changeState?rsid=<s:property value="rsid"/>&state=2"
								<s:if test="state==2">selected</s:if>>审核中</option>
							<option
								value="SearchProviderResourceAction_changeState?rsid=<s:property value="rsid"/>&state=3"
								<s:if test="state==3">selected</s:if>>已下架</option>
						</select>
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
						<div class="l_content" data-rid="<s:property value="id"/>"
							data-parentid="<s:property value="catalogue.id"/>">
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
							    该资源审核已通过
							   </s:elseif>
								<s:elseif test="checkState==2">
							       该资源正在审核中
							    </s:elseif>
							</div>
							<div class="l_time">
								<s:date name="create_time" format="yyy-MM-dd HH:mm:ss" />
								<%-- <s:property value="create_time" /> --%>
							</div>
							<div class="l_operation">
								<a href="javascript:void(0)" class="delete">删除</a> <a
									href='AddResourceAction_toUpdateResource?id=<s:property value="id"/>'>查看详情</a>
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
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum}"
							cssClass="sel">
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
						<div class="clear"></div>
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
	<script type="text/javascript">
		$(function() {
			init();
			initialize_salor();
		});
	</script>
</body>
</html>