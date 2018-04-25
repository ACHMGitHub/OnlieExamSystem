<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="cn">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>已发邮件</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-tag.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-wysihtml5.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-wysihtml5.css"
	rel="stylesheet" type="text/css" />
<!-- BEGIN:File Upload Plugin CSS files-->
<!-- END:File Upload Plugin CSS files-->
<link href="${pageContext.request.contextPath}/media/css/inbox.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/media/css/select2_metro.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/swfupload/css/default.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/media/js/jquery-1.8.2.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />

<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/media/css/bootstrap-tree.css" />  --%>

<style>
.sel {
	position: absolute;
	left: 390px;
	top: 230px;
}

.sel5 {
	position: absolute;
	left: 410px;
	top: 240px;
}
</style>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<input type="hidden" name="result" value="${result}" />
	<jsp:include page="/main_pages/top.jsp"></jsp:include>
	<!-- BEGIN 容器 -->
	<div class="page-container row-fluid">
		<jsp:include page="/main_pages/leftdel.jsp"></jsp:include>
		<!-- BEGIN 开始页面 -->
		<div class="page-content">
			<div class="container-fluid">
				<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END BEGIN STYLE CUSTOMIZER -->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							邮箱 <small>我的邮箱</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">信息中心</a> <i
								class="icon-angle-right"></i></li>
							<li><a href="#">我的邮箱</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<div class="row-fluid inbox">
					<div class="span2">
						<ul class="inbox-nav margin-bottom-10">
							<li class="compose-btn"><a
								href="${pageContext.request.contextPath}/pages_mail/mail_add.jsp"
								data-title="Compose" class="btn green"> <i class="icon-edit"></i>
									写邮件 </a></li>
							<li class="draft"><a class="btn"
								href="${pageContext.request.contextPath}/ReveiceMails.action"
								data-title="收件箱">收件箱</a><b></b>
							</li>
							<li class="sent"><a class="btn"
								href="${pageContext.request.contextPath}/querySendMails.action"
								data-title="已发送">已发送</a><b></b>
							</li>
							<li class="star"><a class="btn"
								href="${pageContext.request.contextPath}/loginOut.action"
								data-title="星标邮件">注销</a><b></b>
							</li>
							<li class="search" style="display:none;"><a class="btn"
								href="javascript:;" data-title="邮件搜索"></a><b></b>
							</li>
						</ul>
					</div>
					<div class="span10">
						<div class="inbox-header">
							<h1 class="pull-left">邮件</h1>
							<form action="#" class="form-search pull-right">
								<div class="input-append">
									<input class="m-wrap" id="searchmail" type="text"
										placeholder="智能匹配" />
									<button class="btn green" id="btn-searchmail" type="button">搜索</button>
								</div>
							</form>
						</div>
						<div class="inbox-loading"></div>
						<div class="inbox-content"></div>
					</div>
				</div>
				<!--  -->
				<!-- BEGIN 表格列表-->
				<!-- BEGIN 表格列表-->
				<div class="span9 sel" style="width:905px;">
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-globe"></i>发件箱
							</div>
							<!-- <div class="actions">
									<a href="param_type_add.jsp" class="btn red"> 新建 <i
										class="icon-plus"></i> </a>
									<div class="btn-group">
										<a class="btn green" href="#" data-toggle="dropdown">
											改变显示列 <i class="icon-angle-down"></i> </a>
										<div id="sample_2_column_toggler"
											class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
											<label><input type="checkbox" checked data-column="0">序号</label>
											<label><input type="checkbox" checked data-column="1">名称</label>
											<label><input type="checkbox" checked data-column="2">次序</label>
											<label><input type="checkbox" checked data-column="3">删除时间</label>
										</div>
									</div>
								</div> -->
						</div>
						<div class="portlet-body">
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_2">
								<thead>
									<tr>
										<th>收件人</th>
										<th>邮件主题</th>
										<th>发件时间</th>
										<th>邮件详情</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="mail">
										<tr>
											<td>${mail.reveicer}</td>
											<td>${fn:substring(mail.subject,0,10)}${fn:length(mail.subject)>10
												? '...' : ''}</td>
											<td>${mail.time}</td>
											<td><a class="search btn mini green"
												href="${pageContext.request.contextPath}/queryOneSend.action?mailId=${mail.mailId}">
													<i class="icon-search"></i>查看详情 </a> <a href="#"
												title="${mail.mailId}" class="user_del search btn mini red">
													<i class="icon-trash"></i>删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- END 表格列表-->
				<!-- END 表格列表-->
				<!--  -->
			</div>
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>

	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-tag.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/wysihtml5-0.3.0.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-wysihtml5.js"
		type="text/javascript"></script>

	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<!-- BEGIN:File Upload Plugin JS files-->
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/inbox.js?v=<%=Math.random()%>"></script>

	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-tree.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
			Inbox.init();
		});

		var result = "";
		result = $(":input[name='result']").val();
		if (result != null && result != "") {
			swal({
				title : result,
				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'
						+ "删除失败" + '</span><br/>3秒后自动关闭。',
				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
				html : true,
				timer : 3000,
				showConfirmButton : false
			});
		}

		//判断是否删除
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
										window.location.href = "${pageContext.request.contextPath}/deleteSendMail.action?mailId="
												+ cId;
									});

						});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>