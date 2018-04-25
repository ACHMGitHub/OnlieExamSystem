<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>功能管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/bootstrap-tree.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->
</head>
<!-- END HEAD -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function() {
		//提示是否禁用
		$(".function_user")
				.click(
						function() {
							//在当前超链接的祖先元素中查找tr
							var $tr = $(this).parents("tr");
							//在tr下查找第一个td
							//获取td的文本内容
							var funName = $tr.children("td:eq(0)").text();
							var funId = $(this).attr("title");
							var forName = $(this).parents("tr")
									.find("td:eq(2)").text();
							//alert(funName);
							//判断是否禁用
							var jname = "";
							var funForbidden = 0;
							if ($.trim(forName) == "否") {
								funForbidden = 1;
								jname = "禁用";
							} else {
								jname = "使用";
							}
							var url = "${pageContext.request.contextPath}/sys_privilege/findByFunId.action";

							$
									.post(
											url,
											function(data) {

												window.location.href = "${pageContext.request.contextPath}/sys_privilege/updateFunction.action?funId="
														+ funId
														+ "&funForbidden="
														+ funForbidden;
											});
						});
	});
</script>
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<input type="hidden" name="result" value="${result}" />
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
							OA权限管理 <small>权限管理页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <i
								class="icon-angle-right"></i> <a
								href="${pageContext.request.contextPath}/sys_privilege/findByFunPage.action">功能管理</a>
							</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->

				<!-- BEGIN 表格列表-->
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-globe"></i>权限展示
						</div>
						<div class="actions">
							<div class="btn-group">
								<a class="btn red"
									href="${pageContext.request.contextPath}/sys_privilege/oa_function_add.jsp">
									新增 <i class="icon-plus"></i> </a> <a class="btn green" href="#"
									data-toggle="dropdown"> 改变显示列 <i class="icon-angle-down"></i>
								</a>
								<div id="sample_2_column_toggler"
									class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
									<label><input type="checkbox" checked data-column="1">功能名称</label>
									<label><input type="checkbox" checked data-column="2">功能菜单</label>
									<label><input type="checkbox" checked data-column="3">是否禁用</label>
									<label><input type="checkbox" checked data-column="4">功能描述</label>
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
									<th>序号</th>
									<th>功能名称</th>
									<th>功能菜单</th>
									<th>是否禁用</th>
									<th>功能描述</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageBean }" var="obj">
									<tr>
										<th>${obj.funId }</th>
										<td>${obj.funName }</td>
										<td>${obj.funUrl }</td>
										<td><c:if test="${obj.funForbidden==0}">否</c:if> <c:if
												test="${obj.funForbidden==1}">是</c:if></td>
										<td>${obj.funDescripti }</td>
										<td>
											<!-- begin操作按钮 -->
											<div class="btn-group" style="margin-bottom: 0px !important;">
												<a class="btn mini green" href="#" data-toggle="dropdown">
													<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
												<li><a href="#"
													class="btn mini red user_del" title="${obj.funId }"><i class="icon-trash"></i>删除</a></li>
												<li><a href="${pageContext.request.contextPath}/sys_privilege/findByFunId.action?id=${obj.funId}"
													class="btn mini green"><i class="icon-edit"></i>修改</a></li>
												<li><a id="" href="#" title="${obj.funId}" class="btn mini purple function_user"><i class="icon-lock"></i>
													<c:if test="${obj.funForbidden==0}">禁用</c:if> <c:if test="${obj.funForbidden==1}">使用</c:if></a></li>
													</ul></div>
													</td>
											</tr>
											 </c:forEach>
									</tbody>
								</table>
							</div>
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
	<!-- END JAVASCRIPTS -->
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
							var adminName = $tr.children("td:eq(1)").text();
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
										window.location.href = "${pageContext.request.contextPath}/sys_privilege/deleteById.action?id="
												+ cId;
									});

						});
	</script>
</body>
<!-- END BODY -->
</html>