<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@	taglib prefix="s" uri="/struts-tags"  %>
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

<!-- 导入jquery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function (){
		var $trs = $(".hi");
		
		$trs.css("display","none");
	
		$("#a").bind("click",function(){
			
			$trs.toggle("slow");
			
			if($(this).text()=="点击展开"){
				$(this).text("点击收拢");
			}
			if($(this).text()=="点击收拢"){
				$(this).text("点击展开");
			}
		});
	
	});
</script>
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
							流程添加 <small>流程添加页</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i> <a href="#">流程中心</a> 
								<i class="icon-angle-right"></i> <a href="#">添加流程</a> 
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
								<div class="caption"><i class="icon-reorder"></i>流程添加</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
							<form action="${pageContext.request.contextPath }/flowTemplate_add.action" method="post" class="form-horizontal">
								<h3 class="form-section">基本信息</h3>
								
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">流程名称</label>
											<div class="controls">
												<input name="flowName" type="text" class="m-wrap span8" placeholder="必填">
											</div>
										</div>
									</div>
									<!--/span-->
									
									
								</div>
								<!-- /row -->
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">流程类型</label>
											<div class="controls">
											
											<select class="span12 " name="flowTypeId" id="select2_sample_customer"  tabindex="1">
												<option value="-1">请选择</option>
												<c:forEach items="${flowTypes }" var="flowType">
													<option value="${flowType.flowTypeId }">${flowType.flowTypeName }</option>
												</c:forEach>
											</select>
											</div>
										</div>
									</div>
									
									
								</div>
								<!--/row-->
							
								<h3 class="form-section">流程步骤</h3>
								
								
								<!--/row-->
								<div class="row-fluid">
									<div>
			
			<div class="table table-responsive">
				<table width="100%" id="sample-table-2" class="table-striped table-bordered table-hover" >				
				<tr>
				<td colspan="2">步骤一
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[0].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select  name="flowLinks[0].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[0].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[0].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[0].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr>
					<td colspan="8"></td>
				</tr>
				
				<tr>
				<td colspan="2">步骤二
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[1].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[1].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[1].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[1].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[1].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				
				<tr>
					<td colspan="8"></td>
				</tr>
				
				<tr>
				<td colspan="2">步骤三
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[2].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[2].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[2].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[2].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[2].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				
				<tr>
					<td colspan="8"></td>
				</tr>
				
				
				<tr>
				<td colspan="2">步骤四
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[3].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[3].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[3].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[3].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[3].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr>
					<td colspan="8"></td>
				</tr>
				
				<tr>
				<td colspan="2">步骤五
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[4].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[4].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[4].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[4].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[4].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr>
					<td colspan="8"><a id="a">点击展开</a></td>
				</tr>
				
				<tr class="hi">
				<td colspan="2">步骤六
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[5].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[5].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[5].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[5].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[5].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr class="hi">
					<td colspan="8"></td>
				</tr>
				
				<tr class="hi">
				<td colspan="2">步骤七
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[6].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[6].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[6].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[6].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[6].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr  class="hi">
					<td colspan="8"></td>
				</tr>
				
				<tr  class="hi">
				<td colspan="2">步骤八
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[7].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[7].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[7].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[7].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[7].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr  class="hi">
					<td colspan="8"></td>
				</tr>
				
				<tr  class="hi">
				<td colspan="2">步骤九
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[8].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[8].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[8].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[8].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[8].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr>
				
				<tr  class="hi">
					<td colspan="8"></td>
				</tr>
				
				
				
				<tr  class="hi">
				<td colspan="2">步骤十
				</td>
				<td colspan="2">
				前一步骤:
				<select name="flowLinks[9].fromStep.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				</td>
				<td colspan="2">下一步骤:</td>
				<td colspan="2">
				<select name="flowLinks[9].toStep1.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[9].toStep2.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select><br/>
				
				<select name="flowLinks[9].toStep3.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				<select name="flowLinks[9].toStep4.stepId">
					<option value="-1">--请选择--</option>
					<c:forEach items="${steps }" var="step">
						<option value="${step.stepId }">${step.stepName }</option>
					</c:forEach>
				</select>
				
				</td>
				</tr><%--  --%>
			</table>
			</div>	
		</div>
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
