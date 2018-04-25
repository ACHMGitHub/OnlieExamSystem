function ajaxLoadPosition(select){
	$(function(){
		var url="../pages_hr/hr_posi!ajaxLoadPosition?v="+new Date().valueOf();
		$.getJSON(url,function(d){
			var chtml="";
			for ( var int = 0; int < d.length; int++) {
				chtml+="<option value='"+d[int].id+"'>"+d[int].positionName+"</option>";
			}
			select.append(chtml);
		});
	});
}

