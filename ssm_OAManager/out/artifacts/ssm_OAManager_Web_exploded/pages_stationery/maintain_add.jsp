<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			<div class="span12">
						<!-- BEGIN SAMPLE FORM PORTLET-->   
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>库存维护</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
							<form id="personForm" action="crm_cont!add" method="post" class="form-horizontal">
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">登记类型：</label>
											<div class="controls">
											<select class="personSelect" id="registerType" class="span12 "   tabindex="1">
												<option value="-1">请选择</option>
												<option value="1">采购入库</option>
												<option value="2">维护</option>
												<option value="3">报废</option>
											</select>
											</div>
										</div>
									</div>
								</div>
								<!-- /row -->
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">办公用品库：</label>
											<div class="controls">
												<select class="chirldSelect1" id="sta_statilibraryName" class="span12 " name="stationery.statilibraryId"  tabindex="1">
												<option value="-1">请选择</option>
												<c:forEach items="${stas}"  var="sta">
														<option value="${sta.statilibraryId}">${sta.statilibraryName}</option>
												</c:forEach>
											</select>
											</div>
										</div>
									</div>
								</div>
								<!--/row-->
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">办公用品类别：</label>
											<div class="controls">  
												<select class="chirldSelect2" id="sta_statitypeName" class="span12 " name="contact.crmCustomer.id"  tabindex="1">
													<option value="-1">请选择</option>
												</select>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">办公用品：</label>
											<div class="controls">  
												<select class="chirldSelect3" id="sta_stationeryName" class="span12 " name="stationery.stationeryId"  tabindex="1">
													<option value="-1">请选择</option>
												</select>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">申请人：</label>
											<div class="controls">  
												<select id="proposerName" class="span12 " name="proposerName.userId"  tabindex="1">
													<option value="-1">请选择</option>
													<c:forEach items="${users}"  var="user">
														<option value="${user.userId }">${user.emp.empName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<span id="span1">
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">申请数量：</label>
											<div class="controls">  
												<input type="text" name="amount"  class="span6 " id="amount"/>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">备注：</label>
											<div class="controls">  
												<textarea name="desprict" rows="5" cols="10"></textarea>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								</span>
								<span id="span2"  style="display: none;">
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">维护开始时间：</label>
											<div class="controls">  
												<input type="text"  name="startDate" value=""/>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">维护结束时间：</label>
											<div class="controls">  
												<input type="text"  name="endingDate" value=""/>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">备注：</label>
											<div class="controls">  
												<textarea rows="5" cols="10"></textarea>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								</span>
								<div class="form-actions">
									<button type="submit" id="maintenance"  class="btn green"><i class="icon-ok"></i>保存</button>
									<button type="reset" class="btn">重置</button>
								</div>
							</form>
							<!-- END FORM-->                     
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
					</div>