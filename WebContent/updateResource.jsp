<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源详情</title>
</head>
<body>
	<center>
		<h1>资源修改</h1>
			<s:form action="AddResourceAction_updateResource">
			   <s:hidden name="id"></s:hidden>
			   <s:hidden name="catalogue.id"></s:hidden>
			   <s:hidden name="provider.id"></s:hidden>
			   <s:hidden name="checkState"></s:hidden>
			   <s:hidden name="create_time"></s:hidden>
				<table>
					<tr>
						<td>资源名称:</td>
						<td><s:textfield name="resource_name" value="%{resource_name}">
						</s:textfield></td>
					</tr>
                    <tr>
                       <td>数量:</td>
                       <td>
                          <s:textfield name="quantity" value="%{quantity}">
                          </s:textfield>
                       </td>
                    </tr>					
					<tr>
					   <td>创建时间:</td>
					   <td>
					       <s:textfield name="create_time" value="%{create_time}" ></s:textfield>
					     <%--  <s:date name="create_time" format="yy-MM-dd HH:mm:ss"/> --%>
					   </td>
					</tr>
					<s:iterator value="attributes" status="st">
						<s:hidden name="resourceAttrs[%{#st.index}].attribute.id"
							value="%{attribute.id}"></s:hidden>
					    <s:hidden name="resourceAttrs[%{#st.index}].id" value="%{id}"></s:hidden>
						<!-- 不显示 -->
						<s:set var="v" value="%{value}"></s:set>
						<s:hidden name="resourceAttrs[%{#st.index}].resource.id" value="%{resource.id}"></s:hidden>
						<tr>
							<td><s:property value="attribute.name" />:</td>
							<td><s:if test="attribute.type!=5">
							        <s:textfield name="resourceAttrs[%{#st.index}].value" value="%{value}"></s:textfield>
								</s:if>
								 <s:elseif test="attribute.type==5&&attribute.enumValue!=null">
									<s:iterator value="attribute.enumValue" status="status">
										<s:set var="i" value="#status.index"></s:set>
										<input type="radio" name='resourceAttrs[<s:property value="#st.index"/>].value'
											<s:if test="#i==#v">checked</s:if>  value='<s:property value="#status.index" />'>
										<s:property />
									</s:iterator>
								</s:elseif></td>
						</tr>
					</s:iterator>
					<tr>
						<td>审核状态:</td>
						<td><s:if test="checkState==0">
                                                       资源已经下架
                     </s:if> <s:elseif test="checkState==1">
                                                       审核通过
                     </s:elseif> <s:elseif test="checkState==2">
                                                        资源正在审核
                     </s:elseif></td>
					</tr>
					<tr>
						<td>资源描述:</td>
						<td><s:textarea name="description"></s:textarea></td>
					</tr>
				</table>
				<s:submit></s:submit>
		</s:form>
	</center>
</body>
</html>