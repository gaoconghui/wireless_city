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
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<center>
		<s:iterator value="catalogues" var="catalogue">
			<s:a
				href="SearchResourceAction_searchResourceByCatalogue?catalogueId=%{id}">
				<s:property value="name" />
			</s:a>
		</s:iterator>
		<br>
		<br>
		<s:form action="SearchResourceAction_frontFindByKeyWord">
			<table>
				<tr>
					<td><s:textfield name="frontKey"></s:textfield></td>
					<td><s:submit value="搜索"></s:submit></td>
				</tr>
			</table>
		</s:form>
	</center>

</body>
</html>