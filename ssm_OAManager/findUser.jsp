<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="cn">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>找回密码</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${pageContext.request.contextPath}/media/css/login-soft.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!--弹出层 开始 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<!-- 结束 -->
<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->


</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="media/image/logo-big.png" alt="" />
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- begin 登录提示框 -->
		<div style="display:none;">
			<a href="#myModal2" role="button" id="btnerr" class="btn btn-danger"
				data-toggle="modal"></a>
		</div>
		<div id="myModal2" class="modal hide fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel2" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true"></button>
				<h3 id="myModalLabel2" style="color:black;">提示信息</h3>
				<input type="hidden" name="findUser" value="${findUser}" />
			</div>
			<div class="modal-body">
				<p id="errmsg" style="color:black;"></p>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn green">取消</button>
			</div>
		</div>
		<!-- end 登录提示框 -->
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical"
			action="${pageContext.request.contextPath }/view/user/updateUser.action"
			method="post">
			<h3 class="">重置密码</h3>
			<p>在下面输入您的帐户资料:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input type="hidden" name="userId"
							value="${finduser.userId}" /> <input
							class="m-wrap placeholder-no-fix" type="text" id="username"
							readonly="readonly" placeholder="用户名" name="userName"
							value="${finduser.userName}" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="register_password" placeholder="新密码"
							name="userPassword" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">请重新输入您的密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="重复密码" name="userPassword1"
							id="rest_password" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<a href="${pageContext.request.contextPath }/login.jsp"
					id="back-btn" class="btn"> <i class="m-icon-swapleft"></i> 返回 </a>
				<button id="button-update" type="submit">
					确认提交 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END REGISTRATION FORM -->
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">2017 &copy; Party - OA软件办公管理系统</div>
	<!-- END COPYRIGHT -->
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.validate.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/media/js/login-soft.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!--begin 弹出层js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/zdialog.js"></script>
	<!-- end -->
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.init();
		});
	</script>
	<script type="text/javascript">
		//注册表单验证
		$('#button-update').click(function() {

			var userpwd = $('#register_password');
			var userPassword = $('#register_password').val().trim();//新密码
			var reuserPassword = $('#rest_password').val().trim();//确认密码框

			if (userPassword == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "新密码不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

			if (reuserPassword == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "重复密码不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			if (userPassword.length<6||userPassword.lenth>18) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "新密码必须大于5位到18位之间!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

			if (reuserPassword.length<6||reuserPassword.lenth>18) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "重新输入新密码必须大于5位到18位之间!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

			if (userPassword != reuserPassword) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "两次输入密码不相等!",
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
	<script>
		$(function() {
			//用户不存在
			var findUser = "";
			findUser = $(":input[name='findUser']").val();
			if (findUser != null && findUser != "") {
				swal("邮箱不存在!", "请输入正确的邮箱！", "error");
			}
			//邮箱不存在
			var findUser2 = "";
			findUser2 = $("#username").val();
			if (findUser2 == null || findUser2 == "") {
				swal(
						{
							title : "失败！",
							text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">此链接已经失效！请重试</span><br/>',
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
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>