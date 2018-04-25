<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
	<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption"> <i class="icon-globe"></i>办公用品</div>
						<div class="actions">
							<div class="btn-group">
								<a class="btn green" href="#" data-toggle="dropdown"> 改变显示列 <i class="icon-angle-down"></i> </a>
								<div id="sample_2_column_toggler" class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
									<label><input type="checkbox" checked data-column="0">办公用品</label>
									<label><input type="checkbox" checked data-column="1">类型</label>
									<label><input type="checkbox" checked data-column="2">申请人</label>
									<label><input type="checkbox" checked data-column="3">数量</label>
									<label><input type="checkbox" checked data-column="4">操作时间</label>
									<label><input type="checkbox" checked data-column="5">操作人</label>
									<label><input type="checkbox" checked data-column="6">备注</label>
									<label><input type="checkbox" checked data-column="7">附加信息</label>
								</div>
							</div>
						</div>
					</div>
					<div class="portlet-body">
						<table class="table table-striped table-bordered table-hover table-full-width" id="sample_2">
							<thead>
								<tr>
									<th>办公用品</th>
									<th>类型</th>
									<th>申请人</th>
									<th>数量</th>
									<th>操作时间</th>
									<th>操作人</th>
									<th>备注</th>
									<th>附加信息</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageBean }"  var="obj"> 
									<tr >
										<td>${obj.stationery.stationeryName }</td>
										<td>${obj.registerType }</td>
										<td>${obj.proposerName.emp.empName}</td>
										<td><c:if test="${obj.amount!=null }">${obj.amount }</c:if><c:if test="${obj.amount==null }">-</c:if></td>
										<td><fmt:formatDate value="${obj.oparateDate }"  pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${obj.oparateName.emp.empName}</td>
										<td>${obj.desprict }</td>
										<td>${obj.additionMassage }</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
