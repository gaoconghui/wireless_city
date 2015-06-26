<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>服务商登陆页面</title>
</head>
<body>
	<s:form action="ProviderAction_login">
		<s:actionerror />
		<s:textfield label="登陆账号" name="loginName"></s:textfield>
		<s:textfield label="密码" name="loginPwd"></s:textfield>
		<s:submit></s:submit>
	</s:form>
</body>
</html>