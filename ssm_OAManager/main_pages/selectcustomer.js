$(function(){
	var cust = $("#select2_sample_customer");
	var url="../pages_crm/crm_cust!ajaxGetAllCustomer?v="+new Date().valueOf();
	$.getJSON(url,function(d){
		var chtml = "";
		for ( var int = 0; int < d.length; int++) {
			chtml += "<option value='" + d[int].id + "'>" + d[int].customer
					+ "</option>";
		}
		cust.append(chtml);
	});
});