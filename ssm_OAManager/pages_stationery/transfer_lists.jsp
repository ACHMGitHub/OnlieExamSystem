<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

					<!-- BEGIN 表格列表-->
			<div class="row-fluid">
					<!-- BEGIN 表格列表-->
					<form action="${pageContext.request.contextPath}/pages_stationery/insertTwoStationery.action"    method="post"  >
					<div class="span12">
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-globe"></i>调拨
								</div>
							</div>
							<div class="portlet-body">
									<div class="row-fluid">
										<div class="span6 ">
												<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">办公用品库：</label>
											<div class="controls">
												<select class="chirldSelect1" id="statilibraryName" class="span12 " name="contact.crmCustomer.id"  tabindex="1">
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
												<select class="chirldSelect2" id="statitypeName"  class="span12 " name="contact.crmCustomer.id"  tabindex="1">
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
												<select class="chirldSelect3" id="stationeryName"  class="span12 " name="stationeryId"  tabindex="1">
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
											<label class="control-label">申请数量：</label>
											<div class="controls">  
												<input type="text"  name="stationeryAmount" value=""  class="span9"/>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
					  </div>
										<!--/span-->
								<div class="span6 ">
									<div class="row-fluid">
									<div class="span6 ">
										<div class="control-group">
											<label class="control-label">办公用品库：</label>
											<div class="controls">
												<select id="chirldSelect11"  class="span12 " name="contact.crmCustomer.id"  tabindex="1">
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
												<select id="chirldSelect22"  class="span12 " name="stationerytype.statitypeId"  tabindex="1">
													<option value="-1">请选择</option>
												</select>
											</div>
										</div>
									<!--/span-->
									</div>
								</div>
								</div>
						<!--/span-->
							</div>
								<div class="form-actions"  align="center">
									<button type="submit" id="transfer" class="btn green"><i class="icon-ok"></i>调拨</button>
									<button type="reset" class="btn">重置</button>
								</div>
									
							</div>
						</div>
					</div>
					</form>
					<!-- END 表格列表-->
				</div>