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
	<title>角色授权</title>
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
<script type="text/javascript">
	$(function(){
			$(".myModal2Update").click(function(){
					var h5 = $("<h5>角色详情：</h5>");
					$(":input[name='userName']").val("");
					$(":input[name='empName']").val("");
					$(":input[name='email']").val("");
					$(":input[name='deptName']").val("");
					var div = $("#div");
					div.html("");
					div.append(h5);
					//* /2.准备发送的异步请求
					var url = "${pageContext.request.contextPath}/view/user/findByUserId.action?userId="+$(this).attr("title");
					//jquery实现  post   Ajax请求
					$.post(url, function(data) {
							$(":input[name='userName']").val(data[0].userName);
							$(":input[name='empName']").val(data[0].emp.empName);
							$(":input[name='email']").val(data[0].userEmail);
							$(":input[name='deptName']").val(data[0].dep.deptName);
							$(data[0].roles).each(function(){
										div.append("<span style='vertical-align: text-top;	margin-top: 60px;'>&nbsp;&nbsp;"+this.roleName+"&nbsp;&nbsp;</span>");
							});
					}, "json");// 替代  eval() 
					
					
			});
	});
</script>
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
						角色授权<small>角色授权页</small>
					</h3>
					<ul class="breadcrumb">
						<li>	<a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a>  <i class="icon-angle-right"></i>
								<a href="${pageContext.request.contextPath}/fixedAsset/findAssetUserAll.action">角色授权</a> 
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
						<i class="icon-globe"></i>角色授权
					</div>
					<div class="actions">
						<div class="btn-group">
							<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列
								<i class="icon-angle-down"></i> </a>
							<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
								<label><input type="checkbox" checked data-column="0">账户</label>
								<label><input type="checkbox" checked data-column="1">员工名称</label>
								<label><input type="checkbox" checked data-column="2">邮箱</label>
								<label><input type="checkbox" checked data-column="3">所属部门</label>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover table-full-width"
						id="sample_2">
						<thead>
							<tr>
								<th>账户</th>
								<th>员工名称</th>
								<th>邮箱</th>
								<th>所属部门</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tablecusfollow">
						<c:forEach items="${pageBean.datas}" var="obj">
								<tr>
									<td>
									${obj.userName}
									</td>
									<td>
									<a class="myModal2Update"  href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.userId}">	${obj.emp.empName }</a>
									</td>
									<td>
									${obj.userEmail }
									</td>
									<td >${obj.dep.deptName }</td>
									<td>
										<!-- begin操作按钮 -->
											<div class="btn-group" style="margin-bottom: 0px !important;">
												<a class="btn mini green" href="#" data-toggle="dropdown">
													<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
												<li><a href="#myModal2Update2" data-toggle="modal" class="role-edit btn mini purple myModal2Update2" title="${obj.userId }"><i class="icon-edit"></i>授权</a></li>
												<li><a href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.userId }" class="btn mini blue myModal2Update"><i class="icon-check"></i>查看</a></li>
										</ul>
										</div>
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

<div id="myModal2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;"> 角色授权</h3>
		</div>
		<div class="modal-body" >
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">账户：</label>
						<div class="controls">
							<input name="userName" type="text"
								class="m-wrap span10" placeholder="必填"  readonly="readonly" >
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">员工名称：</label>
						<div class="controls">
							<input name="empName" type="text"
								class="m-wrap span10" placeholder="选填"  readonly="readonly" >
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
				<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">邮箱：</label>
						<div class="controls">
							<input name="email" type="text"
								class="m-wrap span10" placeholder="选填"  readonly="readonly" >
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
				<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">所属部门：</label>
						<div class="controls">
							<input name="deptName" type="text"
								class="m-wrap span10" placeholder="选填"  readonly="readonly" >
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div id="div">
					
			</div>
		</div>
		<div class="modal-footer">
			<button data-dismiss="modal" class="btn gray">确定</button>
		</div>
	</div>
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
				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'+"操作失败！"+'</span><br/>3秒后自动关闭。',
				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
				html : true,
				timer : 3000,
				showConfirmButton : false
			});
		}
	</script>
	<form action="${pageContext.request.contextPath}/view/emp/insertRuMiddle.action" id="form2" method="post">
	<input type="hidden"  name="user.userId" value=""/>
	<div id="myModal2Update2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;">授权</h3>
		</div>
		<div class="modal-body" >
			<div id="div13">
					
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" id="submit_increase" class="btn green">授权</button>
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	
	<script type="text/javascript">
			$(".myModal2Update2").click(function(){
					$(":input[name='user.userId']").val($(this).attr("title"));
					var h5 = $("<h5>角色授权：</h5>");
					var div = $("#div13");
						div.html("");
					div.append(h5);
						//* /2.准备发送的异步请求
					var url = "${pageContext.request.contextPath}/view/user/findByUserId.action?str=1&userId="+$(this).attr("title");
					//jquery实现  post   Ajax请求
					$.post(url, function(data) {
							$(data[0].roles).each(function(){
								  if(this.roleName.trim()!=""){
										div.append("<span style='vertical-align: text-top;	margin-top: 60px;'><input type='checkbox' name='roleId' value='"+this.roleId+"' checked/>&nbsp;&nbsp;"+this.roleName+"&nbsp;&nbsp;</span>");
									}
							});
							$(data[1]).each(function(){
										div.append("<span style='vertical-align: text-top;	margin-top: 60px;'><input type='checkbox' name='roleId' value='"+this.roleId+"'/>&nbsp;&nbsp;"+this.roleName+"&nbsp;&nbsp;</span>");
							});
					}, "json");// 替代  eval() 
			});
	</script>
</body>
<!-- END BODY -->
</html>