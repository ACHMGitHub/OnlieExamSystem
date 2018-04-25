<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>个人资料</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-fileupload.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/media/css/chosen.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/media/css/profile.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!--弹出层 开始 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />

<!-- 结束 -->

<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN CONTAINER -->
	<div class="page-container row-fluid">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							个人信息 <small>我的主页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath}/index.jsp">我的主页</a> <i
								class="icon-angle-right"></i>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid profile">
					<div class="span12">
						<!--BEGIN TABS-->
						<div class="tabbable tabbable-custom tabbable-full-width">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab_1_2" data-toggle="tab">个人信息</a>
								</li>
								<li><a href="#tab_1_3" data-toggle="tab">修改信息</a></li>
							</ul>
							.
							<div class="tab-content">
								<!--end tab-pane-->
								<div class="tab-pane profile-classic row-fluid active"
									id="tab_1_2">
									<div class="span2">
										<img
											src="${pageContext.request.contextPath}/${user.emp.empPhotoUrl}"
											name="empPhotoUrl"
											style="max-width: 150px; max-height: 150px;"
											onerror="this.src='${pageContext.request.contextPath}/media/image/default-head.png'"
											alt="" />
									</div>
									<ul class="unstyled span10">
										<li><span>用户名:</span>${user.emp.empName}</li>
										<li><span>性别:</span>${user.emp.empSex}</li>
										<li><span>年龄:</span>${user.emp.empAge}</li>
										<li><span>电话:</span>${user.emp.empTelephone}</li>
										<li><span>生日:</span> <fmt:formatDate
												value="${user.emp.empBrithday}" pattern="yyyy-MM-dd " /></li>
										<li><span>地址:</span>${user.emp.empName}</li>
										<li><span>Email:</span>${user.userEmail}<a href="#"></a>
										</li>
										<li><span>入职日期:</span> <fmt:formatDate
												value="${user.emp.empEntryDate}" pattern="yyyy-MM-dd " /></li>
										<li><span>地址:</span>${user.emp.empAddress}</li>
										<li><span>部门:</span>${user.emp.empName}</li>
										<li><span>职位:</span>${user.emp.empName}</li>
									</ul>
								</div>
								<!--tab_1_2-->
								<div class="tab-pane row-fluid profile-account" id="tab_1_3">
									<div class="row-fluid">
										<div class="span12">
											<div class="span3">
												<ul class="ver-inline-menu tabbable margin-bottom-10">
													<li class="active"><a data-toggle="tab"
														href="#tab_1-1"> <i class="icon-cog"></i> 基本信息 </a> <span
														class="after"></span>
													</li>
													<li class=""><a data-toggle="tab" href="#tab_2-2"><i
															class="icon-picture"></i> 更换头像</a></li>
													<li class=""><a data-toggle="tab" href="#tab_3-3"><i
															class="icon-lock"></i>修改密码</a></li>
												</ul>
											</div>
											<div class="span9">
												<div class="tab-content">
													<div id="tab_1-1" class="tab-pane active">
														<div style="height: auto;" id="accordion1-1"
															class="accordion collapse">
															<form
																action="${pageContext.request.contextPath}/view/emp/updateEmpInforById.action"
																method="post">
																<label class="control-label">用户名:</label> <input
																	type="text" name="empName" disabled="disabled"
																	value="${user.emp.empName}" class="m-wrap span8" /> <label
																	class="control-label">性别:</label> <input name="empSex"
																	type="radio" value="先生" disabled="disabled"
																	class="m-wrap span12" ${user.emp.empSex=='男'?'checked':''}>先生
																<input name="empSex" type="radio" value="女士"
																	disabled="disabled" class="m-wrap span12"
																	${user.emp.empSex=='女'?'checked':''}>女士 <label
																	class="control-label">电话</label> <input type="text"
																	name="empTelephone" value="${user.emp.empTelephone}"
																	class="m-wrap span8" /> <label class="control-label">地址:</label>
																<input type="text" name="empAddress"
																	value="${user.emp.empAddress}" class="m-wrap span8" />
																<label class="control-label">Email:</label> <input
																	disabled="disabled" type="text" name="userEmail"
																	value="${user.userEmail}" class="m-wrap span8" />
																<div class="submit-btn">
																	<button type="submit" class="btn green">提交</button>
																	<button type="reset" class="btn">重置</button>
																	<button type="button" onclick="history.back()"
																		class="btn blue">返回</button>
																</div>
															</form>
														</div>
													</div>
													<div id="tab_2-2" class="tab-pane">
														<div style="height: auto;" id="accordion2-2"
															class="accordion collapse">
															<form
																action="${pageContext.request.contextPath}/view/user/updateUserImg.action"
																enctype="multipart/form-data" method="post">
																<div class="fileupload fileupload-new"
																	data-provides="fileupload">
																	<div class="fileupload-new thumbnail"
																		style="width: 200px; height: 150px;">
																		<input type="hidden" name="userId"
																			value="${user.userId}"> <img
																			src="${pageContext.request.contextPath}/${user.emp.empPhotoUrl}"
																			style="max-width: 200px; max-height: 150px;"
																			onerror="this.src='${pageContext.request.contextPath}/media/image/default-head.png'"
																			alt="" />
																	</div>
																	<div class="space10"></div>
																	<div
																		class="fileupload-preview fileupload-exists thumbnail"
																		style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
																	<div>
																		<span class="btn btn-file"><span
																			class="fileupload-new">选择头像</span> <span
																			class="fileupload-exists">改变</span> <input
																			type="file" name="headfile" /> </span> <a href="#"
																			class="btn fileupload-exists"
																			data-dismiss="fileupload">移除</a>
																	</div>
																</div>
																<div class="clearfix"></div>
																<div class="space10"></div>
																<div class="submit-btn">
																	<button type="submit" class="btn green">提交上传</button>
																</div>
															</form>
														</div>
													</div>
													<div id="tab_3-3" class="tab-pane">
														<div style="height: auto;" id="accordion3-3"
															class="accordion collapse">
															<form
																action="${pageContext.request.contextPath}/view/user/updateUserPwd.action"
																method="post">
																<label class="control-label">原始密码</label> <input
																	type="password" name="olduserPassword"
																	class="m-wrap span8 olduserPassword" /> <label
																	class="control-label">新密码</label> <input
																	type="password" name="userPassword"
																	class="m-wrap span8 userPassword" /> <label
																	class="control-label">重复新密码</label> <input
																	type="password" name="newuserPassword"
																	class="m-wrap span8 reuserPassword" />
																<div class="submit-btn">
																	<button type="submit" disabled="disabled"
																		id="button-update" class="btn blue">修改</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											<!--end span9-->
										</div>
									</div>
								</div>
								<!--end tab-pane-->
							</div>
						</div>
						<!--END TABS-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- END FOOTER -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!--begin 弹出层js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/zdialog.js"></script>
	<!-- end -->
	<script>
		$(function() {
			function alerts() {
				$.DialogByZ.Close();
			}
			// initiate layout and plugins
			App.init();
			$('.olduserPassword')
					.blur(
							function() {
								//获取旧密码密码框
								var oldPwd = $('.olduserPassword');

								var olduserPassword = $(this).val();

								if ($(this).val() != "") {

									var data = {
										"userPassword" : olduserPassword
									};
									//异步验证原密码是否正确
									var url = "${pageContext.request.contextPath}/view/user/finduserPwd.action?v="
											+ new Date().valueOf();
									$.post(url, data, function(d) {
										if (d == "1") {
											$('#button-update').removeAttr(
													"disabled");

											swal("验证成功!", "原密码正确！", "success");
										} else {
											$('#button-update').attr(
													"disabled", "disabled");
											swal("验证失败!", "原密码错误！", "error");
										}
									});
								} else {

									$.DialogByZ.Alert({
										Title : "提示",
										Content : "密码不能为空!",
										BtnL : "确定",
										FunL : alerts
									});
									return false;
								}
							});
			//表单验证
			$('#button-update').click(function() {
				//获取旧密码密码框
				var Password = $('.userPassword');

				var olduserPassword = $('.olduserPassword').val().trim();//旧密码
				var userPassword = $('.userPassword').val().trim();//新密码
				var reuserPassword = $('.reuserPassword').val().trim();//确认密码框
				if (userPassword == "") {
					$.DialogByZ.Alert({
						Title : "提示",
						Content : "新密码不能为空！",
						BtnL : "确定",
						FunL : alerts
					});
					Password.focus();//获取文本框焦点

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
					$('.reuserPassword').focus();//获取文本框焦点
					return false;
				}
				if (reuserPassword.length<6||reuserPassword.lenth>18) {
					$.DialogByZ.Alert({
						Title : "提示",
						Content : "重新输入新密码必须大于5位到18位之间!",
						BtnL : "确定",
						FunL : alerts
					});
					$('.reuserPassword').focus();//获取文本框焦点
					return false;
				}
				if (userPassword != reuserPassword) {
					$.DialogByZ.Alert({
						Title : "提示",
						Content : "两次输入密码不相等!",
						BtnL : "确定",
						FunL : alerts
					});
					$('.userPassword').focus();//获取文本框焦点
					return false;
				}
				return true;
			});
		});
	</script>
</body>
<!-- END BODY -->
</html>