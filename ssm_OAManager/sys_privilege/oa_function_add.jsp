<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="cn">
 <!--<![endif]-->
 <!-- BEGIN HEAD -->
 <head> 
  <meta charset="utf-8" /> 
  <title>功能</title> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport" /> 
  <meta content="" name="description" /> 
  <meta content="" name="author" /> 
  <!-- BEGIN PAGE LEVEL STYLES -->
  <jsp:include page="/media/ui_css.jsp"></jsp:include> 
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/media/css/select2_metro.css" /> 
  <!-- END PAGE LEVEL STYLES --> 
  <!--弹出层 开始 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zdialog.css" />
<!-- 结束 --> 
  <!-- 引入jquery的库文件 -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script> 
  
 </head>
 <!-- END HEAD --> 
 <body class="page-header-fixed">
  <!-- BEGIN BODY -->  
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
       <jsp:include page="/main_pages/styleset.jsp"></jsp:include> 
       <!-- BEGIN 网页的标题和面包屑--> 
       <h3 class="page-title"> 功能新增 <small>权限功能新增</small> </h3> 
       <ul class="breadcrumb"> 
        <li><i class="icon-home"></i> <a href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <i class="icon-angle-right"></i> <a href="${pageContext.request.contextPath}/sys_privilege/findByFunPage.action">功能管理</a> <i class="icon-angle-right"></i> <a href="index.html">功能新增</a></li> 
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
          <i class="icon-reorder"></i>功能新增 
         </div> 
         <div class="tools"> 
          <a href="javascript:;" class="collapse"></a> 
          <a href="javascript:;" class="reload"></a> 
          <a href="javascript:;" class="remove"></a> 
         </div> 
        </div> 
        <div class="portlet-body form"> 
         <!-- BEGIN FORM--> 
         <c:if test="${function == null }"><!-- 添加 -->
         <form action="${pageContext.request.contextPath}/sys_privilege/saveFun.action" method="post" class="form-horizontal"> 
          </c:if>
          <c:if test="${function != null }"><!-- 修改 -->
         <form action="${pageContext.request.contextPath}/sys_privilege/updateFun.action" method="post" class="form-horizontal"> 
          </c:if>
          <input type="hidden" name="funId" value="${function.funId }">
          <h3 class="form-section">基本信息</h3> 
          <div class="row-fluid"> 
           <div class="span6 "> 
            <div class="control-group"> 
             <label class="control-label">功能名称</label> 
             <div class="controls"> 
              <input type="text" name="funName" class="m-wrap span12" placeholder="必填" value="${function.funName }" />
             </div> 
            </div> 
           </div> 
          </div> 
          <!-- /row --> 
         <div class="row-fluid"> 
           <div class="span6 "> 
            <div class="control-group"> 
             <label class="control-label">功能菜单</label> 
             <div class="controls"> 
              <input type="text" name="funUrl" class="m-wrap span12" placeholder="必填" value="${function.funUrl }" />
             </div> 
            </div> 
           </div> 
          </div> 
          <!--/row--> 
         <div class="row-fluid"> 
           <div class="span6 "> 
            <div class="control-group"> 
             <label class="control-label">功能描述</label> 
             <div class="controls"> 
              <input type="text" name="funDescripti" class="m-wrap span12" placeholder="可填" value="${function.funDescripti }" />
             </div> 
            </div> 
           </div> 
          </div> 
          <!--/row--> 
         
          <!--/row--> 
          	<div class="form-actions">
				<button type="submit" id="submit-button" class="btn green"><i class="icon-ok"></i>保存</button>
				<button type="reset" class="btn">重置</button>
				<button type="button" onclick="history.back()" class="btn blue">返回</button>
			</div>
         </form> 
         <!--  END FORM--> 
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
  <script type="text/javascript" src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
  <!-- END PAGE LEVEL PLUGINS --> 
  <script src="${pageContext.request.contextPath}/media/js/app.js"></script>
  <script>
		jQuery(document).ready(function() {
			App.init();
		});
  </script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/zdialog.js"></script>
  <script type="text/javascript">
  	$(function(){
  		function alerts() {
			$.DialogByZ.Close();
		}
	
		$('#submit-button').click(function(){
			var funNameEle = $("input[name='funName']");
			
			var funUrlEle = $("input[name='funUrl']");
			var funDescriptiEle = $("input[name='funDescripti']");
			if($.trim(funNameEle.val())==""){
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "功能名称不能为空",
					BtnL : "确定",
					FunL : alerts
				});
				funNameEle.focus();
				return false;
			}
			if($.trim(funUrlEle.val())==""){
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "功能菜单不能为空",
					BtnL : "确定",
					FunL : alerts
				});
				funUrlEle.focus();
				return false;
			}
			if($.trim(funDescriptiEle.val())==""){
				$.DialogByZ.Alert({
					Title : "提示",
					Content : "功能描述不能为空",
					BtnL : "确定",
					FunL : alerts
				});
				funDescriptiEle.focus();
				return false;
			}
			return true;
		});
  	});
  </script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/main_pages/selectcategories.js"></script>
  <!-- END JAVASCRIPTS -->  
  <!-- END BODY -->  
 </body>
</html>