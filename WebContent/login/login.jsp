<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
</head>
<body>
	<center>
		<s:debug></s:debug>
		<h1>欢迎来到武汉无线城市页面</h1>
		<s:form action="LoginAction_login" method="post">
			<s:textfield name="name" label="用户名"></s:textfield>
			<s:actionerror />
			<s:textfield name="loginPwd" label="密码"></s:textfield>
			<s:radio list="#{'1':'用户','0':'服务商'}" name="type" value="1"></s:radio>
			<s:submit></s:submit>
		</s:form>
	</center>
</body>
</html>