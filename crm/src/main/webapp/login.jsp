<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+": "+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>

<script type="text/javascript">
	function refreshcode(img){
	   img.src='validatecode.jsp?t='+new Date().getTime();
	}
  
  	layui.use(['layer', 'form'], function() {
  		if("${param.isfail }" == "unknown") {
		layui.layer.msg("用户名不存在", {icon: 5});
		}
		else if("${param.isfail }" == "error") {
			layui.layer.msg("密码不正确", {icon: 5});
		}
		else if("${param.isfail }" == "code") {
			layui.layer.msg("验证码错误", {icon: 5});
		}
		else if("${param.isfail }" == "other") {
			layui.layer.msg("未知错误", {icon: 5});
		}
  	});
	
 </script>

</head>
<body>
<div id="wrapper" class="login-page">
<div id="login_form" class="form">

<form  action="loginController/login.do" method="post">
 <h2>管理登录</h2>
<%-- <select>
	<c:forEach items="${ }">
	
	</c:forEach>
	<option></option>
</select> --%>
<input type="text" placeholder="用户名" name="uname" value="" id="user_name">
<input type="password" placeholder="密码" name="upassword" value="" id="password" />
<input type="text" placeholder="验证码" name="randomcode" id="randomcode" size="8" style="width: 50%;float: left;">
<img src="validatecode.jsp" id="imgcode" width="40%" height="50px"
     onclick="refreshcode(this)" title="点击刷新">
<button type="submit" id="login">登　录</button>
</form>
</div>
</div>

<script type="text/javascript">
 	/* function check_login()
  	{
  	 var name=$("#user_name").val();
  	 var pass=$("#password").val();
  	 if(name=="admin" && pass=="admin")
  	 {
  	  alert("登录成功");
  	  $("#user_name").val("");
  	  $("#password").val("");
         $(location).attr('href', 'index.html');
  	 }
  	 else
  	 {
  	  $("#login_form").removeClass('shake_effect');  
  	  setTimeout(function()
  	  {
  	   $("#login_form").addClass('shake_effect')
  	  },1);  
  	 }
  	} */
  	/* function check_register(){
  		var name = $("#r_user_name").val();
  		var pass = $("#r_password").val();
  		var email = $("r_email").val();
  		if(name!="" && pass=="" && email != "")
  		 {
  		  alert("注册成功！");
  		  $("#user_name").val("");
  		  $("#password").val("");
  		 }
  		 else
  		 {
  		  $("#login_form").removeClass('shake_effect');  
  		  setTimeout(function()
  		  {
  		   $("#login_form").addClass('shake_effect')
  		  },1);  
  		 }
  	} */
  	$(function(){
  		$("#create").click(function(){
  			check_register();
  			return false;
  		})
  		$("#login").click(function(){
  			check_login();
  			return false;
  		})
  		$('.message a').click(function () {
  		    $('form').animate({
  		        height: 'toggle',
  		        opacity: 'toggle'
  		    }, 'slow');
  		});
  	})
  	
  	 
      
</script>
</body>
</html>