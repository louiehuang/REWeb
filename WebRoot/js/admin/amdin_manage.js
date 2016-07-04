/**
 * 
 */

//测试表
function createTable(json) {
	var htmls = [ '<table>' ];

	htmls.push('<tr>');
	for ( var k in json[0])
		htmls.push('<td>' + k + '</td>');
	htmls.push('</tr>');

	for (var i = 0, L = json.length; i < L; i++) {
		htmls.push('<tr>');
		for ( var k in json[i]) {
			htmls.push('<td>' + json[i][k] + '</td>');
		}
		htmls.push('</tr>');
	}
	htmls.push('</table>');

	//$('#tableDiv').html(htmls.join(''));
	$('#tableDivAllUser').html(htmls.join(''));

}

//切换页面
function changeCurPage(self) {
	/*从隐藏域获取当前页和总页数*/
	var pageIndex = $("#pageIndex").val();
	var pageCount = $("#pageCount").val();
	//alert(self.id + "," + pageIndex + ", " + pageCount);

	/*设置下一次的当前页*/
	if (self.id == "btn_um_lastpage") { //上一页
		//alert("btn_um_lastpage");
		if (pageIndex <= 1) {
			pageIndex = 1;
		} else {
			pageIndex--;
		}
	} else if (self.id == "btn_um_nextpage") { //下一页
		//alert("btn_um_nextpage");
		if (pageIndex >= pageCount) {
			pageIndex = pageCount;
		} else {
			pageIndex++;
		}
	}

	/*更新隐藏域以便下一次执行函数进行获取*/
	$("#curPageIndex").attr("value", pageIndex);
	$("#curPageCount").attr("value", pageCount);

	/*局部刷新页面，输出获得的数据*/
	$.ajax({
		url : 'json_queryAllUser.action',
		type : 'post',
		dataType : "json",
		data : {
			"pageIndex" : pageIndex,
			"pageSize" : pageSize,
			"pageCount" : pageCount,
		},
		//async : false, //默认为true 异步  
		error : function() {
			alert('error');
		},
		success : function(data) {
			//alert(JSON.stringify(data));
			createAllUserTable(data);
		}
	});
}

//创建查询所有用户表格
function createAllUserTable(data) {
	/*返回的data形式的json数据，字段顺序和数据库中字段顺序不同，
	因此需要进行处理：
	1.可以在后台对data进行按期望的字段顺序拼接；
	2.jquery的data Adapter指定格式
	 */

	json = data.list;
	pageIndex = data.pageIndex;
	pageSize = data.pageSize;
	pageCount = data.pageCount;
	$("#pageIndex").attr("value", pageIndex);
	$("#pageIndex").attr("value", pageIndex);
	$("#pageCount").attr("value", pageCount);

	var htmls = [ '<table class=\"table table-hover\" id=\"UserTable\">' ];
	htmls.push('<thead><tr>');
	for ( var k in json[0])
		htmls.push('<td>' + k + '</td>');
	htmls.push('</tr></thead>');
	htmls.push('<tbody>');

	for (var i = 0, L = json.length; i < L; i++) {
		htmls.push('<tr>');
		for ( var k in json[i]) {
			htmls.push('<td>' + json[i][k] + '</td>');
		}
		htmls.push('</tr>');
	}
	htmls.push('</tbody></table>');
	$('#tableDivAllUser').html(htmls.join(''));
}

function loadUserInfo(jsonList) {
	//json一个list

	creditSelect = document.getElementById("credit-select"); //信用登陆下拉框
	//inputUserType province-select city-select county-select inputCommunity
	cur = 0;
	for ( var k in jsonList[0]) {
		switch (cur) {
		case 0:
			$("#inputUAccount").attr("value", jsonList[0][k]);
			break;
		case 1: {
			creditSelect[jsonList[0][k] - 1].selected = true; //0~4对应1~5星
			break;
		}
		case 2:
			$("#inputEmail").attr("value", jsonList[0][k]);
			break;
		case 3: {
			// $("#inputSex").prop("checked", true);
			// $("#inputSex").prop("checked", "checked");
			// 								if (jsonList[0][k] == "男") {
			// 									$("#inputSex").bootstrapSwitch("toggleState");
			// 									$("#inputSex").bootstrapSwitch("setState", true); 	
			// 								}else{
			// 									$("#inputSex").bootstrapSwitch("toggleState");
			// 									$("#inputSex").bootstrapSwitch("setState", flase); 	
			// 								}
			break;
		}
		case 5:
			$("#inputUId").attr("value", jsonList[0][k]);
			break;
		case 6:
			$("#inputUsername").attr("value", jsonList[0][k]);
			break;
		case 7:
			$("#inputPassword").attr("value", jsonList[0][k]);
			break;
		case 8:
			$("#inputPhoneNumber").attr("value", jsonList[0][k]);
			break;
		}

		cur++;
	}

	// 		var arr = new Array("#inputEmail", "#inputUsername", "#inputPassword");
	// 		for (var i = 0, L = jsonList.length; i < L; i++) {
	// 			var j = 0;
	// 			for ( var k in jsonList[i]) {
	// 				$(arr[j]).attr("value", jsonList[i][k]);
	// 				j++;
	// 			}
	// 		}

}
