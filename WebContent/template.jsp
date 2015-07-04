<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源对应模板</title>
</head>
<body>
	<s:debug></s:debug>
	<center>
		<s:form action="AddResourceAction_addResource" theme="simple">
			<table border="1" cellpadding="10" cellspacing="0">
				<s:iterator var="t" value="template.attributes">
					<tr>
						<td><s:property value="name" /></td>
						<td><s:textfield name="value" /></td>
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