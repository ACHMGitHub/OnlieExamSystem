//省市两级联动
$(function() {
	var vince = $('#select2_sample_vince');
	var citys = $('#select2_sample_citys');
	var url = "../pages_param/param_city!ajaxGetProvince?v=" + new Date().valueOf();
	$.getJSON(url, function(d) {
		var chtml = "";
		for ( var int = 0; int < d.length; int++) {
			chtml += "<option value='" + d[int].id + "'>" + d[int].city
					+ "</option>";
		}
		vince.append(chtml);
	});

	vince.change(function() {
		var vinceid = $(this).val();
		var urlcity = "../pages_param/param_city!ajaxGetByProvinceId?vinceid=" + vinceid
				+ "&v=" + new Date().valueOf();
		$.getJSON(urlcity, function(d) {
			var chtml = "";
			for ( var int = 0; int < d.length; int++) {
				chtml += "<option value='" + d[int].id + "'>" + d[int].city
						+ "</option>";
			}
			citys.html(chtml);
		});
	});

});