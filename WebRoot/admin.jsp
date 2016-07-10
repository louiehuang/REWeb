<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.chinasoft.pojo.Users"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理</title>
<link media="all" rel="stylesheet" type="text/css" href="css/all.css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/ bootstrap-combined.min.css" rel="stylesheet" />
<link href="css/bootstrap-switch.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	window.jQuery
			|| document
					.write('<script type="text/javascript" src="js/admin/jquery-1.7.2.min.js"><\/script>');
</script>
<script type="text/javascript" src="js/admin/jquery.main.js"></script>
<script src="js/common/bootstrap.min.js"></script>
<script src=" js/admin/bootstrap-switch.min.js "></script>
<script type="text/javascript" src="js/admin/geo.js"></script>
<script src="layer/layer.js"></script>

<script>
	$(function() {
		$("[name='state']").bootstrapSwitch({
			onText : '<span>已处理</span>',
			offText : '<span>未处理</span>'
		});
		$("[name='complain']").bootstrapSwitch({
			onText : '<span>不属实</span>',
			offText : '<span>属实</span>'
		});
		$("[name='a_user.UGender']").bootstrapSwitch({
			onText : '<span>男</span>',
			offText : '<span>女</span>'
		});
		$("[name='UserType']").bootstrapSwitch({
			onText : '<span>个人用户</span>',
			offText : '<span>企业用户</span>'
		});
		$("[name='availability']").bootstrapSwitch({
			onText : '<span>有效</span>',
			offText : '<span>无效</span>'
		});
		$("[name='authenticity']").bootstrapSwitch({
			onText : '<span>通过</span>',
			offText : '<span>未通过</span>'
		});
		$("[name='trueness']").bootstrapSwitch({
			onText : '<span>真实</span>',
			offText : '<span>不真实</span>'
		});

	})
</script>
<script>
	function changeToUserUpdate() {
		document.getElementById("add_user_submit").value = "保存修改";
	}

	function changeToUserAdd() {
		document.getElementById("add_user_submit").value = "添加用户";
	}

	function changeToAdUpdate() {
		document.getElementById("add_ad_submit").value = "保存修改";
		document.getElementById("adManMode").innerHTML = "您现在是修改模式";
		document.getElementById("adManMode").style.color = "red";
	}

	function changeToAdAdd() {
		document.getElementById("add_ad_submit").value = "添加广告";
		document.getElementById("adManMode").innerHTML = "您现在是添加模式";
		document.getElementById("adManMode").style.color = "green";
		1
	}

	function checkNum(obj) {
		obj.value = obj.value.replace(/\D/gi, "");
	}
</script>




<!-- 验证管理 控制-->
<script type="text/javascript">
	//创建查询验证表格
	function createVeriTable(data) {
		var json = "";
		if (data.unprocessedList != null) {
			json = data.unprocessedList; //未处理验证
		} else if (data.processedList != null) {
			json = data.processedList; //已处理验证
		}

		/*设置新的页数*/
		$("#curVeriPageIndex").attr("value", data.veri_pageIndex);
		$("#curVeriPageSize").attr("value", data.veri_pageSize);
		$("#curVeriPageCount").attr("value", data.veri_pageCount);

		//alert($("#curVeriPageIndex").attr("value") + ", " + $("#curVeriPageCount").attr("value"));

		var htmls = [ '<table class=\"table table-hover\" id=\"VeriTable\">' ];

		htmls.push('<thead><tr>');
		var arrHeader = new Array("ID", "申请日期", "房屋类型", "房屋ID", "申请说明", "地址",
				"处理结果", "操作");
		for (var i = 0; i < arrHeader.length; i++) {
			htmls.push('<td>' + arrHeader[i] + '</td>');
		}
		htmls.push('</tr></thead>');

		htmls.push('<tbody>');
		for (var i = 0, L = json.length; i < L; i++) {
			htmls.push('<tr>');
			var housetype = "";
			switch (json[i].htype) {
			case 1:
				housetype = "企业楼盘";
				break;
			case 2:
				housetype = "二手房屋";
				break;
			case 3:
				housetype = "出租房屋";
				break;
			}

			htmls.push('<td>' + json[i].id + '</td>');
			htmls.push('<td>' + json[i].vdate + '</td>');
			htmls.push('<td>' + housetype + '</td>');
			htmls.push('<td>' + json[i].HId + '</td>');
			htmls.push('<td>' + json[i].content + '</td>');
			htmls.push('<td>' + json[i].region.province + '-'
					+ json[i].region.city + '-' + json[i].region.county
					+ '</td>');

			var res = "";
			switch (json[i].vres) {
			case 0:
				res = "未处理";
				break;
			case 1:
				res = "已通过";
				break;
			case 2:
				res = "不通过";
				break;
			}

			//处理结果
			htmls
					.push('<td>'
							+ '<div class=\"btn-group\">'
							+ '<button id=\"btn_veriRes_' + 
							json[i].id + '\" type=\"button\" class=\"btn btn-info dropdown-toggle\"' + 
							'data-toggle=\"dropdown\">'
							+ res
							+ '</button>'

							+ '<ul class=\"dropdown-menu\" role=\"menu\">'
							+ '<li><a id=\"veriUnhandle?'
							+ json[i].id
							+ '\" href=\'javascript:\' '
							+ 'onclick=\'selectProcessRes(this)\'>未处理</a></li>'

							+ '<li class=\"divider\"></li> <li><a id=\"veriPassed?'
							+ json[i].id
							+ '\" '
							+ 'href=\'javascript:\' onclick=\'selectProcessRes(this)\'>已通过</a></li>'

							+ '<li class=\"divider\"></li> <li><a id=\"veriFailed?'
							+ json[i].id
							+ '\" '
							+ 'href=\'javascript:\' onclick=\'selectProcessRes(this)\'>不通过</a></li>'
							+ '</ul> </div>' + '</td>');

			//保存和删除按钮
			htmls
					.push('<td>'
							+ '<input id=\"btn_vm_save_'
							+ json[i].id
							+ '\" class=\"btn btn-success\"'
							+ 'onclick=\"updateVeri(this)\" type=\"button\"'
							+ 'style=\"width:65px;margin-right:10px;\" value=\"保存\" />'
							+ '<input id=\"btn_vm_delete_'
							+ json[i].id
							+ '\" class=\"btn btn-danger\"'
							+ 'onclick=\"deleteVeri(this)\" type=\"button\"'
							+ 'style=\"width:65px; margin-right:-20px;\" value=\"删除\" />'
							+ '</td>');

			htmls.push('</tr>');
		}
		htmls.push('</tbody></table>');

		$('#tableDivVeri').html(htmls.join(''));

	}

	/*设置处理结果*/
	function selectProcessRes(self) {
		//veriPassed?2 表示ID为2的申请通过
		var arr = (self.id).split("?");
		var res = arr[0]; //veriPassed
		var id = arr[1]; //2
		var display = "未处理";

		switch (res) {
		case "veriUnhandle":
			res = "1";
			display = "未处理";
			break;
		case "veriPassed":
			res = "2";
			display = "已通过";
			break;
		case "veriFailed":
			res = "3";
			display = "不通过";
			break;
		}

		$("#btn_veriRes_" + id).text(display); //更新选择显示

	}

	/*保存验证处理结果*/
	function updateVeri(self) {
		var id = (self.id).substr(12);
		var res = $("#btn_veriRes_" + id).text(); //处理结果 ， "未处理"、"已通过"、"不通过"

		layer.confirm('确定修改此记录？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			/*局部刷新页面，输出获得的数据*/
			$.ajax({
				url : 'json_updateVeri.action',
				type : 'post',
				dataType : "json",
				data : {
					"VId" : id,
					"processRes" : res,
				},
				async : false, //同步 
				error : function() {
					alert('error');
				},
				success : function(data) {
					//alert(JSON.stringify(data.unprocessedList));
					createVeriTable(data);
				}
			});

			layer.msg('修改成功', {
				icon : 1
			});
		}, function() {
			layer.msg('取消修改', {
				time : 2000, //2s后自动关闭
				btn : [ '好' ]
			});
		});

	}

	//切换页面，判断上一页或下一页对下次应显示的当前页pageIndex进行更新，并从后台获取数据
	function changeCurVeriPage(self) {
		/*从隐藏域获取当前页和总页数*/
		var veri_pageIndex = $("#curVeriPageIndex").val();
		var veri_pageCount = $("#curVeriPageCount").val();
		//alert(self.id + "," + veri_pageIndex + ", " + veri_pageCount);

		/*设置下一次的当前页*/
		if (self.id == "btn_vm_lastpage") { //上一页
			//alert("btn_hm_lastpage");
			if (veri_pageIndex <= 1) {
				veri_pageIndex = 1;
			} else {
				veri_pageIndex--;
			}
		} else if (self.id == "btn_vm_nextpage") { //下一页
			//alert("btn_um_nextpage");
			if (veri_pageIndex >= veri_pageCount) {
				veri_pageIndex = veri_pageCount;
			} else {
				veri_pageIndex++;
			}
		}

		/*局部刷新页面，输出获得的数据*/
		$.ajax({
			url : 'json_queryVeri.action',
			type : 'post',
			dataType : "json",
			data : {
				"veri_pageIndex" : veri_pageIndex,
				"veri_pageCount" : veri_pageCount,
			},
			async : false, //同步 
			error : function() {
				alert('error');
			},
			success : function(data) {
				//alert(JSON.stringify(data.unprocessedList));
				createVeriTable(data);
			}
		});
	}

	/*设置查询方式*/
	function selectVeriQueryMode(self) {
		var str = $("#btn_queryVeriMode").text();
		switch (self.id) {
		case "queryVerificaton":
			str = "未处理验证";
			break;
		case "queryVerificaton_processed":
			str = "已处理验证";
			break;
		}
		$("#btn_queryVeriMode").text(str);
	}

	$(document).ready(function() {
		//查询验证信息，生成分页表
		$("#btn_vm_queryVeri").click(function() {
			var veri_queryMode = "queryVerificaton"; //默认查询企业房屋
			var tmp = $("#btn_queryVeriMode").text(); //获取查询方式选择值并更新查询方式
			switch (tmp) {
			case "未处理验证":
				veri_queryMode = "queryVerificaton";
				break;
			case "已处理验证":
				veri_queryMode = "queryVerificaton_processed";
				break;
			}

			var veri_pageSize = $("#curVeriPageSize").attr("value");
			if (veri_pageSize == "") {
				veri_pageSize = 10;
			}

			$.ajax({
				url : 'json_queryVeri.action',
				type : 'post',
				dataType : "json",
				data : {
					"veri_queryMode" : veri_queryMode,
					"veri_pageIndex" : 1,
					"veri_pageSize" : veri_pageSize,
				},
				async : false, //同步 
				error : function() {
					alert('error');
				},
				success : function(data) {
					//alert(JSON.stringify(data.unprocessedList));
					createVeriTable(data);

				}
			});
		});

	});
</script>


<!-- 用户管理 -->
<script type="text/javascript">
	//输出测试表
	function createTable(json) {
		var htmls = [ '<table>' ];

		htmls.push('<tr>');
		//遍历json[0]的键，生成表头
		for ( var k in json[0])
			htmls.push('<td>' + k + '</td>');
		htmls.push('</tr>');

		//遍历json[i]的值
		for (var i = 0, L = json.length; i < L; i++) {
			htmls.push('<tr>');
			for ( var k in json[i]) {
				htmls.push('<td>' + json[i][k] + '</td>');
			}
			htmls.push('</tr>');
		}
		htmls.push('</table>');

		$('#tableDivAllUser').html(htmls.join(''));

	}

	//切换页面，判断上一页或下一页对下次应显示的当前页pageIndex进行更新，并从后台获取数据
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
		3.更改前端的输出顺序
		 */

		json = data.list; //获取返回的列表   dataMap_AllUser.put("list", list);	

		/*设置新的页数*/
		pageIndex = data.pageIndex;
		pageSize = data.pageSize;
		pageCount = data.pageCount;
		$("#pageIndex").attr("value", pageIndex);
		$("#pageSize").attr("value", pageSize);
		$("#pageCount").attr("value", pageCount);

		var htmls = [ '<table class=\"table table-hover\" id=\"UserTable\">' ];

		htmls.push('<thead><tr>');
		htmls.push('<td>' + "用户ID" + '</td>');
		htmls.push('<td>' + "用户账号" + '</td>');
		htmls.push('<td>' + "用户密码" + '</td>');
		htmls.push('<td>' + "用户名称" + '</td>');
		htmls.push('<td>' + "性别" + '</td>');
		htmls.push('<td>' + "联系电话" + '</td>');
		htmls.push('<td>' + "电子邮箱" + '</td>');
		htmls.push('<td>' + "信用等级" + '</td>');
		htmls.push('</tr></thead>');

		htmls.push('<tbody>');
		for (var i = 0, L = json.length; i < L; i++) {
			htmls.push('<tr>');
			htmls.push('<td>' + json[i].UId + '</td>');
			htmls.push('<td>' + json[i].UAccount + '</td>');
			htmls.push('<td>' + json[i].UPwd + '</td>');
			htmls.push('<td>' + json[i].UName + '</td>');
			htmls.push('<td>' + json[i].UGender + '</td>');
			htmls.push('<td>' + json[i].UTele + '</td>');
			htmls.push('<td>' + json[i].UEmail + '</td>');
			htmls.push('<td>' + json[i].UCredit + '</td>');

			//删除按钮
			htmls.push('<td>' + '<input id=\"btn_um_delete_' + json[i].UId
					+ '\" class=\"btn btn-danger\"'
					+ 'onclick=\"deleteUser(this)\" type=\"button\"'
					+ 'style=\"width:65px;\" value=\"删除\" />' + '</td>');

			htmls.push('</tr>');
		}
		htmls.push('</tbody></table>');

		$('#tableDivAllUser').html(htmls.join(''));

	}

	//根据用户ID删除用户，并更新管理员界面用户表的显示
	function deleteUser(self) {
		//btn_um_delete_1, btn_um_delete_12
		//alert(self.id);
		var UId = (self.id).substr(14);
		//alert(UId);

		layer.confirm('确定删除此用户？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			/*局部刷新页面，输出获得的数据*/
			$.ajax({
				url : 'json_deleteUser.action',
				type : 'post',
				dataType : "json",
				data : {
					"UId" : UId,
				},
				//async : false, //默认为true 异步  
				error : function() {
					alert('error');
				},
				success : function(data) {
					createAllUserTable(data);
				}
			});

			layer.msg('删除成功', {
				icon : 1
			});
		}, function() {
			layer.msg('取消删除', {
				time : 2000, //2s后自动关闭
				btn : [ '好' ]
			});
		});
	}
	
	function selectUserGender(self){
		var str = "";
		var genderBtn = document.getElementById('btn_userGender');
		
		switch (self.id) {
		case "userGender_Male":
			str = "男"; 
			genderBtn.setAttribute("class", "btn btn-primary dropdown-toggle"); 
			break;
		case "userGender_Female":
			str = "女";
			genderBtn.setAttribute("class", "btn btn-danger dropdown-toggle"); 
			break;
		}

		$("#btn_userGender").text(str);
		
		
	}

	//加载单个用户信息到控件
	function loadUserInfo(jsonList) {
		var creditSelect = document.getElementById("credit-select"); //信用登陆下拉框
		var genderBtn = document.getElementById('btn_userGender');

		$("#inputUId").attr("value", jsonList[0].UId);
		$("#inputUAccount").attr("value", jsonList[0].UAccount);
		creditSelect[jsonList[0].UCredit - 1].selected = true; //0~4对应1~5星
		$("#inputEmail").attr("value", jsonList[0].UEmail);
		$("#inputUsername").attr("value", jsonList[0].UName);
		
		$("#inputPassword").attr("value", jsonList[0].UPwd); //用户密码，需要保存，用来判断管理员是否更改了用户密码
		$("#UserPassword").attr("value", jsonList[0].UPwd); //隐藏域保存用户密码
		
		
		$("#inputPhoneNumber").attr("value", jsonList[0].UTele);
		
		/*更改性别及其颜色*/
		var gender = jsonList[0].UGender;
		$("#btn_userGender").text(gender);
		if(gender == "男"){
			genderBtn.setAttribute("class", "btn btn-primary dropdown-toggle"); 
		}else{
			genderBtn.setAttribute("class", "btn btn-danger dropdown-toggle"); 
		}

	}

	$(document).ready(function() {

		//根据用户账号查询单个用户的信息
		$("#btn_um_query").click(function() {
			$.ajax({
				url : 'json_queryUser.action',
				type : 'post',
				dataType : "json",
				//data : "user.UAccount=" + $("#UAccount").val(),
				data : {
					"user.UAccount" : $("#UAccount").val()
				},
				//async : false, //默认为true 异步   
				error : function() {
					alert('error');
				},
				success : function(data) {
					loadUserInfo(data.list); //加载信息到控件
				}
			});
		});

		//保存修改的用户信息
		$("#add_user_submit").click(function() {
			$.ajax({
				url : 'json_updateUser.action',
				type : 'post',
				dataType : "json",
				data : {
					"a_user.UId" : $("#inputUId").val(),
					"a_user.UAccount" : $("#inputUAccount").val(),
					"a_user.UPwd" : $("#inputPassword").val(),
					"UserPassword" : $("#UserPassword").val(),
					"a_user.UName" : $("#inputUsername").val(),
					"a_user.UGender" : $("#btn_userGender").text(),
					"a_user.UCredit" : $("#credit-select").val(),
					"a_user.UTele" : $("#inputPhoneNumber").val(),
					"a_user.UEmail" : $("#inputEmail").val(),
				},
				async : false, //默认为true 异步   
				error : function() {
					alert('error' + ", " + $("#inputUAccount").val());
				},
				success : function(data) {
					alert("用户" + $("#inputUAccount").val() + "信息修改成功");
				}
			});
		});

		//查询所有用户信息，生成分页表
		$("#btn_um_query_all").click(function() {
			/*
			初次查询默认传入pageIndex=1,pageSize=10给后台JsonAction，用户可在初次查询更改pageSize值
			查询后返回一个大小为pageSize的列表(data.list)和查询后计算出的pageCount,并返回pageIndex和pageSize
			回调success中，调用createAllUserTable函数中根据data.list生成查询结果
			设置同步，在执行完success后对控件curPageIndex和curPageCount进行赋值显示，若异步则可能赋值在回调前执行，此时值为空
			 */
			pageSize = $("#pageSize").attr("value");
			if (pageSize == "") {
				pageSize = 10;
			}

			$.ajax({
				url : 'json_queryAllUser.action',
				type : 'post',
				dataType : "json",
				data : {
					"pageIndex" : 1,
					"pageSize" : pageSize,
				},
				async : false, //同步 
				error : function() {
					alert('error');
				},
				success : function(data) {
					//alert(JSON.stringify(data.list));
					createAllUserTable(data); //显示用户表
				}
			});

			//前面设置async为false, 即同步，执行完回调函数success后设置了pageIndex和pageCount控件值后，这里再进行获取和赋值
			var pageIndex = $("#pageIndex").val();
			var pageCount = $("#pageCount").val();
			$("#curPageIndex").attr("value", pageIndex);
			$("#curPageCount").attr("value", pageCount);

		});

	});
</script>



<!-- 房屋管理 控制-->
<script type="text/javascript">
	//创建查询房屋表格
	function createAllHouseTable(data) {
		var str = $("#btn_queryHouseMode").text();
		var json = "";
		if (str == "查询二手房屋") {
			json = data.secondList;
		} else if (str == "查询出租房屋") {
			json = data.rentList;
		}

		/*设置新的页数*/
		$("#curHousePageIndex").attr("value", data.house_pageIndex);
		$("#curHousePageSize").attr("value", data.house_pageSize);
		$("#curHousePageCount").attr("value", data.house_pageCount);
		//alert($("#curHousePageIndex").attr("value") + ", " + $("#curHousePageCount").attr("value"));

		var htmls = [ '<table class=\"table table-hover\" id=\"HouseTable\">' ];

		htmls.push('<thead><tr>');
		var arrHeader = new Array("房屋ID", "用户ID", "标题", "价格", "地域", "户型", "面积",
				"楼层", "小区", "真实性", "有效性");
		for (var i = 0; i < arrHeader.length; i++) {
			htmls.push('<td>' + arrHeader[i] + '</td>');
		}
		htmls.push('</tr></thead>');
		htmls.push('<tbody>');
		for (var i = 0, L = json.length; i < L; i++) {
			htmls.push('<tr>');

			htmls.push('<td>' + json[i].HId + '</td>');
			htmls.push('<td>' + json[i].UId + '</td>');
			htmls.push('<td>' + json[i].title + '</td>');
			htmls.push('<td>' + json[i].price + '</td>');
			htmls.push('<td>' + json[i].region.province + '-'
					+ json[i].region.city + '-' + json[i].region.county
					+ '</td>');
			htmls.push('<td>' + json[i].houseType.name + '</td>');
			htmls.push('<td>' + json[i].size + '</td>');
			htmls.push('<td>' + json[i].houseFloor + '</td>');
			htmls.push('<td>' + json[i].community + '</td>');
			htmls.push('<td>' + json[i].hauthenticity + '</td>');
			htmls.push('<td>' + json[i].havailability + '</td>');

			//删除按钮
			htmls.push('<td>' + '<input id=\"btn_hm_delete_' + json[i].HId
					+ '\" class=\"btn btn-danger\"'
					+ 'onclick=\"deleteHouse(this)\" type=\"button\"'
					+ 'style=\"width:65px;\" value=\"删除\" />' + '</td>');

			htmls.push('</tr>');
		}
		htmls.push('</tbody></table>');

		$('#tableDivAllHouse').html(htmls.join(''));

	}

	//切换页面，判断上一页或下一页对下次应显示的当前页pageIndex进行更新，并从后台获取数据
	function changeCurHousePage(self) {
		/*从隐藏域获取当前页和总页数*/
		var house_pageIndex = $("#curHousePageIndex").val();
		var house_pageSize = $("#curHousePageSize").val();
		var house_pageCount = $("#curHousePageCount").val();
		//alert(self.id + "," + house_pageIndex + ", " + house_pageCount);

		/*设置下一次的当前页*/
		if (self.id == "btn_hm_lastpage") { //上一页
			//alert("btn_hm_lastpage");
			if (house_pageIndex <= 1) {
				house_pageIndex = 1;
			} else {
				house_pageIndex--;
			}
		} else if (self.id == "btn_hm_nextpage") { //下一页
			//alert("btn_um_nextpage");
			if (house_pageIndex >= house_pageCount) {
				house_pageIndex = house_pageCount;
			} else {
				house_pageIndex++;
			}
		}

		/*局部刷新页面，输出获得的数据*/
		$.ajax({
			url : 'json_queryAllHouse.action',
			type : 'post',
			dataType : "json",
			data : {
				"house_pageIndex" : house_pageIndex,
				"house_pageSize" : house_pageSize,
				"house_pageCount" : house_pageCount,
			},
			//async : false, //默认为true 异步  
			error : function() {
				alert('error');
			},
			success : function(data) {
				//alert(JSON.stringify(data));
				createAllHouseTable(data);
			}
		});
	}

	/*设置查询方式*/
	function selectHouseQueryMode(self) {
		var str = $("#btn_queryHouseMode").text();
		switch (self.id) {
		case "queryHouse_Enterprise":
			str = "查询企业楼盘";
			break;
		case "queryHouse_Secondhand":
			str = "查询二手房屋";
			break;
		case "queryHouse_Rent":
			str = "查询出租房屋";
			break;
		}

		// $("selectedqueryHouseMode").attr("value", str);
		$("#btn_queryHouseMode").text(str);

	}

	//根据用户ID删除房屋，并更新管理员界面房屋表的显示
	function deleteHouse(self) {
		//btn_um_delete_1, btn_um_delete_12
		//alert(self.id);
		var HId = (self.id).substr(14);
		//alert(HId);

		layer.confirm('确定删除此记录？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			/*局部刷新页面，输出获得的数据*/
			$.ajax({
				url : 'json_deleteHouse.action',
				type : 'post',
				dataType : "json",
				data : {
					"HId" : HId,
				},
				//async : false, //默认为true 异步  
				error : function() {
					alert('error');
				},
				success : function(data) {
					createAllHouseTable(data);
				}
			});
			layer.msg('删除成功', {
				icon : 1
			});
		}, function() {
			layer.msg('取消删除', {
				time : 2000, //2s后自动关闭
				btn : [ '好' ]
			});
		});
	}

	$(document).ready(
			function() {
				//查询房屋信息，生成分页表
				$("#btn_hm_queryHouse_all").click(
						function() {
							var house_queryMode = "HouseSellEnterprise"; //默认查询企业房屋
							var tmp = $("#btn_queryHouseMode").text(); //获取查询方式选择值并更新查询方式
							switch (tmp) {
							case "查询企业楼盘":
								house_queryMode = "HouseSellEnterprise";
								break;
							case "查询二手房屋":
								house_queryMode = "HouseSellSecondhand";
								break;
							case "查询出租房屋":
								house_queryMode = "HouseSellRent";
								break;
							}

							var house_pageSize = $("#curHousePageSize").attr(
									"value");
							if (house_pageSize == "") {
								house_pageSize = 10;
							}

							$.ajax({
								url : 'json_queryAllHouse.action',
								type : 'post',
								dataType : "json",
								data : {
									"house_queryMode" : house_queryMode,
									"house_pageIndex" : 1,
									"house_pageSize" : house_pageSize,
								},
								async : false, //同步 
								error : function() {
									alert('error');
								},
								success : function(data) {
									//alert(JSON.stringify(data.list));
									if (data.enterList != null) {
									} else if (data.secondList != null
											|| data.rentList != null) {
										createAllHouseTable(data); //显示二手房表或出租表
									}
								}
							});

						});
			});
</script>







<!-- 广告管理 控制-->
<script type="text/javascript">
	//创建查询房屋表格
	function createAllAdTable(data) {
		json = data.adList;
		/*设置新的页数*/
		$("#curAdPageIndex").attr("value", data.ad_pageIndex);
		$("#curAdPageSize").attr("value", data.ad_pageSize);
		$("#curAdPageCount").attr("value", data.ad_pageCount);

		var htmls = [ '<table class=\"table table-hover\" id=\"AdTable\">' ];

		htmls.push('<thead><tr>');
		var arrHeader = new Array("广告ID", "用户ID", "用户类型", "内容", "花费(元/天)",
				"起始日期", "结束日期");
		for (var i = 0; i < arrHeader.length; i++) {
			htmls.push('<td>' + arrHeader[i] + '</td>');
		}
		htmls.push('</tr></thead>');

		htmls.push('<tbody>');
		for (var i = 0, L = json.length; i < L; i++) {
			htmls.push('<tr>');

			htmls.push('<td>' + json[i].id + '</td>');
			htmls.push('<td>' + json[i].UId + '</td>');
			htmls.push('<td>' + json[i].UType + '</td>');
			htmls.push('<td>' + json[i].adContent + '</td>');
			htmls.push('<td>' + json[i].adCost + '</td>');
			htmls.push('<td>' + json[i].startDate + '</td>');
			htmls.push('<td>' + json[i].endDate + '</td>');

			/*删除按钮*/
			htmls.push('<td>' + '<input id=\"btn_am_delete_' + json[i].id
					+ '\" class=\"btn btn-danger\"'
					+ 'onclick=\"deleteAd(this)\" type=\"button\"'
					+ 'style=\"width:65px;\" value=\"删除\" />' + '</td>');
			htmls.push('</tr>');
		}

		htmls.push('</tbody></table>');

		$('#tableDivAllAd').html(htmls.join(''));
	}

	//切换页面，判断上一页或下一页对下次应显示的当前页pageIndex进行更新，并从后台获取数据
	function changeCurAdPage(self) {
		/*从隐藏域获取当前页和总页数*/
		var ad_pageIndex = $("#curAdPageIndex").val();
		var ad_pageCount = $("#curAdPageCount").val();

		/*设置下一次的当前页*/
		if (self.id == "btn_am_lastpage") { //上一页
			//alert("btn_hm_lastpage");
			if (ad_pageIndex <= 1) {
				ad_pageIndex = 1;
			} else {
				ad_pageIndex--;
			}
		} else if (self.id == "btn_am_nextpage") { //下一页
			//alert("btn_um_nextpage");
			if (ad_pageIndex >= ad_pageCount) {
				ad_pageIndex = ad_pageCount;
			} else {
				ad_pageIndex++;
			}
		}

		/*局部刷新页面，输出获得的数据*/
		$.ajax({
			url : 'json_queryAllAd.action',
			type : 'post',
			dataType : "json",
			data : {
				"ad_pageIndex" : ad_pageIndex,
				"ad_pageCount" : ad_pageCount,
			},
			async : false, //同步 
			error : function() {
				alert('error');
			},
			success : function(data) {
				createAllAdTable(data);
			}
		});
	}

	//加载单个广告信息到控件
	function loadAdInfo(ad) {
		$("#inputAdUserID").attr("value", ad.UId);

		var str = "企业用户";
		if (ad.UType == 1) {
			str = "企业用户";
		} else {
			str = "个人用户";
		}

		$("#btn_adPublishMode").text(str);
		$("#inputAdUserType").attr("value", ad.UType);

		$("#inputAdStartDate").attr("value", ad.startDate);
		$("#inputAdEndDate").attr("value", ad.endDate);
		$("#inputAdMoney").attr("value", ad.adCost);
		$("#inputAdContent").attr("value", ad.adContent);
	}

	/*设置广告用户类型，企业用户为1，个人用户为0*/
	function selectAdPublishMode(self) {
		var str = $("#inputAdUserType").val();
		var val = 1;
		switch (self.id) {
		case "adPublish_Enterprise":
			str = "企业用户";
			val = 1;
			break;
		case "adPublish_User":
			str = "个人用户";
			val = 0;
			break;
		}

		$("#inputAdUserType").attr("value", val);
		$("#btn_adPublishMode").text(str);
	}

	//根据用户ID删除房屋，并更新管理员界面房屋表的显示
	function deleteAd(self) {
		//btn_am_delete_1, btn_am_delete_12
		var AId = (self.id).substr(14);

		layer.confirm('确定删除此记录？', {
			btn : [ '确定', '取消' ]
		//按钮
		}, function() {
			/*局部刷新页面，输出获得的数据*/
			$.ajax({
				url : 'json_deleteAd.action',
				type : 'post',
				dataType : "json",
				data : {
					"AId" : AId,
				},
				error : function() {
					alert('error');
				},
				success : function(data) {
					createAllAdTable(data);
				}
			});
			layer.msg('删除成功', {
				icon : 1
			});
		}, function() {
			layer.msg('取消删除', {
				time : 2000, //2s后自动关闭
				btn : [ '好' ]
			});
		});

	};

	$(document).ready(function() {

		//根据广告ID查询单个广告的信息
		$("#btn_querySingleAd").click(function() {
			var AId = $("#AId").val();
			if (AId == "") {
				AId = 1;
			}
			$.ajax({
				url : 'json_querySingleAd.action',
				type : 'post',
				dataType : "json",
				data : {
					"AId" : AId
				},
				error : function() {
					alert('error');
				},
				success : function(data) {
					loadAdInfo(data.ad); //加载信息到控件
				}
			});
		});

		//保存添加或修改的广告信息
		$("#add_ad_submit").click(function() {
			var type = $("#add_ad_submit").attr("value");
			var url = "";
			if (type == "添加广告") {
				url = 'json_saveAd.action';
			} else if (type == "保存修改") {
				url = 'json_updateAd.action';
			}

			var flag = false;
			if ($("#inputAdUserID").val() != "") {
				flag = true;
			}

			if (flag == false) {
				alert("请先填写信息");
			} else {
				$.ajax({
					url : url,
					type : 'post',
					dataType : "json",
					data : {
						"ad.id" : $("#AId").val(),
						"ad.UId" : $("#inputAdUserID").val(),
						"ad.UType" : $("#inputAdUserType").val(),
						"ad.adContent" : $("#inputAdContent").val(),
						"ad.adCost" : $("#inputAdMoney").val(),
						"ad.startDate" : $("#inputAdStartDate").val(),
						"ad.endDate" : $("#inputAdEndDate").val(),
					},
					async : false, //默认为true 异步   
					error : function() {
						alert('error' + ", " + $("#AId").val());
					},
					success : function(data) {
						alert("广告" + $("#AId").val() + "信息修改成功");
					}
				});
			}

		});

		//查询广告信息，生成分页表
		$("#btn_am_queryAd_all").click(function() {
			ad_pageSize = $("#curAdPageSize").attr("value");
			if (ad_pageSize == "") {
				ad_pageSize = 10;
			}

			$.ajax({
				url : 'json_queryAllAd.action',
				type : 'post',
				dataType : "json",
				data : {
					"ad_pageIndex" : 1,
					"ad_pageSize" : ad_pageSize,
				},
				async : false, //同步 
				error : function() {
					alert('error');
				},
				success : function(data) {
					//alert(JSON.stringify(data.adList));
					createAllAdTable(data); //显示用户表
				}
			});

		});

	});
</script>


<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
</head>


<body>
	<iframe id="header_nav" src="nav_model/header_nav_admin.jsp"
		width="100%" height="45px" style="border: 0px;" scrolling="no"></iframe>

	<!-- 用户密码隐藏域 -->
	<input type="hidden" id="UserPassword" value=""/>
	
	
	<!-- 用户分页隐藏域 -->
	<input type="hidden" name="hiddenPageIndex" id="pageIndex" value="1" />
	<input type="hidden" name="hiddenPageCount" id="pageCount" value="1" />


	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<div class="profile-box">
						<span class="profile"> <a href="#" class="section"> <img
								class="image" src=" images/admin/img2.jpg"
								alt="image description" width="26" height="26" /> <span
								class="text-box"> Welcome <strong class="name">幸平创真</strong>
							</span>
						</a> <a href="#" class="opener">opener</a>
						</span> <a href="#" class="btn-on">On</a>
					</div>
				</div>

				<div class="tabs">
					<div id="tab-1" class="tab">
						<article>
						<div class="text-section">
							<h1>房屋验证</h1>
							<p class="subtitle">验证卖方提交的房屋信息是否真实，并对房屋信息进行相应修改.</p>
						</div>
						<div class="tab-content">
							<div class="tab-pane active" id="delHouse">

								<!--分页输入框 -->
								<div style="float:right; margin-right:100px;margin-top:30px;">
									<!-- 查询模式隐藏域 -->
									<input type="hidden" id="selectedqueryHouseMode" /> <label
										style="width:80px">查询方式: </label>
									<div class="btn-group">
										<button id="btn_queryVeriMode" type="button"
											class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">未处理验证</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="queryVerificaton" href='javascript:'
												onclick='selectVeriQueryMode(this)'>未处理验证</a></li>
											<li class="divider"></li>
											<li><a id="queryVerificaton_processed"
												href='javascript:' onclick='selectVeriQueryMode(this)'>已处理验证</a></li>
										</ul>
									</div>
									<span class="caret" style="margin-right:30px;"></span> <label
										style="width:80px">分页大小：</label> <input id="curVeriPageSize"
										style="width:120px;height:30px; margin-right:30px;"
										type="text" value="10" placeholder="请输入分页大小" />
									<button id="btn_vm_queryVeri" type="submit"
										class="btn btn-primary" style="width:150px;">查询</button>
								</div>

								<div style="clear:both;height:5px"></div>

								<div class="container accordion-gap">

									<div id="tableDivVeri" style="margin-left:3%; margin-right:3%"></div>

									<div style="clear:both;height:5px; margin-bottom:30px;"></div>

									<div style="margin-bottom:150px;float:right;margin-right:65px;">
										当前 <input type="text" style="width:20px" id="curVeriPageIndex"
											readonly="readonly" value="1" /> / <input type="text"
											value="1" style="width:20px" id="curVeriPageCount"
											readonly="readonly" /> 页 <input id="btn_vm_lastpage"
											class="btn btn-primary" onclick="changeCurVeriPage(this)"
											type="button" style="width:80px;margin-left:30px;"
											value="上一页" /> <input id="btn_vm_nextpage"
											class="btn btn-primary" onclick="changeCurVeriPage(this)"
											type="button" style="width:80px;margin-left:30px;"
											value="下一页" />
									</div>

								</div>
							</div>
						</div>
						</article>
					</div>

					<div id="tab-2" class="tab">
						<article>
						<div class="text-section">
							<h1>投诉信息</h1>
							<p class="subtitle">处理用户对房产信息的投诉并修改相应信息</p>
						</div>

						<div class="container">
							<table class="table table-hover complainTable">
								<thead>
									<tr>
										<td>投诉日期</td>
										<td>用户ID</td>
										<td>房屋信息ID</td>
										<td>投诉原因</td>
										<td>处理状态</td>
										<td>结果</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2016-6-22</td>
										<td>1</td>
										<td>24</td>
										<td>烂尾楼！老板带着小姨子跑了！</td>
										<td><input type="radio" name="state" /></td>
										<td>
											<div class="switch">
												<input type="radio" name="complain" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="my-center-block">
							<button name="complain_save" class="btn btn-info" onclick="">保存</button>
							<!--保存  post修改值至后台-->
						</div>
						</article>
					</div>



					<!-- 用户信息管理 -->
					<div id="tab-3" class="tab">
						<article>
						<div class="text-section">
							<h1>用户信息管理</h1>
							<p class="subtitle">添加新用户、修改用户信用等级及其他信息、删除恶意用户等</p>
						</div>

						<ul class="nav nav-tabs">
							<li class="active"><a href="#addUser" data-toggle="tab">查询/修改用户信息</a>
							</li>
							<li><a href="#delUser" data-toggle="tab">查看/删除用户信息</a></li>
						</ul>

						<!-- 修改用户信息 -->
						<div class="tab-content">
							<div class="tab-pane active" id="addUser">
								<div class="container-fluid" style="height:660px">
									<div class="row-fluid">
										<div class="container" style="padding-top:40px;">

											<!-- 显示信息 -->
											<div class="accordion" id="accordion-423793">
												<div class="accordion-group accordion-group-gap">

													<div id="accordion-element-basic" class="accordion-body ">
														<div class="accordion-inner ">

															<!-- 隐藏域，存放用户ID，后台更新数据时需要UId来定位 -->
															<input type="hidden" id="inputUId" />


															<div class="my-container accordion-gap"
																style="margin-top:60px;">
																<table class="table table-hover">
																	<tr>
																		<td></td>
																		<td>
																			<div class="bootstrap-switch my-control">
																				<input type="radio" name="UserType"
																					id="inputUserType" />
																			</div>
																		</td>
																		<td></td>
																		<td><input id="UAccount" name="user.UAccount"
																			style="width:200px;height:30px; margin-left:60px;"
																			type="text" value="test" placeholder="请输入用户账号" />
																			<button id="btn_um_query" type="submit"
																				class="btn btn-primary"
																				onclick="changeToUserUpdate()">查询</button>
																			<button type="submit" class="btn btn-primary"
																				onclick="changeToUserAdd()">退出修改</button></td>
																	</tr>
																	<tr>
																		<td></td>
																		<td></td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">用户账号</label></td>
																		<td>
																			<div class=" my-control">
																				<input type="text" id="inputUAccount"
																					name="a_user.UAccount">
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">用户邮箱</label></td>
																		<td>
																			<div class=" my-control">
																				<input type="text" id="inputEmail"
																					name="a_user.UEmail">
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">用户名</label></td>
																		<td>
																			<div class=" my-control">
																				<input type="text" id="inputUsername"
																					name="a_user.UName">
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">密码</label></td>
																		<td>
																			<div class=" my-control">
																				<input type="text" id="inputPassword"
																					name="a_user.UPwd">
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">性别</label></td>
																		<td>
																			<div class=" my-control">
																				<div class="btn-group">
																					<button id="btn_userGender" type="button" value="男"
																						class="btn btn-primary dropdown-toggle"
																						data-toggle="dropdown" style="width:125px;">
																						男
																					</button>
																					<ul class="dropdown-menu" role="menu">
																						<li><a id="userGender_Male"
																							href='javascript:'
																							onclick='selectUserGender(this)'>男</a></li>
																						<li class="divider"></li>
																						<li><a id="userGender_Female" href='javascript:'
																							onclick='selectUserGender(this)'>女</a></li>
																					</ul>
																					
																				</div>
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">联系电话</label></td>
																		<td>
																			<div class=" my-control">
																				<input id="inputPhoneNumber" type="text" size="13"
																					name="a_user.UTele" maxlength="13"
																					onKeyUp="checkNum(this);" />
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																	<tr>
																		<td><label class="my-control-label">信用等级</label></td>
																		<td>
																			<div class=" my-control">
																				<select class="selectpicker my-control my-select"
																					id="credit-select" name="a_user.UCredit">
																					<option value="1">一星</option>
																					<option value="2">二星</option>
																					<option value="3">三星</option>
																					<option value="4">四星</option>
																					<option value="5">五星</option>
																				</select>
																			</div>
																		</td>
																		<td></td>
																		<td></td>
																	</tr>
																</table>

																<div class="my-center-block" style="margin-top:50px;">
																	<input type="submit" class="btn btn-large btn-primary "
																		style="width:180px;" value="添加用户" id="add_user_submit">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<!-- 查看/删除 -->
							<div class="tab-pane" id="delUser">
								<!--分页输入框 -->
								<div style="float:right; margin-right:100px;margin-top:30px;">
									<label style="width:80px">分页大小：</label> <input id="pageSize"
										style="width:120px;height:30px; margin-right:30px;"
										type="text" value="10" placeholder="请输入分页大小" />
									<button id="btn_um_query_all" type="submit"
										class="btn btn-primary" style="width:150px;">查询</button>
								</div>

								<div style="clear:both;height:5px"></div>


								<!-- 页面选择 -->
								<div class="container accordion-gap">
									<div id="tableDivAllUser"
										style="margin-left:3%; margin-right:3%"></div>

									<div style="clear:both;height:5px; margin-bottom:30px;"></div>

									<div style="margin-bottom:150px;float:right;margin-right:65px;">
										当前 <input type="text" style="width:20px" id="curPageIndex"
											readonly="readonly" /> / <input type="text"
											style="width:20px" id="curPageCount" readonly="readonly" />
										页 <input id="btn_um_lastpage" class="btn btn-primary"
											onclick="changeCurPage(this)" type="button"
											style="width:80px;margin-left:30px;" value="上一页" /> <input
											id="btn_um_nextpage" class="btn btn-primary"
											onclick="changeCurPage(this)" type="button"
											style="width:80px;margin-left:30px;" value="下一页" />
									</div>
								</div>
							</div>
						</div>
						</article>
					</div>



					<!-- 房屋信息管理 -->
					<div id="tab-4" class="tab">
						<article>
						<div class="text-section">
							<h1>房屋信息管理</h1>
							<p class="subtitle">修改房屋真实性及其他信息、删除虚假房源等</p>
						</div>
						<ul class="nav nav-tabs">
							<li><a href="#delHouse" data-toggle="tab">房屋信息</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="delHouse">

								<!--分页输入框 -->
								<div style="float:right; margin-right:100px;margin-top:30px;">
									<!-- 查询模式隐藏域 -->
									<input type="hidden" id="selectedqueryHouseMode" /> <label
										style="width:80px">查询方式: </label>
									<div class="btn-group" style="margin-right:30px;">
										<button id="btn_queryHouseMode" type="button"
											class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">
											查询企业楼盘
											<!-- <span class="caret"></span> -->

										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="queryHouse_Enterprise" href='javascript:'
												onclick='selectHouseQueryMode(this)'>查询企业楼盘</a></li>
											<li class="divider"></li>
											<li><a id="queryHouse_Secondhand" href='javascript:'
												onclick='selectHouseQueryMode(this)'>查询二手房屋</a></li>
											<li class="divider"></li>
											<li><a id="queryHouse_Rent" href='javascript:'
												onclick='selectHouseQueryMode(this)'>查询出租房屋</a></li>
										</ul>
									</div>


									<label style="width:80px">分页大小：</label> <input
										id="curHousePageSize"
										style="width:120px;height:30px; margin-right:30px;"
										type="text" value="10" placeholder="请输入分页大小" />
									<button id="btn_hm_queryHouse_all" type="submit"
										class="btn btn-primary" style="width:150px;">查询</button>
								</div>

								<div style="clear:both;height:5px"></div>

								<div class="container accordion-gap">

									<div id="tableDivAllHouse"
										style="margin-left:3%; margin-right:3%"></div>

									<div style="clear:both;height:5px; margin-bottom:30px;"></div>

									<div style="margin-bottom:150px;float:right;margin-right:65px;">
										当前 <input type="text" style="width:20px" value="1"
											id="curHousePageIndex" readonly="readonly" /> / <input
											type="text" style="width:20px" id="curHousePageCount"
											value="1" readonly="readonly" /> 页 <input
											id="btn_hm_lastpage" class="btn btn-primary"
											onclick="changeCurHousePage(this)" type="button"
											style="width:80px;margin-left:30px;" value="上一页" /> <input
											id="btn_hm_nextpage" class="btn btn-primary"
											onclick="changeCurHousePage(this)" type="button"
											style="width:80px;margin-left:30px;" value="下一页" />
									</div>

								</div>
							</div>
						</div>
						</article>
					</div>



					<!-- 管理广告 -->
					<div id="tab-5" class="tab">
						<article>
						<div class="text-section">
							<h1>发布广告</h1>
							<p class="subtitle">填写发布广告并支持查看、修改广告信息.</p>
						</div>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#addAd" data-toggle="tab">添加/修改</a>
							</li>
							<li><a href="#delAd" data-toggle="tab">查看/删除</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="addAd">

								<div class="container-fluid" style="height:660px">
									<div class="row-fluid">
										<div class="container">
											<div class="my-container accordion-gap"
												style="margin-top:60px;">
												<table class="table table-hover">
													<tr>
														<td></td>
														<td><label id="adManMode" class=" my-control"
															style="color:green">您现在是添加模式</label></td>
														<td>
															<div class=" my-control">
																<input id="AId" type="text" placeholder="请输入广告ID..." />
															</div>
														</td>
														<td><button id="btn_querySingleAd" type="submit"
																class="btn btn-primary" onclick="changeToAdUpdate()">查询</button>
															<button type="submit" class="btn btn-primary"
																onclick="changeToAdAdd()">退出修改</button></td>
													</tr>

													<tr>
														<td><label class="my-control-label">用户ID</label></td>
														<td>
															<div class=" my-control">
																<input type="text" id="inputAdUserID">
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td><label class="my-control-label">用户类型</label></td>
														<td>
															<div class=" my-control">
																<div class="btn-group" style="margin-right:30px;">
																	<button id="btn_adPublishMode" type="button"
																		class="btn btn-primary dropdown-toggle"
																		data-toggle="dropdown">
																		企业用户
																		<!-- <span class="caret"></span> -->

																	</button>
																	<ul class="dropdown-menu" role="menu">
																		<li><a id="adPublish_Enterprise"
																			href='javascript:'
																			onclick='selectAdPublishMode(this)'>企业用户</a></li>
																		<li class="divider"></li>
																		<li><a id="adPublish_User" href='javascript:'
																			onclick='selectAdPublishMode(this)'>个人用户</a></li>
																</div>

																<input type="hidden" id="inputAdUserType" value="1">
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td><label class="my-control-label">起始时间</label></td>
														<td>
															<div class=" my-control">
																<input type="text" value="" id="inputAdStartDate">
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td><label class="my-control-label">结束时间</label></td>
														<td>
															<div class=" my-control">
																<input type="text" value="" id="inputAdEndDate">
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td><label class="my-control-label">花销</label></td>
														<td>
															<div class=" my-control">
																<input type="text" value="" id="inputAdMoney">
																元/天
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td><label class="my-control-label">内容</label></td>
														<td>
															<div class=" my-control">
																<textarea id="inputAdContent" type="text" value=""
																	style="width:300px;height:80px;"></textarea>
															</div>
														</td>
														<td></td>
														<td></td>
													</tr>
												</table>

												<div class="my-center-block" style="margin-top:50px;">
													<input type="button" class="btn btn-large btn-primary "
														style="width:180px;" value="添加广告" id="add_ad_submit"
														name="bt">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane" id="delAd">
								<!--分页输入框 -->
								<div style="float:right; margin-right:100px;margin-top:30px;">
									<label style="width:80px">分页大小：</label> <input
										id="curAdPageSize"
										style="width:120px;height:30px; margin-right:30px;"
										type="text" value="10" placeholder="请输入分页大小" />
									<button id="btn_am_queryAd_all" type="submit"
										class="btn btn-primary" style="width:150px;">查询</button>
								</div>

								<div style="clear:both;height:5px"></div>

								<div class="container accordion-gap">

									<div id="tableDivAllAd" style="margin-left:3%; margin-right:3%"></div>

									<div style="clear:both;height:5px; margin-bottom:30px;"></div>

									<div style="margin-bottom:150px;float:right;margin-right:65px;">
										当前 <input type="text" style="width:20px" id="curAdPageIndex"
											value="1" readonly="readonly" /> / <input type="text"
											value="1" style="width:20px" id="curAdPageCount"
											readonly="readonly" /> 页 <input id="btn_am_lastpage"
											class="btn btn-primary" onclick="changeCurAdPage(this)"
											type="button" style="width:80px;margin-left:30px;"
											value="上一页" /> <input id="btn_am_nextpage"
											class="btn btn-primary" onclick="changeCurAdPage(this)"
											type="button" style="width:80px;margin-left:30px;"
											value="下一页" />
									</div>
								</div>
							</div>
						</div>
						</article>
					</div>
				</div>
			</div>
		</div>

		<aside id="sidebar"> <strong class="logo"><a href="#">lg</a></strong>
		<ul class="tabset buttons">
			<li class="active"><a href="#tab-1" class="ico1"><span>申请列表</span><em></em></a>
				<span class="tooltip"><span>申请列表</span></span></li>

			<li><a href="#tab-2" class="ico3"><span>投诉列表</span><em></em></a>
				<span class="tooltip"><span>投诉列表</span></span></li>
			<li><a href="#tab-3" class="ico2"><span>用户信息管理</span><em></em></a>
				<span class="tooltip"><span>用户信息管理</span></span></li>

			<li><a href="#tab-4" class="ico4"><span>房屋信息管理</span><em></em></a>
				<span class="tooltip"><span>房屋信息管理</span></span></li>
			<li><a href="#tab-5" class="ico5"><span>发布广告</span><em></em></a>
				<span class="tooltip"><span>发布广告</span></span></li>
		</ul>
		<span class="shadow"></span> </aside>
	</div>


</body>
</html>