<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.in {
	width: 100%;
}

td {
	border-left: 1px solid #cccccc;
	border-top: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	z-index: 9;
}

.tr {
	background-color: #cccccc;
}
</style>
<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/datepicker.css" />
	<link href="<%=basePath%>media/css/search.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL STYLES -->
</head>
<!-- 导入jquery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function(){
	
		$(".form3").bind("click",function(){
			$("#form3").submit();
			$(".input").val("");
		});
	
		/***异步请求******/
  		$.ajax({
  			url:"${pageContext.request.contextPath}/accessory_returnAskLeaveType.action",
  			data:{},
  			type:"post",
  			dataType:"json",//返回数据类型
  			success: function(data){
  				$("[name='aflTypeId']").remove();
  				
  				var span = $("#sp");
  				
  				$(data).each(function(){
  					var radio = $("<label style='display: inline;'><input class='input' type='radio' style='margin: 7px' name='aflTypeId'  value='"+this.aflTypeId+"'/>"+this.aflTypeName+"</label>");
  					
  					span.append(radio);
  				});
  			},
  			error:function(){alert("获取失败！");}
  			
  		});
	});
</script>
<body>
		<div class="portlet box blue">
  		<form id="form3" action="${pageContext.request.contextPath }/accessory_askforleave_add.action"
  		method="post">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-globe"></i>请假申请表
			</div>
			<div class="actions">
				
				<div class="btn-group">
					<div id="sample_2_column_toggler"
						class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
	
					</div>
				</div>
			</div>
		</div>
		<div class="portlet-body" style="height: 800px">
			<table cellpadding="0" cellspacing="0" class="table table-striped  table-hover table-full-width" >
				<thead>
				<tr>
					<td  colspan="4" align="center">请假申请表</td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">基本信息</td>
				</tr>
				<tr>
					<td>
					申请人
					</td>
					<td>
						<input readonly="readonly" class="in" style="height: 40px;" type="text"  value="${user.emp.empName }"/>
					</td>
					<td>
					申请部门
					</td>
					<td>
					<input readonly="readonly" class="in" style="height: 40px;" type="text" name="" value="${user.emp.dep.deptName }"/>
					</td>
				</tr>
				<tr>
					<td>申请类型</td>
					<td colspan="3">
						<!-- <label><input type="radio" name="aflTypeId" value="1" checked="checked"/>事假</label>
						<label><input type="radio" name="aflTypeId"  value="2"/>病假</label>
						<label><input type="radio" name="aflTypeId"  value="3"/>年假</label>
						<label><input type="radio" name="aflTypeId"  value="4"/>婚假</label>
						<label><input type="radio" name="aflTypeId"  value="5"/>探亲假</label>
						<label><input type="radio" name="aflTypeId"  value="6"/>其他</label> -->
						<span id="sp"></span>
					</td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">请假详情</td>
				</tr> 
				
				<tr >
					<td colspan="4">请假时间</td>
				</tr>
				<tr>
					<td><div class="input-append date date-picker" data-date-format="" data-date-viewmode="">
													<input name="aflStartDate"  style="height: 28px;"  class="m-wrap m-ctrl-medium date-picker in input" size="16" type="text" value="${date }" />
													<span class="add-on"><i class="icon-calendar"></i></span>
												</div></td>
					<td><div class="input-append date date-picker" data-date-format="" data-date-viewmode="">
													<input name="aflEndDate" style="height: 28px;"  class="m-wrap m-ctrl-medium date-picker in input" size="16" type="text" value="${date }" />
													<span class="add-on"><i class="icon-calendar"></i></span>
												</div></td>
					<td></td>
					<td><!-- <input style="height: 25px;"  type="text"/>天 --></td>
				</tr>
				<tr>
					<td>请假原由</td>
					<td colspan="3">
						<textarea name="aflContent" class="in input" rows="3" cols="8"></textarea>
					</td>
				</tr>
				
				
				<tr>
					<td colspan="4">
						<div class="form-actions">
									<button type="button" id="submit-button" class="btn green form3"><i class="icon-ok"></i>保存并导出word文档</button>
									<button type="reset" class="btn">重置</button>
									<button type="button" onclick="history.back()" class="btn blue">返回</button>
								</div>
					</td>
				</tr>
				</thead>
				
			</table>
		</div>
		</form>
	</div>
</body>
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
</html>
