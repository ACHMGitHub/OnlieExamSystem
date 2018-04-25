<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
					<div class="span12">
						<!-- BEGIN SAMPLE FORM PORTLET-->   
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>代登记</div>
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
							<form id="personForm2" action="crm_cont!add" method="post" class="form-horizontal">
								<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">登记类型：</label>
											<div class="controls">
											<select class="personSelect" class="span12 "   tabindex="1">
												<option value="-1">请选择</option>
												<option value="4">领用</option>
												<option value="5">借用</option>
												<option value="6">归还</option>
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
												<select class="chirldSelect1" class="span12 " name="contact.crmCustomer.id"  tabindex="1">
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
												<select class="chirldSelect2"  class="span12 " name="contact.crmCustomer.id"  tabindex="1">
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
												<select class="chirldSelect3"  class="span12 " name="stationery.stationeryId"  tabindex="1">
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
												<select  class="span12 " id="user_userId" name="proposerName.userId"  tabindex="1">
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
								<div class="row-fluid">
									<div class="span4 ">
									<div class="control-group">
											<label class="control-label">申请数量：</label>
											<div class="controls">  
												<input type="text"  name="amount" value=""  class="span9"/>
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
								<div class="form-actions">
									<button type="submit" id="registration"  class="btn green"><i class="icon-ok"></i>保存</button>
									<button type="reset" class="btn">重置</button>
								</div>
							</form>
							<!-- END FORM-->                     
							</div>
						</div>
						<!-- END SAMPLE FORM PORTLET-->
					</div>
