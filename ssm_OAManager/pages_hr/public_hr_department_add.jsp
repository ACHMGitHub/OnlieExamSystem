<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>部门添加</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>

<style type="text/css">
#DeptNumberId {
	position: absolute;
	top: 305px;
	left: 660px;
}

#deptNameId {
	position: absolute;
	top: 355px;
	left: 660px;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
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
							部门<small>添加部门</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath }/index.jsp">我的桌面</a> <i
								class="icon-angle-right"></i> <a
								href="${pageContext.request.contextPath }/pages_hr/findDeptAll.action">部门管理</a>
								<i class="icon-angle-right"></i>添加部门</li>
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
									<i class="icon-reorder"></i>添加部门
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form
									action="${pageContext.request.contextPath}/pages_hr/insertDept.action"
									method="post" class="form-horizontal">
									<h3 class="form-section">部门信息</h3>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<label class="control-label">部门编号</label>
												<div class="controls">
													<input type="text" name="deptNumber" class="m-wrap span12"
														placeholder="必需以字母D开头" value="" />
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<label class="control-label">部门名称</label>
												<div class="controls">
													<input type="text" name="deptName" class="m-wrap span12"
														placeholder="必填" value="" />
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<label class="control-label">部门描述</label>
												<div class="controls">
													<input type="text" name="deptDescripti"
														class="m-wrap span12" placeholder="选填" value="" />
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
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
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
	<script
		src="${pageContext.request.contextPath}/main_pages/crm_table_editable.js"></script>
	<script
		src="${pageContext.request.contextPath}/main_pages/selectdepsemps.js"></script>
	<script
		src="${pageContext.request.contextPath}/main_pages/selectposition.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableEditable.init();
			Search.init();
			var position = $("#select2_sample_posi");
			ajaxLoadPosition(position);
		});
	</script>
	<!-- END JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>

	<script type="text/javascript">
		$("#submit-button").click(function() {
			var deptNumberEle = $("input[name='deptNumber']");
			var deptNameEle = $("input[name='deptName']");
			if ($.trim(deptNumberEle.val().charAt(0)) != "D") {
				swal("提示", "部门编号必须以D开头", "error");
				return false;
			}

			if ($.trim(deptNumberEle.val()) == "") {
				swal("提示", "部门编号不能为空", "error");
				return false;
			}

			if ($.trim(deptNameEle.val()) == "") {
				swal("提示", "部门名称不能为空", "error");
				return false;
			}
		});
	</script>
</body>
<!-- END BODY -->
</html>