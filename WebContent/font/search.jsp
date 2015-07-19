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
<link href="css/reset.css" rel="stylesheet">
<link href="css/front_default_style.css" rel="stylesheet">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/placeholder.js"></script>
</head>
<body>
	<!-- header begin-->
	<s:include value="header.jsp"></s:include>
	<!-- header end-->
	<div class="layout_hd">
		<s:if test="page.catalogue.parent.id != 1">
			<div class="hd_reference" id="reference">
				<s:a href="javascript:void(0)">全部类目</s:a>
				<s:if test="page.catalogue.parent.parent.id != 1">
					<s:if test="page.catalogue.parent.parent.parent.id != 1">
						<s:a cssClass="more_icon icon iconfont"
							href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.parent.id}">&#xe615;</s:a>
						<s:a
							href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.parent.id}">
							<s:property value="page.catalogue.parent.parent.parent.name" />
						</s:a>
					</s:if>
					<s:a cssClass="more_icon icon iconfont"
						href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.id}">&#xe615;</s:a>
					<s:a
						href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.parent.id}">
						<s:property value="page.catalogue.parent.parent.name" />
					</s:a>
				</s:if>
				<s:a cssClass="more_icon icon iconfont"
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.id}">&#xe615;</s:a>
				<s:a
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.parent.id}">
					<s:property value="page.catalogue.parent.name" />
				</s:a>
				<s:a cssClass="more_icon icon iconfont"
					href="SearchResourceAction_searchResourceByCatalogue?rsid=%{rsid}&catalogueId=%{page.catalogue.id}">&#xe615;</s:a>
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
				<a href="javascript:void(0)" class="more_icon icon iconfont">&#xe615;</a>
				<p style="border-color: rgb(204, 204, 204);" class="attr_show">
					<s:a
						href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}">
						<s:property value="value" />
					</s:a>
					<s:a style="background-position: -209px -407px;"
						href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}"
						cssClass="delete_icon icon iconfont">&#xe613;</s:a>
				</p>
			</s:iterator>
		</div>
		<div class="hd_attribute" id="hd_attribute">
			<s:iterator value="page.attrList" status="rowst">
				<!-- TODO 颜色class="colorgradient" -->
				<p>
					<span><s:property value="name" />:</span> <span> <s:iterator
							value="enumValue" status="st">
							<s:if test="attrMap.containsKey(id+'_'+#st.index)">
								<s:a cssClass="colorgradient"
									href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
									<s:property value="enumValue[#st.index]" />
								</s:a>
							</s:if>
							<s:else>
								<s:a
									href="SearchResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
									<s:property value="enumValue[#st.index]" />
								</s:a>
							</s:else>
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
				<span> <s:if test="orderName == 0">
						<s:a cssClass="sort_1"
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=0">
					 按时间<i class="iconfont"> <s:if test="orderSequence == 0">&#xe600;</s:if>
								<s:if test="orderSequence == 1">&#xe601;</s:if>
							</i>
						</s:a>
					</s:if> <s:else>
						<s:a cssClass="sort_0"
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=0">
					 按时间
						</s:a>
					</s:else>
				</span> <span> <s:if test="orderName == 1">
						<s:a cssClass="sort_1"
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=1">
					按名称<i class="iconfont"> <s:if test="orderSequence == 0">&#xe600;</s:if>
								<s:if test="orderSequence == 1">&#xe601;</s:if>
							</i>
						</s:a>
					</s:if>
					<s:else>
						<s:a cssClass="sort_0"
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=1">
					按名称
					</s:a>
					</s:else>
				</span>
			</div>
			<div class="bd_left" id="bd_left">
				<label>默认显示条数</label> <select>
					<option
						value="SearchResourceAction_changePageSize?rsid=<s:property value="rsid"/>&pageSize=10">
						10</option>
					<option
						value="SearchResourceAction_changePageSize?rsid=<s:property value="rsid"/>&pageSize=20">
						20</option>
					<option
						value="SearchResourceAction_changePageSize?rsid=<s:property value="rsid"/>&pageSize=50">
						50</option>
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
			<div id="center_page">
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
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}"
					id="last">尾页</s:a>
			</div>
		</div>
	</div>
	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->
	<!-- login_box begin -->
	<s:include value="login_box.jsp"></s:include>
	<!-- end login_box -->
	<script src="js/default_fn.js"></script>
	<script type="text/javascript">
		$(function() {
			loginBoxShow();
			loginValidator();
			init();
			searchInitialize();
		});
	</script>
</body>
</html>