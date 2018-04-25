<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<title>固定资产管理</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<jsp:include page="/media/ui_css.jsp"></jsp:include>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/DT_bootstrap.css" />
	<link href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css" rel="stylesheet" />

<link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css"  rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<!--弹出层 开始 -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/zdialog.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zdialog.js"></script>
<!--弹出层 结束 -->

</head>
<body>

<div class="mui-content-padded" style="text-align: center;">
	<button id="alertBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">警告消息框</button>
	<button id="confirmBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">确认消息框</button>
	<button id="toastBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">自动消失提示框</button>
	<button id="load" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">加载中</button>
	<div id="info" onclick="$.DialogByZ.Close()">关闭加载</div>
</div>

<script>
///
   $("#alertBtn").click(function(){
	   $.DialogByZ.Alert({Title: "提示", Content: "您的请求失败",BtnL:"确定",FunL:alerts}) 
   })
   $("#confirmBtn").click(function(){
	   $.DialogByZ.Confirm({Title: "", Content: "投资前需开通第三方存管账户</br>确保资金安全",FunL:confirmL,FunR:Immediate})
   })
   $("#toastBtn").click(function(){
	  $.DialogByZ.Autofade({Content: "感谢您对我们的支持"})
   })
   $("#load").click(function(){
	  $.DialogByZ.Loading('image/loading.png') 
   })
///
   function confirmL(){
			$.DialogByZ.Close();
			$.DialogByZ.Alert({Title: "提示", Content: "您要求稍后开通",BtnL:"确定"})
   }
   //
   function alerts(){

	  $.DialogByZ.Close();
   }
   function Immediate(){
	  window.open("http://www.lanrenzhijia.com/")
   }
   

</script>
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
</body>
</html>


