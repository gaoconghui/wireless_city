<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		//更新模板名字 描述。url地址就是TemplateAction_updateTemplateUseAJAX，参数通过JS从输入的文本框内获取。
		//1是成功 非1是失败
		$(".update").click(function() {
			var url = "TemplateAction_updateTemplateUseAJAX";
			var args = {
				"description" : "你好",
				"templateName" : "你好",
				"id" : "11"
			};
			$.post(url, args, function(data) {
				if (data == "1") {
					alert("修改成功!");
				} else {
					alert("修改失败!");
				}
			});

		});
	})
</script>

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

	<s:hidden name="id"></s:hidden>
	<s:textfield name="templateName"></s:textfield>
	<s:textfield name="description"></s:textfield>
	<a class="update">修改</a>

	<br>
	<center>
		<table>
			<s:iterator value="attributes" var="attr">
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
			</s:iterator>
		</table>
		<br> <br>

		<s:iterator value="attributes" var="attr">
			<table>
				<tr>
					<td>属性名称</td>
					<td><s:textfield name="name"></s:textfield></td>
				</tr>
				<tr>
					<td>属性描述</td>
					<td><s:textfield name="description"></s:textfield></td>
				</tr>
				<tr>
					<td>属性类型</td>
					<td><s:radio
							list="#{'0':'文本型','1':'小数型','2':'整数型','3':'时间型','4':'枚举型'}"
							name="type"></s:radio></td>
				</tr>
				<tr>
					<td>枚举内容</td>
					<td><s:textfield name="value"></s:textfield></td>
				</tr>
			</table>
		</s:iterator>


	</center>
</body>
</html>