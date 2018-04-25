<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="cn">
<!-- BEGIN HEAD -->
<head>
  <meta charset="utf-8" />
  <title>邮件详情</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <jsp:include page="/media/ui_css.jsp"></jsp:include>
  <!-- BEGIN PAGE LEVEL STYLES --> 
  <link href="${pageContext.request.contextPath}/media/css/bootstrap-tag.css" rel="stylesheet" type="text/css" /> 
  <link href="${pageContext.request.contextPath}/media/css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" /> 
  <link href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css" rel="stylesheet" /> 
  <link href="${pageContext.request.contextPath}/media/css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" /> 
  <!-- BEGIN:File Upload Plugin CSS files--> 
  <!-- END:File Upload Plugin CSS files--> 
  <link href="${pageContext.request.contextPath}/media/css/inbox.css" rel="stylesheet" type="text/css" /> 
  <!-- END PAGE LEVEL STYLES --> 
  <link href="${pageContext.request.contextPath}/media/css/select2_metro.css"  rel="stylesheet" type="text/css"/> 
  <link href="${pageContext.request.contextPath}/media/swfupload/css/default.css" rel="stylesheet" type="text/css" />
  <script src="${pageContext.request.contextPath}/media/js/jquery-1.8.2.js"></script>
  
<style>
.sel4{
  position:absolute;
  left:430px;
  top:240px;
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
			<div class="container-fluid"> 
		     <!-- BEGIN PAGE HEADER-->
		     <div class="row-fluid"> 
		      <div class="span12"> 
		       <!-- BEGIN STYLE CUSTOMIZER --> 
		       <jsp:include page="/main_pages/styleset.jsp"></jsp:include>
		       <!-- END BEGIN STYLE CUSTOMIZER --> 
		       <!-- BEGIN PAGE TITLE & BREADCRUMB--> 
		       <h3 class="page-title"> 邮箱 <small>我的邮箱</small> </h3>
		       <ul class="breadcrumb"> 
		        <li> <i class="icon-home"></i> <a href="#">信息中心</a> <i class="icon-angle-right"></i> </li> 
		        <li> <a href="#">我的邮箱</a> </li>
		       </ul> 
		       <!-- END PAGE TITLE & BREADCRUMB--> 
		      </div> 
		     </div>
		     <div class="row-fluid inbox"> 
		      <div class="span2"> 
		       <ul class="inbox-nav margin-bottom-10">
		        <li class="compose-btn"> <a href="${pageContext.request.contextPath}/pages_mail/mail_add.jsp" data-title="Compose" class="btn green"> <i class="icon-edit"></i> 写邮件 </a> </li>
		        <li class="draft"><a class="btn" href="${pageContext.request.contextPath}/ReveiceMails.action" data-title="收件箱">收件箱</a><b></b></li> 
		        <li class="sent"><a class="btn" href="${pageContext.request.contextPath}/querySendMails.action" data-title="已发送">已发送</a><b></b></li>
		        <li class="star"><a class="btn" href="${pageContext.request.contextPath}/loginOut.action" data-title="星标邮件">注销</a><b></b></li>
		        <li class="search" style="display:none;"><a class="btn" href="javascript:;" data-title="邮件搜索"></a><b></b></li>
		       </ul> 
		      </div> 
		      <div class="span10"> 
		       <div class="inbox-header"> 
		        <h1 class="pull-left">邮件</h1> 
		       </div> 
		       <div class="inbox-loading">
		  			
		       </div> 
		       <div class="inbox-content"> 
		       </div> 
		      </div> 
		     </div> 
		     <!--  -->
					<!-- START 邮件详情 -->
					<div class="portlet sel4" style="width:880px;">
                    <div class="portlet-title"><div class="caption">
                    <i class="icon-reorder"></i>标题 &nbsp;&nbsp;&nbsp;${mail.subject}
                    </div>
                    <div class="actions">
                    </div>
                    </div>
                    <div class="portlet-title"><div class="caption">
                    <i class="icon-time"></i>发送时间：${mail.time} &nbsp;&nbsp;&nbsp;&nbsp;发件人：${mail.sender}
                    </div>
                    </div>
                    <!-- 添加标签 -->
                     <%-- <c:if test="${mail.sereveicer!=''}">
                    <div class="portlet-title"><div class="caption">
                    <i class="icon-user"></i>收件人：${mail.sereveicer}
                    </div>
                    </div>
                    </c:if> --%>
                    <!--  -->
                    <div class="portlet-body">
                    <font style="font-weight: bolder; font-size:15px; color:#4D82A3;">文本内容：${mail.content}</font>
                    <hr/>
                    <div class="alert alert-info"><button class="close" data-dismiss="alert"></button>
                    <!-- 附件不为空 -->
                    <c:if test="${list!=null && list!=''}">
                    <strong>提醒！</strong> 如下附件单击可以下载！
                    </c:if>
                    <!-- 附件为空 -->
                    <c:if test="${list==null||list==''}">
                    <strong>提醒！</strong> 无附件！
                    </c:if>
                    </div> 
                    <c:if test="${list!=null && list!=''}">
                    <font style="font-weight: bolder; font-size:15px; color:#4D82A3;">附件内容</font><br>
                    </c:if>
                    <c:forEach items="${list}" var="attach">
				    <a class="btn mini green" href="${pageContext.request.contextPath}/HandleAttachments.action?mailId=${attach.msgNum}&bodynum=${attach.bodyNum}&filename=${attach.fileName}" ><i class="icon-file"></i>&nbsp;${attach.fileName}</a>&nbsp;&nbsp;
				    </c:forEach>
			         </div></div>
					<!-- END 邮件详情 -->
		      
		     <!--  -->
		    </div> 
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>

	<jsp:include page="/media/ui_js.jsp"></jsp:include>
  <!-- BEGIN PAGE LEVEL PLUGINS --> 
  <script src="${pageContext.request.contextPath}/media/js/bootstrap-tag.js" type="text/javascript"></script> 
  <script src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js" type="text/javascript"></script> 
  <script src="${pageContext.request.contextPath}/media/js/wysihtml5-0.3.0.js" type="text/javascript"></script> 
  <script src="${pageContext.request.contextPath}/media/js/bootstrap-wysihtml5.js" type="text/javascript"></script> 
  <!-- BEGIN:File Upload Plugin JS files-->  
  <!-- END PAGE LEVEL PLUGINS --> 
  <script src="${pageContext.request.contextPath}/media/js/app.js"></script> 
  <script src="${pageContext.request.contextPath}/media/js/inbox.js?v=<%=Math.random()%>"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			Inbox.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>