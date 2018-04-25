<%@ page language="java" pageEncoding="UTF-8"%>
<%@page contentType="application/vnd.ms-word;charset=gbk"%>
<%response.setHeader("Content-disposition","attachment; filename="+request.getAttribute("fileName2"));%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.in {
	width: 100%;
}

td {
	border-left: 1px solid #cccccc;
	border-top: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	height:40px;
	z-index: 9;
}

.tr {
	background-color: #cccccc;
}
</style>
</head>
<body>
		<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-globe"></i>请假申请表
			</div>
			<div class="actions">
				
				<div class="btn-group">
					<div id="sample_2_column_toggler"
						class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
	
					</div>
				</div>
			</div>
		</div>
		<div class="portlet-body" style="height: 800px">
			<center>
			<table cellpadding="0" width="80%" cellspacing="0" class="table table-striped  table-hover table-full-width" >
				<thead>
				<tr>
					<td  colspan="4" align="center">请假申请表</td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">基本信息</td>
				</tr>
				<tr>
					<td>
					申请人
					</td>
					<td>
						${user.emp.empName }
					</td>
					<td>
					申请部门
					</td>
					<td>
					${user.emp.dep.deptName }
					</td>
				</tr>
				<tr>
					<td>申请类型</td>
					<td colspan="3">
						${askLeave.aflType.aflTypeName}
					</td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">请假详情</td>
				</tr> 
				
				<tr>
					<td colspan="4">请假时间</td>
				</tr>
				<tr>
					<td>${date}</td>
					<td>${date2 }</td>
					<td>共</td>
					<td>${differentDays}天</td>
				</tr>
				<tr>
					<td style="height:80px;z-index:10">请假原由</td>
					<td style="height:80px;z-index:10" colspan="3">
						${askLeave.aflContent }
					</td>
				</tr>
				</thead>
				
			</table>
			</center>
		</div>
	</div>
</body>
</html>
