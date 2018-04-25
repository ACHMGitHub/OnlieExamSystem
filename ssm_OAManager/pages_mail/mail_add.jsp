<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8" />
<title>写邮件</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-tag.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/css/bootstrap-wysihtml5.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/css/jquery.fancybox.css"
	rel="stylesheet" />
<!-- BEGIN:File Upload Plugin CSS files-->
<!-- END:File Upload Plugin CSS files-->
<link href="${pageContext.request.contextPath}/media/css/inbox.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/media/css/select2_metro.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/media/uploadify/uploadify.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/media/js/jquery-1.8.2.js"></script>
<!-- 定时提示框 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<!-- 结束 -->	

</head>
<style type="text/css">
.row-fluid {
	margin-bottom: 10px;
}

.receive label {
	float: left;
	margin-top: 10px;
}

.receive input {
	float: left;
}

#title {
	margin-left: 38px;
}

.success-upload {
	display: none;
}
</style>

<style>
.sel4 {
	position: absolute;
	left: 430px;
	top: 200px;
}
</style>

<body>
	<input type="hidden" id="cuo" value="${cuo}" />
	<input type="hidden" id="dui" value="${dui}" />
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
						<h3 class="page-title">
							邮箱 <small>我的邮箱</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a href="#">信息中心</a> <i
								class="icon-angle-right"></i></li>
							<li><a href="#">我的邮箱</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<div class="row-fluid inbox">
					<div class="span2">
						<ul class="inbox-nav margin-bottom-10">
							<li class="compose-btn sel2"><a
								href="${pageContext.request.contextPath}/pages_mail/mail_add.jsp"
								data-title="Compose" class="btn green"> <i class="icon-edit"></i>
									写邮件 </a></li>
							<li class="draft sel3"><a class="btn"
								href="${pageContext.request.contextPath}/ReveiceMails.action"
								data-title="收件箱">收件箱</a><b></b>
							</li>
							<li class="sent"><a class="btn"
								href="${pageContext.request.contextPath}/querySendMails.action"
								data-title="已发送">已发送</a><b></b>
							</li>
							<li class="star"><a class="btn"
								href="${pageContext.request.contextPath}/loginOut.action"
								data-title="星标邮件">注销</a><b></b>
							</li>
							<li class="search" style="display:none;"><a class="btn"
								href="javascript:;" data-title="邮件搜索"></a><b></b>
							</li>
						</ul>
					</div>
					<div class="span10">
						<div class="inbox-header">
							<h1 class="pull-left">邮件</h1>
							<!-- <form action="#" class="form-search pull-right"> 
		         <div class="input-append"> 
		          <input class="m-wrap" id="searchmail" type="text" placeholder="智能匹配" /> 
		          <button class="btn green" id="btn-searchmail" type="button">搜索</button> 
		         </div> 
		        </form>  -->
						</div>
						<div class="inbox-loading"></div>
						<div class="inbox-content"></div>
					</div>
				</div>
				<!-- 写邮件 -->
				<form method="post" enctype="multipart/form-data" id="frm"
					action="${pageContext.request.contextPath}/sendEmails.action">
					<div class="sel4" style="width:850px;">
						<div class="row-fluid">
							<div class="span12 receive">
								<input type="hidden" id="hd1" name="reveicer" /> <input
									type="hidden" id="hd2" name="reveicerAddr"> <label
									class="control-label">收件人:</label> <input type="hidden"
									id="select2_sample5" class="span11 select2 m-wrap"
									placeholder="请选择收件人" />
							</div>
							<div class="span12 receive">
								<input type="hidden" id="hd3" name="sereveicer" /> <input
									type="hidden" id="hd4" name="sereveicerAddr"> <label
									class="control-label">抄送人:</label> <input type="hidden"
									id="select3_sample5" class="span11 select2 m-wrap" value=""
									placeholder="请选择抄送人" />
							</div>

							<div class="span12 receive">
								<input type="hidden" id="hd5" name="anreveicer" /> <input
									type="hidden" id="hd6" name="anreveicerAddr"> <label
									class="control-label">暗送人:</label> <input type="hidden"
									id="select4_sample5" class="span11 select2 m-wrap" value=""
									placeholder="请选择暗送人" />
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12 receive">
								<label class="control-label">主题:</label> <input type="text"
									name="subject" class="span11 m-wrap" value=""
									placeholder="不能超过100字" />
							</div>
						</div>


						<div class="row-fluid">
							<div class="span12">
								<input type="hidden" name="content" id="con" /> <label
									class="control-label">正文:</label>
								<textarea rows="30" cols="50" id="TextArea1"></textarea>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<input type="file" name="fileUp">附件不能超过10M大小,支持单个文件
								<div id="fileQueue"></div>
								<a class="btn green" id="submit-button" href="#">邮件发送</a> <a
									class="btn purple" href="#"
									onclick="changeUrl('${pageContext.request.contextPath}');">保存到草稿箱</a>
							</div>
						</div>
					</div>
				</form>
				<!--  -->
			</div>
		</div>
		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>

	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-tag.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/wysihtml5-0.3.0.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/bootstrap-wysihtml5.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/media/uploadify/jquery.uploadify.min.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/media/js/inbox.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/select2.min.js"></script>
	<script type="text/javascript">
		var tafss;
		$(function() {
			App.init();
			CKEDITOR.replace('TextArea1');
			var url = "${pageContext.request.contextPath}/queryUser.action";
			$.post(url, function(backdata) {
				var tags = "";
				var data = eval("(" + backdata + ")");
				for ( var o in data) {
					tags += data[o].userName + "|" + data[o].userEmail + ",";
				}

				tafss = tags.split(",");
				$("#select2_sample5").select2({
					tags : tafss
				});

				$("#select3_sample5").select2({
					tags : tafss
				});

				$("#select4_sample5").select2({
					tags : tafss
				});
			});
		});
	</script>


	<script type="text/javascript">
		$(function() {
			//获得所有的值
			function changes() {
				var username1 = $("#select2_sample5").val();
				var all1 = username1.split(",");
				var reveicer = "";
				var reveicerAddr = "";
				//获取收件人名字字符串
				for ( var i = 0; i < all1.length; i++) {
					if (i == all1.length - 1) {
						reveicer += all1[i].substring(0, all1[i].indexOf("|"));
					} else {
						reveicer += all1[i].substring(0, all1[i].indexOf("|"))
								+ ",";
					}
				}
				$("#hd1").val(reveicer);
				//获取收件人地址字符串
				for ( var j = 0; j < all1.length; j++) {
					if (j == all1.length - 1) {
						reveicerAddr += all1[j]
								.substring(all1[j].indexOf("|") + 1);
					} else {
						reveicerAddr += all1[j]
								.substring(all1[j].indexOf("|") + 1)
								+ ",";
					}
				}
				$("#hd2").val(reveicerAddr);

				//抄送人
				var username2 = $("#select3_sample5").val();
				var all2 = username2.split(",");
				var sereveicer = "";
				var sereveicerAddr = "";
				//获取抄送人名字字符串
				for ( var x = 0; x < all2.length; x++) {
					if (x == all2.length - 1) {
						sereveicer += all2[x]
								.substring(0, all2[x].indexOf("|"));
					} else {
						sereveicer += all2[x]
								.substring(0, all2[x].indexOf("|"))
								+ ",";
					}
				}
				//赋值
				$("#hd3").val(sereveicer);
				//获取抄送人地址字符串
				for ( var y = 0; y < all2.length; y++) {
					if (y == all2.length - 1) {
						sereveicerAddr += all2[y].substring(all2[y]
								.indexOf("|") + 1);
					} else {
						sereveicerAddr += all2[y].substring(all2[y]
								.indexOf("|") + 1)
								+ ",";
					}
				}

				$("#hd4").val(sereveicerAddr);
				//暗送人
				var username3 = $("#select4_sample5").val();

				var all3 = username3.split(",");
				var anreveicer = "";
				var anreveicerAddr = "";
				//获取暗送人名字字符串
				for ( var z = 0; z < all3.length; z++) {
					if (z == all3.length - 1) {
						anreveicer += all3[z]
								.substring(0, all3[z].indexOf("|"));
					} else {
						anreveicer += all3[z]
								.substring(0, all3[z].indexOf("|"))
								+ ",";
					}
				}

				$("#hd5").val(anreveicer);
				//获取暗送人地址字符串
				for ( var t = 0; t < all3.length; t++) {
					if (t == all3.length - 1) {
						anreveicerAddr += all3[t].substring(all3[t]
								.indexOf("|") + 1);
					} else {
						anreveicerAddr += all3[t].substring(all3[t]
								.indexOf("|") + 1)
								+ ",";
					}
				}

				$("#hd6").val(anreveicerAddr);

				//正文
				var content = CKEDITOR.instances.TextArea1.getData();
				$("#con").val(content);
			}

			$("#submit-button").click(function() {
				changes();
				$("#frm").submit();
			});

			function changeUrl(url) {
				changes();
				$("#frm").attr("action", url + "/deletePartUser.action")
						.submit();
			}
		});
	</script>
	
	<script type="text/javascript">
	$(function() {
		var cuo = "";
		cuo = $("#cuo").val();
		if (cuo != null && cuo != "") {
			swal("失败!", "邮件发送失败！", "error");
		}
		var dui = "";
		dui = $("#dui").val();
		if (dui != null && dui != "") {
			swal("成功!", "邮件发送成功！", "success");
		}
	});
</script>

</body>
</html>
