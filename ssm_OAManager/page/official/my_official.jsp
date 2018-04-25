<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/datepicker.css" />
<link
	href="${pageContext.request.contextPath }/media/css/jquery.fancybox.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/media/css/search.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->

<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
</head>

<!-- 导入jquery库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function() {
		$(".a").bind("click", function() {
			var $tr = $(this).parent().parent();
			$tr.find("th").first().text();
			var offiId = $tr.find("th").first().text();
			$("[name='offiId']").val(offiId);
		});

		$(".a2")
				.bind(
						"click",
						function() {

							var offiId = $(this).next().val();
							/***异步请求******/
							$
									.ajax({
										url : "${pageContext.request.contextPath}/official_approve_result.action",
										data : {
											"offiId" : offiId
										},
										type : "post",
										dataType : "json",//返回数据类型
										success : function(data) {
											$("#result").text("");
											$("#result").append(data[0]);

											var $atr = $("#atr");
											$(".t").remove();

											$(data[1])
													.each(
															function() {
																var $tr = $("<tr class='t'><td>"
																		+ this.approveIdea
																		+ "</td><td class='atd'>"
																		+ this.agreeOrNot
																		+ "</td><td>"
																		+ this.user.emp.empName
																		+ "</td></tr>");
																$atr.after($tr);
															});

											$(".atd").each(function() {
												if ($(this).text() == "0") {
													$(this).text("");
													$(this).text("同意");
												}
												if ($(this).text() == "1") {
													$(this).text("");
													$(this).text("未同意");
												}
											});
										},
									//error:function(){alert("获取失败！");}

									});
							return;
						});
	});
</script>
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
							公文管理 <small>我的公文页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">公文管理</a> <i
								class="icon-angle-right"></i> <a href="#">我的公文</a>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->
				<div class="row-fluid">
					<div class="span12"></div>
				</div>
				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-globe"></i>公文列表
						</div>
						<div class="actions">
							<a class="btn yellow"
								href="${pageContext.request.contextPath }/my_official.action?status=1">待审公文
							</a> <a class="btn green"
								href="${pageContext.request.contextPath }/my_official.action?status=2">已审公文
							</a>
						</div>

						<div class="actions">
							<div class="btn-group">
								<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列
									<i class="icon-angle-down"></i> </a>
								<div id="sample_2_column_toggler"
									class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
									<label><input type="checkbox" checked data-column="0">公文编号</label>
									<label><input type="checkbox" checked data-column="1">公文名称</label>
									<label><input type="checkbox" checked data-column="2">所属流程</label>
									<label><input type="checkbox" checked data-column="3">创建时间</label>
									<label><input type="checkbox" checked data-column="4">创建用户</label>
									<label><input type="checkbox" checked data-column="5">查看附件</label>
									<label><input type="checkbox" checked data-column="6">审批</label>
									<label><input type="checkbox" checked data-column="7">审批结果</label>
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
									<th>公文编号</th>
									<th>公文名称</th>
									<th>所属流程</th>
									<th>创建时间</th>
									<th>创建用户</th>
									<th>查看附件</th>
									<th>提交</th>
									<th>审批</th>
									<th>审批结果</th>
									<th>删除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${datas }" var="official" varStatus="s">
									<tr>
										<th>${official.offiId }</th>
										<th>${official.offiName }</th>
										<th>${official.flow.flowName }</th>
										<th>${official.offiDate }</th>
										<th>${official.user.userId }</th>
										<th><a
											href="${pageContext.request.contextPath }/official_down.action?offiId=${official.offiId}">
												下载附件 </a></th>
										<th><c:forEach items="${stepInstances }" var="step"
												varStatus="s2">
												<c:if test="${s.count==s2.count }">
													<c:if test="${step.commit==1 }" var="c"></c:if>
												</c:if>
											</c:forEach> <c:if
												test="${twe==1 and (official.offiState==0 or (three==1 and !c )) }">
												<a
													href="${pageContext.request.contextPath }/official_commitView.action?offiId=${official.offiId }">
													<input class="btn green" type="button" value="提交" /> </a>
											</c:if> <%-- <c:if test="${twe==1 and official.offiState==0 }">
									<input class="btn-danger" disabled="disabled" type="button" value="已提交" />
									</c:if> --%></th>
										<th><c:if test="${one==1 }">
												<a class="a" href="#myModal2" data-toggle="modal" lang="1"
													title=""> <input class="btn green" type="button"
													value="审批" /> </a>
											</c:if></th>
										<th><a class="a2" href="#myModal3" data-toggle="modal"
											lang="1" title=""> 查看审批结果 </a> <input type="hidden"
											value="${official.offiId }"> <%--  --%></th>
										<th><c:if
												test="${(official.offiState == 2 or official.offiState == 0) and user.userId == official.user.userId }">
												<a href="#" title="${official.offiId}" class="user_del">删除</a>
											</c:if></th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
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
		src="${pageContext.request.contextPath }/media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/media/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${pageContext.request.contextPath }/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath }/media/js/form-samples.js"></script>
	<script
		src="${pageContext.request.contextPath }/media/js/table-advanced.js"></script>
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
		src="${pageContext.request.contextPath }/main_pages/selectcustomer.js"></script>
	<!-- END JAVASCRIPTS -->

	<form
		action="${pageContext.request.contextPath}/approve_official.action?status=1&app=1"
		id="form" method="post">
		<input type="hidden" name="assetTypeId" value="" />
		<div id="myModal2" class="modal hide  fade" style="width:600px;"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
			aria-hidden="true">
			<div class="modal-header ">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true"></button>
				<h3 id="myModalLabel2" style="color:black;">公文审批</h3>
			</div>
			<div class="portlet-body">
				<table
					class="table table-striped table-bordered table-hover table-full-width"
					id="sample_2">
					<thead>
						<tr>
							<th>审批意见</th>
							<th><input type="text" name="approveIdea" />
							</th>
						</tr>
					</thead>
					<tbody>
						<tr id="trOne">
							<th>是否同意</th>
							<th><label><input type="radio" name="agreeOrNot"
									value="0" />同意</label> <label><input type="radio"
									name="agreeOrNot" value="1" />不同意</label></th>
						</tr>
					</tbody>
				</table>
			</div>
			<input type="hidden" name="offiId" />
			<div class="modal-footer">
				<button type="submit" class="btn green submit-button">审批</button>
				<button data-dismiss="modal" class="btn gray">取消</button>
			</div>
		</div>
	</form>

	<form action="" method="post">
		<div id="myModal3" class="modal hide  fade" style="width:600px;"
			tabindex="-1" role="dialog" aria-labelledby="myModalLabel2"
			aria-hidden="true">
			<div class="modal-header ">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true"></button>
				<h3 id="myModalLabel2" style="color:black;">审批结果</h3>
			</div>
			<div class="portlet-body">
				<table
					class="table table-striped table-bordered table-hover table-full-width"
					id="sample_2">
					<thead>
						<tr>
							<th>审批结果</th>
							<th id="result"></th>
						</tr>
					</thead>
					<tbody>
						<tr id="atr">
							<th>审批意见</th>
							<th>是否同意</th>
							<th>审批人</th>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</form>

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
										window.location.href = "${pageContext.request.contextPath }/official_delete.action?offiId="
												+ cId;
									});

						});
	</script>

</body>
<!-- END BODY -->
</html>