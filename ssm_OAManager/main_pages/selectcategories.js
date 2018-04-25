//产品类别二级联动
$(function() {
	var cate = $('#select2_sample_cate');
	var childcate = $('#select2_sample_childcate');
	var url = "../pages_crm/crm_cate!ajaxGetCate?v=" + new Date().valueOf();
	$.getJSON(url, function(d) {
		var chtml = "";
		for ( var int = 0; int < d.length; int++) {
			chtml += "<option value='" + d[int].id + "'>"
					+ d[int].productCategory + "</option>";
		}
		cate.append(chtml);
	});
	cate.change(function() {
		var parentid = cate.val();
		var urlcate = "../pages_crm/crm_cate!ajaxGetChildCate?parentid=" + parentid + "&v="
				+ new Date().valueOf();
		$.getJSON(urlcate, function(d) {
			var chtml = "<option value='-1'>请选择</option>";
			for ( var int = 0; int < d.length; int++) {
				chtml += "<option value='" + d[int].id + "'>"
						+ d[int].productCategory + "</option>";
			}
			childcate.html(chtml);
		});
	});
});