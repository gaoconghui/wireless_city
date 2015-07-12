<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/tmAjax.js"></script>
	
  </head>
  
  <body>
  	用户名:<input type="text" id="name"/>
  	密码:<input type="password" id="password"/>
  	<input type="submit" value="登录"/>
    <script type="text/javascript">
    	$(function(){
    		$("input[type=submit]").click(function(){
    			var name=$("#name").val();
        		var password=$("#password").val();
    			console.log(name+password);
    			console.log("登录");
    			$.ajax({
        			type:"post",
        			data:{"name":name,"loginPwd":password},
        			url:"LoginAction_login",
        			success:function(data){
        				alert(data);
        			}
        		});
    		});
    	});
    </script>
  </body>
</html>
