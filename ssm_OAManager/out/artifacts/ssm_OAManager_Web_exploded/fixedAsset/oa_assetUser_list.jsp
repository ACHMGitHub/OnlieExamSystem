<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>我管理的资产</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<jsp:include page="/media/ui_css.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
	<link href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css" rel="stylesheet" />
<!-- END PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
</head>
<!-- 引入jquery的库文件 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script> 
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<jsp:include page="/main_pages/top.jsp"></jsp:include>
<input type="hidden" name="result" value="${result}" />
<!-- BEGIN 容器 -->
<div class="page-container row-fluid">
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
						我管理的资产<small>我管理的资产页</small>
					</h3>
					<ul class="breadcrumb">
						<li>	<a href="${pageContext.request.contextPath}/index.jsp">系统管理</a>  <i class="icon-angle-right"></i>
								<a href="${pageContext.request.contextPath}/fixedAsset/findAssetUserAll.action">我管理的资产</a> 
						</li>
					</ul>
					<!-- END 网页的标题和面包屑-->
				</div>
			</div>
			<!-- END 页面标题-->
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-globe"></i>我管理的资产
					</div>
					<div class="actions">
						<div class="btn-group">
							<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列
								<i class="icon-angle-down"></i> </a>
							<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
								<label><input type="checkbox" checked data-column="0">所属部门</label>
								<label><input type="checkbox" checked data-column="1">资产编号</label>
								<label><input type="checkbox" checked data-column="2">资产名称</label>
								<label><input type="checkbox" checked data-column="3">资产原价(￥)</label>
								<label> <input type="checkbox" checked data-column="4">资产保管人</label>
								<label><input type="checkbox" checked data-column="5">资产性质</label>
								<label><input type="checkbox" checked data-column="6">增加类型</label>
								<label><input type="checkbox" checked data-column="7">增加日期</label>
								<label><input type="checkbox" checked data-column="8">启用日期</label>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover table-full-width"
						id="sample_2">
						<thead>
							<tr>
								<th>所属部门</th>
								<th>资产编号</th>
								<th>资产名称</th>
								<th>资产原价(￥)</th>
								<th>资产保管人</th>
								<th>资产性质</th>
								<th>增加类型</th>
								<th>增加日期</th>
								<th>启用日期</th>
							</tr>
						</thead>
						<tbody id="tablecusfollow">
						<c:forEach items="${pageBean.datas}" var="obj">
								<tr>
									<td>
									${obj.department.deptName }
									</td>
									<td>
									${obj.assetNo }
									</td>
									<td>
									<a class="myModal2Update"  href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.assetNo}">${obj.assetName}</a>
									</td>
									<td>
									${obj.assetMoney }
									</td>
									<td >${obj.user.emp.empName }</td>
									<td ><c:if test="${obj.assetNature==0}">资产</c:if><c:if test="${obj.assetNature==1}">费用</c:if></td>
									<td >${obj.fortifyType.fortifyTypeName }</td>
									<td>
									<fmt:formatDate value="${obj.assetDate}"  pattern="yyyy-MM-dd"/>
									</td>
									<td>
									<fmt:formatDate value="${obj.usingDate}"  pattern="yyyy-MM-dd"/>
									</td>
								</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
</div>
<jsp:include page="/main_pages/foot.jsp"></jsp:include>
<jsp:include page="/media/ui_js.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
<script src="${pageContext.request.contextPath}/media/js/form-samples.js"></script>
<script src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
<script>
	jQuery(document).ready(function() {
		App.init();
		TableAdvanced.init();
		FormSamples.init();
	});
	
</script>
<!-- END JAVASCRIPTS -->
<!-- 定时提示框 -->
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
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
	</script>
</body>
<!-- END BODY -->
</html>