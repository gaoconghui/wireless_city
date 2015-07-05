<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid;
	border-collapse: collapse;
	text-align: center;
}

td {
	height: 25px;
}
</style>
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<center>
		<s:debug></s:debug>
		<s:form action="SearchResourceAction_inFindByKeyWord">
			<table>
				<tr>
					<s:hidden name="rsid"></s:hidden>
					<td><s:textfield name="keyWord"></s:textfield></td>
					<td><s:submit value="内搜索"></s:submit></td>
				</tr>
				<tr>
					<td><s:a
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=0">创建时间排序</s:a></td>
					<td><s:a
							href="SearchResourceAction_changeOrder?rsid=%{rsid}&orderName=1">名字排序</s:a></td>
				</tr>
			</table>
		</s:form>

		<br> 
			<s:a href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=10">10</s:a>
			<s:a href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=20">20</s:a>
			<s:a href="SearchResourceAction_changePageSize?rsid=%{rsid}&pageSize=50">50</s:a>
		<br> <br>
		<table>
			<tr>
				<td>id</td>
				<td>resource_name</td>
				<td>description</td>
				<td>create_time</td>
			</tr>
			<s:iterator value="page.list" var="resource">
				<tr>
					<td><s:property value="id" /></td>
					<td><s:property value="resource_name" /></td>
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
			<s:a href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=1">首页</s:a>
			<s:if test="page.hasPrev">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.prevPage}">上一页</s:a>
			</s:if>
			<s:if test="page.hasNext">
				<s:a
					href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.nextPage}">下一页</s:a>
			</s:if>
			<s:a
				href="SearchResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}">末页</s:a>
			到<input type="text" name="topage" id="topage" size="3" />页
		</p>

	</center>

</body>
</html>