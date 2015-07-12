<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源列表页面</title>
</head>
<body>
	<center>
		<s:debug></s:debug>
		<h1>资源列表</h1>
		<s:iterator var="c" value="catalogues">
			<a
				href="SearchProviderResourceAction_searchResourceBycatalogue?catalogueId=<s:property value="id" />">
				<s:property value="name" />
			</a>
		</s:iterator>
		<table>
			<s:form action="SearchProviderResourceAction_keyWordSearch"
				theme="simple">
				<s:hidden name="rsid"></s:hidden>
				<tr>
					<td><s:textfield name="frontKey"></s:textfield></td>
					<td><s:submit value="关键字搜索"></s:submit></td>
				</tr>
			</s:form>
		</table>

		<s:if test="resources!=null&&resources.size()!=0">

			<table>
				<tr>
					<td><a
						href="AddResourceAction_orderByTime?cid=<s:property value="#session.cid"/>">按创建时间排序</a></td>
				</tr>
			</table>
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>资源名称</td>
					<td>资源类目</td>
					<td>创建时间</td>
					<td>修改</td>
					<td>删除</td>
				</tr>
				<s:iterator var="r" value="resources">
					<tr>
						<td><s:property value="#r.resource_name" /></td>
						<td><s:property value="#r.catalogue.name" /></td>
						<td><s:date name="create_time" format="yy-MM-dd" /></td>
						<s:set var="cid" value="r.catalogue.id"></s:set>
						<td><a
							href="AddResourceAction_toUpdateResource?rid=<s:property value="#r.id"/>&cid=<s:property value="#r.catalogue.id"/>">修改</a></td>
						<td><a
							href="AddResourceAction_deleteResource?rid=<s:property value="#r.id"/>&cid=<s:property value="#r.catalogue.id"/>">删除</a></td>
					</tr>
				</s:iterator>
			</table>
		</s:if>
	</center>
	<center></center>

</body>
</html>