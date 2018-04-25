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
<title>登录</title>
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
<link href="${pageContext.request.contextPath}/css/lanrenzhijia.css"
	type="text/css" rel="stylesheet" />
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
		<form class="form-vertical login-form"
			action="${pageContext.request.contextPath }/view/user/findByNp.action"
			method="post">
			<h3 class="form-title" style="text-align: center;">OA软件办公管理系统登录</h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>请输入您的用户名和密码.</span>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="用户名" name="userName" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" placeholder="密码" name="userPassword" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">验证码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-tag"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="验证码" name="inpcode" style="width:100px;"
							autocomplete="off" />
						<iframe id="checkcode" name="checkcode"
							src="${pageContext.request.contextPath}/view/user/checkCode.action"
							id="iframecode" style="height:34px; width:85px; margin: 0px;"
							frameborder="0" scrolling="no"></iframe>
						<div style="float: right;">
							<a href="#" id="showcode" class="btn blue"
								style="width: 28px; height: 20px;"><i class="icon-refresh"
								style="margin:2px 8px;"></i> </a>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn blue pull-right">
					登录 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<div class="forget-password">
				<h4>忘记密码 ?</h4>
				<p>
					不用担心, 点击 <a href="javascript:;" class="" id="forget-password">这里</a>
					找回你的密码.
				</p>
			</div>
			<div class="create-account">
				<p>
					还没有账号 ?&nbsp; <a href="javascript:;" id="register-btn" class="">注册账号</a>
				</p>
			</div>
		</form>
		<!-- END LOGIN FORM -->
		<!-- BEGIN FORGOT PASSWORD FORM -->
		<form class="form-vertical forget-form"
			action="${pageContext.request.contextPath }/view/user/findUser.action"
			method="post">
			<h3 class="">忘记密码 ?</h3>
			<p>输入您的电子邮件地址重置您的密码.</p>
			<div class="control-group">
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="邮箱"
							name="userEmail" id="find_email" />
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
					<i class="m-icon-swapleft"></i> 返回
				</button>
				<button type="submit" class="btn blue pull-right" id="btn_email">
					提交 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
		<!-- END FORGOT PASSWORD FORM -->
		<!-- BEGIN REGISTRATION FORM -->
		<form class="form-vertical register-form"
			action="${pageContext.request.contextPath }/view/user/regist.action"
			method="POST">
			<h3 class="">注册</h3>
			<p>在下面输入您的帐户资料:</p>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" id="username" placeholder="用户名" name="userName" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">员工姓名</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-user"></i> <input class="m-wrap placeholder-no-fix"
							type="text" placeholder="员工姓名" id="emp_id" name="" /> <input
							class="m-wrap placeholder-no-fix" type="hidden"
							placeholder="员工编号" id="emp_idss" name="emp.empId" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-lock"></i> <input class="m-wrap placeholder-no-fix"
							type="password" id="register_password" placeholder="密码"
							name="userPassword" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label visible-ie8 visible-ie9">请重新输入您的密码</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-ok"></i> <input class="m-wrap placeholder-no-fix"
							id="rest_password" type="password" placeholder="重复密码"
							name="userPassword1" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">邮箱</label>
				<div class="controls">
					<div class="input-icon left">
						<i class="icon-envelope"></i> <input
							class="m-wrap placeholder-no-fix" type="text" placeholder="邮箱"
							id="loginName" name="userEmail" />
					</div>
					<ul class="on_changes">
						<li email="">请选择邮箱类型</li>
						<li email=""></li>
						<li email="@sina.com"></li>
						<li email="@163.com"></li>
						<li email="@qq.com"></li>
						<li email="@126.com"></li>
						<li email="@gmail.com"></li>
					</ul>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<label class="checkbox"> <input type="checkbox" name="tnc" />
						我同意 <a href="#">服务条件</a> 和 <a href="#">隐私政策</a> </label>
					<div id="register_tnc_error"></div>
				</div>
			</div>
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
					<i class="m-icon-swapleft"></i> 返回
				</button>
				<button type="submit" id="button-update">
					注册 <i class="m-icon-swapright m-icon-white"></i>
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
	<!--开始 邮箱插件 js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/inputmail.js"></script>
	<!--结束 邮箱插件js -->
	<!-- 弹出层js -->
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.init();
		});
		$(function() {
			$("#showcode")
					.click(
							function() {
								var url = "${pageContext.request.contextPath}/view/user/checkCode.action?v="
										+ new Date().valueOf();
								window.parent.frames[0].location.href = url;
							});

			var err = '${err}';
			if (err != '') {
				$("#errmsg").text(err);
				$("#btnerr").click();
			}
		});
	</script>
	<!-- 忘记密码邮箱表单验证 -->
	<script type="text/javascript">
		//密码找回表单验证
		$('#btn_email').click(function() {
			var findEmail = $('#find_email').val().trim();//邮箱
			//定义邮箱正则表达式
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

			var bool = reg.test(findEmail);
			if (findEmail == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不能为空!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			if (bool == false) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不合法!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			return true;
		});
	</script>



	<!-- 异步验证用户名和邮箱是否可用 -->
	<script type="text/javascript">
		var bl = true;
		var bu = true;
		var yg = true;
		//异步验证用户名是否可用
		$("#username")
				.blur(
						function() {
							if ($(this).val() != "") {
								//* /2.准备发送的异步请求
								var url = "${pageContext.request.contextPath}/view/user/findByName.action?userName="
										+ $(this).val();
								//jquery实现  post   Ajax请求
								$.post(url, function(data) {

									if (data == "1") {
										$.DialogByZ.Alert({
											Title : "提示",
											Content : "用户名已存在",
											BtnL : "确定",
											FunL : alerts
										});
										bl = false;
									}
									if (data == "2") {
										$.DialogByZ.Alert({
											Title : "提示",
											Content : "用户名可用",
											BtnL : "确定",
											FunL : alerts
										});
										bl = true;
									}
								}, "json");// 替代  eval() 
							} else {
								$.DialogByZ.Alert({
									Title : "提示",
									Content : "用户名不能为空!",
									BtnL : "确定",
									FunL : alerts
								});
							}
						});

		//异步验证员工是否可用
		$("#emp_id")
				.blur(
						function() {
							if ($(this).val() != "") {
								//* /2.准备发送的异步请求
								var url = "${pageContext.request.contextPath}/view/user/findEmpIdByEmpName.action?empName="
										+ $(this).val();
								//jquery实现  post   Ajax请求
								$.post(url, function(data) {
									var arrayJson = data;
									//遍历json数组
									var $jsons = $(arrayJson);
									$jsons.each(function() { //this 当前json对象
										if (this.empId != "") {
											$("#emp_idss").val(this.empId);
											$.DialogByZ.Alert({
												Title : "提示",
												Content : "验证成功!,您是本公司员工",
												BtnL : "确定",
												FunL : alerts
											});
											yg = true;
										}
										if (data == "6") {
											$.DialogByZ.Alert({
												Title : "提示",
												Content : "你不是本公司成员,无法注册!",
												BtnL : "确定",
												FunL : alerts
											});
											yg = false;
										}
									});
								}, "json");// 替代  eval() 
							} else {
								$.DialogByZ.Alert({
									Title : "提示",
									Content : "员工姓名不能为空!",
									BtnL : "确定",
									FunL : alerts
								});
								$('#emp_id').focus();//获取文本框的焦点
							}
						});

		//异步验证邮箱是否可用	
		$(function() {
			//邮箱插件js
			$("#loginName").changeTips({
				divTip : ".on_changes"
			});

			$("#loginName")
					.blur(
							function() {
								if ($(this).val() != "") {
									//* /2.准备发送的异步请求
									var url = "${pageContext.request.contextPath}/view/user/findEmail.action?userEmail="
											+ $(this).val();
									//jquery实现  post   Ajax请求
									$.post(url, function(data) {
										if (data == "3") {
											$.DialogByZ.Alert({
												Title : "提示",
												Content : "该邮箱已被绑定!",
												BtnL : "确定",
												FunL : alerts
											});
											$(this).focus();//获取文本框的焦点
											bu = false;
										}
										if (data == "4") {
											$.DialogByZ.Alert({
												Title : "提示",
												Content : "邮箱可用",
												BtnL : "确定",
												FunL : alerts
											});
											bu = true;
										}
									}, "json");// 替代  eval() 
								} else {
									$.DialogByZ.Alert({
										Title : "提示",
										Content : "邮箱不能为空!",
										BtnL : "确定",
										FunL : alerts
									});
								}
							});
		});
		//注册表单验证
		$('#button-update').click(function() {
			//获取旧密码密码框
			var Username = $('#username');
			var UserName = $('#username').val().trim();//用户名
			var empId = $('#emp_id').val().trim();//员工id

			var userPassword = $('#register_password').val().trim();//新密码
			var reuserPassword = $('#rest_password').val().trim();//确认密码框
			var userEmail = $('#loginName').val().trim();//邮箱

			if (UserName == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "用户名不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				Username.focus();//获取文本框焦点
				return false;
			}
			if (empId == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "员工姓名不能为空！",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

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

			//定义邮箱正则表达式
			var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

			var bool = reg.test(userEmail);
			if (userEmail == "") {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不能为空!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			if (bool == false) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱不合法!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}

			if (!bu) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "邮箱已存在!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			if (!yg) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "您不是本公司成员!",
					BtnL : "确定",
					FunL : alerts
				});
				return false;
			}
			if (!bl) {
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "用户名已存在!",
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

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>