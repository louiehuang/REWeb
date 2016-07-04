<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.chinasoft.pojo.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AdminPanel</title>
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
	function promptinfo() {
		var s1 = document.getElementById('province-select');
		var s2 = document.getElementById('city-select');
		var s3 = document.getElementById('county-select');
	}

	function changeToUserUpdate() {
		document.getElementById("add_user_submit").value = "保存修改";
	}

	function changeToUserAdd() {
		document.getElementById("add_user_submit").value = "提交";
	}

	function changeToAdUpdate() {
		document.getElementById("add_ad_submit").value = "保存修改";
	}

	function changeToAdAdd() {
		document.getElementById("add_ad_submit").value = "提交";
	}

	$(function() {
		function initTableCheckbox() {
			var $thr = $('table thead tr');
			var $checkAllTh = $('<th><input type="checkbox" id="checkAll" name="checkAll" /></th>');
			$thr.prepend($checkAllTh);
			var $checkAll = $thr.find('input');
			$checkAll
					.click(function(event) {
						$tbr.find('input').prop('checked',
								$(this).prop('checked'));
						if ($(this).prop('checked')) {
							$tbr.find('input').parent().parent().addClass(
									'warning');
						} else {
							$tbr.find('input').parent().parent().removeClass(
									'warning');
						}
						event.stopPropagation();
					});
			/*点击全选框所在单元格时也触发全选框的点击操作*/
			$checkAllTh.click(function() {
				$(this).find('input').click();
			});
			var $tbr = $('table tbody tr');
			var $checkItemTd = $('<td><input type="checkbox" name="checkItem" /></td>');
			$tbr.prepend($checkItemTd);
			$tbr
					.find('input')
					.click(
							function(event) {
								$(this).parent().parent()
										.toggleClass('warning');
								$checkAll
										.prop(
												'checked',
												$tbr.find('input:checked').length == $tbr.length ? true
														: false);
								event.stopPropagation();
							});
			$tbr.click(function() {
				$(this).find('input').click();
			});
		}
		initTableCheckbox();
	});
	function checkNum(obj) {
		obj.value = obj.value.replace(/\D/gi, "")
	}
</script>


<script type="text/javascript">
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

		$('#tableDiv').html(htmls.join(''));
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

	$(document).ready(function() {
		$("#btn_um_query").click(function() {
			$.ajax({
				url : 'json_queryUser.action',
				type : 'post',
				dataType : "json",
				//data : "user.UAccount=" + $("#UAccount").val(),
				data: {"user.UAccount": $("#UAccount").val()},
				//async : false, //默认为true 异步   
				error : function() {
					alert('error');
				},
				success : function(data) {
					createTable(data.list);
					loadUserInfo(data.list);
				}
			});
		});

		
		$("#add_user_submit").click(function() {
			$.ajax({
				url : 'json_updateUser.action',
				type : 'post',
				dataType : "json",
				data: {
						   "a_user.UId": $("#inputUId").val(), //用id赋值
						   "a_user.UAccount": $("#inputUAccount").val(),
						   "a_user.UPwd": $("#inputPassword").val(),	
						   "a_user.UName": $("#inputUsername").val(),	
						   "a_user.UGender": $("#inputSex").val(),	
						   "a_user.UCredit": $("#credit-select").val(),	
						   "a_user.UTele": $("#inputPhoneNumber").val(),	
						   "a_user.UEmail": $("#inputEmail").val(),	
				},
				async : false, //默认为true 异步   
				error : function() {
					alert('error' + ", " + $("#inputUAccount").val());
				},
				success : function(data) {
					alert("用户信息修改成功" );
				}
			});
		});
		
		

	});
</script>


<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/ie.css" /><![endif]-->
</head>


<body onload="setup();preselect('湖北省');promptinfo();">
	<iframe id="header_nav" src="nav_model/header_nav_admin.jsp"
		width="100%" height="48px" style="border: 0px;" scrolling="no"></iframe>

	<div id="wrapper">
		<div id="content">
			<div class="c1">
				<div class="controls">
					<div class="profile-box">
						<span class="profile"> <a href="#" class="section"> <img
								class="image" src=" images/admin/img1.png"
								alt="image description" width="26" height="26" /> <span
								class="text-box"> Welcome <strong class="name">Asif
										Aleem</strong>
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
						<div class="container">
							<table class="table table-hover " id="verifyTable">
								<thead>
									<tr>
										<td>申请日期</td>
										<td>用户ID</td>
										<td>房屋信息ID</td>
										<td>地址</td>
										<td>验证结果</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2016-6-21</td>
										<td>1</td>
										<td>4</td>
										<td>湖北省武汉市珞瑜路152号华中师范大学</td>
										<td>
											<div class="switch">
												<input type="radio" name="authenticity" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</article>
						<div class="my-center-block">
							<button name="verify_save" class="btn btn-info " onclick="">保存</button>
							<!--保存  post修改值至后台-->
						</div>
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

					<div id="tab-3" class="tab">
						<article>
						<div class="text-section">
							<h1>用户信息管理</h1>
							<p class="subtitle">添加新用户、修改用户信用等级及其他信息、删除恶意用户等</p>
						</div>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#addUser" data-toggle="tab">添加/修改</a>
							</li>
							<li><a href="#delUser" data-toggle="tab">查看/删除</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="addUser">
								<div class="container-fluid">
									<div class="row-fluid">
										<div class="container" style="padding-top:40px;">


											<div class="my-query">
												<label class="my-control-label">身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</label>
												<div class="bootstrap-switch my-control">
													<input type="radio" name="UserType" id="inputUserType" />
												</div>
												<input id="UAccount" name="user.UAccount"
													style="width:200px;height:30px; margin-left:60px;"
													type="text" value="test" placeholder="请输入用户账号" />
												<button id="btn_um_query" type="submit"
													class="btn btn-primary" onclick="changeToUserUpdate()">查询</button>
												<button type="submit" class="btn btn-primary"
													onclick="changeToUserAdd()">退出修改</button>

												<div id="tableDiv"></div>
											</div>


											<!-- 											<form action="um!updateFromAdmin" method="post"> -->


											<div class="accordion" id="accordion-423793">
												<div class="accordion-group accordion-group-gap">
													<div class="accordion-heading ">
														<a class="accordion-toggle my-accordion"
															data-toggle="collapse" data-parent="#accordion-423793"
															href="#accordion-element-basic">基本信息</a>
													</div>
													<div id="accordion-element-basic" class="accordion-body ">
														<div class="accordion-inner ">

															<input type="hidden" name="a_user.UId" id="inputUId"/>
															<div class="my-container accordion-gap">
																<label class="my-control-label">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
																<div class=" my-control">
																	<input type="text" id="inputUAccount"
																		name="a_user.UAccount">
																</div>
															</div>
															<div class="my-container">
																<label class="my-control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
																<div class=" my-control">
																	<input type="text" id="inputEmail" name="a_user.UEmail">
																</div>
															</div>
															<div class="my-container ">
																<label class="my-control-label">用&nbsp;户&nbsp;名&nbsp;</label>
																<div class=" my-control">
																	<input type="text" id="inputUsername"
																		name="a_user.UName">
																</div>
															</div>
															<div class="my-container">
																<label class="my-control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
																<div class=" my-control">
																	<input type="text" id="inputPassword"
																		name="a_user.UPwd">
																</div>
															</div>
															<div class="my-container">
																<label class="my-control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
																<div class="swicth my-control">
																	<input type="radio" name="a_user.UGender" id="inputSex" />
																</div>
															</div>
															<div class="my-container">
																<label class="my-control-label">联系电话</label>
																<div class=" my-control">
																	<input id="inputPhoneNumber" type="text" size="13"
																		name="a_user.UTele" maxlength="13"
																		onKeyUp="checkNum(this);" />
																</div>
															</div>




															<!--毒瘤		-->
															<!-- <input type="hidden" name="a_user.UCredit" value="1"/> -->





														</div>
													</div>
												</div>
												<div class="accordion-group accordion-group-gap">
													<br />
													<div class="accordion-heading">
														<a class="accordion-toggle my-accordion"
															data-toggle="collapse" data-parent="#accordion-423793"
															href="#accordion-element-power">权限信息</a>
													</div>
													<div id="accordion-element-power" class="accordion-body in">
														<div class="accordion-inner accordion-gap ">
															<div class="my-container">
																<label class="my-control-label">信用等级</label> <select
																	class="selectpicker my-control my-select"
																	id="credit-select" name="a_user.UCredit">
																	<option value="1">一星</option>
																	<option value="2">二星</option>
																	<option value="3">三星</option>
																	<option value="4">四星</option>
																	<option value="5">五星</option>
																</select>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="my-center-block">
												<input type="submit" class="btn btn-large btn-primary "
													value="提交" id="add_user_submit">
											</div>

											<!-- 											</form> -->
										</div>
									</div>
								</div>
								<br /> <br />
							</div>

							<div class="tab-pane" id="delUser">
								<div class="container accordion-gap">
									<table class="table table-hover " id="UserTable">
										<thead>
											<tr>
												<td>用户ID</td>
												<td>邮箱</td>
												<td>用户名</td>
												<td>密码</td>
												<td>性别</td>
												<td>联系电话</td>
												<td>信用等级</td>
												<td>身份</td>
												<td>地址</td>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>1</td>
												<td>2@gmail.com</td>
												<td>小王</td>
												<td>12121212</td>
												<td>男</td>
												<td>13874562134</td>
												<td>四星</td>
												<td>个人用户</td>
												<td>湖北省武汉市珞喻路152号华中师范大学</td>
											</tr>
										</tbody>
									</table>
									<button class="btn btn-info my-center-block accordion-gap"
										name="del_user_submit">确认删除</button>
								</div>
							</div>
						</div>
						</article>
					</div>
					<div id="tab-4" class="tab">
						<article>
						<div class="text-section">
							<h1>房屋信息管理</h1>
							<p class="subtitle">修改房屋真实性及其他信息、删除虚假房源等</p>
						</div>
						<ul class="nav nav-tabs">
							<li><a href="#updateHouse" data-toggle="tab">更改房屋信息</a></li>
							<li><a href="#delHouse" data-toggle="tab">删除房屋信息</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="updateHouse">
								<div class=" accordion-gap">
									<div class="container-fluid">
										<div class="row-fluid">
											<div class="container">
												<div class="my-container">
													<input class="input-medium search-query my-input"
														type="text" placeholder="请输入房源信息ID..." />
													<button type="submit" class="btn my-btn">查找</button>
												</div>
												<div class="my-container accordion-gap">
													<label class="my-control-label">房源信息ID</label>
													<div class=" my-control">
														<input type="text" id="inputId" readonly="readonly">
													</div>
												</div>
												<div class="my-container ">
													<label class="my-control-label">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;段</label>
													<div class=" my-control">
														<input type="text" id="inputAddress">
													</div>
												</div>
												<div class="my-container">
													<label class="my-control-label">户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
													<div class=" my-control">
														<input type="text" id="inputHouseType">
													</div>
												</div>
												<div class="my-container">
													<label class="my-control-label">面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积</label>
													<div class=" my-control">
														<input type="text" id="inputArea">
													</div>
												</div>
												<div class="my-container">
													<label class="my-control-label">楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;层</label>
													<div class=" my-control">
														<input id="inputFloor" type="text" />
													</div>
												</div>
												<div class="my-container">
													<label class="my-control-label">真&nbsp;&nbsp;&nbsp;&nbsp;实&nbsp;&nbsp;&nbsp;&nbsp;性</label>
													<div class="bootstrap-switch my-control">
														<input type="radio" name="trueness" id="inputTrueness" />
													</div>
												</div>
												<div class="my-container">
													<label class="my-control-label">有&nbsp;&nbsp;&nbsp;&nbsp;效&nbsp;&nbsp;&nbsp;&nbsp;性</label>
													<div class="bootstrap-switch my-control">
														<input type="radio" name="availability"
															id="inputAvailability" />
													</div>
												</div>
												<div class="my-center-block">
													<button class="btn btn-info accordion-gap"
														name="update_house_submit">保存修改</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="delHouse">
								<div class="container accordion-gap">
									<table class="table table-hover " id="HouseTables">
										<thead>
											<tr>
												<td>房源信息ID</td>
												<td>用户ID</td>
												<td>户型</td>
												<td>楼层</td>
												<td>地址</td>
												<td>面积</td>
												<td>价格</td>
												<td>真实性</td>
												<td>有效性</td>
												<td>备注</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>4</td>
												<td>2</td>
												<td>两房一厅</td>
												<td>5</td>
												<td>湖北省武汉市珞瑜路152号华中师范大学</td>
												<td>80</td>
												<td>100</td>
												<td>1</td>
												<td>1</td>
												<td>无</td>
											</tr>
										</tbody>
									</table>
									<div class="my-center-block">
										<button class="btn btn-info accordion-gap"
											name="del_house_submit">确认删除</button>
									</div>
								</div>
							</div>
						</div>
						</article>
					</div>
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
								<div class="container-fluid">
									<div class="row-fluid">
										<div class="container">
											<div class="my-query">
												<input style="width:200px;height:30px;" type="text"
													placeholder="请输入广告ID..." />
												<button type="submit" class="btn btn-primary"
													onclick="changeToAdUpdate()">查询</button>
												<button type="submit" class="btn btn-primary"
													onclick="changeToAdAdd()">退出修改</button>
											</div>
											<div class="my-container accordion-gap">
												<label class="my-control-label">用&nbsp;户&nbsp;&nbsp;ID</label>
												<div class=" my-control">
													<input type="text" id="inputAdUserID">
												</div>
											</div>
											<div class="my-container">
												<label class="my-control-label">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间</label>
												<div class=" my-control">
													<input type="text" id="inputAdDate">
												</div>
											</div>
											<div class="my-container">
												<label class="my-control-label">用户类型</label>
												<div class="switch my-control">
													<input type="radio" name="UserType" id="inputAdUserType">
												</div>
											</div>
											<div class="my-container">
												<label class="my-control-label">花&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</label>
												<div class=" my-control">
													<input type="text" id="inputAdMoney"> 元/天
												</div>
											</div>
											<div class="my-container">
												<label class="my-control-label">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容</label>
												<div class=" my-control">
													<textarea id="inputAdContent" type="text"
														style="width:300px;height:80px;"></textarea>
												</div>
											</div>
										</div>
									</div>
									<br />
									<div class="my-center-block">
										<input type="button" class="btn btn-large btn-primary "
											value="提交" id="add_ad_submit" name="bt">
									</div>
								</div>
							</div>
							<div class="tab-pane" id="delAd">
								<div class="container accordion-gap">
									<table class="table table-hover " id="AdTable">
										<thead>
											<tr>
												<td>广告ID</td>
												<td>时间</td>
												<td>用户ID</td>
												<td>用户类型</td>
												<td>广告花费</td>
												<td>广告内容</td>
											</tr>
										</thead>
										<tbody id="delAdTable">
											<tr>
												<td>1</td>
												<td>2016-6-23</td>
												<td>1</td>
												<td>1</td>
												<td>5000</td>
												<td>一口气上五楼，不费劲！</td>
											</tr>
										</tbody>
									</table>
									<div class="my-center-block">
										<button class="btn btn-info accordion-gap"
											name="del_ad_submit">确认删除</button>
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

	<!-- <iframe src = "footer_nav.html" width="100%" height="325px" style="border: 0px;" scrolling="no"></iframe>
 -->
</body>
</html>