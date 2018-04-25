<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统通知</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles1.css" />
<!-- <script src="js/script.js"></script> -->
<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>

<!-- 结束 -->

<style type="text/css">
#succe {
	border: 3px solid #5e5e5e;
	width: 250px;
	margin: auto;
	border-radius: 4px;
	text-decoration: none;
}
</style>
<script>
	$(function() {
		//注册成功
		var findUser = "";
		findUser = $(":input[name='findUser']").val();
		if (findUser != null && findUser != "") {
			swal(
					{

						title : "注册成功!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">前去邮箱激活即可登录！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}
		//激活失败
		var findUser1 = "";
		findUser1 = $(":input[name='findUser1']").val();
		if (findUser1 != null && findUser1 != "") {
			swal(
					{
						title : "激活失败!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">激活码错误！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}
		//激活成功
		var findUser2 = "";
		findUser2 = $(":input[name='findUser2']").val();
		if (findUser2 != null && findUser2 != "") {
			swal(
					{
						title : "激活成功!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">前去首页登录！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}
		//密码重置
		var findUser3 = "";
		findUser3 = $(":input[name='findUser3']").val();
		if (findUser3 != null && findUser3 != "") {
			swal(
					{

						title : "邮件发送成功!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">前去邮箱修改！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}
		//邮箱不存在
		var findUser4 = "";
		findUser4 = $(":input[name='findUser4']").val();
		if (findUser4 != null && findUser4 != "") {
			swal(
					{

						title : "邮箱不存在!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">请输入正确的邮箱！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}

		//邮箱不存在
		var findUser5 = "";
		findUser5 = $(":input[name='findUser5']").val();
		if (findUser5 != null && findUser5 != "") {
			swal(
					{

						title : "成功!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">密码重置成功！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}

		//验证码错误
		var messages = "";
		messages = $(":input[name='findUser6']").val();
		if (messages != null && messages != "") {
			swal(
					{
						title : "登录失败！",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">验证码错误！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});
		}
		//用户名或密码错误
		var result = "";
		result = $(":input[name='findUser7']").val();
		if (result != null && result != "") {
			swal(
					{

						title : "登录失败！",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">用户名或密码错误！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});

		}

		//账号未激活
		var result1 = "";
		result1 = $(":input[name='findUser8']").val();
		if (result1 != null && result1 != "") {
			swal(
					{

						title : "登录失败！",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">用户未激活！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/login.jsp";
					});

		}

	});
</script>

</head>


<body>
	<input type="hidden" name="findUser" value="${result0}" />
	<input type="hidden" name="findUser1" value="${result1}" />
	<input type="hidden" name="findUser2" value="${result2}" />
	<input type="hidden" name="findUser3" value="${result3}" />
	<input type="hidden" name="findUser4" value="${findUser}" />
	<input type="hidden" name="findUser5" value="${result4}" />
	<input type="hidden" name="findUser6" value="${result5}" />
	<input type="hidden" name="findUser7" value="${message}" />
	<input type="hidden" name="findUser8" value="${result6}" />
	<p>&nbsp;</p>
	<h1 style="text-align:center;">OA软件办公管理系统</h1>
	<h2 style="text-align:center;">We couldn't find what you were
		looking for.</h2>
	<h2 style="text-align:center;">
		<a id="succe" href="${pageContext.request.contextPath}/login.jsp"><font
			style="color: highlight; font-weight: 900;font-size: larger;">首页</font>
		</a>
	</h2>
	<div id="rocket">&nbsp;</div>
	<p>&nbsp;</p>
	<p>
		<hgroup></hgroup>
	</p>

	<p>
		<!-- Internet Explorer HTML5 enabling script: -->
		<!--[if IE]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

	</p>
	<p>&nbsp;</p>

</body>
</html>