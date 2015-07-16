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
		<h1>选择种类</h1>
		<s:iterator var="c" value="catalogues">
			<a
				href="AddResourceAction_showTemplate?cid=<s:property value="#c.id"/>">
				<s:property value="name" /><br>
			</a>
		</s:iterator>


	</center>
</body>
</html>