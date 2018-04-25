<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/datepicker.css" />
	<link href="<%=basePath%>media/css/search.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL STYLES -->
	<style type="text/css">
		body{
			font-family: cursive;
		}
		
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
		
		.d:hover {
		
		background-color: #bebebe; /* Green */
		
		color: black;
		
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
							公文管理 <small>选择流程</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i> <a href="#">公文管理</a> 
								<i class="icon-angle-right"></i> <a href="#">添加公文</a> 
								<i class="icon-angle-right"></i> <a href="#">选择流程</a> 
							</li>
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
								<div class="caption"><i class="icon-reorder"></i>选择流程</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
							<form action="${pageContext.request.contextPath }/" method="post" class="form-horizontal">
								<h3 class="form-section">流程列表</h3>
								
								<div class="row-fluid">
									<!-- <div class="span6 ">
													<div class="control-group" style="width: 100%">
														<label class="control-label">流程名称</label>
														<div class="controls">
															
															<input name="flowName" type="text" class="m-wrap span12" placeholder="搜索..." >
														</div>
													</div>
					
									</div> -->
									<!--/span-->
									
									
								</div>
								<!-- /row -->
								<c:forEach items="${flows }" var="flow">
									<a href="${pageContext.request.contextPath }/official_addView.action?flowId=${flow.flowId}&flowName=${flow.flowName }">
									<div class="row-fluid" id="d2" >
										<div class="span6 ">
											<div class="control-group">
												<div  class="d" style=" width: 100%" >
													<img style="display: inline;" alt="" width="50px" height="50px" src="${pageContext.request.contextPath }/img/doc.png">&nbsp;&nbsp;
													<div style="display: inline;">${flow.flowName }</div>
												</div>
											</div>
										</div>			
									</div>
									</a>
								</c:forEach>
								
								
								

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
			<!-- --------------------------------------------------------- -->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="<%=basePath%>media/js/select2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/search.js"></script>  
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="<%=basePath%>media/js/app.js"></script>
	<script src="<%=basePath%>media/js/form-samples.js"></script>   
	<script>
		jQuery(document).ready(function() {
			App.init();
			Search.init();
			FormSamples.init();
		});
	</script>
	<script type="text/javascript" src="<%=basePath%>main_pages/selectcustomer.js"></script>
	<!-- END JAVASCRIPTS -->


</body>

<!-- END BODY -->

</html>
