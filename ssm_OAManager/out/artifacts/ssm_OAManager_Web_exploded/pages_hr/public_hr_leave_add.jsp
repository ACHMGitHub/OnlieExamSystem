<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>请假原由添加</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/datepicker.css" />
<link href="${pageContext.request.contextPath}/media/css/search.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function() {
		$("#frm").submit(function() {
			var reg = /[0-9]{1,}/;

			var date = $("input[name='leaDate']").val();
			if (date == "") {
				alert("请假日期不能为空!");
				return false;
			}

			var time = $("input[name='leaTime']").val();
			if (time == "") {
				alert("请假天数不能为空!");
				return false;
			}
			if (!reg.test(time) || time <= 0) {
				alert("请假天数必须为数字且大于0!");
				return false;
			}

			var cause = $("input[name='leaCause']").val();
			if (cause == "") {
				alert("请假原因不能为空!");
				return false;
			}
			return true;
		});
	});
</script>

<!-- END PAGE LEVEL STYLES -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<strong><jsp:include page="/main_pages/top.jsp"></jsp:include></strong>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<strong><jsp:include page="/main_pages/leftdel.jsp"></jsp:include></strong>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<!-- BEGIN 页面容器-->
			<div class="container-fluid">
				<!-- BEGIN 页面标题-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN 风格定制 -->
						<strong> <jsp:include page="/main_pages/styleset.jsp"></jsp:include>

						</strong>
						<!-- END 风格定制 -->
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							<strong>请假管理<small>添加出差记录</small> </strong>
						</h3>
						<ul class="breadcrumb">
							<li><strong> <a
									href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <a
									href="${pageContext.request.contextPath}/hrm/findAllLeaves.action">请假管理</a>
									添加请假记录</strong>
							</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN SAMPLE FORM PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<strong>添加出差记录 </strong>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form id="frm"
									action="${pageContext.request.contextPath}/hrm/insertLeave.action"
									method="post" class="form-horizontal">
									<h3 class="form-section">
										<strong>请假信息</strong>
									</h3>

									<div class="row-fluid">
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 请假日期:
												</label> </strong>
												<div class="controls">
													<div class="input-append date date-picker"
														data-date-format="yyyy-mm-dd" data-date-viewmode="date">
														<strong><input type="text" name="leaDate"
															class="m-wrap m-ctrl-medium date-picker" size="16"
															placeholder="请选择" value=""> <span class="add-on">
														</span> </strong>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 天数: </label>
												</strong>
												<div class="controls">
													<strong><input type="text" name="leaTime"
														class="m-wrap span12" placeholder="必填"> </strong>
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 请假原因:
												</label> </strong>
												<div class="controls">
													<strong><input type="text" name="leaCause"
														class="m-wrap span12" placeholder="必填"> </strong>
												</div>
											</div>
										</div>
									</div>

									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 员工名称
												</label> </strong>
												<div class="controls">
													<strong> <select name="emp.empId"
														class="m-wrap span6">
															<c:forEach items="${emps}" var="emp">
																<option value="${emp.empId}">${emp.empName }</option>
															</c:forEach>
													</select> </strong>
												</div>
											</div>
										</div>
									</div>

									<div class="form-actions">
										<button type="submit" id="submit-button" class="btn green">
											<i class="icon-ok"></i>保存
										</button>
										<button type="reset" class="btn">重置</button>
										<button type="button" onclick="history.back()"
											class="btn blue">返回</button>
									</div>
								</form>
								<!-- END FORM-->
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END 页面容器-->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectdepsemps.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectposition.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectparam.js"></script>
	<script>
		jQuery(document)
				.ready(
						function() {
							App.init();
							Search.init();
							ajaxLoadPosition($('#positionselect'));
							$('#positionselect')
									.change(
											function() {
												var id = $(this).val();
												var url = "../pages_hr/hr_post!ajaxLoadPostByPositionId?id="
														+ id
														+ "&v="
														+ new Date().valueOf();
												$
														.getJSON(
																url,
																function(d) {
																	var chtml = "";
																	for ( var int = 0; int < d.length; int++) {
																		chtml += "<option value='"+d[int].postId+"'>"
																				+ d[int].postName
																				+ "</option>";
																	}
																	$(
																			'#postselect')
																			.html(
																					chtml);
																});
											});
							var role = $('#roleselect');
							var roleurl = "../pages_sys/sys_role!ajaxLoadSysRole?v="
									+ new Date().valueOf();
							$
									.getJSON(
											roleurl,
											function(d) {
												var chtml = "";
												for ( var int = 0; int < d.length; int++) {
													chtml += "<option value='"+d[int].roleid+"'>"
															+ d[int].rolename
															+ "</option>";
												}
												role.append(chtml);
											});
							var emplevel = $('#emplevel');
							ajaxLoadParam(emplevel, 11);
						});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>