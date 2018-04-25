<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>lock.jsp</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${pageContext.request.contextPath}/media/css/lock.css"
	rel="stylesheet" type="text/css" />
<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
<!-- END PAGE LEVEL STYLES -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	//异步解锁屏幕	
	$(function() {
		$("#btn1")
				.click(
						function() {
							var pwds = $('#pwd').val().trim();
							if (pwds != "") {
								
								//* /2.准备发送的异步请求
								var url = "${pageContext.request.contextPath}/view/user/lockuser.action?pwd="
										+ pwds;
								//jquery实现  post   Ajax请求
								$.post(url, function(data) {
									if (data == "1") {
										window.history.back();
										return false;
									}
									if (data == "2") {
										swal("解锁失败!", "密码错误！", "error");
										$(this).focus();//获取文本框的焦点
									}
								}, "json");// 替代  eval() 
							} else {
								swal("解锁失败!", "密码不能为空！", "error");
								$('#pwd').focus();//获取文本框的焦点
							}
						});
	});
</script>

<%-- <script>
	jQuery(document).ready(function() {
		/* App.init();
		Lock.init(); */
		$("#btn-submit1").click(function() {
			var pwds = $('#pwd').val().trim();
			var password = $(":input[name='password']").val();
			if (pwds == password) {
				window.history.back();
				return false;
			} else {
			swal("解锁失败!", "密码错误！", "error");
			}
		});
	});
</script> --%>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
	<div class="page-lock">
		<div class="page-logo">
			<a class="brand" href="index.jsp"> <img
				src="${pageContext.request.contextPath}/media/image/logo-big.png"
				alt="logo" /> </a>
		</div>
		<div class="page-body">
			<img class="page-lock-img"
				src="${pageContext.request.contextPath}/${user.emp.empPhotoUrl}"
				alt="">
			<div class="page-lock-info">
				<h1><font  color="#ooBFF">${user.userName}</font></h1>
				<span><font color="red">${user.userEmail}</font> </span> <span><em>锁屏中(或者是屏幕保护)</em>
					<input type="hidden" name="password" value="${user.userPassword}">
				</span>
					<div class="input-append">
						<input type="password" id="pwd" class="m-wrap" placeholder="请输入密码">
						<button id="btn1" class="btn blue icn-only">
							<i class="m-icon-swapright m-icon-white"></i>
						</button>
					</div>
					<div class="relogin">
						<a href="${pageContext.request.contextPath}/view/user/quitUser.action"><font color="#4d90fe">点击这里重新登陆！</font> </a>
					</div>
			</div>
		</div>
		<div class="page-footer">2010-2017 &copy; Party - OA软件办公管理系统</div>
	</div>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<%-- <script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/lock.js"></script> --%>

	<!-- END JAVASCRIPTS -->
</body>
<!--END BODY -->
</html>