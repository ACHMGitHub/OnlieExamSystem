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
<title>公告修改</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/datepicker.css" />
<link
	href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/media/css/search.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
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
							公告<small>编辑公告</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">OA公告管理</a>
								<i class="icon-angle-right"></i> <a href="#">公告列表</a></li>
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
									<i class="icon-reorder"></i>编辑公告
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form
									action="${pageContext.request.contextPath}/view/announcement/updateAnnouncement.action"
									method="post" class="form-horizontal">
									<h3 class="form-section">公告信息</h3>
									<div class="row-fluid">
										<div class="span12 ">
											<div class="control-group">
												<label class="control-label">公告标题：</label>
												<div class="controls">
													<input type="hidden" name="amId" value="${data.amId}" /> <input
														name="amTheme" type="text" class="m-wrap span10"
														placeholder="必填" value="${data.amTheme}">
												</div>
											</div>
										</div>
										<!--/span-->
									</div>
									<div class="row-fluid">
										<div class="span12 ">
											<div class="control-group">
												<label class="control-label">公告内容：</label>
												<div class="controls">
													<textarea name="amConten" rows="5" class="m-wrap span10"
														placeholder="必填">${data.amConten}</textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span12">
											<div class="row-fluid">
												<div class="span3 ">
													<div class="control-group">
														<label class="control-label">公告发布时间</label>
														<div class="controls">
															<div class="input-append date date-picker"
																data-date-format="yyyy-mm-dd" data-date-viewmode="years">
																<input placeholder="请选择" name="amDate"
																	class="m-wrap m-ctrl-medium date-picker" size="16"
																	type="text"
																	value="<fmt:formatDate value='${data.amDate}'
									pattern="yyyy-MM-dd" />" /><span
																	class="add-on"><i class="icon-calendar"></i> </span>
															</div>
														</div>
													</div>
												</div>
												<!--/span-->
											</div>
											<!--/row-->
											<br />
										</div>
										<!--end booking-search-->
									</div>
									<!--/span-->
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
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/form-samples.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectparam.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
			FormSamples.init();
			Search.init();
			$(".collapse").click();
		});
		$(function() {
			var custype = $("#select2_sample_custype");
			ajaxLoadParam(custype, 1);
			var type = $("#select2_sample_type");
			ajaxLoadParam(type, 2);
		});
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectcustomer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectdepsemps.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/main_pages/selectcitys.js"></script>
	<!-- END JAVASCRIPTS -->
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		$("#submit-button").click(function(){
			var amThemeEle = $("input[name='amTheme']");
			var amContenEle = $("textarea[name='amConten']");
			var amDateEle = $("input[name='amDate']");
			
			if($.trim(amThemeEle.val())==""){
				swal("提示","公告标题不能为空","error");
				return false;
			}
			
			if($.trim(amContenEle.val())==""){
				swal("提示","公告内容不能为空","error");
				return false;
			}
			
			if($.trim(amDateEle.val())==""){
				swal("提示","请选择公告发布时间","error");
				return false;
			}
		});
	</script>
</body>
<!-- END BODY -->
</html>