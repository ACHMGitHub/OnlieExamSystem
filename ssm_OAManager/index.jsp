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

<title>首页</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />

<meta content="" name="description" />

<meta content="" name="author" />

<jsp:include page="media/ui_css.jsp"></jsp:include>

<link rel="shortcut icon" href="media/image/favicon.ico" />
<script type="text/javascript">
	function showtime() {
		var today, hour, second, minute, year, month, date;
		var strDate;
		today = new Date();
		var n_day = today.getDay();
		switch (n_day) {
		case 0:
			strDate = "星期日";
			break;
		case 1:
			strDate = "星期一";
			break;
		case 2:
			strDate = "星期二";
			break;
		case 3:
			strDate = "星期三";
			break;
		case 4:
			strDate = "星期四";
			break;
		case 5:
			strDate = "星期五";
			break;
		case 6:
			strDate = "星期六";
			break;
		case 7:
			strDate = "星期日";
			break;
		}
		year = today.getFullYear();
		month = today.getMonth() + 1;
		date = today.getDate();
		hour = today.getHours();
		minute = today.getMinutes();
		second = today.getSeconds();
		if (month < 10)
			month = "0" + month;
		if (date < 10)
			date = "0" + date;
		if (hour < 10)
			hour = "0" + hour;
		if (minute < 10)
			minute = "0" + minute;
		if (second < 10)
			second = "0" + second;
		document.getElementById('time').innerHTML = year + " 年 " + month
				+ " 月 " + date + " 日 " + strDate + " " + hour + ":" + minute
				+ ":" + second; //显示时间 
		setTimeout("showtime();", 1000); //设定函数自动执行时间为 1000 ms(1 s) 
	}
</script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<jsp:include page="main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<jsp:include page="main_pages/leftdel.jsp"></jsp:include>
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
							我的桌面 <small>我的办公信息导航页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <i
								class="icon-angle-right"></i>
							</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<!-- BEGIN 网页内容-->
				<div class="tiles">
					<div class="tile bg-purple"
						url="${pageContext.request.contextPath}/pages_stationery/findAll.action">
						<div class="tile-body">
							<i class="icon-briefcase"></i>
						</div>
						<div class="tile-object">
							<div class="name">办公用品</div>
						</div>
					</div>
					<div class="tile bg-red"
						url="${pageContext.request.contextPath}/fixedAsset/findAssetByPage.action">
						<div class="tile-body">
							<i class="icon-money"></i>
						</div>
						<div class="tile-body">
							<i class="icon-plane"></i>
						</div>
						<div class="tile-object">
							<div class="name">固定资产</div>
						</div>
					</div>
					<div class="tile bg-blue"
						url="${pageContext.request.contextPath}/view/announcement/findAll.action">
						<div class="tile-body">
							<i class="icon-plane"></i>
						</div>
						<div class="tile-object">
							<div class="name">公司公告</div>
						</div>
					</div>
					<div class="tile bg-green"
						url="${pageContext.request.contextPath}/sys_schedule/findBySchedulePage.action">
						<div class="tile-body">
							<i class="icon-calendar"></i>
						</div>
						<div class="tile-object">
							<div class="name">我的日程</div>
							<div class="number">12</div>
						</div>
					</div>
					<div class="tile double bg-blue"
						url="${pageContext.request.contextPath}/pages_mail/mail_login.jsp">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<h4>邮件</h4>
							<p>Re: Metronic v1.2 - Project Update!</p>
							<p>24 March 2013 12.30PM confirmed for the project plan
								update meeting...</p>
						</div>
						<div class="tile-object">
							<div class="name">
								<i class="icon-envelope"></i>
							</div>
							<div class="number">14</div>
						</div>
					</div>
					<div class="tile bg-red"
						url="${pageContext.request.contextPath}/fixedAsset/findAssetAllUserId.action">
						<div class="corner"></div>
						<div class="tile-body">
							<i class="icon-user"></i>
						</div>
						<div class="tile-object">
							<div class="name">我管理的资产</div>
						</div>
					</div>

					<div class="tile double bg-purple"
						url="${pageContext.request.contextPath}/page/accessory/accessory_add.jsp">
						<div class="corner"></div>
						<div class="tile-body">
							<i class="icon-folder-close"></i>
						</div>
						<div class="tile-object">
							<div class="name">我的工作</div>
							<div class="number">43</div>
						</div>
					</div>
					<div class="tile double bg-grey"
						url="${pageContext.request.contextPath}/pages_stationery/findStationeryStatusByUserAll.action">
						<div class="tile-body"
							style="background-image:url(${pageContext.request.contextPath}/media/image/photo2.jpg);height:114px;width: 258px;">
							<div class="name">我管理的办公用品</div>
						</div>
						<div class="tile-object">
							<div class="name">
								<i class="icon-twitter"></i>
							</div>
							<div class="number">
								<span id="time"></span>
							</div>
						</div>
					</div>
					<div class="tile bg-red"
						url="${pageContext.request.contextPath}/lock.jsp">
						<div class="corner"></div>
						<div class="check"></div>
						<div class="tile-body">
							<i class="icon-lock"></i>
						</div>
						<div class="tile-object">
							<div class="name">锁屏</div>
						</div>
					</div>
				</div>
				<br>
				<!-- END 网页内容-->
			</div>
			<!-- END 页面容器-->
			<!-- --------------------------------------------------------- -->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<script src="media/js/app.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			showtime();
			$('.tile').click(function() {
				var url = $(this).attr('url');
				location.href = url;
			});

		});
	</script>



	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>