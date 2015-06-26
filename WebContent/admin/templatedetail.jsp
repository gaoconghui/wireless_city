<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="operatortop.jsp"></jsp:include>

	<center>

		<h1>template detail</h1>
		<br>
		<s:property value="id" />
		<br>
		<h3>
			<s:property value="templateName" />
			(
			<s:property value="catalogue.id" />
			<s:property value="catalogue.name" />
			)
		</h3>
		<p>
			<s:property value="description" />
		</p>
	</center>
	<br>
	<s:form action="TemplateAction_updateTemplateUseAJAX">
		<s:hidden name="id"></s:hidden>
		<s:textfield name="templateName"></s:textfield>
		<s:textfield name="description"></s:textfield>
		<s:submit></s:submit>
	</s:form>
	<br>
	<center>
		<table>
			<s:iterator value="attributes" var="attr"></s:iterator>
			<tr>
				<td><s:property value="name" />:</td>
				<td><s:property value="description" /></td>
			</tr>
			<tr>
				<td>类型：</td>
				<td><s:if test="type == 1">文本型</s:if> <s:if test="type == 2">小数型</s:if>
					<s:if test="type == 3">整形型</s:if> <s:if test="type == 4">时间型</s:if>
					<s:if test="type == 5">枚举型</s:if></td>
			</tr>
		</table>
		<br> <br>

	</center>
</body>
</html>