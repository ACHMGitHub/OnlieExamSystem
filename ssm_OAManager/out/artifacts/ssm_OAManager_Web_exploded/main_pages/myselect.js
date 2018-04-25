var FormComponets = function() {

	var handleSelec2 = function() {
		$('#select2_sample_customer').select2({
			placeholder : "请选择",
			allowClear : false
		});
		
		$('#select2_sample_emps').select2({
			placeholder : "请选择",
			allowClear : false
		});

		$('#select2_sample_deps').select2({
			placeholder : "请选择",
			allowClear : false
		});

		$('#select2_sample_vince').select2({
			placeholder : "请选择",
			allowClear : true
		});

		$('#select2_sample_citys').select2({
			placeholder : "请选择",
			allowClear : true
		});

		$('#select2_sample_cate').select2({
			placeholder : "请选择",
			allowClear : true
		});

		$('#select2_sample_childcate').select2({
			placeholder : "请选择",
			allowClear : true
		});

		$('#select2_sample_paramsys').select2({
			placeholder : "请选择",
			allowClear : true
		});

		$("#select2_sample3").select2({
			placeholder : "请选择",
			allowClear : true,
			minimumInputLength : 1,
			query : function(query) {
				var data = {
					results : []
				}, i, j, s;
				for (i = 1; i < 5; i++) {
					s = "";
					for (j = 0; j < i; j++) {
						s = s + query.term;
					}
					data.results.push({
						id : query.term + i,
						text : s
					});
				}
				query.callback(data);
			}
		});
	};

	return {
		init : function() {
			handleSelec2();
		}
	};

}();