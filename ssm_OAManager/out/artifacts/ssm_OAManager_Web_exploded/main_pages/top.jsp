<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="icon" href="favicon.ico" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font_eolqem241z66flxr.css"
	media="all" />
<!-- 导入jquey库文件 -->
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
	<!-- BEGIN TOP NAVIGATION BAR -->
	<div class="navbar-inner">
		<div class="container-fluid">
			<!-- BEGIN LOGO -->
			<a class="brand" href="${pageContext.request.contextPath}/index.jsp">
				<img src="${pageContext.request.contextPath}/media/image/logo.png"
				alt="logo" /> </a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="${pageContext.request.contextPath}/index.jsp"
				class="btn-navbar collapsed" data-toggle="collapse"
				data-target=".nav-collapse"> <img
				src="${pageContext.request.contextPath}/media/image/menu-toggler.png"
				alt="" /> </a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav pull-right">
				<!-- BEGIN 用户登录下拉菜单 -->
				<li class="layui-nav-item showNotice" id="showNotice" pc><a
					href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>公司公告</cite>
				</a>
				</li>
				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <img alt=""
						src="${pageContext.request.contextPath}/${user.emp.empPhotoUrl}"
						onerror="this.src='${pageContext.request.contextPath}/media/image/default-head.png'"
						style="max-height:30px; max-height: 30px;" /> <span
						class="username">用户名:${user.userName}</span> <i
						class="icon-angle-down"></i> </a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/pages_hr/emp.jsp"><i
								class="icon-user"></i> 我的资料</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ResultSession.action"><i
								class="icon-envelope"></i> 我的邮件</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/lock.jsp"><i
								class="icon-lock"></i> 锁屏</a></li>
						<li><a
							href="${pageContext.request.contextPath}/view/user/quitUser.action"><i
								class="icon-key"></i> 注销</a></li>
					</ul>
				</li>
				<!-- END 用户登录下拉菜单 -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
	</div>
	<!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/index.js"></script>

<script type="text/javascript">
	//公告层
	function showNotice() {
		//* /2.准备发送的异步请求
		var url = "${pageContext.request.contextPath}/view/announcement/findByNewnotice.action";
		var bl = "";
		var amconten = "";//内容
		var amtheme = "";//标题
		//jquery实现  post   Ajax请求
		$
				.post(
						url,
						function(data) {
							if (data == "") {
								bl = false;
								amconten = "没有最新公告！";
							} else {
								bl = true;
							}
							var arrayJson = data;
							//遍历json数组
							var $jsons = $(arrayJson);
							if (bl) {
								$jsons.each(function() { //this 当前json对象
									/* $("#emp_id").val(this.empId); */
									amconten = this.amConten;
									amtheme = this.amTheme;
									amdate = this.amDate;
								});
							} else {
								amconten = "没有最新公告！";
							}
							layer
									.open({
										type : 1,
										title : "公司公告", //不显示标题栏
										closeBtn : false,
										area : '520px',
										shade : 0.8,
										id : 'LAY_layuipro', //设定一个id，防止重复弹出
										btn : [ '火速围观' ],
										moveType : 1, //拖拽模式，0或者1
										content : '<div style="padding:50px;text-align:justify; line-height: 22px; text-indent:2em;border-bottom:1px solid #e2e2e2;"><p><span><font color="red"  style="font-weight: 900;">标题：</font></span>'
												+ amtheme
												+ '</p><p><span><font color="blue"  style="font-weight: 900;">内容：</font></span>'
												+ amconten + '</p></div>',
										success : function(layero) {
											var btn = layero
													.find('.layui-layer-btn');
											btn.css('text-align', 'center');
											btn.on("click", function() {
												window.sessionStorage.setItem(
														"showNotice", "true");
											})
											if ($(window).width() > 432) { //如果页面宽度不足以显示顶部“系统公告”按钮，则不提示
												btn.on("click", function() {
													layer.tips('公司公告躲在了这里',
															'#showNotice', {
																tips : 3
															});
												})
											}
										}
									});

						}, "json");// 替代  eval() 

	}
</script>