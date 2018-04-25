<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<!-- 导入jquery库 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript">
	$(function(){
	
	$(".form2").bind("click",function(){
			$("#form2").submit();
			$(".input").val("");
		});
	
		$("#money1").blur(function(){
			var num = $(this).val();
			
			//
			if (isNaN(num) || num > Math.pow(10, 12)) return "";
       var cn = "零壹贰叁肆伍陆柒捌玖";
       var unit = new Array("拾百千", "分角");    
       var unit1= new Array("万亿", "");    
       var numArray = num.toString().split(".");    
       var start = new Array(numArray[0].length-1, 2) ;   
       function toChinese(num, index)    
       {    
           var num = num.replace(/\d/g, function ($1)    
           {    
               return cn.charAt($1)+unit[index].charAt(start--%4 ? start%4 : -1);    
           });    
           return num;    
       }    
       for (var i=0; i<numArray.length; i++)    
       {    
           var tmp = "";    
           for (var j=0; j*4<numArray[i].length; j++)    
           {    
           var strIndex = numArray[i].length-(j+1)*4 ;   
           var str = numArray[i].substring(strIndex, strIndex+4);    
           var start = i ? 2 : str.length-1 ;   
           var tmp1 = toChinese(str, i);    
           tmp1 = tmp1.replace(/(零.)+/g, "零").replace(/零+$/, "");    
           tmp1 = tmp1.replace(/^壹拾/, "拾")  ;  
           tmp = (tmp1+unit1[i].charAt(j-1)) + tmp;    
           }    
           numArray[i] = tmp;    
       }    
       numArray[1] = numArray[1] ? numArray[1] : "";    
       numArray[0] = numArray[0] ? numArray[0]+"元" : numArray[0], numArray[1] = numArray[1].replace(/^零+/, "");    
       numArray[1] = numArray[1].match(/分/) ? numArray[1] : numArray[1]+"整";    
       //
			
			$("#money11").val(numArray[0]+numArray[1]);
		});
	});
</script>
<body>
	<div class="portlet box blue">
  		<form id="form2" method="post" action="${pageContext.request.contextPath }/accessory_project_add.action">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-globe"></i>项目资金申请
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
			<table cellpadding="0" cellspacing="0" class="table table-striped  table-hover table-full-width" >
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
						<input name="projectName"  style="height: 40px;"  class="in input" type="text"/>
					</td>
				</tr>
				<tr>
					<td>
					申请人
					</td>
					<td>
						<input readonly="readonly" class="in" style="height: 40px;" type="text" name="" value="${user.userName }"/>
					</td>
					<td>
					申请部门
					</td>
					<td>
					<input readonly="readonly" class="in" style="height: 40px;" type="text" name="" value="${user.emp.dep.deptName }"/>
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
					<td>申请事由</td>
					<td colspan="3">
						<textarea class="in input" rows="3" name="projectContent" cols="8"></textarea>
					</td>
				</tr>
				<tr class="tr">
					<td colspan="4">申请金额</td>
					
				</tr>
				<tr>
					<td>金额(小写)</td>
					<td><input class="in input" id="money1" style="height: 40px;" type="text" name="projectMoney" /></td>
					<td>金额(大写)</td>
					<td><input class="in input" id="money11" style="height: 40px;" type="text" name="money" /></td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="form-actions">
									<button type="button" id="submit-button" class="btn green form2"><i class="icon-ok"></i>保存并导出word文档</button>
									<button type="reset" class="btn">重置</button>
									<button type="button" onclick="history.back()" class="btn blue">返回</button>
								</div>
					</td>
				</tr>
				</thead>
				
			</table>
		</div>
		</form>
	</div>
</body>

</html>
