<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>员工修改</title>
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
		$("#frm")
				.submit(
						function() {
							var reg = /[0-9]{1,}/;
							var regPhone = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])|173\d{8}$/;

							var number = $("input[name='empNumber']").val();
							if (number == "") {
								alert("员工工号不能为空!");
								return false;
							}
							if (number.length > 5) {
								alert("员工工号不能超过5个字符!");
								return false;
							}

							var empPhotoUrl = $("input[name='empPhotoUrl']")
									.val();
							if (empPhotoUrl == "") {
								alert("请选一张图片作为图像");
								return false;
							}

							var empName = $("input[name='empName']").val();
							if (empName == "") {
								alert("姓名不能为空!");
								return false;
							}

							var empAge = $("input[name='empAge']").val();
							if (empAge == "") {
								alert("年龄不能为空!");
								return false;
							}
							if (!reg.test(empAge)) {
								alert("年龄必须为数字!");
								return false;
							}

							var empSalary = $("input[name='empSalary']").val();
							if (empSalary == "") {
								alert("薪资不能为空!");
								return false;
							}
							if (!reg.test(empSalary)) {
								alert("薪资必须为数字!");
								return false;
							}

							var empBrithday = $("input[name='empBrithday']")
									.val();
							if (empBrithday == "") {
								alert("出生日期不能为空!");
								return false;
							}

							var empTelephone = $("input[name='empTelephone']")
									.val();
							if (empTelephone == "") {
								alert("电话不能为空!");
								return false;
							}
							if (!regPhone.test(empTelephone)) {
								alert("电话号码不合规范!");
								return false;
							}

							var empEntryDate = $("input[name='empEntryDate']")
									.val();
							if (empEntryDate == "") {
								alert("入职日期不能为空!");
								return false;
							}

							var empAddress = $("input[name='empAddress']")
									.val();
							if (empAddress == "") {
								alert("地址不能为空!");
								return false;
							}
							return true;
						});
	});
</script>
<script type="text/javascript">
	//图片上传预览
	function showImg(val) {
		//获得文件上传文本框对象
		var docObj = document.getElementById("doc");
		//获得放图片的img对象
		var img = document.getElementById("img");
		//设置图片大小
		img.style.width = '100px';
		if (docObj.files && docObj.files[0]) {
			//火狐下 直接设img属性
			img.style.display = 'block';
			//img.src=docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用以上方法.getAsDataURL()获取,需要以下方式
			img.src = window.URL.createObjectURL(docObj.files[0]);
		}
	}
</script>

<style type="text/css">
input,select {
	width: 100%;
	border: 0px;
	height: 100%;
	font-size: 18px;
}

.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0px;
	top: 0px;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
}
</style>
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
							<strong> 员工<small>修改员工</small> </strong>
						</h3>
						<ul class="breadcrumb">
							<li><strong> <a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <a
									href="${pageContext.request.contextPath}/hrm/getEmployeeByPage.action">员工管理</a>修改员工</strong></li>
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
									<strong>修改员工 </strong>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form id="frm"
									action="${pageContext.request.contextPath}/hrm/updateEmployee.action"
									method="post" enctype="multipart/form-data"
									class="form-horizontal">
									<h3 class="form-section">
										<strong>员工信息</strong><input name="empId" value="${emp.empId}"
											type="hidden" />
									</h3>
									<div class="row-fluid">
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 员工工号:
												</label> </strong>
												<div class="controls">
													<strong><input type="text" name="empNumber"
														value="${emp.empNumber }" class="m-wrap span12"
														placeholder="必填"> </strong>
												</div>
											</div>
										</div>
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 员工头像:
												</label> </strong> <img id="img" alt=""
													src="${pageContext.request.contextPath}/upload/${emp.empPhotoUrl}"
													style="width:10px;z-index: 10">
												<div class="controls">
													<strong><a class="file">选择头像 <input
															onchange="showImg(this.value)"
															style="width: 1700px; height: 138px;" name="empPhotoUrl"
															value="${emp.empPhotoUrl}" type="file" id="doc" /> </a> </strong>
												</div>
											</div>
										</div>

									</div>
									<div class="row-fluid">
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 员工姓名:
												</label> </strong>
												<div class="controls">
													<strong><input type="text" name="empName"
														value="${emp.empName}" class="m-wrap span12"
														placeholder="必填"> </strong>
												</div>
											</div>
										</div>
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 年龄: </label>
												</strong>
												<div class="controls">
													<strong><input type="text" name="empAge"
														value="${emp.empAge}" class="m-wrap span12"
														placeholder="必填"> </strong>
												</div>
											</div>
										</div>

									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 工资 </label> </strong>
												<div class="controls">
													<strong><input type="text" name="empSalary"
														value="${emp.empSalary}" class="m-wrap span12"
														placeholder="必填"> </strong>
												</div>
											</div>
										</div>

										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 出生日期:
												</label> </strong>
												<div class="controls">
													<div class="input-append date date-picker"
														data-date-format="yyyy-mm-dd" data-date-viewmode="years">
														<strong><input type="text" name="empBrithday"
															value='<f:formatDate value="${emp.empBrithday}" pattern="yyyy-MM-dd"/>'
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
												<strong><label class="control-label"> 电话: </label>
												</strong>
												<div class="controls">
													<strong><input type="text" name="empTelephone"
														value="${emp.empTelephone}" class="m-wrap span12"
														placeholder="必填"> </strong>
												</div>
											</div>
										</div>
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 性别： </label>
												</strong>
												<div class="controls">
													<strong><label class="radio"> <input
															type="radio" name="empSex" value="男"
															class="m-wrap span12" checked> 先生 </label> <label
														class="radio"> <input type="radio" name="empSex"
															value="女" class="m-wrap span12"> 女士 </label> </strong>
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 入职日期:
												</label> </strong>
												<div class="controls">
													<div class="input-append date date-picker"
														data-date-format="yyyy-mm-dd" data-date-viewmode="years">
														<strong><input type="text" name="empEntryDate"
															value='<f:formatDate value="${emp.empEntryDate}" pattern="yyyy-MM-dd"/>'
															class="m-wrap m-ctrl-medium date-picker" size="16"
															placeholder="请选择" value=""> <span class="add-on">
														</span> </strong>
													</div>
												</div>
											</div>
										</div>
										<div class="span6">
											<div class="control-group">
												<strong><label class="control-label"> 状态: </label>
												</strong>
												<div class="controls">
													<strong><label class="radio"> <input
															type="radio" name="maritalStatus" value="1"
															class="m-wrap span12" checked> 已婚 </label> <label
														class="radio"> <input type="radio"
															name="maritalStatus" value="0" class="m-wrap span12">
															未婚 </label> </strong>
												</div>
											</div>
										</div>

									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 部门职务
												</label> </strong>
												<div class="controls">
													<strong><select id="positionselect" name="deptId"
														class="m-wrap span6">
															<option value="-1">请选择</option>
															<c:forEach items="${depts }" var="dept">
																<option
																	<c:if test="${emp.dep.deptId == dept.deptId  }">selected="selected"</c:if>
																	value="${dept.deptId }">${dept.deptName }</option>
															</c:forEach>
													</select> <select id="postselect" name="postId" class="m-wrap span6">

															<option value="-1">请选择</option>
															<c:forEach items="${positions }" var="pos">
																<option
																	<c:if test="${emp.pos.posId == pos.posId  }">selected="selected"</c:if>
																	value="${pos.posId }">${pos.posName }</option>
															</c:forEach>
													</select> </strong>
												</div>
											</div>
										</div>
										<div class="span6 ">
											<div class="control-group">
												<strong><label class="control-label"> 地址: </label>
												</strong>
												<div class="controls">
													<strong><input type="text" name="empAddress"
														value="${emp.empAddress}" class="m-wrap span12"
														placeholder="必填"> </strong>
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