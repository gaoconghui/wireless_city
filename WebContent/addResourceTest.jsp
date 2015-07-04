<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加资源</title>
</head>
<body>
	<center>
		<s:form action="AddResourceAction_showTemplate">
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>一级类目</td>
					<td><select>
							<option>请选择类目一</option>
							<s:iterator var="c1" value="catalogues">
							   <option>
							      <s:property value="name"/>
							   </option>
							</s:iterator>
					</select></td>
				</tr>
			</table>
			<s:submit></s:submit>
		</s:form>
	</center>
	<a
		href="AddResourceAction_showTemplate?cid=<s:property value="#c.id"/>">
		<s:property value="name" /><br>
	</a>
</body>
</html>