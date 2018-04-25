function ajaxLoadParam(select,paramid){
	$(function(){
		var sysid=paramid;//这里定义要显示的分类 父ID
		var url="../pages_param/param_sys!ajaxGetBySysId?sysid="+sysid+"&v="+new Date().valueOf();
		$.getJSON(url,function(d){
			var chtml="";
			for ( var int = 0; int < d.length; int++) {
				chtml+="<option value='"+d[int].id+"'>"+d[int].paramsName+"</option>";
			}
			select.append(chtml);
		});
	});
}

