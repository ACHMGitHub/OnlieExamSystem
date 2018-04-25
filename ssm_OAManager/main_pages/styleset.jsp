<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
	<div class="color-panel hidden-phone">
		<div class="color-mode-icons icon-color"></div>
		<div class="color-mode-icons icon-color-close"></div>
		<div class="color-mode">
			<p>主题颜色</p>
			<ul class="inline">
				<li onclick="changeTheme('default')" class="theme color-black current color-default"  data-style="default"></li>
				<li onclick="changeTheme('blue')" class="theme color-blue" data-style="blue"></li>
				<li onclick="changeTheme('brown')" class="theme color-brown" data-style="brown"></li>
				<li onclick="changeTheme('purple')" class="theme color-purple" data-style="purple"></li>
				<li onclick="changeTheme('grey')" class="theme color-grey" data-style="grey"></li>
				<li onclick="changeTheme('light')" class="theme color-white color-light" data-style="light"></li>
			</ul>
			<label>
				<span>布局</span>
				<select class="layout-option m-wrap small">
					<option value="fluid" selected>全屏</option>
					<option value="boxed">居中</option>
				</select>
			</label>
			<label>
				<span>顶部</span>
				<select class="header-option m-wrap small">
					<option value="fixed" selected>固定</option>
					<option value="default">默认</option>
				</select>
			</label>
			<label>
				<span>侧边栏</span>
				<select class="sidebar-option m-wrap small">
					<option value="fixed">固定</option>
					<option value="default" selected>默认</option>
				</select>
			</label>
			<label>
				<span>底部</span>
				<select class="footer-option m-wrap small">
					<option value="fixed" selected>固定</option>
					<option value="default">默认</option>
				</select>
			</label>
		</div>
	</div>
	<script type="text/javascript" >
		function changeTheme(theme){
			var url="<%=basePath%>pages_hr/hr_emp!changeTheme?v="+new Date().valueOf();
			var data={"theme":theme};
			$.get(url,data,function(d){
				alert('皮肤更新成功！');
			});
		}
	</script>