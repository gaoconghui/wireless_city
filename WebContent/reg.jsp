<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
</head>
<body>
	<center>
		<h1>注册页面</h1>

		<s:include value="header.jsp"></s:include>
		<s:form action="RegAction_doReg"
			method="post">
			<s:fielderror>
				<s:param name="name"></s:param>
			</s:fielderror>
			<s:textfield label="昵称" name="name"></s:textfield>
			<s:fielderror>
				<s:param name="loginPwd"></s:param>
			</s:fielderror>
			<s:textfield label="密码" name="loginPwd"></s:textfield>
			<s:fielderror>
				<s:param name="confirmPassword"></s:param>
			</s:fielderror>
			<s:textfield label="确认密码" name="confirmPassword"></s:textfield>
			<s:fielderror>
				<s:param name="realName"></s:param>
			</s:fielderror>
			<s:textfield label="真实姓名" name="realName"></s:textfield>
			<s:fielderror>
				<s:param name="phoneNumber"></s:param>
			</s:fielderror>
			<s:textfield label="电话号码" name="phoneNumber"></s:textfield>
			<s:fielderror>
				<s:param name="email"></s:param>
			</s:fielderror>
			<s:textfield label="邮箱" name="email"></s:textfield>
			<%-- <s:radio list="#{'1':'用户','0':'提供商'}" name="type" value="1"></s:radio> --%>
			<s:submit></s:submit>
		</s:form>
		<br> <br>
		<hr>
	</center>
</body>
</html>