<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="cn">

<head>
<meta charset="utf-8" />
<title>部门管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>

<body class="page-header-fixed">
<input type="hidden" name="result" value="${result}" />
<input type="hidden" name="message" value="${message}" />
<input type="hidden" name="num" value="${num }">
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<!-- ---------------------------------------------- -->
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
							部门管理 <small>部门管理页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a>
								<i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/pages_hr/findDeptAll.action">部门管理</a>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->

				<!-- BEGIN 表格列表-->
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-globe"></i>部门展示
						</div>
						<div class="actions">
							<div class="btn-group">
								<a class="btn red"
									href="${pageContext.request.contextPath}/pages_hr/public_hr_department_add.jsp">
									新增 <i class="icon-plus"></i> </a> <a class="btn green" href="#"
									data-toggle="dropdown"> 改变显示列 <i class="icon-angle-down"></i>
								</a>
								<div id="sample_2_column_toggler"
									class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
									<!-- <label><input type="checkbox" checked data-column="0">序号</label> -->
									<label><input type="checkbox" checked data-column="0">部门编号</label>
									<label><input type="checkbox" checked data-column="1">部门名称</label>
									<label><input type="checkbox" checked data-column="2">部门描述</label>
									<!-- <label><input type="checkbox" checked data-column="5">功能描述</label>
											<label><input type="checkbox" checked data-column="6">备注</label> -->
								</div>
							</div>
						</div>
					</div>
					<div class="portlet-body">
						<table
							class="table table-striped table-bordered table-hover table-full-width"
							id="sample_2">
							<thead>
								<tr>

									<th>部门编号</th>
									<th>部门名称</th>
									<th>部门描述</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageBean }" var="obj">
									<tr>

										<td>${obj.deptNumber }</td>
										<td>${obj.deptName }</td>
										<td>${obj.deptDescripti }</td>
										<td>
											<!-- begin操作按钮 -->
											<div class="btn-group" style="margin-bottom: 0px !important;">
												<a class="btn mini green" href="#" data-toggle="dropdown">
													<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
													<li><a href="#" title="${obj.deptId}" class="btn mini purple user_del"><i
															class="icon-trash"></i>删除</a>
													</li>
													<li><a
														href="${pageContext.request.contextPath}/pages_hr/findByDeptId.action?id=${obj.deptId}"
														class="btn mini green"><i class="icon-edit"></i>修改</a>
													</li>
												</ul>
											</div></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END 表格列表-->
			</div>
			<!-- END PAGE CONTENT-->
		</div>
		<!-- END PAGE CONTENT-->
		<!-- --------------------------------------------------------- -->
	</div>
	<!-- END 页面 -->
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-tree.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/ui-tree.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			UITree.init();
			TableAdvanced.init();
		});
		$(function() {
			$("#tree_1").on("nodeselect.tree.data-api", "[data-role=leaf]",
					function(e) {
						var cateid = e.node.value;
						var url = "crm_prod?id=" + cateid;
						location.href = url;
					});
		});
	</script>
	<script type="text/javascript">
		var result = "";
		result = $(":input[name='result']").val();
		if (result != null && result != "") {
			swal({
				title : result,
				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'+result+'</span><br/>3秒后自动关闭。',
				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
				html : true,
				timer : 3000,
				showConfirmButton : false
			});
		}
		
		
			$(".user_del").click(
				function() {
					//在当前超链接的祖先元素中查找tr
					var $tr = $(this).parents("tr");
					//在tr下查找第一个td
					//获取td的文本内容
					var adminName = $tr.children("td:eq(1)").text();
					var cId = $(this).attr("title");
					swal(
							{
								title : "您确定要删除"
										+ [ adminName ]
										+ "吗？",
								text : "您确定要删除这条数据？",
								type : "warning",
								showCancelButton : true,
								closeOnConfirm : false,
								confirmButtonText : "是的，我要删除",
								confirmButtonColor : "#ec6c62"
							},
							function() {
								window.location.href = "${pageContext.request.contextPath}/pages_hr/deleteByDeptId.action?id="
										+ cId;
							});
	
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var message = "";
			message = $(":input[name='message']").val();
			if (message != null && message != "") {
				swal({
					title : message,
					text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">操作失败！</span><br/>3秒后自动关闭。',
					imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
					html : true,
					timer : 3000,
					showConfirmButton : false
				});
			}
		});
	</script>

</body>

</html>