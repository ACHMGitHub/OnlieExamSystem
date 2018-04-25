<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
<%-- <%@taglib prefix="s" uri="/struts-tags"%> --%>
<!DOCTYPE html>
<html lang="cn">
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
	href="<%=basePath%>media/css/select2_metro.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>media/css/datepicker.css" />
<link href="<%=basePath%>media/css/jquery.fancybox.css" rel="stylesheet" />
<link href="<%=basePath%>media/css/search.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<!-- END PAGE LEVEL STYLES -->
<style type="text/css">
	.d
		{
		border:2px solid #a1a1a1;
		padding:10px 40px; 
		width:350px;
		/* border-radius:25px; */
		
		box-shadow: 10px 10px 5px #888888;
		}
		
		.d{border-radius:5px 5px 5px 5px;} 
		
		.d {

		-webkit-transition-duration: 0.4s; /* Safari */
		
		transition-duration: 0.4s;
		

		}
</style>
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
							流程中心 <small>流程列表页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">流程中心</a> <i
								class="icon-angle-right"></i> <a href="#">流程查看</a>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- END 页面标题-->

				<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-globe"></i>流程列表
						</div>
						<div class="actions">
							<a class="btn red" href="${pageContext.request.contextPath }/flowTemplate_addView.action"> 添加 <i
								class="icon-plus"></i> </a>
							<div class="btn-group">
								<div id="sample_2_column_toggler"
									class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">

								</div>
							</div>
						</div>
					</div>
					<div class="portlet-body">
						<table
							class="table table-striped  table-hover table-full-width"
							id="sample_2">
							<thead>
								<tr>
								<c:forEach items="${flows }" var="flow" varStatus="s">
									<c:if test="${s.count%2==1 }"><tr></c:if>
								
										<td class="d">
										流程名称<input type="text" readonly="readonly" value="${flow.flowName }"/>
										创建时间<fmt:formatDate value="${flow.createDate}"  pattern="yyyy-MM-dd HH:mm:ss"/>
										<br/>
										流程类型<input type="text" readonly="readonly"  value="${flow.flowType.flowTypeName }"/>
										创建用户${flow.user.userName }
										<br/>
											<div style="background-color: #cccccc">
											<a href="#" title="${flow.flowId}" class="user_del"><i class="icon-trash"></i>删除</a>
											</div>
										</td>
										
									<c:if test="${s.count%2==0 }">
									</tr><tr><td></td></tr>
									</c:if>	
								</c:forEach>
							</thead>
							<tbody>

								<!-- begin操作按钮 -->
								<%-- <div class="btn-group" style="margin-bottom: 0px !important;">
									<a class="btn mini green" href="#" data-toggle="dropdown">
										<i class="icon-user"></i>操作<i class="icon-angle-down"></i> </a>
									<ul class="dropdown-menu">
										<li><a
											href="pub_news!findOne?news.id=<s:property value="#m.id"/>">
												<i class="icon-edit"></i>编辑</a>
										</li>
										<li><a
											href="pub_news!del?news.id=<s:property value="#m.id"/>">
												<i class="icon-trash"></i>删除</a>
										</li>
									</ul>
								</div> --%>


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
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/select2.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>media/js/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="<%=basePath%>media/js/app.js"></script>
	<script src="<%=basePath%>media/js/table-advanced.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
		
					$(".user_del").click(
											function() {
												//在当前超链接的祖先元素中查找tr
												var $tr = $(this).parents("tr");
												//在tr下查找第一个td
												//获取td的文本内容
												var adminName = $tr.children("td:eq(1)").text();
												var cId = $(this).attr("title");
												swal(
														{
															title : "您确定要删除"
																	+ [ adminName ]
																	+ "吗？",
															text : "您确定要删除这条数据？",
															type : "warning",
															showCancelButton : true,
															closeOnConfirm : false,
															confirmButtonText : "是的，我要删除",
															confirmButtonColor : "#ec6c62"
														},
														function() {
															window.location.href = "${pageContext.request.contextPath }/flowTemplate_delete.action?flowId="
																	+ cId;
														});

											});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>