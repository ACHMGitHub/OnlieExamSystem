<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c" %>
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
<link rel="stylesheet" href="<%=basePath%>media/css/DT_bootstrap.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/datepicker.css" />
<link href="<%=basePath%>media/css/search.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->

<style>
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
<!-- 导入jquery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	function selectEmp(position,num,i){
		
		/***异步请求******/
  		$.ajax({
  			url:"${pageContext.request.contextPath}/official_commit_selectEmp.action",
  			data:{"posName":position,"offiId":i},
  			type:"post",
  			dataType:"json",//返回数据类型
  			success: function(data){
  				var $trOne = $("#trOne");
  				
  				$(".t").remove();
  				
				for(var i = 0;i<data.length;i++){
					var $tr = $("<tr data-dismiss='modal' class='t' ><td>"+data[i].empId+"</td><td>"+data[i].empName+"</td><td></td><td></td></tr>");
   					$trOne.after($tr);
  				}
  				
	    		$(".t").bind("click",function(){
	    			var empId = $(this).find("td").first().text();
	    			var empName =  $(this).find("td:eq(1)").text();
	    			var posName =  $(this).find("td:eq(3)").text();
	    			
	    			if($(".pos").size()>1){
	    				
	    				var $select = $("#p"+num);
	    				$select.text(empName);
	    				$select.val(empId);
	    				
	    			}else{
	    				$(".sel").val(empId);
	    				$(".sel").text(empName);
	    			}
	    			
	    			
	    		});
	   		    				
  			},
  			error:function(){alert("获取失败！");}
  			
  		});
  		return;
}
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
			<!-- BEGIN 页面容器-->
			<div class="container-fluid" >
				<!-- BEGIN 页面标题-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN 风格定制 -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END 风格定制 -->
						<!-- BEGIN 网页的标题和面包屑-->
						<h3 class="page-title">
							公文管理<small>公文提交页</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="index.html">公文管理</a>
								<i class="icon-angle-right"></i> <a href="index.html">我的公文</a> <i
								class="icon-angle-right"></i> <a href="index.html">提交公文</a> 
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
								<div class="caption">
									<i class="icon-reorder"></i>提交公文
								</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form action="${pageContext.request.contextPath }/official_commit.action" method="post" class="form-horizontal">
									<h3 class="form-section">公文路由</h3>
									<input type="hidden" value="${flowinstance.flowInstanceId }" name="flowInstanceId"/>
									<input type="hidden" value="${official.offiId }" name="offiId"/>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<label >当前步骤：</label>
												<c:forEach items="${nowSteps }" var="nowStep">
													<div class="row-fluid" id="d2" >
																<div  class="d" style=" width: 100%" >
																	<img style="display: inline;" alt="" width="50px" height="50px" src="${pageContext.request.contextPath }/img/j.jpg">&nbsp;&nbsp;
																	<div style="display: inline;">${nowStep.stepName }</div>
																	<%-- <div style="display: inline;"><li style="display: inline;"><i class=" icon-male"></i></li>指派人:${nowStep.stepAppoint }</div> --%>
																</div>
													</div>		
												</c:forEach>
												<div class="row-fluid" id="d2" >
															<div  class="d" style=" width: 100%" >
																<img style="display: inline;" alt="" width="50px" height="50px" src="${pageContext.request.contextPath }/img/j.jpg">&nbsp;&nbsp;
																<div style="display: inline;">${nowStep.stepName }</div>
																<input name="stepId" type="hidden" value="${nowStep.stepId }"/>
																<%-- <div style="display: inline;"><li style="display: inline;"><i class=" icon-male"></i></li>指派人:${nowStep.stepAppoint }</div> --%>
															</div>
												</div>	
											</div>
										</div>
										
									</div>
									
									<hr/>
									<div class="row-fluid">
										<div class="span6 ">
											<div class="control-group">
												<label >下一步骤：</label>
												<c:forEach items="${toSteps }" var="toStep" varStatus="s">
													<div class="row-fluid" id="d2" >
																<div  class="d" style=" width: 100%" >
																	<img style="display: inline;" alt="" width="50px" height="50px" src="${pageContext.request.contextPath }/img/j.jpg">&nbsp;&nbsp;
																	<input type="hidden" name="stepInstances[${s.index }].step.stepId" value="${toStep.stepId }" />
																	<div  style="display: inline;">${toStep.stepName }</div>
																	<div class="pos"  style="display: inline;"><i class=" icon-male"></i>指派人----><b><span>${toStep.stepAppoint }</span></b></div>
																	<select  name="stepInstances[${s.index }].emp.empId">
																		<option id="p${s.index }" class="sel"></option>
																	</select>
																	<a onclick="selectEmp('${toStep.stepAppoint}','${s.index }','${official.offiId }')" href="#myModal2"  data-toggle="modal"  lang="1" title="">选择员工</a>
																</div>
													</div>		
												</c:forEach>
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
		</div>
		<!-- END 页面 -->
	</div>
	
	
<!-- begin 消息提示框 -->
	<form action="" id="form" method="post">
	<input type="hidden"  name="assetTypeId" value=""/>
	<div id="myModal2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;">选择指派人</h3>
		</div>
		<div class="portlet-body">
			<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
				<thead>
					<tr>
						<th>员工编号</th>
						<th>员工名称</th>
						<th>部门</th>
						<th>职位</th>
					</tr>
				</thead>
				<tbody>
					<tr id="trOne">
						<th colspan="4"></th>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<!-- <button type="submit" class="btn green submit-button">提交</button> -->
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	<!-- end 消息提示框 -->
	
	
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="<%=basePath%>media/js/DT_bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/select2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=basePath%>media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="<%=basePath%>media/js/app.js"></script>
	<script type="text/javascript" src="<%=basePath%>main_pages/selectdepsemps.js"></script>
	<script type="text/javascript" src="<%=basePath%>main_pages/selectposition.js"></script>
	<script type="text/javascript" src="<%=basePath%>main_pages/selectparam.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Search.init();
			ajaxLoadPosition($('#positionselect'));
			$('#positionselect').change(function(){
				var id=$(this).val();
				var url="../pages_hr/hr_post!ajaxLoadPostByPositionId?id="+id+"&v="+new Date().valueOf();
				$.getJSON(url,function(d){
					var chtml="";
					for ( var int = 0; int < d.length; int++) {
						chtml+="<option value='"+d[int].postId+"'>"+d[int].postName+"</option>";
					}
					$('#postselect').html(chtml);
				});
			});
			var role = $('#roleselect');
			var roleurl="../pages_sys/sys_role!ajaxLoadSysRole?v="+new Date().valueOf();
			$.getJSON(roleurl,function(d){
				var chtml="";
				for ( var int = 0; int < d.length; int++) {
					chtml+="<option value='"+d[int].roleid+"'>"+d[int].rolename+"</option>";
				}
				role.append(chtml);
			});
			var emplevel = $('#emplevel');
			ajaxLoadParam(emplevel,11);
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>