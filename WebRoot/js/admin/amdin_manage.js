/**
 * 
 */

//���Ա�
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

//�л�ҳ��
function changeCurPage(self) {
	/*���������ȡ��ǰҳ����ҳ��*/
	var pageIndex = $("#pageIndex").val();
	var pageCount = $("#pageCount").val();
	//alert(self.id + "," + pageIndex + ", " + pageCount);

	/*������һ�εĵ�ǰҳ*/
	if (self.id == "btn_um_lastpage") { //��һҳ
		//alert("btn_um_lastpage");
		if (pageIndex <= 1) {
			pageIndex = 1;
		} else {
			pageIndex--;
		}
	} else if (self.id == "btn_um_nextpage") { //��һҳ
		//alert("btn_um_nextpage");
		if (pageIndex >= pageCount) {
			pageIndex = pageCount;
		} else {
			pageIndex++;
		}
	}

	/*�����������Ա���һ��ִ�к������л�ȡ*/
	$("#curPageIndex").attr("value", pageIndex);
	$("#curPageCount").attr("value", pageCount);

	/*�ֲ�ˢ��ҳ�棬�����õ�����*/
	$.ajax({
		url : 'json_queryAllUser.action',
		type : 'post',
		dataType : "json",
		data : {
			"pageIndex" : pageIndex,
			"pageSize" : pageSize,
			"pageCount" : pageCount,
		},
		//async : false, //Ĭ��Ϊtrue �첽  
		error : function() {
			alert('error');
		},
		success : function(data) {
			//alert(JSON.stringify(data));
			createAllUserTable(data);
		}
	});
}

//������ѯ�����û����
function createAllUserTable(data) {
	/*���ص�data��ʽ��json���ݣ��ֶ�˳������ݿ����ֶ�˳��ͬ��
	�����Ҫ���д���
	1.�����ں�̨��data���а��������ֶ�˳��ƴ�ӣ�
	2.jquery��data Adapterָ����ʽ
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
	//jsonһ��list

	creditSelect = document.getElementById("credit-select"); //���õ�½������
	//inputUserType province-select city-select county-select inputCommunity
	cur = 0;
	for ( var k in jsonList[0]) {
		switch (cur) {
		case 0:
			$("#inputUAccount").attr("value", jsonList[0][k]);
			break;
		case 1: {
			creditSelect[jsonList[0][k] - 1].selected = true; //0~4��Ӧ1~5��
			break;
		}
		case 2:
			$("#inputEmail").attr("value", jsonList[0][k]);
			break;
		case 3: {
			// $("#inputSex").prop("checked", true);
			// $("#inputSex").prop("checked", "checked");
			// 								if (jsonList[0][k] == "��") {
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
