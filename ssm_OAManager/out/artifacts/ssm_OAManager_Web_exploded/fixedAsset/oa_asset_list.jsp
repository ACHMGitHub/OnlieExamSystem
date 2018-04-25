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
	<title>固定资产管理</title>
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
<script type="text/javascript">
			
	$(function(){
			
			$("#dept_deptId").change(function(){
									$("#user_userId").children("option").each(function(){
											if($(this).val()!=0){
													$(this).remove();
											}
									});
									var url2 = "${pageContext.request.contextPath}/fixedAsset/findByAllU.action?num="+$(this).val();
									$.post(url2, function(data) {
									$(data).each(function(){
										$("#user_userId").append("<option value='"+this.userId+"'>"+this.emp.empName+"</option>");
									});
								}, "json");// 替代  eval() 
			});
	
			var button = $("#submit_asset");
			$(".myModal2Update").click(function(){
						var lang = $(this).attr("lang");
						var title = $(this).attr("title");
						$("select[name='assetNature']").children("option").each(function(){
									$(this).removeAttr("selected");
						   });
						$("#user_userId").children("option").each(function(){
								if($(this).val()!=0){
										$(this).remove();
								}
						});
						
						$("#fort_fortifyTypeId").children("option").each(function(){
							if($(this).val()!=0){
										$(this).remove();
								}
						});
						$("#asset_assetTypeId").children("option").each(function(){
								if($(this).val()!=0){
										$(this).remove();
								}
						});
						$("#dept_deptId").children("option").each(function(){
								if($(this).val()!=0){
										$(this).remove();
								}
						});
					$("#myModalLabel2").html("资产修改");
					change();
					if(lang==1){
							$("#myModalLabel2").html("资产");
							$(":input[name='incompleteRate']").attr("readonly","readonly");
							$(":input[name='assetDescripti']").attr("readonly","readonly");
							$(":input[name='usingDate']").attr("readonly","readonly");
							$(":input[name='depreciationYear']").attr("readonly","readonly");
							$(":input[name='assetMoney']").attr("readonly","readonly");
							$(":input[name='assetName']").attr("readonly","readonly");
							$(":input[name='assetNo']").attr("readonly","readonly");
							$("#submit_asset").remove();
							$(".gray").html("确定");
					}else if(lang==2){
						$("#myModalLabel2").html("资产添加");
						$("#sbmit_asset").prepend(button);
						$(".gray").html("取消");
					}else{
						$("#sbmit_asset").prepend(button);
						$(".gray").html("取消");
					}
						if(lang!=1){
							//* /2.准备发送的异步请求
							var url1 = "${pageContext.request.contextPath}/fixedAsset/findByAllUAFP.action";
							//jquery实现  post   Ajax请求
							$.post(url1, function(data) {
							$(data[0]).each(function(){
									$("#fort_fortifyTypeId").append("<option value='"+this.fortifyTypeId+"'>"+this.fortifyTypeName+"</option>");
							});
							$(data[1]).each(function(){
									$("#asset_assetTypeId").append("<option value='"+this.assetTypeId+"'>"+this.assetTypeName+"</option>");
							});
							$(data[2]).each(function(){
										$("#dept_deptId").append("<option value='"+this.deptId+"'>"+this.deptName+"</option>");
							});
						}, "json");// 替代  eval() 
						if(lang==null){
							var url3 = "${pageContext.request.contextPath}/fixedAsset/findByAllU.action?num="+$(this).attr("title2");
							$.post(url3, function(data1) {
								$(data1).each(function(){
									$("#user_userId").append("<option value='"+this.userId+"'>"+this.emp.empName+"</option>");
								});
							}, "json");// 替代  eval() 
						 	select(title);
						}
					}
						
				 if(lang==1){
					 	//* /2.准备发送的异步请求
						var url2 = "${pageContext.request.contextPath}/fixedAsset/findByAssetId.action?assetNo="+title;
						//jquery实现  post   Ajax请求
						$.post(url2, function(data) {
								$("#user_userId").append("<option value='"+data.user.userId+"'>"+data.user.emp.empName+"</option>");
								$("#fort_fortifyTypeId").append("<option value='"+data.fortifyType.fortifyTypeId+"'>"+data.fortifyType.fortifyTypeName+"</option>");
								$("#asset_assetTypeId").append("<option value='"+data.assetType.assetTypeId+"'>"+data.assetType.assetTypeName+"</option>");
								$("#dept_deptId").append("<option value='"+data.department.deptId+"'>"+data.department.deptName+"</option>");
							$("#user_userId").children("option").each(function(){
								if($(this).val()==data.user.userId){
										$(this).attr("selected","selected");
								}
							});
								
							$("#fort_fortifyTypeId").children("option").each(function(){
									if($(this).val()==data.fortifyType.fortifyTypeId){
										$(this).attr("selected","selected");
									}
							});
							$("#asset_assetTypeId").children("option").each(function(){
										if($(this).val()==data.assetType.assetTypeId){
											$(this).attr("selected","selected");
										}
							});
							$("#dept_deptId").children("option").each(function(){
										if($(this).val()==data.department.deptId){
											$(this).attr("selected","selected");
										}
							});
							$("select[name='assetNature']").children("option").each(function(){
										if($(this).val()==data.assetNature){
											$(this).attr("selected","selected");
										}
							});
							$(":input[name='incompleteRate']").val(data.incompleteRate);
							$(":input[name='assetDescripti']").val(data.assetDescripti);
							$(":input[name='usingDate']").val(data.usingDate);
							$(":input[name='depreciationYear']").val(data.depreciationYear);
							$(":input[name='assetMoney']").val(data.assetMoney);
							$(":input[name='assetName']").val(data.assetName);
							$(":input[name='assetNo']").val(data.assetNo);
							$(":input[name='monthDepreciation']").val(data.monthDepreciation);
						}, "json");// 替代  eval() 
					 }
					
			});
			
			function change(){
					$(":input[name='assetDescripti']").val("");
					$(":input[name='assetDescripti']").removeAttr("readonly");
					$(":input[name='usingDate']").val("");
					$(":input[name='usingDate']").removeAttr("readonly");
					$(":input[name='monthDepreciation']").val("");
					$(":input[name='depreciationYear']").val("");
					$(":input[name='depreciationYear']").removeAttr("readonly");
					$(":input[name='assetMoney']").val("");
					$(":input[name='assetMoney']").removeAttr("readonly");
					$(":input[name='assetName']").val("");
					$(":input[name='assetName']").removeAttr("readonly");
					$(":input[name='assetNo']").val("");
					$(":input[name='assetNo']").removeAttr("readonly");
					$(":input[name='incompleteRate']").val("");
					$(":input[name='incompleteRate']").removeAttr("readonly");
			}
			
			function select(title){
				//* /2.准备发送的异步请求
						var url2 = "${pageContext.request.contextPath}/fixedAsset/findByAssetId.action?assetNo="+title;
						//jquery实现  post   Ajax请求
						$.post(url2, function(data) {
							$("#user_userId").children("option").each(function(){
								if($(this).val()==data.user.userId){
										$(this).attr("selected","selected");
								}
							});
								
							$("#fort_fortifyTypeId").children("option").each(function(){
									if($(this).val()==data.fortifyType.fortifyTypeId){
										$(this).attr("selected","selected");
									}
							});
							$("#asset_assetTypeId").children("option").each(function(){
										if($(this).val()==data.assetType.assetTypeId){
											$(this).attr("selected","selected");
										}
							});
							$("#dept_deptId").children("option").each(function(){
										if($(this).val()==data.department.deptId){
											$(this).attr("selected","selected");
										}
							});
							$("select[name='assetNature']").children("option").each(function(){
										if($(this).val()==data.assetNature){
											$(this).attr("selected","selected");
										}
							});
							$(":input[name='incompleteRate']").val(data.incompleteRate);
							$(":input[name='assetDescripti']").val(data.assetDescripti);
							$(":input[name='usingDate']").val(data.usingDate);
							$(":input[name='depreciationYear']").val(data.depreciationYear);
							$(":input[name='assetMoney']").val(data.assetMoney);
							$(":input[name='assetName']").val(data.assetName);
							$(":input[name='assetNo']").val(data.assetNo);
							$(":input[name='monthDepreciation']").val(data.monthDepreciation);
						}, "json");// 替代  eval() 
			}
	});
</script>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<jsp:include page="/main_pages/top.jsp"></jsp:include>
<!-- BEGIN 容器 -->
<div class="page-container row-fluid">
		<input type="hidden" name="result" value="${result}" />
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
						固定资产管理 <small>固定资产管理页</small>
					</h3>
					<ul class="breadcrumb">
						<li>	<a href="${pageContext.request.contextPath}/index.jsp">系统管理</a>  <i class="icon-angle-right"></i>
								<a href="${pageContext.request.contextPath}/fixedAsset/findAssetByPage.action">固定资产管理</a> 
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
						<i class="icon-globe"></i>固定资产
					</div>
					<div class="actions">
						<div class="btn-group">
							<a  class="btn red myModal2Update" href="#myModal2"  lang="2" data-toggle="modal">新建 <i class="icon-plus"></i></a>
							<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列
								<i class="icon-angle-down"></i> </a>
							<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
								<label><input type="checkbox" checked data-column="0">所属部门</label>
								<label><input type="checkbox" checked data-column="1">资产编号</label>
								<label><input type="checkbox" checked data-column="2">资产名称</label>
								<label><input type="checkbox" checked data-column="3">资产原价(￥)</label>
								<label> <input type="checkbox" checked data-column="4">资产保管人</label>
								<label><input type="checkbox" checked data-column="5">资产性质</label>
								<label><input type="checkbox" checked data-column="6">增加类型</label>
								<label><input type="checkbox" checked data-column="7">增加日期</label>
								<label><input type="checkbox" checked data-column="7">启用日期</label>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover table-full-width"
						id="sample_2">
						<thead>
							<tr>
								<th>所属部门</th>
								<th>资产编号</th>
								<th>资产名称</th>
								<th>资产原价(￥)</th>
								<th>资产保管人</th>
								<th>资产性质</th>
								<th>增加类型</th>
								<th>增加日期</th>
								<th>启用日期</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tablecusfollow">
						<c:forEach items="${pageBean}" var="obj">
								<tr>
									<td>
									${obj.department.deptName }
									</td>
									<td>
									${obj.assetNo }
									</td>
									<td>
									<a class="myModal2Update"  href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.assetNo}">${obj.assetName}</a>
									</td>
									<td>
									${obj.assetMoney }
									</td>
									<td >${obj.user.emp.empName }</td>
									<td ><c:if test="${obj.assetNature==0}">资产</c:if><c:if test="${obj.assetNature==1}">费用</c:if></td>
									<td >${obj.fortifyType.fortifyTypeName }</td>
									<td>
									<fmt:formatDate value="${obj.assetDate}"  pattern="yyyy-MM-dd"/>
									</td>
									<td>
									<fmt:formatDate value="${obj.usingDate}"  pattern="yyyy-MM-dd"/>
									</td>
									<td>
											<!-- begin操作按钮 -->
											<div class="btn-group" style="margin-bottom: 0px !important;">
												<a class="btn mini green" href="#" data-toggle="dropdown">
													<i class="icon-user"></i>操作<i class="icon-angle-down"></i>
												</a>
												<ul class="dropdown-menu">
													<li><a href="#myModal2" data-toggle="modal" title2="${obj.department.deptId}" class="myModal2Update" title="${obj.assetNo}"><i class="icon-edit"></i>编辑</a>
													</li>
													<li><a href="#"  title="${obj.assetNo }" class="user_del"><i class="icon-trash"></i>删除</a></li>
													<li><a href="#myModal2Add" data-toggle="modal" class="myModal2Add"  title="${obj.assetNo }"><i class="icon-edit"></i>维护</a></li>
													<li><a href="#myModal2"  data-toggle="modal"  lang="1" title="${obj.assetNo }" class="myModal2Update"><i class="icon-check"></i>查看</a></li>
													<li><a href="#myModal2Update2"  data-toggle="modal"   lang="${obj.department.deptName }"  title="${obj.assetNo }" class="myModal2Update2"><i class="icon-check"></i>转赠</a></li>
												</ul>
											</div></td>
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
<!-- END JAVASCRIPTS -->
<!-- 定时提示框 -->
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->
<!-- begin 消息提示框 -->
	<form action="${pageContext.request.contextPath}/fixedAsset/saveAsset.action" id="form" method="post">
	<div id="myModal2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;"> 固定资产维护添加</h3>
		</div>
		<div class="modal-body" >
				<div class="row-fluid">
						<div class="span10 ">
							<div class="control-group">
								<label class="control-label">资产编号：</label>
								<div class="controls">
									<input name="assetNo" type="text"
										class="m-wrap span10" placeholder="以字母A开头">
								</div>
							</div>
						</div>
						<!--/span-->
					</div>
					<div class="row-fluid">
						<div class="span10 ">
							<div class="control-group">
								<label class="control-label">资产名称：</label>
								<div class="controls">
									<input name="assetName" type="text"
										class="m-wrap span10" placeholder="必选">
								</div>
							</div>
						</div>
						<!--/span-->
					</div>
					<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">类别：</label>
						<div class="controls">
							<select name="assetType.assetTypeId" id="asset_assetTypeId">
										<option value="0">--请选择--</option>
							</select>
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
							<select name="department.deptId" id="dept_deptId">
										<option value="0">--请选择--</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">资产性质：</label>
						<div class="controls">
							<select name="assetNature" id="assetNatureId">
										<option value="">--请选择--</option>
										<option value="0">资产</option>
										<option value="1">费用</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">增加类型：</label>
						<div class="controls">
							<select name="fortifyType.fortifyTypeId" id="fort_fortifyTypeId">
										<option value="0">--请选择--</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">资产原价：</label>
						<div class="controls">
							<input name="assetMoney" type="text"
								class="m-wrap span10" placeholder="必填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">折旧年限：</label>
						<div class="controls">
							<input name="depreciationYear" type="text"
								class="m-wrap span10" placeholder="必填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">残值率：</label>
						<div class="controls">
							<input name="incompleteRate" type="text"
								class="m-wrap span10" placeholder="必填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">保管人：</label>
						<div class="controls">
							<select name="user.userId" id="user_userId">
										<option value="0">--请选择--</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
				<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">启用时间：</label>
						<div class="controls">
							<input name="usingDate" type="text"
								class="m-wrap span10" placeholder="不填表示未启用"><input type="button"  value="清空"/>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">维护描述：</label>
						<div class="controls">
							<input name="assetDescripti" type="text"
								class="m-wrap span10" placeholder="选填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
		</div>
		<div id="sbmit_asset"  class="modal-footer">
			<button type="submit"  id = "submit_asset" class="btn green submit_property">提交</button>
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	<!-- end 消息提示框 -->
<script type="text/javascript">
	$(function(){
			
			
		function alerts() {
			$.DialogByZ.Close();
		}
			var bl=false;
			$(":input[name='assetNo']").blur(function(){
						//* /2.准备发送的异步请求
							var url1 = "${pageContext.request.contextPath}/fixedAsset/findByAssetId.action?assetNo="+$(this).val();
							//jquery实现  post   Ajax请求
							$.post(url1, function(data) {
									if(data.assetNo==null){
											swal("提示", "编号名可用");
											bl=true;
									}else{
										swal("提示", "编号不可用", "error");		
									}
							}, "json");// 替代  eval() 
			});
		$('.submit_property').click(function(){
			var assetNoEle = $("input[name='assetNo']");
			var assetNameEle = $("input[name='assetName']");
			var assetTypeIdEle = $("#asset_assetTypeId");
			var deptIdEle = $("#dept_deptId");
			var assetNatureIdEle = $("#assetNatureId");
			var fortifyTypeIdEle = $("#fort_fortifyTypeId");
			var assetMoneyEle = $("input[name='assetMoney']");
			var depreciationYearEle = $("input[name='depreciationYear']");
			var incompleteRateEle = $("input[name='incompleteRate']");
			var userIdEle = $("#user_userId");
			
			// 定义正则表达式
			var reg = /^\d*$/;
			if(!bl){ 
				swal("提示", "用户名不可用", "error");
				return false;
			}
			if($.trim(assetNoEle.val())==""){
				swal("提示", "资产编号不能为空", "error"); 
				return false;
			}
			if ($.trim(assetNoEle.val().charAt(0)) != "A") {
				swal("提示", "资产编号必须以A开头", "error");
				return false;
			}
			if($.trim(assetNameEle.val())==""){
				swal("提示", "资产名称不能为空", "error"); 
				return false;
			}
			
			if(assetTypeIdEle.val()==0){
				swal("提示", "请选择类别", "error"); 
				return false;
			}
			
			if(deptIdEle.val()==0){
				swal("提示", "请选择所属部门", "error");
				return false;
			}
			
			if(assetNatureIdEle.val()==""){
				swal("提示", "请选择资产性质", "error");
				return false;
			}
			
			if(fortifyTypeIdEle.val()==0){ 
				swal("提示", "请选择增加类型", "error");
				return false;
			}
			
			if($.trim(assetMoneyEle.val())==""){
				swal("提示", "资产原价不能为空", "error");
				return false;
			}
			
			if(!reg.test(assetMoneyEle.val())){
				swal("提示", "资产原价只能输入数字", "error");
				return false;
			}
			
			if($.trim(depreciationYearEle.val())==""){
				swal("提示", "折旧年限不能为空", "error");
				return false;
			}
			
			if($.trim(incompleteRateEle.val())==""){
				swal("提示", "残值率不能为空", "error");
				return false;
			}
			
			if(userIdEle.val()==0){ 
				swal("提示", "请选择保管人", "error");
				return false;
			}
			return true;
		});
	});
</script>

<!-- begin 消息提示框 -->
	<form action="${pageContext.request.contextPath}/fixedAsset/saveAssetMaintain.action" id="form1" method="post">
	<input type="hidden"  name="massage" value="1"/>
	<input type="hidden"  name="asset.assetNo" value=""/>
	<div id="myModal2Add" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;"> 维护登记</h3>
		</div>
		<div class="modal-body" >
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">维护类型：</label>
						<div class="controls">
							<select name="maintainType.maintainTypeId" id="maintain_maintainTypeId">
										<option value="0">请选择维护类型</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">维护备注：</label>
						<div class="controls">
							<input name="maintainDescripti" type="text"
								class="m-wrap span10" placeholder="选填">
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
			
			<div class="row-fluid">
				<div class="span10 ">
					<div class="control-group">
						<label class="control-label">维护人：</label>
						<div class="controls">
							<select name="user.userId" id="user_userId2">
										<option value="0">--请选择--</option>
							</select>
						</div>
					</div>
				</div>
				<!--/span-->
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn green submit-button">提交</button>
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	<script type="text/javascript">
			$(function(){
					$(".myModal2Add").click(function(){
							$(".gray").html("取消");
							$(":input[name='asset.assetNo']").val($(this).attr("title"));
							//* /2.准备发送的异步请求
							var url1 = "${pageContext.request.contextPath}/fixedAsset/findByAllUAM.action";
							//jquery实现  post   Ajax请求
							$.post(url1, function(data) {
							$(data[0]).each(function(){
									$("#user_userId2").append("<option value='"+this.userId+"'>"+this.userName+"</option>");
							});
							
							$(data[2]).each(function(){
									$("#maintain_maintainTypeId").append("<option value='"+this.maintainTypeId+"'>"+this.maintainTypeName+"</option>");
							});
						}, "json");// 替代  eval() 
					});
			});
	</script>
	<!-- end 消息提示框 -->
	<script type="text/javascript">
		$(function(){
			function alerts() {
				$.DialogByZ.Close();
			}
			
			$('.submit-button').click(function(){
				var maintainTypeIdEle = $("#maintain_maintainTypeId");
				var userIdElement = $("#user_userId2");
				
				if(maintainTypeIdEle.val()==0){
					swal("提示", "请选择维护类型", "error");
					return false;
				}
				
				if(userIdElement.val()==0){
					swal("提示", "请选择维护人", "error");
					return false;
				}
				return true;
			});
		});
	</script>
	
	<!-- begin 消息提示框 -->
	<form action="${pageContext.request.contextPath}/fixedAsset/updateAsset.action" id="form2" method="post">
	<input type="hidden"  name="assetNo" value=""/>
	<div id="myModal2Update2" class="modal hide  fade" style="width:600px;" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		<div class="modal-header ">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h3 id="myModalLabel2"  style="color:black;"> 转赠</h3>
		</div>
		<div class="modal-body" >
			<div class="row-fluid">
						<div class="span6 ">
							<div class="control-group">
								<label class="control-label">部门</label>
								<div class="controls">
									<input name="dept"  type="text" class="m-wrap span8"  readonly="readonly">
								</div>
							</div>
						</div>
						<!--/span-->
						<div class="span6 ">
							<div class="control-group">
								<label class="control-label">受赠部门：</label>
								<div class="controls">
									<select name="department.deptId" id="dept_deptId2">
										<option value="0">--请选择--</option>
							</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">保管人：</label>
								<div class="controls">
								<select name="user.userId" id="user_userId3">
										<option value="0">--请选择--</option>
								</select>
								</div>
							</div>
						</div>
						<!--/span-->
				</div>
		</div>
		<div class="modal-footer">
			<button type="submit" id="submit_increase" class="btn green">转赠</button>
			<button data-dismiss="modal" class="btn gray">取消</button>
		</div>
	</div>
	</form>
	<!-- end 消息提示框 -->
		<script type="text/javascript">
			$(function(){
					$(".myModal2Update2").click(function(){
							$(".gray").html("取消");
								$("#dept_deptId2").children("option").each(function(){
									if($(this).val()!=0){
												$(this).remove();
										}
								});
							$(":input[name='dept']").val($(this).attr("lang"));
							$(":input[name='assetNo']").val($(this).attr("title"));
							//* /2.准备发送的异步请求
							var url1 = "${pageContext.request.contextPath}/fixedAsset/findByAllUAFP.action";
							//jquery实现  post   Ajax请求
							$.post(url1, function(data) {
								$(data[2]).each(function(){
										$("#dept_deptId2").append("<option value='"+this.deptId+"'>"+this.deptName+"</option>");
								});
 							}, "json");// 替代  eval() 
					});
					
				$("#dept_deptId2").change(function(){
									$("#user_userId3").children("option").each(function(){
											if($(this).val()!=0){
													$(this).remove();
											}
									});
							var url2 = "${pageContext.request.contextPath}/fixedAsset/findByAllU.action?num="+$(this).val();
							$.post(url2, function(data) {
								$(data).each(function(){
									$("#user_userId3").append("<option value='"+this.userId+"'>"+this.emp.empName+"</option>");
								});
						}, "json");// 替代  eval() 
					});
			});
	</script>
	
	<script type="text/javascript">
		$(function(){
			function alerts() {
				$.DialogByZ.Close();
			}
			
			$('#submit_increase').click(function(){
				var deptIdElelement = $("#dept_deptId2");
				var user_userId2 = $("#user_userId3");
				if(deptIdElelement.val()==0){
					swal("提示", "请选择受赠部门", "error");
					return false;
				}
				if(user_userId2.val()==0){
					swal("提示", "请选择受赠部门", "error");
					return false;
				}
				return true;
			});
		});
	</script>
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
												var adminName = $tr.children("td:eq(2)").text();
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
															window.location.href = "${pageContext.request.contextPath}/fixedAsset/deleteAsset.action?assetNo="
																	+ cId;
														});

											});
	</script>
</body>
<!-- END BODY -->
</html>