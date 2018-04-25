<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>公告详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
<link href="${pageContext.request.contextPath}/media/css/news.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/demo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.flipster.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flipsternavtabs.css">
<!--弹出层 开始 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />
<!-- 结束 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css">
</head>
<!-- 引入jquery的库文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
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
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							OA公告查看 <small>公告查看页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <i class="icon-angle-right"></i>
								<a
								href="${pageContext.request.contextPath}/view/announcement/findAllAnnouncement.action">OA公告管理</a>
								<i class="icon-angle-right"></i> 公告列表</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<!-- page begin -->
				<ul class="tabs">
					<input type="hidden" value="${data}" />
					<c:if test="${data[0]=='' or data[0]==undefined}">
						<div class="span16"
							style="margin-right:0px !important; margin-right: 500px;">
							<div class="top-news">
								<a href="#" class="btn blue"> <span>没有公告</span> <em> <i
										class="icon-tags"></i> </em> <i
									class="icon- icon-bullhorn top-news-icon"></i> </a>
							</div>
						</div>
					</c:if>
					<c:forEach items="${data}" var="obj">
						<li class="tabs__item color1">
							<div class="span16"
								style="margin-right:0px !important; margin-right: 500px;">

								<div class="top-news">
									<a href="#" class="btn blue"> <span>标题：${obj.amTheme}</span>
										<em> <i class="icon-tags"></i> 发布日期：<fmt:formatDate
												value="${obj.amDate}" pattern="yyyy-MM-dd " /> </em> <i
										class="icon- icon-bullhorn top-news-icon"></i> </a>
								</div>
								<div class="news-blocks">
									<h3>
										<em>内容</em>
									</h3>
									<div class="news-block-tags">
										<em>${obj.amConten} </em>
									</div>
								</div>
							</div></li>
					</c:forEach>
					<div class="views-toggle views-toggle--hidden">
						<svg fill="black" viewBox="0 0 24 24"> <path
							d="M16.59 8.59l-4.59 4.58-4.59-4.58-1.41 1.41 6 6 6-6z" /> <path
							d="M0 0h24v24h-24z" fill="none" /> </svg>
					</div>
				</ul>
				<!-- page end -->
			</div>
			<!-- END 页面容器 -->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
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
		src="${pageContext.request.contextPath}/media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/form-samples.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
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
		src="${pageContext.request.contextPath}/main_pages/selectcustomer.js"></script>
	<!-- END JAVASCRIPTS -->
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
					tabs.css({
						'opacity' : '1',
						'box-shadow' : '0 30px 60px rgba(0,0,0,0.4)',
						'cursor' : 'pointer'
					});
					tabs.each(function(index) {
						transY = index * 10;
						scale = 0.5 + index / 25;
						transform($(this), 'translate3d(0,' + transY
								+ 'vh, 0) scale(' + scale + ')');
					});
					toggler.addClass('views-toggle--hidden');
				} else {
					transform(tabs, 'translate3d(0,0,0) scale(1)');
				}
			};
			var switchTabs = function() {
				var selected = $(this);
				var others = selected.siblings('li');
				if (toggled) {
					transition(others,
							'transform 0.3s cubic-bezier(0.755, 0.05, 0.855, 0.06)');
					transform(others, 'translate3d(0, 100%, 0) scale(1)');
					transform(selected, 'translate3d(0,0,0) scale(1)');
					tabs.css({
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
</body>
<!-- END BODY -->
</html>