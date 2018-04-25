<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'MyJsp2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/media/ui_css.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/datepicker.css" />
	<link href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/media/css/search.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL STYLES -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/demo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.flipster.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flipsternavtabs.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/sweetalert.css" />
  </head>
  <!-- 引入jquery的库文件 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script> 
  <script type="text/javascript">
			
			$(function(){
					$(".personSelect").change(function(){
						if($(this).val()==1){
								$("#personForm").attr("action","${pageContext.request.contextPath}/pages_stationery/savePurchase.action");
								$("#span1").show();
								$("#span2").hide();
						}else if($(this).val()==2){
								$("#personForm").attr("action","${pageContext.request.contextPath}/pages_stationery/saveMaintain.action");	
								$("#span2").show();
								$("#span1").hide();
						}else if($(this).val()==3){
								$("#personForm").attr("action","${pageContext.request.contextPath}/pages_stationery/saveScrap.action");
								$("#span1").show();
								$("#span2").hide();
						}else if($(this).val()==4){
								$("#personForm2").attr("action","${pageContext.request.contextPath}/pages_stationery/saveReceive.action");
						}else if($(this).val()==5){
								$("#personForm2").attr("action","${pageContext.request.contextPath}/pages_stationery/saveBorrow.action");	
						}else if($(this).val()==6){
								$("#personForm2").attr("action","${pageContext.request.contextPath}/pages_stationery/saveGiveback.action");
						}
				});
				
				$(".chirldSelect1").change(function(){
						$(".chirldSelect2").children("option").each(function(){
									if($(this).val()!=-1){
										$(this).remove();
									}
						   });
							//* /2.准备发送的异步请求
							var url = "${pageContext.request.contextPath}/pages_stationery/findBylibararyId.action?statilibraryId="+$(this).val();
							//jquery实现  post   Ajax请求
							$.post(url, function(data) {
								   if(data==1){
											swal({
												title : "权限不足",
												text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">权限不足！</span><br/>3秒后自动关闭。',
												imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
												html : true,
												timer : 3000,
												showConfirmButton : false
											});
									}
								   $(data).each(function(){
								 			 $(".chirldSelect2").append("<option value='"+this.statitypeId+"'>"+this.statitypeName+"</option>");
								   });
									
							}, "json");// 替代  eval() 
				});
				
				$(".chirldSelect2").change(function(){
						$(".chirldSelect3").children("option").each(function(){
									if($(this).val()!=-1){
										$(this).remove();
									}
						   });
							//* /2.准备发送的异步请求
							var url = "${pageContext.request.contextPath}/pages_stationery/findBytypeId.action?statitypeId="+$(this).val();
							//jquery实现  post   Ajax请求
							$.post(url, function(data) {
								   $(data).each(function(){
								   var result = this.stationeryAmount==undefined?0:this.stationeryAmount;
								 			 $(".chirldSelect3").append("<option value='"+this.stationeryId+"'>"+this.stationeryName+"/库存:"+result+"</option>");
								   });
									
							}, "json");// 替代  eval() 
				});
				
					$("#chirldSelect11").change(function(){
							
							$("#chirldSelect22").children("option").each(function(){
										if($(this).val()!=-1){
											$(this).remove();
										}
							   });
								//* /2.准备发送的异步请求
								var url = "${pageContext.request.contextPath}/pages_stationery/findBylibararyId.action?statilibraryId="+$(this).val();
								//jquery实现  post   Ajax请求
								$.post(url, function(data) {
									   $(data).each(function(){
									 			 $("#chirldSelect22").append("<option value='"+this.statitypeId+"'>"+this.statitypeName+"</option>");
									   });
										
								}, "json");// 替代  eval() 
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
							库存维护 <small>库存维护页</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i><a href="${pageContext.request.contextPath}/pages_stationery/findAll.action">办公用品管理</a> 
								<i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/pages_stationery/findAll.action">库存维护</a> 
							</li>
						</ul>
						<!-- END 网页的标题和面包屑-->
					</div>
				</div>
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<!-- 代码部分begin -->
					<ul class="tabs">
						<li class="tabs__item"><jsp:include page="register_add.jsp"></jsp:include></li>
						<li class="tabs__item"><jsp:include page="maintain_add.jsp"></jsp:include></li>
						<li class="tabs__item"><jsp:include page="transfer_lists.jsp"></jsp:include></li>
						<li class="tabs__item"><jsp:include page="status_list.jsp"></jsp:include></li>
						<div class="views-toggle views-toggle--hidden">
											<svg fill="black" viewBox="0 0 24 24">
					 <path d="M16.59 8.59l-4.59 4.58-4.59-4.58-1.41 1.41 6 6 6-6z" />
					<path d="M0 0h24v24h-24z" fill="none" />
				  </svg>
						</div>
					</ul>
				</div>
				</div>
		</div>
   </div>
   	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
		<jsp:include page="/media/ui_js.jsp"></jsp:include>
		<input type="hidden" name="result" value="${result}" />
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/DT_bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/media/js/search.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/form-samples.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/table-advanced.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Search.init();
			TableAdvanced.init();
			FormSamples.init();
			$(".collapse").click();
		});
	</script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/main_pages/selectcustomer.js"></script>
	<!-- END JAVASCRIPTS -->
<script src="../../js/jquery-2.1.1.min.js"></script>
					<script>
						var Tabs = function() {
							var toggler = $('.views-toggle');
							var tabs = $('li.tabs__item');
							var toggled = false;
							var transform = function(el, value) {
								el.css('transform', value);
								el.css('-webkit-transform', value);
								el.css('-ms-transform', value);
							};
							var transition = function(el, value) {
								el.css('transition', value);
								el.css('-webkit-transition', value);
								el.css('-ms-transition', value);
							};
							var moveContent = function() {
								if (!toggled) {
									toggled = true;
								} else {
									toggled = false;
								}
								moveTabs(toggled);
								return false;
							};
							var moveTabs = function(a) {
								var transY, scale;
								if (a) {
									tabs
											.css({
												'opacity' : '1',
												'box-shadow' : '0 30px 60px rgba(0,0,0,0.4)',
												'cursor' : 'pointer'
											});
									tabs.each(function(index) {
										transY = index * 10;
										scale = 0.5 + index / 25;
										transform($(this), 'translate3d(0,'
												+ transY + 'vh, 0) scale('
												+ scale + ')');
									});
									toggler.addClass('views-toggle--hidden');
								} else {
									transform(tabs,
											'translate3d(0,0,0) scale(1)');
								}
							};
							var switchTabs = function() {
								var selected = $(this);
								var others = selected.siblings('li');
								if (toggled) {
									transition(others,
											'transform 0.3s cubic-bezier(0.755, 0.05, 0.855, 0.06)');
									transform(others,
											'translate3d(0, 100%, 0) scale(1)');
									transform(selected,
											'translate3d(0,0,0) scale(1)');
									tabs
											.css({
												'box-shadow' : '0 30px 60px rgba(0,0,0,0.4)',
												'cursor' : 'default'
											});
									toggled = false;
									selected
											.on(
													'transitionend webkitTransitionend',
													function() {
														toggler
																.removeClass('views-toggle--hidden');
														others.css({
															'opacity' : '0'
														});
														transform(others,
																'translate3d(0, 100%, 0) scale(0)');
														transition(others,
																'transform 0.9s cubic-bezier(0.23, 1, 0.32, 1)');
														selected
																.off('transitionend webkitTransitionend');
													});
								}
							};
							var setup = function() {
								toggled = true;
								moveTabs(toggled);
							};
							var init = function() {
								$(document).on('ready', setup);
								toggler.on('click touchstart', moveContent);
								tabs.on('click touchstart', switchTabs);
							};
							return {
								init : init
							};
						}();
						Tabs.init();
					</script>

<script type="text/javascript">
	$(function(){
		/* 代登记 */
		$("#registration").click(function(){
			var personSelectEle = $(".personSelect");
			var chirldSelect1Ele = $(".chirldSelect1");
			var chirldSelect2Ele = $(".chirldSelect2");
			var chirldSelect3Ele = $(".chirldSelect3");
			var userIdEle = $("#user_userId");
			var amountEle = $("input[name='amount']");
			
			// 定义正则表达式
			var reg = /^\d*$/;
			
			if(personSelectEle.val()==-1){ 
				swal("提示", "请选择登记类型", "error");
				return false;
			}
			
			if(chirldSelect1Ele.val()==-1){ 
				swal("提示", "请选择办公用品库", "error");
				return false;
			}
			
			if(chirldSelect2Ele.val()==-1){ 
				swal("提示", "请选择办公用品类别", "error");
				return false;
			}
			
			if(chirldSelect3Ele.val()==-1){ 
				swal("提示", "请选择办公用品", "error");
				return false;
			}
			
			if(userIdEle.val()==-1){ 
				swal("提示", "请选择申请人", "error");
				return false;
			}
			
			if($.trim(amountEle.val())==""){
				swal("提示","申请数量不能为空","error");
				return false;
			}
			
			if(!reg.test(amountEle.val())){
				swal("提示","申请数量只能填数字","error");
				return false;
			}
			return true;
			
		});
		
		/* 调拨 */
		$("#transfer").click(function(){
			var stalibraryNameEle = $("#statilibraryName");
			var stattypeNameEle = $("#statitypeName");
			var stationeryNameEle = $("#stationeryName");
			var stationeryAmount = $("input[name='stationeryAmount']");
			var stalibraryEle = $("#chirldSelect11");
			var statitypeEle = $("#chirldSelect22");
			
			// 定义正则表达式
			var reg = /^\d*$/;
			
			if(stalibraryNameEle.val()==-1){ 
				swal("提示", "请选择办公用品库", "error");
				return false;
			}
			
			if(stattypeNameEle.val()==-1){ 
				swal("提示", "请选择办公用品类别", "error");
				return false;
			}
			
			if(stationeryNameEle.val()==-1){ 
				swal("提示", "请选择办公用品", "error");
				return false;
			}
			
			if($.trim(stationeryAmount.val())==""){
				swal("提示","申请数量不能为空","error");
				return false;
			}
			
			if(!reg.test(stationeryAmount.val())){
				swal("提示","申请数量只能填数字","error");
				return false;
			}
			
			if(stalibraryEle.val()==-1){ 
				swal("提示", "请选择办公用品库", "error");
				return false;
			}
			
			if(statitypeEle.val()==-1){ 
				swal("提示", "请选择办公用品类别", "error");
				return false;
			}
			
			return true;
		});
		
		/* 库存维护 */
		$("#maintenance").click(function(){
			var registerEle = $("#registerType");
			var statilibraryNameEle = $("#sta_statilibraryName");
			var statitypeNameEle = $("#sta_statitypeName");
			var stationeryNameEle = $("#sta_stationeryName");
			var proposerEle = $("#proposerName");
			var amountmainEle = $("#amount");
			
			// 定义正则表达式
			var reg = /^\d*$/;
			
			if(registerEle.val()==-1){ 
				swal("提示", "请选择登记类型", "error");
				return false;
			}
			
			if(statilibraryNameEle.val()==-1){ 
				swal("提示", "请选择办公用品库", "error");
				return false;
			}
			
			if(statitypeNameEle.val()==-1){ 
				swal("提示", "请选择办公用品类别", "error");
				return false;
			}
			
			if(stationeryNameEle.val()==-1){ 
				swal("提示", "请选择办公用品", "error");
				return false;
			}
			
			if(proposerEle.val()==-1){ 
				swal("提示", "请选择申请人", "error");
				return false;
			}
			
			if(registerEle.val()!=2){
				if($.trim(amountmainEle.val())==""){
					swal("提示","申请数量不能为空","error");
					return false;
				}
				
				if(!reg.test(amountmainEle.val())){
					swal("提示","申请数量只能填数字","error");
					return false;
				}
			}
			
			return true;
			
		});
	});
</script>

<script type="text/javascript">
	$(function(){
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
	});
</script>

  </body>
</html>
