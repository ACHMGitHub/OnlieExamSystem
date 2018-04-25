<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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
<title>员工管理</title>
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
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<!-- END PAGE LEVEL STYLES -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<input type="hidden" name="result" value="${result}" />
	<input type="hidden" name="message" value="${message}" />
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<!-- BEGIN 页面容器-->
			<div class="container-fluid">
				<!-- BEGIN 页面标题-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN 风格定制 -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END 风格定制 -->
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							员工管理<small>员工管理页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <i
								class="icon-angle-right"></i> <a
								href="${pageContext.request.contextPath}/hrm/getEmployeeByPage.action">员工管理列表</a>
							</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<!-- ---------------------------------------------- -->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-edit"></i>员工管理
								</div>
								<div class="actions">
									<button id="sample_editable_1_new"
										onclick="location.href='${pageContext.request.contextPath}/go.action'"
										class="btn red">
										新建 <i class="icon-plus"></i>
									</button>
								</div>
							</div>
							<div class="portlet-body">
								<table
									class="table table-striped table-bordered table-hover table-full-width"
									id="sample_2">
									<thead>
										<tr>
											<th>序号</th>
											<th>工号</th>
											<th>姓名</th>
											<th>性别</th>
											<th>年龄</th>
											<th>生日</th>
											<th>工资</th>
											<th>电话</th>
											<th>地址</th>
											<th>入职日期</th>
											<th>状态</th>
											<th>头像</th>
											<th>用户名</th>
											<th>邮箱</th>
											<th>部门</th>
											<th>岗位</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${emps}" var="emp">
											<tr>
												<td>${emp.empId }</td>
												<td>${emp.empNumber }</td>
												<td>${emp.empName }</td>
												<td>${emp.empSex }</td>
												<td>${emp.empAge }</td>
												<td><f:formatDate value="${emp.empBrithday }"
														pattern="yyyy-MM-dd" />
												</td>
												<td>${emp.empSalary }</td>
												<td>${emp.empTelephone}</td>
												<td>${emp.empAddress }</td>
												<td><f:formatDate value="${emp.empEntryDate}"
														pattern="yyyy-MM-dd" />
												</td>
												<td><c:if test="${emp.maritalStatus==1}" var="flag">已婚</c:if>
													<c:if test="${!flag}">未婚</c:if></td>
												<td style="margin:0px;padding:0px;"><img width="60px"
													style="margin:0px;padding:0px;"
													src="${pageContext.request.contextPath}/${emp.empPhotoUrl}" />
												</td>
												<td>${emp.user.userName}</td>
												<td>${emp.user.userEmail }</td>
												<td>${emp.dep.deptNumber}</td>
												<td>${emp.pos.posName }</td>
												<td>
													<!-- begin操作按钮 -->
													<div class="btn-group"
														style="margin-bottom: 0px !important;">
														<a class="btn mini green" href="#" data-toggle="dropdown">
															<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
														</a>
														<ul class="dropdown-menu">
															<!-- editRow(传入当前行ID 0开始)  -->
															<li><a data-toggle="modal"
																href="${pageContext.request.contextPath}/hrm/findEmpById.action?empId=${emp.empId}">
																	<i class="icon-edit"></i>编辑</a>
															</li>
															<li><a href="#" title="${emp.empId}"
																class="user_del"><i class="icon-trash"></i>删除</a></li>
														</ul>
													</div> <!-- end操作按钮 --></td>
											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div>
				<!-- ---------------------------------------------- -->
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
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
	</script>
	<script type="text/javascript">
		var result = "";
		result = $(":input[name='result']").val();
		if (result != null && result != "") {
			swal({
				title : result,
				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'
						+ result + '</span><br/>3秒后自动关闭。',
				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
				html : true,
				timer : 3000,
				showConfirmButton : false
			});
		}

		$(".user_del")
				.click(
						function() {
							//在当前超链接的祖先元素中查找tr
							var $tr = $(this).parents("tr");
							//在tr下查找第一个td
							//获取td的文本内容
							var adminName = $tr.children("td:eq(2)").text();
							var cId = $(this).attr("title");
							swal(
									{
										title : "您确定要删除" + [ adminName ] + "吗？",
										text : "您确定要删除这条数据？",
										type : "warning",
										showCancelButton : true,
										closeOnConfirm : false,
										confirmButtonText : "是的，我要删除",
										confirmButtonColor : "#ec6c62"
									},
									function() {
										window.location.href = "${pageContext.request.contextPath}/hrm/deleteEmp.action?empId="
												+ cId;
									});

						});
	</script>


	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>