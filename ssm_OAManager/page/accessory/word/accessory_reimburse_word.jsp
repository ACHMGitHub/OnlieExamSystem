<%@ page language="java" pageEncoding="UTF-8"%>
<%@page contentType="application/vnd.ms-word;charset=utf-8"%>
<%response.setHeader("Content-disposition","attachment; filename="+request.getAttribute("fileName"));%>
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
	z-index: 9;
}

.tr {
	background-color: #cccccc;
}
</style>
</head>


<body>
	
		<center>
		<div id="div1" class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-globe"></i>
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
				<table cellpadding="0" cellspacing="0"
					width="80%" height="1000px">
					<thead>
						<tr>
							<td colspan="4" align="center">报销申请单</td>
						</tr>
						<tr class="tr">
							<td colspan="4" align="left">基本信息</td>
						</tr>
						<tr>
							<td>申请人</td>
							<td>${user.emp.empName }</td>
							<td>申请部门</td>
							<td>${user.emp.dep.deptName }</td>
						</tr>
						<tr>
							<td>申请类型</td>
							<td colspan="3"><input type="radio" name="reimTypeId"
								value="1" />报销</td>
						</tr>
						<tr>
							<td>申请时间</td>
							<td colspan="3"></td>
						</tr>
						<tr class="tr">
							<td colspan="4" align="left">费用信息</td>
						</tr>
						<tr>
							<td style="height:80px;z-index:10">报销事由</td>
							<td colspan="3" style="height:80px;z-index:10">${reimburse.reContent}</td>
						</tr>
						<tr class="tr">
							<td colspan="4">报销金额</td>

						</tr>
						<tr>
							<td>金额(小写)</td>
							<td>${reimburse.reMoney }
							</td>
							<td>金额(大写)</td>
							<td>
								${money2}
							</td>
						</tr>
					</thead>
				</table>
				
			</div>
	</div>
	</center>
</body>
</html>