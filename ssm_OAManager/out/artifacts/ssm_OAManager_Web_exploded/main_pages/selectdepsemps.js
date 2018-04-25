//部门员工 两级联动
$(function() {
	var hrdeps = $('#select2_sample_deps');
	var hremps = $('#select2_sample_emps');
	var url = "../pages_hr/hr_dep!ajaxGetDeps?v=" + new Date().valueOf();
	$.getJSON(url, function(d) {
		var chtml = "";
		for ( var int = 0; int < d.length; int++) {
			chtml += "<option value='" + d[int].id + "'>" + d[int].DName
					+ "</option>";
		}
		hrdeps.append(chtml);
	});

	hrdeps.change(function() {
		var depid = $(this).val();
		var urlemp = "../pages_hr/hr_emp!ajaxGetEmpsByDepId?depid=" + depid + "&v="
				+ new Date().valueOf();
		$.getJSON(urlemp, function(d) {
			var chtml = "";
			for ( var int = 0; int < d.length; int++) {
				chtml += "<option value='" + d[int].id + "'>" + d[int].name
						+ "</option>";
			}
			hremps.html(chtml);
		});
	});
	var hrcdeps = $('#select2_sample_cdeps');
	var hrcemps = $('#select2_sample_cemps');
	if (hrcdeps!=null) {

		var url = "../pages_hr/hr_dep!ajaxGetDeps?v=" + new Date().valueOf();
		$.getJSON(url, function(d) {
			var chtml = "";
			for ( var int = 0; int < d.length; int++) {
				chtml += "<option value='" + d[int].id + "'>" + d[int].DName
						+ "</option>";
			}
			hrcdeps.append(chtml);
		});

		hrcdeps.change(function() {
			var depid = $(this).val();
			var urlemp = "../pages_hr/hr_emp!ajaxGetEmpsByDepId?depid=" + depid + "&v="
					+ new Date().valueOf();
			$.getJSON(urlemp, function(d) {
				var chtml = "";
				for ( var int = 0; int < d.length; int++) {
					chtml += "<option value='" + d[int].id + "'>" + d[int].name
							+ "</option>";
				}
				hrcemps.html(chtml);
			});
		});
	}
});