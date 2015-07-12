<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源列表</title>
</head>
<body>
	<s:debug></s:debug>
	<center>
		<h1>Resource_List</h1>
		<s:iterator var="c" value="page.catalogue.parent.child">
			<s:a
				href="SearchProviderResourceAction_searchResourceBycatalogue?rsid=%{rsid}&catalogueId=%{id}">
				<s:property value="name" />
			</s:a>
		</s:iterator>
		<br> <br>
		<s:iterator value="page.catalogue.child">
			<s:a
				href="SearchProviderResourceAction_searchResourceBycatalogue?rsid=%{rsid}&catalogueId=%{id}">
				<s:property value="name" /> &nbsp;
			</s:a>
		</s:iterator>

		<s:form action="SearchProviderResourceAction_keyWordSearch"
			theme="simple">
			<s:hidden name="rsid"></s:hidden>
			<table>
				<tr>
					<td><s:textfield name="frontKey" /></td>
					<td><s:submit value="全局搜索"></s:submit></td>
				</tr>
			</table>
		</s:form>

		<s:form action="SearchProviderResourceAction_nextKeyWordSearch"
			theme="simple">
			<table>
				<tr>
					<s:hidden name="rsid"></s:hidden>
					<td><s:textfield name="keyWord" /></td>
					<td><s:submit value="内搜索"></s:submit></td>
				</tr>
			</table>
		</s:form>
		<br>
		<table>
			<s:iterator value="page.attrList">
				<tr>
					<td><s:property value="name" />:&nbsp;&nbsp;&nbsp;</td>
					<s:iterator value="enumValue" status="st">
						<td><s:a
								href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
								<s:property value="enumValue[#st.index]" />
							</s:a></td>
					</s:iterator>
				</tr>
			</s:iterator>
		</table>
		<br>
		<s:a
			href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=1">按名字排序</s:a>
		<s:a
			href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=0">按时间排序</s:a>
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<td>id</td>
				<td>resource_name</td>
				<td>catalogue_name</td>
				<td>description</td>
				<td>create_time</td>
			</tr>
			<s:iterator value="page.list" var="resource">
				<tr>
					<td><s:property value="id" /></td>
					<td><s:property value="resource_name" /></td>
					<td><s:property value="catalogue.name" /></td>
					<td><s:property value="description" /></td>
					<td><s:property value="create_time" /></td>
				</tr>
			</s:iterator>
		</table>
		<p>
			共
			<s:property value="page.totalPageNumber" />
			页 当前第
			<s:property value="page.pageNo" />
			页
			<s:a
				href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=1">首页</s:a>
			<s:if test="page.hasPrev">
				<s:a
					href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.prevPage}">上一页</s:a>
			</s:if>
			<s:if test="page.hasNext">
				<s:a
					href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.nextPage}">下一页</s:a>
			</s:if>
			<s:a
				href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}">末页</s:a>
			到<input type="text" name="topage" id="topage" size="3" />页
		</p>

	</center>
</body>
</html>