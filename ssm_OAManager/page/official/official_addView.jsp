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
							公文管理 <small>公文添加页</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i> <a href="#">公文管理</a> 
								<i class="icon-angle-right"></i> <a href="#">添加公文</a> 
								<i class="icon-angle-right"></i> <a href="#">选择流程</a> 
								<i class="icon-angle-right"></i> <a href="#">公文添加</a> 
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
								<div class="caption"><i class="icon-reorder"></i>${flow.flowName }公文添加</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
							<form action="${pageContext.request.contextPath }/official_add.action" 
							enctype="multipart/form-data" method="post" class="form-horizontal">
								<h3 class="form-section">基本信息</h3>
								
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">公文名称</label>
											<div class="controls">
												<input name="offiName" type="text" class="m-wrap span8" placeholder="必填">
											</div>
										</div>
									</div>
									<!--/span-->
									
								</div>
								<!-- /row -->
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">所属流程</label>
											<div class="controls">
											<input type="hidden" name="flowName" value="${flow.flowName }">
											<select class="span12 " name="flowId" id="select2_sample_customer"  tabindex="1">
													
													<option value="${flow.flowId }">${flow.flowName }</option>
												
											</select>
											</div>
										</div>
									</div>
									
									
								</div>
								<!--/row-->
							
								<h3 class="form-section">公文附件</h3>
								
								
								<!--/row-->
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">选择附件</label>
											<div class="controls">	
												<input type="file" name="accessory"/>
												<%-- <a href="${pageContext.request.contextPath }/official_selectReimburse.action?flowId=${flow.flowId}&flowName=${flow.flowName }">					
													<input  
													
													<c:if test="${s =='更换附件'}">class="btn green"</c:if>
													class="btn btn-success" type="button" value="${s }"/>
													<input name="reId" type="hidden" value="${reimburse.reId }" />
												</a> --%>		
											</div><br/>
											<label class="control-label">附件名称</label>
											<div class="controls">
												<input name="accessoryName" type="text" class="m-wrap span6" placeholder="必填">
												
											</div>
											<label class="control-label">附件描述</label>
											<div class="controls">
											<textarea name="offiDescripti" rows="8" cols="8"></textarea>
											</div>
										</div>
									</div>
									<!--/span-->
									<div class="span4 ">
										<div class="control-group">
											<label class="control-label">创建时间</label>
											<div class="controls">
												<div class="input-append date date-picker" data-date-format="" data-date-viewmode="">
													<input name="" readonly="readonly"  class="m-wrap m-ctrl-medium date-picker" size="16" type="text" value="${date }" />
													<span class="add-on"><i class="icon-calendar"></i></span>
												</div>
											</div>
										</div>
									</div>
									<!--/span-->
								</div>
								
								<div class="form-actions">
									<button type="submit" id="submit-button" class="btn green"><i class="icon-ok"></i>保存</button>
									<button type="reset" class="btn">重置</button>
									<button type="button" onclick="history.back()" class="btn blue">返回</button>
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
			<!-- --------------------------------------------------------- -->
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器ywj -->
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
		//135074564967 148.5
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
