<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="cn">
<!-- BEGIN HEAD -->
<head>
<title>我的日程</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="/media/ui_css.jsp"></jsp:include>
<link
	href="${pageContext.request.contextPath}/media/css/fullcalendar.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/sweetalert.css" />
</head>

<style>
.fc-event-time :hover {
	font-size: 14pt;
	text-decoration: underline;
	color: blue;
}
</style>

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

				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN STYLE CUSTOMIZER -->
						<jsp:include page="/main_pages/styleset.jsp"></jsp:include>
						<!-- END STYLE CUSTOMIZER -->
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title">
							个人工作 <small>我的日程管理</small>
						</h3>
						<ul class="breadcrumb">
							<li><i class="icon-home"></i> <a
								href="${pageContext.request.contextPath}/index.jsp">我的桌面</a> <i
								class="icon-angle-right"></i>
							</li>
							<li><a
								href="${pageContext.request.contextPath}/sys_schedule/findByScheduleAll.action">日程管理</a>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>

				<div class="row-fluid">
					<div class="portlet box blue calendar">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-reorder"></i>我的日程管理
							</div>
						</div>
						<div class="portlet-body light-grey">
							<div class="row-fluid">
								<div class="span3 responsive" data-tablet="span12 fix-margin"
									data-desktop="span8">
									<!-- BEGIN DRAGGABLE EVENTS PORTLET-->
									<h3 class="event-form-title">常用日程添加</h3>
									<div id="external-events">
										<form class="inline-form">
											<!-- <input type="text" value="" class="m-wrap span12"
												placeholder="常用事件..." id="event_title" /> -->
											<br /> <a
												href="${pageContext.request.contextPath}/pages_personal/public_schedule_add.jsp"
												id="event_add" class="btn green">添加日程</a>
										</form>
										<hr />
										<div id="event_box"></div>
										<c:forEach items="${pageBean}" var="obj" varStatus="sta">
											<input type="hidden" name="sval${sta.index}"
												value="${obj.scheduleDesprict}" />

											<input type="hidden" name="sjval${sta.index}"
												value="${obj.scheduleDate}" />
											<input type="hidden" name="sidjval${sta.index}"
												value="${obj.scheduleId}" />
										</c:forEach>
										<!-- <label for="drop-remove"> <input type="checkbox"
											id="drop-remove" />remove after drop </label> -->
										<hr class="visible-phone" />

									</div>
									<!-- END DRAGGABLE EVENTS PORTLET-->
								</div>
								<div class="span9">
									<div id="calendar" class="has-toolbarss"></div>
								</div>
							</div>
							<!-- END CALENDAR PORTLET-->
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- END 页面 -->
	</div>
	<!-- END 容器 -->
	<jsp:include page="/main_pages/foot.jsp"></jsp:include>
	<jsp:include page="/media/ui_js.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/media/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/media/js/fullcalendar.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			App.init();
			Calendar.init();

		});
	</script>
	<!-- 定时提示框 -->
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
	<!-- 结束 -->

	<script type="text/javascript">
		//事件  备忘录(1)
		var sval = "";//工作
		sval = $(":input[name='sval0']").val();
		if (sval != "") {
			sval;
		}

		var sval1 = "";
		sval1 = $(":input[name='sval1']").val();
		if (sval1 != "") {
			sval1;
		}
		var sval2 = "";
		sval2 = $(":input[name='sval2']").val();
		if (sval2 != "") {
			sval2;
		}

		var sval3 = "";
		sval3 = $(":input[name='sval3']").val();
		if (sval3 != "") {
			sval3;
		}

		var sval4 = "";
		sval4 = $(":input[name='sval4']").val();
		if (sval4 != "") {
			sval4;
		}

		var Calendar = function() {
			return {
				// main function to initiate the module
				init : function() {

					App.addResponsiveHandler(function() {
						Calendar.initCalendar();
					});

					$('.page-sidebar .sidebar-toggler').click(function() {
						Calendar.initCalendar();
					});

					Calendar.initCalendar();
				},

				initCalendar : function() {

					if (!jQuery().fullCalendar) {
						return;
					}

					//获取时间
					var sjval = "";
					sjval = $(":input[name='sjval0']").val();
					if (sjval != "") {
						var rq = sjval;
						//rq = rq.replace(/-/g, "/");
						var date = new Date(rq);
					}
					var sjval1 = "";
					sjval1 = $(":input[name='sjval1']").val();
					if (sjval1 != "") {
						var rq1 = sjval1;
						//rq = rq.replace(/-/g, "/");
						var date1 = new Date(rq1);
					}
					var sjval2 = "";
					sjval2 = $(":input[name='sjval2']").val();
					if (sjval2 != "") {
						var rq2 = sjval2;
						//rq = rq.replace(/-/g, "/");
						var date2 = new Date(rq2);
					}

					var sjval3 = "";
					sjval3 = $(":input[name='sjval3']").val();
					if (sjval3 != "") {
						var rq3 = sjval3;
						//rq = rq.replace(/-/g, "/");
						var date3 = new Date(rq3);
					}
					var sjval4 = "";
					sjval4 = $(":input[name='sjval4']").val();
					if (sjval4 != "") {
						var rq4 = sjval4;
						//rq = rq.replace(/-/g, "/");
						var date4 = new Date(rq4);
					}

					var h = {};

					if (App.isRTL()) {
						if ($('#calendar').parents(".portlet").width() <= 720) {
							$('#calendar').addClass("mobile");
							h = {
								right : 'title, prev, next',
								center : '',
								right : 'agendaDay, agendaWeek, month, today'
							};
						} else {
							$('#calendar').removeClass("mobile");
							h = {
								right : 'title',
								center : '',
								left : 'agendaDay, agendaWeek, month, today, prev,next'
							};
						}
					} else {
						if ($('#calendar').parents(".portlet").width() <= 720) {
							$('#calendar').addClass("mobile");
							h = {
								left : 'title, prev, next',
								center : '',
								right : 'today,month,agendaWeek,agendaDay'
							};
						} else {
							$('#calendar').removeClass("mobile");
							h = {
								left : 'title',
								center : '',
								right : 'prev,next,today,month,agendaWeek,agendaDay'
							};
						}
					}

					var initDrag = function(el) {
						// create an Event Object
						// (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
						// it doesn't need to have a start or end
						var eventObject = {
							title : $.trim(el.text())
						// use the element's text as the event title
						};
						// store the Event Object in the DOM element so we can get to it
						// later
						el.data('eventObject', eventObject);
						// make the event draggable using jQuery UI
						el.draggable({
							zIndex : 999,
							revert : true, // will cause the event to go back to its
							revertDuration : 0
						// original position after the drag
						});
					};

					var addEvent = function(title) {
						title = title.length == 0 ? "Untitled Event" : title;
						var html = $('<div class="external-event label">'
								+ title + '</div>');
						jQuery('#event_box').append(html);
						initDrag(html);
					};

					$('#external-events div.external-event').each(function() {
						initDrag($(this));
					});

					$('#event_add').unbind('click').click(function() {
						var title = $('#event_title').val();
						addEvent(title);
					});

					// predefined events
					$('#event_box').html("");
					var url = "person_calen!ajaxGetEventByEmpId?v="
							+ new Date().valueOf();
					$.getJSON(url, function(d) {
						for ( var int = 0; int < d.length; int++) {
							addEvent(d[int].title);
						}
					});

					$('#calendar').fullCalendar('destroy'); // destroy the calendar
					$('#calendar')
							.fullCalendar(
									{ // re-initialize the calendar
										header : h,
										slotMinutes : 15,
										editable : true,
										droppable : true, // this allows things to be dropped
										// onto the calendar !!!
										drop : function(date, allDay) { // this function is
											// called when something
											// is dropped
											// retrieve the dropped element's stored Event
											// Object
											var originalEventObject = $(this)
													.data('eventObject');
											// we need to copy it, so that multiple events don't
											// have a reference to the same object
											var copiedEventObject = $.extend(
													{}, originalEventObject);

											// assign it the date that was reported
											copiedEventObject.start = date;
											copiedEventObject.allDay = allDay;
											copiedEventObject.className = $(
													this).attr("data-class");
											//var num = Math.round(Math.random()*10+1);
											var num = Math.random() * 10 + 1;
											//alert(num);
											copiedEventObject.backgroundColor = App
													.getLayoutColorCode('purple');

											// render the event on the calendar
											// the last `true` argument determines if the event
											// "sticks"
											// (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
											$('#calendar').fullCalendar(
													'renderEvent',
													copiedEventObject, true);

											// is the "remove after drop" checkbox checked?
											if ($('#drop-remove')
													.is(':checked')) {
												// if so, remove the element from the "Draggable
												// Events" list
												$(this).remove();
											}
										},
										events : [
												{
													title : sval,
													start : date,
													backgroundColor : App
															.getLayoutColorCode('yellow')
												},
												{
													title : sval1,
													start : date1,
													backgroundColor : App
															.getLayoutColorCode('green')
												},
												{
													title : sval2,
													start : date2,
													allDay : false,
													backgroundColor : App
															.getLayoutColorCode('red')
												},
												{
													title : sval3,
													start : date3,
													allDay : false,
													backgroundColor : App
															.getLayoutColorCode('green')
												},
												{
													title : sval4,
													start : date4,
													backgroundColor : App
															.getLayoutColorCode('grey'),
													allDay : false,
												}, ]
									});

				}

			};

		}();

		$(function() {
			$(".fc-event-inner")
					.click(
							function() {
								var resultId = "";
								var result = ($(this).children(
										'.fc-event-title').html());
								if (sval == result) {
									resultId = $(":input[name='sidjval0']")
											.val();
								}
								if (sval1 == result) {
									resultId = $(":input[name='sidjval1']")
											.val();
								}
								if (sval2 == result) {
									resultId = $(":input[name='sidjval2']")
											.val();
								}
								if (sval3 == result) {
									resultId = $(":input[name='sidjval3']")
											.val();
								}
								if (sval4 == result) {
									resultId = $(":input[name='sidjval4']")
											.val();
								}

								swal(
										{
											title : "您确定要删除这条数据",
											type : "warning",
											showCancelButton : true,
											closeOnConfirm : false,
											confirmButtonText : "是的，我要删除",
											confirmButtonColor : "#ec6c62"
										},
										function() {
											//* /2.准备发送的异步请求
											var url = "${pageContext.request.contextPath}/sys_schedule/deleteSchedule.action?id="
													+ resultId;
											//jquery实现  post   Ajax请求
											$
													.post(
															url,
															function(data) {
																if (data == "1") {
																	$(this)
																			.remove();
																	swal(
																			{
																				title : "SUCCESS！",
																				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">删除成功！</span><br/>',
																				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
																				html : true,
																				timer : 5000,
																				showConfirmButton : false
																			},
																			function() {
																				window.location.href = "${pageContext.request.contextPath}/pages_personal/personal_calendars.jsp";
																			});
																}
																if (data == "2") {
																	swal(
																			{
																				title : "权限不足！",
																				text : '<span  style="color:red;font-size: 20px;font-weight: 500;font-weight: 600; ">删除失败！</span><br/>',
																				imageUrl : "${pageContext.request.contextPath}/images/thumbs-up.jpg",
																				html : true,
																				timer : 5000,
																				showConfirmButton : false
																			},
																			function() {
																				window.location.href = "${pageContext.request.contextPath}/pages_personal/personal_calendars.jsp";
																			});
																}
															}, "json");// 替代  eval() 
										});

							});
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>