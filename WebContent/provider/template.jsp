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
	<center>
		<s:form action="AddResourceAction_addResource" theme="simple">
			<s:hidden name="cid"></s:hidden>
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>资源名称:</td>
					<td><s:textfield name="resource_name"></s:textfield></td>
				</tr>
				<s:iterator var="t" value="template.attributes" status="status">
					<tr>
						<s:set var="type" value="#t.type"></s:set>
						<s:hidden name="resourceAttrs[%{#status.index}].attribute.id"
							value="%{id}"></s:hidden>
						<td><s:property value="name" /></td>
						<td><s:if test="#type==5">
								<%-- <s:radio list="#t.enumValue"
									name="resourceAttrs[%{#status.index}].value"></s:radio> --%>
									<s:iterator value="#t.enumValue" status="st">
										<input type="radio" 
											name='resourceAttrs[<s:property value="#status.index"/>].value'
											value='<s:property value="#st.index" />'
											/>
										<s:property/>
									</s:iterator>
									
									
							</s:if> <s:else>
								<s:textfield name="resourceAttrs[%{#status.index}].value" />
							</s:else></td>
					</tr>
				</s:iterator>
				<tr>
					<td>资源描述	:</td>
					<td><s:textarea name="description"></s:textarea></td>
				</tr>
				<tr>
					<td colspan="2"><s:submit></s:submit></td>
				</tr>
			</table>
		</s:form>
	</center>
</body>
</html>