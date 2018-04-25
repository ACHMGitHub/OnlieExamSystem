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
	<title>角色管理</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<jsp:include page="/media/ui_css.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
	<link href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css" rel="stylesheet" />
	
	<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
<!-- END PAGE LEVEL STYLES -->
<style type="text/css">
  span{
  
  }
</style>
<!--弹出层 开始 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />

<!-- 结束 -->
</head>
<!-- 引入jquery的库文件 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script> 
<script type="text/javascript">
			
	$(function(){
			var button = $(".submit-button");
			$(".myModal2Update").click(function(){
				var a = $(this);
				var h5 = $("<h5>权限附加：</h5>");
				$("#myModalLabel2").html("角色修改");
					$(":input[name='roleName']").val("");
					$(":input[name='roleDescripti']").val("");
					$(":input[name='roleName']").removeAttr("readonly");
					$(":input[name='roleDescripti']").removeAttr("readonly");
					var div = $("#div");
					div.html("");
					div.append(h5);
					if($(this).attr("lang")==1){
							$("#myModalLabel2").html("系统角色");
							$(":input[name='roleName']").attr("readonly","readonly");
							$(":input[name='roleDescripti']").attr("readonly","readonly");
							$(".submit-button").remove();
							$(".gray").html("确定");
					}else if($(this).attr("lang")==2){
						$("#myModalLabel2").html("角色添加");
						//* /2.准备发送的异步请求
						var url = "${pageContext.request.contextPath}/sys_privilege/findFunctionAll.action";
						//jquery实现  post   Ajax请求
						$.post(url, function(data) {
							$(data).each(function(){
									div.append("<span style='vertical-align: text-top;	margin-top: 60px;'><input type='checkbox' name='funId' value='"+this.funId+"'/>&nbsp;&nbsp;"+this.funName+"&nbsp;&nbsp;</span>");
							});
						}, "json");// 替代  eval() 
				
					}else{
						$(".modal-footer").prepend(button);
						$(".gray").html("取消");
					}
					
					if($(this).attr("lang")!=2||$(this).attr("lang")==""){
						//* /2.准备发送的异步请求
						var url = "${pageContext.request.contextPath}/sys_privilege/findByRoleId.action?id="+$(this).attr("title");
						//jquery实现  post   Ajax请求
						$.post(url, function(data) {
								$("#form").attr("action","${pageContext.request.contextPath}/sys_privilege/updateRole.action");
								$(":input[name='roleId']").val(data[0].roleId);
								$(":input[name='roleName']").val(data[0].roleName);
								$(":input[name='roleDescripti']").val(data[0].roleDescripti);
								if(data[0].functions!=null){
									$(data[0].functions).each(function(){
									     if(this.funName.trim()!=""){
												div.append("<span style='vertical-align: text-top;	margin-top: 60px;'><input type='checkbox' name='funId' value='"+this.funId+"' checked/>&nbsp;&nbsp;"+this.funName+"&nbsp;&nbsp;</span>");
										 }
									});
								}
								if(a.attr("lang")!=1){
									$(data[1]).each(function(){
										div.append("<span style='vertical-align: text-top;	margin-top: 60px;'><input type='checkbox' name='funId' value='"+this.funId+"'/>&nbsp;&nbsp;"+this.funName+"&nbsp;&nbsp;</span>");
									});
								}
						}, "json");// 替代  eval() 
					}
			});
	});
</script>
<!-- END HEAD -->
<!-- BEGIN BODY -->
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
						系统角色管理 <small>系统角色管理页</small>
					</h3>
					<ul class="breadcrumb">
						<li>	<a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a>  <i class="icon-angle-right"></i>
								<a href="${pageContext.request.contextPath}/sys_privilege/findByRolePage.action">系统角色管理</a> 
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
						<i class="icon-globe"></i>系统角色
					</div>
					<div class="actions">
						<div class="btn-group">
							<a id="new-role" class="btn red myModal2Update" lang="2" href="#myModal2" data-toggle="modal">新建 <i class="icon-plus"></i></a>
							<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列
								<i class="icon-angle-down"></i> </a>
							<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
								<label><input type="checkbox" checked data-column="0">序号</label>
								<label><input type="checkbox" checked data-column="1">角色名称</label>
								<label><input type="checkbox" checked data-column="2">角色详细</label>
								<!--<label><input type="checkbox" checked data-column="3">类别描述</label>
								<label> <input type="checkbox" checked data-column="5">收款日期</label>
								<label><input type="checkbox" checked data-column="6">录入人</label> -->
							</div>
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover table-full-width"
						id="sample_2">
						<thead>
							<tr>
								<th>序号</th>
								<th>角色名称</th>
								<th>角色详细</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tablecusfollow">
						<c:forEach items="${pageBean}" var="obj">
								<tr>
									<td>
									${obj.roleId }
									</td>
									<td>
									<a class="myModal2Update"  href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.roleId }">${obj.roleName }</a>
									</td>
									<td>
									${obj.roleDescripti }
									</td>
									<td>
									<!-- begin操作按钮 -->
											<div class="btn-group" style="margin-bottom: 0px !important;">
												<a class="btn mini green" href="#" data-toggle="dropdown">
													<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
									<li><a href="#myModal2" data-toggle="modal" class="role-edit btn mini purple myModal2Update" title="${obj.roleId }"><i class="icon-edit"></i>编辑</a></li>
												<li><a href="#" title="${obj.roleId }" class="btn mini red user_del"><i class="icon-trash"></i>删除</a></li>
												<li><a href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.roleId }" class="btn mini blue myModal2Update"><i class="icon-check"></i>查看</a></li>
												</ul></div>
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

<script type="text/javascript">
	$(function(){
		$('#submit-button').click(function(){
			var roleNameEle = $("input[name='roleName']");
			var roleDescriptiEle = $("input[name='roleDescripti']");
			
			if($.trim(roleNameEle.val())==""){
				swal("提示!", "角色名称不能为空！", "error");
				roleNameEle.focus();
				return false;
			}
			if($.trim(roleDescriptiEle.val())==""){
				swal("提示!", "角色描述不能为空！", "error");
				roleDescriptiEle.focus();
				return false;
			}
			return true;
		});
	});
</script>
<!-- END JAVASCRIPTS -->

<!-- begin 消息提示框 -->
	<form action="${pageContext.request.contextPath}/sys_privilege/saveRole.action" id="form" method="post" onsubmit="return verify()">
	<input type="hidden"  name="roleId" value=""/>
	<div id="myModal2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;">角色添加</h3>
		</div>
		<div class="modal-body" >
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">角色名称：</label>
						<div class="controls">
							<input name="roleName" type="text"
								class="m-wrap span10" placeholder="必填" >
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">角色详细：</label>
						<div class="controls">
							<input name="roleDescripti" type="text"
								class="m-wrap span10" placeholder="选填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			
			<div id="div">
					
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn green submit-button" id="submit-button">提交</button>
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	<!-- end 消息提示框 -->
	<script type="text/javascript">
		var result = "";
		result = $(":input[name='result']").val();
		if (result != null && result != "") {
			swal({
				title : result,
				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">'+result+'</span><br/>3秒后自动关闭。',
				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
				html : true,
				timer : 3000,
				showConfirmButton : false
			});
		}
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
															window.location.href = "${pageContext.request.contextPath}/sys_privilege/deleteRole.action?id="
																	+ cId;
														});

											});
	</script>
</body>
<!-- END BODY -->
</html>