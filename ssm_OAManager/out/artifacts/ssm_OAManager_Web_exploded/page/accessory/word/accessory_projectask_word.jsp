<%@ page language="java" pageEncoding="UTF-8"%>
<%@page contentType="application/msword;charset=utf-8"%>
<%response.setHeader("Content-disposition","attachment; filename="+request.getAttribute("fileName3"));%>
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
			<center>
			<table cellpadding="0" cellspacing="0" width="80%" class="table table-striped  table-hover table-full-width" >
				<thead>
				<tr>
					<td  colspan="4" align="center">项目资金申请</td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">基本信息</td>
				</tr>
				<tr>
					<td>项目名称</td>
					<td colspan="3">
						${projectAsk.projectName }
					</td>
				</tr>
				<tr>
					<td>
					申请人
					</td>
					<td>
						${projectAsk.user.userName }
					</td>
					<td>
					申请部门
					</td>
					<td>
					${projectAsk.user.emp.dep.deptName }
					</td>
				</tr>
				<tr>
					<td>申请时间</td>
					<td colspan="3"></td>
				</tr>
				<tr class="tr">
					<td colspan="4" align="left">费用信息</td>
				</tr> 
				<tr>
					<td style="height:80px;z-index:10">申请事由</td>
					<td style="height:80px;z-index:10" colspan="3">
					${projectAsk.projectContent }
					</td>
				</tr>
				<tr class="tr">
					<td colspan="4">申请金额</td>
					
				</tr>
				<tr>
					<td>金额(小写)</td>
					<td>
					${projectAsk.projectMoney }
					</td>
					<td>金额(大写)</td>
					<td>${money}</td>
				</tr>
				</thead>
				
			</table>
			</center>
		</div>
	</div>
</body>
</html>
