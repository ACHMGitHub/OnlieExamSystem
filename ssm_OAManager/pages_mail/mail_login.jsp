<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮箱授权登录</title>
<link
	href="${pageContext.request.contextPath}/pages_mail/css/bootstrap.min.css"
	title="" rel="stylesheet" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />
<link title="orange"
	href="${pageContext.request.contextPath}/pages_mail/css/login.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
<style type="text/css">
button {
	background: rgba(247, 247, 247, 0.15);
	box-shadow: 0px 0px 50px 0px #007aff;
	width: 120px;
	height: 40px; font-size : 40px;
	background: #0075f9;
	color: #fff;
	border: none;
	padding: 10px;
	border-radius: 65px;
	cursor: pointer;
	outline: none;
	font-size: 50px;
}

span{
	margin-left: 4%;
}

button:hover {
	box-shadow: 0px 0px 1px 1px #007aff;
}
</style>

</head>
<script type="text/javascript">
	$(function() {
		var cuo = "";
		cuo = $("#cuo").val();
		if (cuo != null && cuo != "") {
			swal("OMG!", "邮箱认证失败！", "error");
		}
		//注册成功
		var result = "";
		result = $(":input[name='result']").val();
		if (result != null && result != "") {
			swal(
					{

						title : "OMG失败!",
						text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">您没有登录邮箱！</span><br/>',
						imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
						html : true,
						timer : 5000,
						showConfirmButton : false
					},
					function() {
						window.location.href = "${pageContext.request.contextPath}/pages_mail/mail_login.jsp";
					});
		}

	});
</script>
<!--begin 弹出层js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/zdialog.js"></script>
<!-- end -->

<body>
	<input type="hidden" id="cuo" value="${cuo}" />
	<input type="hidden" name="result" value="${result}" />
	<div style="height:1px;"></div>
	<div class="login">
		<header>
		<h1>邮箱授权登录</h1>
		</header>
		<div class="sr">
			<form action="${pageContext.request.contextPath}/mailLogin.action"
				method="post">
				<div class="name">
					<label> <i class="sublist-icon glyphicon glyphicon-user"></i>
					</label> <input type="text" placeholder="邮箱账号" class="name_inp"
						id="register_password" name="mailAddr">
				</div>
				<div class="name">
					<label> <i class="sublist-icon glyphicon glyphicon-pencil"></i>
					</label> <input type="password" placeholder="授权码" class="name_inp"
						id="rest_password" name="mailPass">
				</div>
				<span>
					<button class="btn" id="dl">登录</button>
					<button type="button" onclick="location='${pageContext.request.contextPath}/index.jsp' "
						class="btn">
						<font style="font-weight: 500;" color="#fff">返回</font>
					</button> </span>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//注册表单验证
		$('#dl').click(function() {
			var userpwd = $('#register_password');
			var userPassword = $('#register_password').val().trim();//邮箱
			var reuserPassword = $('#rest_password').val().trim();//授权码

			if (userPassword == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			//定义邮箱正则表达式
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

			var bool = reg.test(userPassword);
			if (bool == false) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不合法!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

			if (reuserPassword == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "授权密码不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			return true;
		});

		function alerts() {

			$.DialogByZ.Close();
		}
	</script>
</body>
</html>