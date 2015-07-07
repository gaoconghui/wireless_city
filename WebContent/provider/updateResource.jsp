<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改服务资源</title>
</head>
<body>
	<center>
		<s:debug></s:debug>
		<h1>
			<s:property value="resource_name" />
		</h1>
		<s:form action="AddResourceAction_updateResource" theme="simple">
			<s:hidden name="cid"></s:hidden>
			<s:hidden name="id"></s:hidden>
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>资源名称:</td>
					<td><s:textfield name="resource_name"></s:textfield></td>
				</tr>
				<tr>
					<td>资源简介:</td>
					<td><s:textfield name="description"></s:textfield></td>
				</tr>
				<tr>
				   <td></td>
				   <td></td>
				</tr>
				<s:iterator var="ra" value="attributes">
					<tr>
						<td><s:property value="#ra.attribute.name" /></td>
						<td><s:textfield name="#ra.value"></s:textfield></td>
					</tr>
				</s:iterator>
				<tr>
					<td colspan="2"><s:submit></s:submit></td>
				</tr>
			</table>
		</s:form>
	</center>
</body>
</html>