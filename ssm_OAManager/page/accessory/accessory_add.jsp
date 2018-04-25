<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html lang="cn">

<head>
<meta charset="utf-8" />
<title></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>media/css/select2_metro.css"/>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>media/css/datepicker.css" />
<link href="<%=basePath%>media/css/jquery.fancybox.css" rel="stylesheet" />
<link href="<%=basePath%>media/css/search.css" rel="stylesheet"
	type="text/css" />
<!-- END PAGE LEVEL STYLES -->

	<!-- 定时提示框 -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/css/sweetalert.css" />
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<!-- 结束 -->


<link rel="stylesheet" type="text/css" href="../../css/styles.css"/>

<style type="text/css">
.in {
	width: 100%;
}

td {
	border-left: 1px solid #cccccc;
	border-top: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	z-index: 9;
}

.tr {
	background-color: #cccccc;
}
</style>
</head>

<!-- 导入jquery库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>


<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<!-- ---------------------------------------------- -->
			<!-- BEGIN 页面容器-->
			<div class="container-fluid">
			
			
			<input type="hidden" name="result" value="${result}" />
			
				<!-- BEGIN 页面标题-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN 风格定制 -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END 风格定制 -->
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							我的工作 <small>新建工作页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">我的工作</a> <i
								class="icon-angle-right"></i> <a href="#">新建工作</a>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<div class="row-fluid">
					<!-- 代码部分begin -->
					<ul class="tabs">
						<%-- <li class="tabs__item color1"><c:import
								url="accessory_chuchai.jsp"></c:import></li>
						<li class="tabs__item color1"><c:import
								url="accessory_chuchai.jsp"></c:import></li>
						<li class="tabs__item color1"><c:import
								url="accessory_chuchai.jsp"></c:import></li> --%>
						<li class="tabs__item color1"><c:import
								url="accessory_project_ask.jsp"></c:import></li>
						<li class="tabs__item color1"><c:import
								url="accessory_ask_leave.jsp"></c:import></li>
						<li class="tabs__item color1"><%-- <c:import
								url="accessory_reimburse.jsp"></c:import> --%>
								<jsp:include page="accessory_reimburse.jsp"></jsp:include>
								</li>
						<div class="views-toggle views-toggle--hidden">
							<svg fill="black" viewBox="0 0 24 24">
	 <path d="M16.59 8.59l-4.59 4.58-4.59-4.58-1.41 1.41 6 6 6-6z" />
	<path d="M0 0h24v24h-24z" fill="none" />
  </svg>
						</div>
					</ul>
					<script src="../../js/jquery-2.1.1.min.js"></script>
					<script>
						var Tabs = function() {
							var toggler = $('.views-toggle');
							var tabs = $('li.tabs__item');
							var toggled = false;
							var transform = function(el, value) {
								el.css('transform', value);
								el.css('-webkit-transform', value);
								el.css('-ms-transform', value);
							};
							var transition = function(el, value) {
								el.css('transition', value);
								el.css('-webkit-transition', value);
								el.css('-ms-transition', value);
							};
							var moveContent = function() {
								if (!toggled) {
									toggled = true;
								} else {
									toggled = false;
								}
								moveTabs(toggled);
								return false;
							};
							var moveTabs = function(a) {
								var transY, scale;
								if (a) {
									tabs
											.css({
												'opacity' : '1',
												'box-shadow' : '0 30px 60px rgba(0,0,0,0.4)',
												'cursor' : 'pointer'
											});
									tabs.each(function(index) {
										transY = index * 10;
										scale = 0.5 + index / 25;
										transform($(this), 'translate3d(0,'
												+ transY + 'vh, 0) scale('
												+ scale + ')');
									});
									toggler.addClass('views-toggle--hidden');
								} else {
									transform(tabs,
											'translate3d(0,0,0) scale(1)');
								}
							};
							var switchTabs = function() {
								var selected = $(this);
								var others = selected.siblings('li');
								if (toggled) {
									transition(others,
											'transform 0.3s cubic-bezier(0.755, 0.05, 0.855, 0.06)');
									transform(others,
											'translate3d(0, 100%, 0) scale(1)');
									transform(selected,
											'translate3d(0,0,0) scale(1)');
									tabs
											.css({
												'box-shadow' : '0 30px 60px rgba(0,0,0,0.4)',
												'cursor' : 'default'
											});
									toggled = false;
									selected
											.on(
													'transitionend webkitTransitionend',
													function() {
														toggler
																.removeClass('views-toggle--hidden');
														others.css({
															'opacity' : '0'
														});
														transform(others,
																'translate3d(0, 100%, 0) scale(0)');
														transition(others,
																'transform 0.9s cubic-bezier(0.23, 1, 0.32, 1)');
														selected
																.off('transitionend webkitTransitionend');
													});
								}
							};
							var setup = function() {
								toggled = true;
								moveTabs(toggled);
							};
							var init = function() {
								$(document).on('ready', setup);
								toggler.on('click touchstart', moveContent);
								tabs.on('click touchstart', switchTabs);
							};
							return {
								init : init
							};
						}();
						Tabs.init();
					</script>
					<!-- 代码部分end -->
				</div>
				<!-- BEGIN EXAMPLE TABLE PORTLET-->

				<!-- END EXAMPLE TABLE PORTLET-->
			</div>
			<!-- END 页面容器-->
			<!-- --------------------------------------------------------- -->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript"
		src="<%=basePath%>media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="<%=basePath%>media/js/app.js"></script>
	<script src="<%=basePath%>media/js/form-samples.js"></script>
	<script src="<%=basePath%>media/js/table-advanced.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Search.init();
			TableAdvanced.init();
			FormSamples.init();
			$(".collapse").click();
		});
	</script>
	<script type="text/javascript"
		src="<%=basePath%>main_pages/selectcustomer.js"></script>
		
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
	<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->
</html>