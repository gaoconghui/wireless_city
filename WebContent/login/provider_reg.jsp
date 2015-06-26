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
	
	<s:form action="ProviderAction_reg">
		<s:fielderror>
			<s:param name="name"></s:param>
		</s:fielderror>
		<s:textfield label="服务商名称" name="name"></s:textfield>
		<s:fielderror>
			<s:param name="loginName"></s:param>
		</s:fielderror>
		<s:textfield label="登陆账号" name="loginName"></s:textfield>
		<s:fielderror>
			<s:param name="loginPwd"></s:param>
		</s:fielderror>
		<s:textfield label="密码" name="loginPwd"></s:textfield>
		<s:fielderror>
			<s:param name="confirmPwd"></s:param>
		</s:fielderror>
		<s:textfield label="确认密码" name="confirmPwd"></s:textfield>
		<s:fielderror>
			<s:param name="enail"></s:param>
		</s:fielderror>
		<s:textfield label="邮箱" name="enail"></s:textfield>
		<s:fielderror>
			<s:param name="telephone"></s:param>
		</s:fielderror>
		<s:textfield label="联系电话" name="telephone"></s:textfield>
		<s:submit></s:submit>
	</s:form>
</body>
</html>