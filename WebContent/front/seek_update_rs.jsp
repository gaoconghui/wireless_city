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
	<title>无线城市-详情页</title>
	<meta name="keywords" content="关键词,关键词">
	<meta name="description" content="">
	<link href="css/reset.css" rel="stylesheet">
	<link href="css/front_default_style.css" rel="stylesheet">
	<link rel="shortcut icon" href="favicon.ico"  type="image/x-icon" />
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/placeholder.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
</head>
<body>
	<% 
		String rsid=request.getParameter("id");
		pageContext.setAttribute("rsid",rsid);
	%>
	<div class="dis_none" id="rs_id">${rsid }</div>
	<s:include value="logined_header.jsp"/>
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
	<div class="rs_wrapper">
		<div class="rs_header">
			<h1 id="title">资源详情</h1>
		</div>
		<div class="container">
			<s:form action="AddResourceAction_updateResource" id="update_rs">
			    <s:hidden name="id"></s:hidden>
			    <s:hidden name="cid" value="%{catalogue.id}"></s:hidden>
			    <s:hidden name="catalogue.id"></s:hidden>
			    <s:hidden name="provider.id"></s:hidden>
			    <s:hidden name="checkState"></s:hidden>
			    <s:hidden name="create_time"></s:hidden>
			    <div class="left_wrapper">
			    	<p class="name">
			    		<span class="key">资源名称</span>
			    		<span class="value" title="<s:property value="%{resource_name}" />"><s:property value="%{resource_name}" /></span>
			    	</p>
			    	<p class="desc">
			    		<span class="key">资源描述</span>
			    		<span class="value"><s:property value="%{description}" /></span>
			    	</p>
			    	<p class="updatetime" id="updatetime">
			    		<span class="key">更新时间</span>
			    		<span>
			    			<s:date name="create_time" format="yyyy-MM-dd HH:mm:ss"/>
			    		</span>
			    	</p>
			    	<p class="state" id="state">
			    		<span class="key">审核状态</span>
			    		<span>
			    			<s:if test="checkState==0">已经下架</s:if> 
			    			<s:elseif test="checkState==1">审核通过</s:elseif> 
			    			<s:elseif test="checkState==2">正在审核</s:elseif>
			    		</span>
			    	</p>
			    </div>
			    <div class="right_wrapper">
			    	<s:iterator value="attributes" status="st">
				    	<s:hidden name="resourceAttrs[%{#st.index}].attribute.id" value="%{attribute.id}"></s:hidden>
						<s:hidden name="resourceAttrs[%{#st.index}].id" value="%{id}"></s:hidden>
						<s:set var="v" value="%{value}"></s:set>
						<s:hidden name="resourceAttrs[%{#st.index}].resource.id" value="%{resource.id}"></s:hidden>
				    	<p class="attr">
				    		<span class="key" title="<s:property value="attribute.name" />"><s:property value="attribute.name" /></span>
			    			<s:if test="attribute.type!=5">
			    				<span class="value" data-type="0" title="<s:property value="%{value}"/>" data-name="<s:property value="%{#st.index}"/>">
			    					<s:property value="%{value}" />
			    				</span>
							</s:if>
							<s:elseif test="attribute.type==5&&attribute.enumValue!=null">
								<span class="value" data-type="1" title="<s:property value="%{value}"/>" data-name="<s:property value="%{#st.index}"/>">
									<s:iterator value="attribute.enumValue" status="status">
										<s:set var="i" value="#status.index"></s:set>
										<s:if test="#i==#v">
											<s:property/>
										</s:if>
										<span class="enum_str" style="display:none;"><s:property /></span>
									</s:iterator>	
								</span>
							</s:elseif>
				    	</p>
				    </s:iterator>
			    </div>
			    <div class="clear"></div>
			</s:form>
		</div>
		<div class="rs_footer">
	    	<div class="edit" id="operation_panel">
	    		<a href="javascript:void(0)"  id="edit">编辑</a>
	    	</div>
	    </div>
	</div>
	<s:include value="bottom.jsp" />
	<script src="js/default_fn.js"></script>
	<script>
		$(function(){
			init();
			edit_rs();
		});
	</script>
</body>
</html>