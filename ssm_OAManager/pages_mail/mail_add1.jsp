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
  <!-- END PAGE LEVEL STYLES --> 
  <link href="${pageContext.request.contextPath}/media/css/select2_metro.css"  rel="stylesheet" type="text/css"/> 
  <link href="${pageContext.request.contextPath}/media/uploadify/uploadify.css" type="text/css"  rel="stylesheet"/>
  <script src="${pageContext.request.contextPath}/media/js/jquery-1.8.2.js"></script>
  
<style type="text/css">
 .row-fluid {margin-bottom:10px;}
 .receive label {float: left; margin-top:10px;}
 .receive input {float: left;}
 #title {margin-left:38px;}
 .success-upload{display: none; }
</style>
  
<style>
.sel4{
  position:absolute;
  left:430px;
  top:240px;
}
.sel7{
  position:absolute;
  left:500px;
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
		        <li class="compose-btn sel2"> <a href="javascript:;" data-title="Compose" class="btn green"> <i class="icon-edit"></i> 写邮件 </a> </li>
		        <li class="draft sel3"><a class="btn" href="javascript:;" data-title="收件箱">收件箱</a><b></b></li> 
		        <li class="sent sel2"><a class="btn" href="javascript:;" data-title="已发送">已发送</a><b></b></li>
		        <!-- <li class="star"><a class="btn" href="javascript:;" data-title="星标邮件">星标邮件</a><b></b></li> -->
		        <!-- <li class="trash"><a class="btn" href="javascript:;" data-title="已删除">已删除</a><b></b></li> -->
		        <li class="search" style="display:none;"><a class="btn" href="javascript:;" data-title="邮件搜索"></a><b></b></li>
		       </ul> 
		      </div> 
		      <div class="span10"> 
		       <div class="inbox-header"> 
		        <h1 class="pull-left">邮件</h1> 
		        <form action="#" class="form-search pull-right"> 
		         <div class="input-append"> 
		          <input class="m-wrap" id="searchmail" type="text" placeholder="智能匹配" /> 
		          <button class="btn green" id="btn-searchmail" type="button">搜索</button> 
		         </div> 
		        </form> 
		       </div> 
		       <div class="inbox-loading">
		  			
		       </div> 
		       <div class="inbox-content"> 
		       </div> 
		      </div> 
		     </div> 
		     <!--  -->
		     <!-- 写邮件 -->
		 <div class="sel7">  
		<div class="row-fluid" style="width:800px;">
		<div class="span12 receive">
		    <label class="control-label">收件人:</label>
		    <input type="hidden" id="select2_sample5" class="span11 select2 m-wrap" value="" placeholder="请选择收件人" />
	     </div>
	     
	     <div class="span12 receive">
		    <label class="control-label">抄送人:</label>
		    <input type="hidden" id="select3_sample5" class="span11 select2 m-wrap" value="" placeholder="请选择抄送人" />
	     </div>
	     
	     <div class="span12 receive">
		    <label class="control-label">暗送人:</label>
		    <input type="hidden" id="select4_sample5" class="span11 select2 m-wrap" value="" placeholder="请选择暗送人" />
	     </div>
	     </div>
	     
	     
	    <div class="row-fluid" style="width:800px;">
		<div class="span12 receive">
		    <label class="control-label">主题:</label>
		    <input type="text" id="title" class="span11 m-wrap" value="" placeholder="不能超过100字"/>
	     </div>
	     </div> 
	     
	     
	     <div class="row-fluid" style="width:800px;"> 
			<div class="span12">
				<label class="control-label">正文:</label>
	  			<textarea rows="30" cols="50" id="TextArea1"></textarea>
	  		</div>
	  	</div>
	  	<div class="row-fluid">
	      <div class="span12">
	       	 <input type="file" id="file" name="filePath" onchange="getvl(this)"><!-- 附件不能超过5M大小 -->
			  <div id="fileQueue"></div>
			  <a class="btn green" id="submit-button" href="javascript:;">邮件发送</a>
			 <!--  <a class="btn blue" href="javascript:$('#uploadify').uploadify('upload','*')">开始上传</a>
			  <a class="btn purple" href="javascript:$('#uploadify').uploadify('cancel')">取消所有上传</a> -->
	      </div>
	    </div>
	    </div>
	    
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/media/js/bootstrap-tag.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/media/js/wysihtml5-0.3.0.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/media/js/bootstrap-wysihtml5.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/media/uploadify/jquery.uploadify.min.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script> 
	<script src="${pageContext.request.contextPath}/media/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/inbox.js"></script> 
	<script src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
  	<script type="text/javascript">
  	var tafss;
  	$(function(){
  		App.init();
	  	CKEDITOR.replace('TextArea1');
  		var url="${pageContext.request.contextPath}/queryUser.action";
		$.post(url,function(backdata){
			var tags="";
		    var data = eval("("+backdata+")");
		    for(var o in data) {
               tags+=data[o].userName+"|"+data[o].userEmail+",";
            }
		    
		    tafss=tags.split(",");
		  	$("#select2_sample5").select2({
		        tags:tafss
		    });
		    
		    $("#select3_sample5").select2({
		        tags:tafss
		    });
		    
		    $("#select4_sample5").select2({
		        tags:tafss
		    });
		});
		
		$("#submit-button").click(function(){
		    //收件人
			var username1=$("#select2_sample5").val();
			
			var all1 = username1.split(",");
			var reveicer="";
			var reveiceAddr="";
			//获取收件人名字字符串
			for(var i=0; i < all1.length; i++){
				if(i==all1.length-1){
					reveicer+=all1[i].substring(0,all1[i].indexOf("|"));
				}else{
					reveicer+=all1[i].substring(0,all1[i].indexOf("|"))+",";
				} 
			}
			//获取收件人地址字符串
			for(var j=0;j<all1.length;j++){
			  if(j==all1.length-1){
			   reveiceAddr+=all1[j].substring(all1[j].indexOf("|")+1);
			  }else{
			   reveiceAddr+=all1[j].substring(all1[j].indexOf("|")+1)+",";
			  
			  }
			} 
			
			//抄送人
			var username2 = $("#select3_sample5").val();
			
			var all2 = username2.split(",");
			var sereveicer = "";
			var sereveicerAddr = "";
			//获取抄送人名字字符串
			for(var x=0;x<all2.length;x++){
			   if(x==all2.length-1){
					sereveicer+=all2[x].substring(0,all2[x].indexOf("|"));
				}else{
					sereveicer+=all2[x].substring(0,all2[x].indexOf("|"))+",";
				} 
			}
			//获取抄送人地址字符串
			for(var y=0;y<all2.length;y++){
			  if(y==all2.length-1){
			   sereveicerAddr+=all2[y].substring(all2[y].indexOf("|")+1);
			  }else{
			   sereveicerAddr+=all2[y].substring(all2[y].indexOf("|")+1)+",";
			  }
			} 
			
			//暗送人
			var username3 = $("#select4_sample5").val();
			
			var all3 = username3.split(",");
			var anreveicer = "";
			var anreveicerAddr = "";
			//获取暗送人名字字符串
			for(var z=0;z<all3.length;z++){
			 if(z==all3.length-1){
					anreveicer+=all3[z].substring(0,all3[z].indexOf("|"));
				}else{
					anreveicer+=all3[z].substring(0,all3[z].indexOf("|"))+",";
				} 
			}
			//获取暗送人地址字符串
			for(var t=0;t<all3.length;t++){
			  if(t==all3.length-1){
					anreveicerAddr+=all3[t].substring(all3[t].indexOf("|")+1);
				}else{
					anreveicerAddr+=all3[t].substring(all3[t].indexOf("|")+1)+",";
				} 
			}
			alert(anreveicerAddr);
			//标题
			var subject=$("#title").val();
			//正文
			var content=CKEDITOR.instances.TextArea1.getData();
			
			var filePath = $("#uploadify").val();
			
			
			$.ajax({
				async:false,
				cache:false,
				type:"post",
				url:"${pageContext.request.contextPath}/sendEmails.action",
				data:{
				    "reveicer":reveicer,
				    "reveiceAddr":reveiceAddr,
				    "sereveicer":sereveicer,
				    "sereveicerAddr":sereveicerAddr,
				    "anreveicer":anreveicer,
				    "anreveicerAddr":anreveicerAddr,
					"subject":subject,
					"content":content,
					"filePath":filePath,
				},
				dataType:"text",
				success:function(cuo){
					if(cuo=="success"){
						//$('.success-upload').removeClass("success-upload");
						//alert("邮件发送成功,如果有附件请上传附件!");
						//$('.success-upload').click();
						//$('#uploadify').uploadify('upload','*');
						alert("邮件发送成功！");
					}
				},
				error:function(){
					alert("邮件发送失败！");
				}
			});
		});
	});
	//*.rar;*.7z;*.zip;*.jpg;*.png;*.gif;*.avi,*.rmvb,*.3gp,*.flv,*.mp3,*.wav,*.krc,*.lrc,*.doc,*.docx,*.xls,*.ppt,*.pdf,*.chm
 <%--  $(function(){  
         $("#uploadify").uploadify({      
            'debug'     : false, //开启调试  
            'auto'           : false, //是否自动上传     
            'swf'            : '<%=basePath%>media/uploadify/uploadify.swf',  //引入uploadify.swf    
            'uploader'       : 'mail_atta',//请求路径    
            'queueID'        : 'fileQueue',//队列id,用来展示上传进度的    
            'width'     : '75',  //按钮宽度    
            'height'    : '24',  //按钮高度  
            'queueSizeLimit' : 3,  //同时上传文件的个数    
            'fileTypeDesc'   : '邮箱文件',    //可选择文件类型说明  
            'fileTypeExts'   : '*.*', //控制可上传文件的扩展名    
            'multi'          : true,  //允许多文件上传   
            'buttonText'     : '附件上传',//按钮上的文字 
            'fileSizeLimit' : '5MB', //设置单个文件大小限制     
            'fileObjName' : 'uploadify',  //<input type="file"/>的name
            'method' : 'post',    
            'removeCompleted' : true,//上传完成后自动删除队列    
            'onFallback':function(){      
                alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");     
            },   
            'onUploadSuccess' : function(file, data, response){//单个文件上传成功触发  
                //data就是action中返回来的数据 
            },'onQueueComplete' : function(){//所有文件上传完成 
                alert("文件上传成功!");
                location.href="mail_flow.jsp";
                }
            });  
     });  --%>
  	</script>	
		      
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