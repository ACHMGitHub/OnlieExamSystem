<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- BEGIN 从侧边栏 -->
<div class="page-sidebar nav-collapse collapse">
	<!-- BEGIN 开始工具条菜单 -->
	<ul class="page-sidebar-menu">
		<li>
			<!-- BEGIN 侧边栏显示开关按钮 -->
			<div class="sidebar-toggler hidden-phone"></div> <!-- END 侧边栏显示开关按钮 -->
		</li>
		<li>
			<!-- BEGIN 响应快速搜索表单 -->
			<form class="sidebar-search">
				<div class="input-box">
					<a href="#" class="remove"></a> <input type="text"
						placeholder="Search...." /> <input type="button" class="submit"
						value=" " />
				</div>
			</form> <!-- END 响应快速搜索表单 --></li>
		<li class="active "><a
			href="${pageContext.request.contextPath}/index.jsp"> <i
				class="icon-home"></i> <span class="title">我的桌面</span> </a></li>
		<li class=""><a class="active" href="javascript:;"> <i
				class="icon-sitemap"></i> <span class="title">个人办公</span> <span
				class="arrow "></span> </a>
			<ul class="sub-menu">
				<li><a href="javascript:;"><i class="icon-user"></i>个人工作 <span
						class="arrow"></span> </a>
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath}/sys_schedule/findByScheduleAll.action"><i
								class="icon-calendar"></i>我的日程</a>
						</li>
					</ul></li>
				<li><a
					href="${pageContext.request.contextPath}/pages_mail/mail_login.jsp">
						<i class="icon-envelope-alt"></i> 邮箱 </a></li>
			</ul></li>
		<li><a href="javascript:;"> <i class="icon-youtube-sign"></i>
				信息中心 <span class="arrow"></span> </a>
			<ul class="sub-menu">
				<li><a
					href="${pageContext.request.contextPath}/view/announcement/findAllAnnouncement.action"><i
						class="icon-volume-up"></i>公告管理</a>
				</li>
			</ul></li>
		<li class=""><a href="javascript:;"> <i class="icon-group"></i>
				<span class="title">公文管理</span> <span class="selected"></span> <span
				class="arrow open"></span> </a>
			<ul class="sub-menu">
				<li><a href="javascript:;"><i class=" icon-male"></i>公文管理 <span
						class="arrow"></span> </a>
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath}/my_official.action"><i
								class="  icon-stackexchange"></i>我的公文</a>
						</li>

						<li><a
							href="${pageContext.request.contextPath}/official_findAll.action"><i
								class="icon-book"></i>添加公文</a>
						</li>

					</ul></li>
			</ul></li>


		<li class=""><a href="javascript:;"> <i class="icon-table"></i>

				<span class="title">人事管理</span> <span class="arrow"></span> </a>

			<ul class="sub-menu">

				<li><a href="javascript:;"><i class=" icon-male"></i>财务管理 <span
						class="arrow"></span> </a>
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath}/hrm/findAllEvections.action"><i
								class="  icon-stackexchange"></i>出差管理</a>
						</li>

						<li><a
							href="${pageContext.request.contextPath}/hrm/findAllLeaves.action"><i
								class="icon-book"></i>请假管理</a>
						</li>

						<li><a
							href="${pageContext.request.contextPath}/hrm/findToSal.action"><i
								class="  icon-foursquare"></i>工资管理</a>
						</li>

					</ul></li>
				<li><a href="javascript:;"><i class=" icon-male"></i>组织架构 <span
						class="arrow"></span> </a>
					<ul class="sub-menu">
						<li><a
							href="${pageContext.request.contextPath}/pages_hr/findPositionPages.action">
								<i class="icon-hospital"></i> 职务管理</a>
						</li>

						<li><a
							href="${pageContext.request.contextPath}/pages_hr/findDeptAll.action">
								<i class="icon-indent-right"></i> 部门管理</a></li>

						<li><a
							href="${pageContext.request.contextPath}/hrm/getEmployeeByPage.action">
								<i class="icon-group"></i> 员工管理</a></li>
					</ul></li>

			</ul></li>

		<li class=""><a href="javascript:;"> <i class="icon-book"></i>

				<span class="title">流程中心</span> <span class="arrow "></span> </a>

			<ul class="sub-menu">

				<li><a href="javascript:;"><i class="icon-trash"></i>新建工作流程
						<span class="arrow"></span> </a>

					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/flowTemplate_addView.action"><i
								class="icon-trash"></i>添加工作流程</a>
						</li>


					</ul></li>

				<li><a href="javascript:;"><i class="icon-trash"></i>查看工作流程
						<span class="arrow"></span> </a>

					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/flowTemplate_show.action"><i
								class="icon-trash"></i>查看工作流程</a>
						</li>

					</ul></li>

			</ul></li>

		<li class=""><a href="javascript:;"> <i class="icon-wrench"></i>

				<span class="title">实用工具</span> <span class="arrow "></span> </a>

			<ul class="sub-menu">

				<li><a href="javascript:;"><i class="icon-th-large"></i>办公用品管理
						<span class="arrow"></span> </a>
					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/stationery/findAll.action"><i
								class="icon-share"></i>办公用品库管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/stationery/findAll1.action"><i
								class="icon-sitemap"></i>办公用品类别管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/pages_stationery/StationeryByPage.action"><i
								class="icon-heart"></i>办公用品管理</a>
						</li>


					</ul></li>

				<li><a href="javascript:;"><i class="icon-plane"></i>固定资产管理
						<span class="arrow"></span> </a>

					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/fixedAsset/findAssetTypeByPage.action"><i
								class="icon-group"></i>资产类型管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/fixedAsset/findFortifyTypeByPage.action"><i
								class="icon-road"></i>增加类型管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/fixedAsset/findAssetMaintainByPage.action"><i
								class="icon-reorder"></i>固定资产维护管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/fixedAsset/findMaintainTypeByPage.action"><i
								class="icon-star-half"></i>维护类型管理</a>
						</li>
					</ul></li>
			</ul></li>
		<li class="last"><a href="javascript:;"> <i
				class="icon-map-marker"></i> <span class="title">系统管理</span> <span
				class="arrow "></span> </a>

			<ul class="sub-menu">

				<li><a
					href="${pageContext.request.contextPath}/page/user/fillByPage.action">
						<i class="icon-cog"></i> 角色授权</a></li>
				<li><a href="javascript:;"><i class="icon-cog"></i>权限管理 <span
						class="arrow"></span> </a>

					<ul class="sub-menu">

						<li><a
							href="${pageContext.request.contextPath}/sys_privilege/findByRolePage.action"><i
								class="icon-group"></i>角色管理</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/sys_privilege/findByFunPage.action"><i
								class="icon-wrench"></i>功能管理</a>
						</li>

					</ul></li>
			</ul></li>

	</ul>

	<!-- END 结束工具条菜单 -->

</div>

<!-- END 结束侧边栏 -->
