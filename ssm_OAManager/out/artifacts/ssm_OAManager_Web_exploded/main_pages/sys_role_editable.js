var TableEditable = function() {

	return {

		// main function to initiate the module
		init : function() {
			function restoreRow(oTable, nRow) {
				var aData = oTable.fnGetData(nRow);
				var jqTds = $('>td', nRow);
				for ( var i = 0, iLen = jqTds.length; i < iLen; i++) {
					oTable.fnUpdate(aData[i], nRow, i, false);
				}
				oTable.fnDraw();
			}

			function editRow(oTable, nRow) {
				var aData = oTable.fnGetData(nRow);
				var jqTds = $('>td', nRow);
				jqTds[0].innerHTML = '<input type="text" class="m-wrap small" disabled value="'+ aData[0] + '">';
				jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="'+ aData[1] + '">';
				jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="'+ aData[2] + '">';
				jqTds[3].innerHTML = '<input type="text" class="m-wrap small" style="width:200px !important;" value="'+ aData[3] + '">';
				jqTds[4].innerHTML = '<a class="edit btn purple mini" href=""><i class="icon-save"></i>保存</a>'+ '&nbsp;<a class="cancel btn grey mini" href=""><i class="icon-minus-sign"></i>取消</a>';
			}

			function saveRow(oTable, nRow) {
				var jqInputs = $('input', nRow);
				oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
				oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
				oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
				oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
				oTable.fnUpdate('<a class="edit btn blue mini" href=""><i class="icon-edit"></i>编辑</a> <a class="delete btn green mini" href=""><i class="icon-trash"></i>删除</a>',nRow, 4, false);
				oTable.fnDraw();
			}

			function cancelEditRow(oTable, nRow) {
				var jqInputs = $('input', nRow);
				oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
				oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
				oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
				oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
				oTable.fnUpdate('<a class="edit btn blue mini" href=""><i class="icon-edit"></i>编辑</a>',nRow, 4, false);
				oTable.fnDraw();
			}

			var oTable = $('#sample_editable_1').dataTable({
				"aLengthMenu" : [ 
				        [ 5, 10, 15, -1 ],
						[ 5, 10, 15, "All" ] // change per page values here
				],
				// set the initial value
				"iDisplayLength" : 5,
				"sDom" : "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
				"sPaginationType" : "bootstrap",
				"oLanguage" : {
					"sLengthMenu" : "_MENU_ 每页显示记录数",
					"oPaginate" : {
						"sPrevious" : "上一页",
						"sNext" : "下一页"
					}
				},
				"aoColumnDefs" : [ {
					'bSortable' : false,
					'aTargets' : [ 0 ]
				} ]
			});

			jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("m-wrap medium"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialzie select2 dropdown
			var nEditing = null;
			//添加时自增的id  区分添加和修改 修改时 =0 添加时 !=0 
			var newid=0;

			$('#sample_editable_1_new').click(function(e) {
				var url = "crm_cate!getMaxId?v="+ new Date().valueOf();
				$.get(url,function(d) {
					if (d > 0) {
						e.preventDefault();
						var aiNew = oTable.fnAddData(
							['','','','','<a class="edit btn blue mini" href=""><i class="icon-edit"></i>编辑</a> <a class="mycancel btn gray mini" data-mode="new" href=""><i class="icon-minus-sign"></i>取销</a>' ]);
						var nRow = oTable.fnGetNodes(aiNew[0]);
						oTable.fnGetData(nRow)[0]=d;//
						newid=d;//当添加时 将ajax 生成的id 保存到newid 
		                editRow(oTable, nRow);
		                nEditing = nRow;
					} else {
						$("#errmsg").text("ID加载失败");
						$("#btnerr").click();
					}
				});
				// nEditing = nRow;
			});

			$('#sample_editable_1 a.delete').live('click', function (e) {
                e.preventDefault();

                if (confirm("你确定要删除这行吗 ？") == false) {
                    return;
                }
                //此id只能在页面第一次载入好 之后的数据做删除 才能拿到  ajax 新添行  删除 拿到是0
                //var id = e.currentTarget.id;
                var nRow = $(this).parents('tr')[0];
                var id=$(nRow).children(0).html(); //拿到第一个单元格的 ID  做删除
                var url = "crm_cate!delCate?id=" + id + "&v=" + new Date().valueOf();
				$.get(url, function(d) {
					if (d == "success") {
						//删除行
		                oTable.fnDeleteRow(nRow);
						$("#errmsg").text("删除成功");
						$("#btnerr").click();
					} else {
						$("#errmsg").text("删除失败");
						$("#btnerr").click();
					}
				});
            });

			$('#sample_editable_1 a.cancel').live('click', function(e) {
				e.preventDefault();
				if ($(this).attr('data-mode') == 'new') {
					var nRow = $(this).parents('tr')[0];
					oTable.fnDeleteRow(nRow);
				} else {
					restoreRow(oTable, nEditing);
					nEditing = null;
				}
			});


			$('#sample_editable_1 a.edit').live('click', function (e) {
                e.preventDefault();

                /* Get the row as a parent of the link that was clicked on */
            	
                var nRow = $(this).parents('tr')[0];

                if (nEditing !== null && nEditing != nRow) {
                	alert("请先完成当前编辑行！");
                	return;
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    /*restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                    alert("Currently editing - but not this row - restore the old before continuing to edit mode :");
                    */
                } else if (nEditing == nRow && this.innerText == "保存") {
                    /* Editing this row and want to save it */
                	//获取编辑行 对象
                	var jqInputs = $('input', nEditing);
                	//获取编辑行 文本框value组成data 
                	var data = "id=" + jqInputs[0].value + "&productCategory=" + jqInputs[1].value + "&parentid="
					+ jqInputs[2].value + "&productIcon=" + jqInputs[3].value;
                	//ajax  提交路径
                	var url="";
                	var msg="";//保存成功信息
                	var msgerr="";//保存失败信息
                	if (newid==0) {//提交到修改路径
                    	url = "crm_cate!updateCate?v=" + new Date().valueOf();
                    	msg="修改成功";
                    	msgerr="修改失败";
					}else{		  //提交到保存路径
	                	url = "crm_cate!saveCate?v=" + new Date().valueOf();
	                	msg="添加成功";
	                	msgerr="添加失败";
	                	newid=0;
					}
                	$.post(url, data, function(d) {
						if (d == "success") {
							//保存行
							saveRow(oTable, nEditing);
							//清空当前编辑行
							nEditing = null;
							$("#errmsg").text(msg);
							$("#btnerr").click();
						} else {
							$("#errmsg").text(msgerr);
							$("#btnerr").click();
						}
					});
                    //alert("Updated! Do not forget to do some ajax to sync with backend :)");
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                    //alert("No edit in progress - let's start one :)");
                };
            });
		}

	};

}();