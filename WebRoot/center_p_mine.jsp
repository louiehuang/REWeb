<%@page import="com.chinasoft.pojo.Users"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script type="text/javascript">

	function UserPwdCheck1() {
		var UPwd = $("#User_pwd1").val();
		
		//alert(UPwd);
		
		if (UPwd == "") {
			document.getElementById("UserPwdCheck1Span").innerHTML = "";
			document.getElementById("changeInfo-submit").disabled = true;
		} else {
			$
					.ajax({
						url : 'checkPwd.action',
						type : 'post',
						dataType : "json",
						data : {
							"User_pwd" : UPwd
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data.userPwd == "1") {
								document.getElementById("UserPwdCheck1Span").innerHTML = "<font color='red'>密码错误</font>";
								//document.getElementById("register-submit").disabled = true;
							} else if (data.userPwd == "0") {
								document.getElementById("UserPwdCheck1Span").innerHTML = "<font color='green'>密码正确</font>";
								document.getElementById("changeInfo-submit").disabled = false;
							}
						}
					});
		}
	}

	function UserPwdCheck2() {
		//var UPwd = $("#User_pwd2").val();
		var UPwd = $("#User_pwd2").attr("value");
		
		//alert(UPwd);
		
		
		if (UPwd == "") {
			document.getElementById("UserPwdCheck2Span").innerHTML = "";
			document.getElementById("changePwd-submit").disabled = true;
		} else {
			$
					.ajax({
						url : 'checkPwd.action',
						type : 'post',
						dataType : "json",
						data : {
							"User_pwd" : UPwd
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert("error");
						},
						success : function(data) {
							if (data.userPwd == "1") {
								document.getElementById("UserPwdCheck2Span").innerHTML = "<font color='red'>密码错误</font>";
								//document.getElementById("register-submit").disabled = true;
							} else if (data.userPwd == "0") {
								document.getElementById("UserPwdCheck2Span").innerHTML = "<font color='green'>密码正确</font>";
								document.getElementById("changePwd-submit").disabled = false;
							}
						}
					});
		}
	}

	function UserPwdMakeSure() {
		var pwd1 = document.getElementById("User_pwd_new").value;
		var pwd2 = document.getElementById("Check_pwd_new").value;
		if (pwd1 == pwd2) {
			document.getElementById("PwdCheckSpan").innerHTML = "<font color='green'>两次密码一致</font>";
			document.getElementById("changePwd-submit").disabled = false;
		} else {
			document.getElementById("PwdCheckSpan").innerHTML = "<font color='red'>两次密码输入不一致</font>";
			document.getElementById("changePwd-submit").disabled = true;
		}
	}
</script>
</head>

<body style="background-color:#F8F8F8">

	<!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<%
		if (session.getAttribute("users") == null) {
	%>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else {
	%>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		}
	%>

	<div class="container-fluid"
		style="margin-top:20px; margin-bottom: 50px;">
		<div class="row-fluid">
			<div class="span3">
				<div align="center">
					<img alt="100x100" src=${session.users.UHeader } class="img-circle"
						style="width: 100px;height: 100px" />
					<p class="dl-horizontal" style="margin-top:20px">
						<span><strong> <c:out
									value="${session.users.UName } "></c:out>
						</strong></span>
					</p>
				</div>
				<div class="list-group" style="margin-top:40px">
					<a class="list-group-item active" href="cc!LoadInfo">个人中心</a>
					<div class="list-group-item">
						<a href="cc!LoadInfo">首页</a>
					</div>
					<div class="list-group-item">
						<a href="cc!LoadInfo">账户设置</a>
					</div>
					<div class="list-group-item">
						<a href="cc!LoadInfo">消息</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="cb!LoadBillInfo">交易中心</a>
					<div class="list-group-item">
						<a href="cb!LoadBillInfo">我买入的新房</a>
					</div>
					<div class="list-group-item">
						<a href="cb!LoadBillInfo">我买入的二手房</a>
					</div>
					<div class="list-group-item">
						<a href="cb!LoadBillInfo">我租到的房屋</a>
					</div>
					<div class="list-group-item">
						<a href="cb!LoadBillInfo">我卖出的二手房</a>
					</div>
					<div class="list-group-item">
						<a href="cb!LoadBillInfo">我租出的房屋</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="cf!LoadFollowInfo">关注中心</a>
					<div class="list-group-item">
						<a href="cf!LoadFollowInfo">我关注的新楼盘</a>
					</div>
					<div class="list-group-item">
						<a href="cf!LoadFollowInfo">我关注的二手房</a>
					</div>
					<div class="list-group-item">
						<a href="cf!LoadFollowInfo">我关注的出租房</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="ch!LoadHouseStateInfo">我发布的房屋</a>
					<div class="list-group-item">
						<a href="ch!LoadHouseStateInfo">二手房</a>
					</div>
					<div class="list-group-item">
						<a href="ch!LoadHouseStateInfo">出租房</a>
					</div>
				</div>
			</div>
			<div class="span9">
				<div class="tabbable" id="tabs-711867">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-655240" data-toggle="tab">首页</a>
						</li>
						<li><a href="#panel-392567" data-toggle="tab">账户设置</a></li>
						<li><a href="#panel-987654" data-toggle="tab">消息</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane  active" id="panel-655240">
							<span class="label" style="margin-top:10px">我最近关注的新楼盘</span>
							<ul class="thumbnails" style="margin-top:10px">
								<div class="row-fluid">
									<c:forEach var="house"
										items="${collectHouseSellEnterpriseList}" begin="0" end="2">
										<li class="span4">
											<div class="thumbnail">
												<a href="HouseAction!Info?HId=${house.HId }&&CType=1">
												<img
													alt="300x200" src="${house.getPics().split(';')[0] }"
													style="width: 300px;height: 200px" />
												</a>
												<div class="caption">
													<a href="HouseAction!Info?HId=${house.HId }&&CType=1">
														<h4>${house.getTitle() }</h4>
													</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</div>
								<span class="label" style="margin-top:20px">我最近关注的二手房</span>
								<ul class="thumbnails" style="margin-top:10px">
									<div class="row-fluid">
										<c:forEach var="house"
											items="${collectHouseSellSecondhandList}" begin="0" end="2">
											<li class="span4">
												<div class="thumbnail">
													<a href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=2">
													<img
														alt="300x200" src="${house.getPics().split(';')[0] }"
														style="width: 300px;height: 200px" />
													</a>
													<div class="caption">
														<a href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=2">
															<h4>${house.getTitle() }</h4>
														</a>
													</div>
												</div>
											</li>
										</c:forEach>
									</div>
								</ul>
								<span class="label" style="margin-top:20px">我最近关注的出租房</span>
								<ul class="thumbnails" style="margin-top:10px">
									<div class="row-fluid">
										<c:forEach var="house" items="${collectHouseSellRentList}"
											begin="0" end="2">
											<li class="span4">
												<div class="thumbnail">
													<a href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=3">
													<img
														alt="300x200" src="${house.getPics().split(';')[0] }"
														style="width: 300px;height: 200px" />
													</a>
													<div class="caption">
														<a href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=3">
															<h4>${house.getTitle() }</h4>
														</a>
													</div>
												</div>
											</li>
										</c:forEach>
									</div>
								</ul>
						</div>
						<div class="tab-pane" id="panel-392567">
							<div class="accordion" id="accordion-126037">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle collapsed" data-toggle="collapse"
											data-parent="#accordion-126037"
											href="#accordion-element-297071">个人信息</a>
									</div>
									<div id="accordion-element-297071"
										class="accordion-body collapse">
										<div class="accordion-inner">
											<form class="form-horizontal" method="post"
												action="cc!changePersonInfo">
												<%-- <input type="hidden"  id="User_pwd" value="${session.users.getUPwd() }"/> --%>
												<div class="control-group">
													<label class="control-label" for="User_account">帐号</label>
													<div class="controls">
														<input id="User_account"
															placeholder="${session.users.UAccount }" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_credit">信用等级</label>
													<div class="controls">
														<input id="User_credit"
															placeholder="${session.users.UCredit }" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_type">用户身份</label>
													<div class="controls">
														<input id="User_type" placeholder="个人用户" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_name">用户名</label>
													<div class="controls">
														<input name="changeName" id="User_name"
															placeholder="请输入新用户名" type="text"
															value="${session.users.UName }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_gender">性别</label>
													<div class="controls">
														<select name="changeGender" id="User_gender">
															<c:choose>
																<c:when test="${session.users.UGender=='女' }">
																	<option value="男">男</option>
																	<option value="女" selected="selected">女</option>
																</c:when>
																<c:otherwise>
																	<option value="男" selected="selected">男</option>
																	<option value="女">女</option>
																</c:otherwise>
															</c:choose>
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_email">邮箱</label>
													<div class="controls">
														<input name="changeEmail" id="User_email"
															placeholder="请输入新邮箱" type="text"
															value="${session.users.UEmail }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_tele">电话</label>
													<div class="controls">
														<input name="changeTele" id="User_tele"
															placeholder="请输入新电话" type="text"
															value="${session.users.UTele }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_pwd1">密码</label>
													<div class="controls">
														<input id="User_pwd1" name="User_pwd1" placeholder="请输入密码"
															onBlur="UserPwdCheck1()" type="password" />
														<span id="UserPwdCheck1Span"></span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<input type="submit" class="btn btn-primary"
															id="changeInfo-submit" value="提交修改" />
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle collapsed" data-toggle="collapse"
											data-parent="#accordion-126037"
											href="#accordion-element-197773">修改密码</a>
									</div>
									<div id="accordion-element-197773"
										class="accordion-body collapse">
										<div class="accordion-inner">
											<form class="form-horizontal" action="cc!changePersonPwd"
												method="post">
												<%-- <input type="hidden"  id="User_old_pwd" value="${session.users.getUPwd() }"/> --%>
												<div class="control-group">
													<label class="control-label" for="User_pwd2">原密码</label>
													<div class="controls">
														<input id="User_pwd2" name="User_pwd2"
															placeholder="请输入旧密码" type="password"
															onBlur="UserPwdCheck2()" />
														<span id="UserPwdCheck2Span"></span>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_pwd_new">新密码</label>
													<div class="controls">
														<input id="User_pwd_new" name="changePwd"
															placeholder="请输入新密码" type="password" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="Check_pwd_new">确认新密码</label>
													<div class="controls">
														<input id="Check_pwd_new" placeholder="请确认新密码"
															type="password" onkeyup="UserPwdMakeSure()" />
														<span id="PwdCheckSpan"></span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<input type="submit" class="btn btn-primary"
															id="changePwd-submit" value="提交" />
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="panel-987654">
							<div class="accordion" id="accordion-977402">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion-977402"
											href="#accordion-element-664175">系统通知 <span class="badge"
											style="color:lightblue">新通知个数</span>
										</a>
									</div>
									<div id="accordion-element-664175"
										class="accordion-body collapse in">
										<div class="accordion-inner" style="background-color: #ECF5FF">
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的申请验证房屋XXX已通过验证！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除通知</h3>
														</div>
														<div class="modal-body">
															<p>确定将该通知从我的通知中删除？</p>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">关闭</button>
															<button class="btn btn-primary">确定</button>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的申请验证房屋XXX未通过验证！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除通知</h3>
														</div>
														<div class="modal-body">
															<p>确定将该通知从我的通知中删除？</p>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">关闭</button>
															<button class="btn btn-primary">确定</button>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的房屋XXX由于被投诉已被禁止出租！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除通知</h3>
														</div>
														<div class="modal-body">
															<p>确定将该通知从我的通知中删除？</p>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">关闭</button>
															<button class="btn btn-primary">确定</button>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的申请验证房屋XXX已通过验证！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除通知</h3>
														</div>
														<div class="modal-body">
															<p>确定将该通知从我的通知中删除？</p>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">关闭</button>
															<button class="btn btn-primary">确定</button>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的申请验证房屋XXX已通过验证！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除通知</h3>
														</div>
														<div class="modal-body">
															<p>确定将该通知从我的通知中删除？</p>
														</div>
														<div class="modal-footer">
															<button class="btn" data-dismiss="modal"
																aria-hidden="true">关闭</button>
															<button class="btn btn-primary">确定</button>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="pagination" align="right">
												<ul>
													<li><a href="#">上一页</a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">下一页</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion-977402"
											href="#accordion-element-469365">评论<span class="badge"
											style="color:lightblue">新评论个数</span></a>
									</div>
									<div id="accordion-element-469365"
										class="accordion-body collapse">
										<div class="accordion-inner">
											<div class="row-fluid">
												<div class="span1">
													<div align="right">
														<img alt="50x50" src="img/gbf.jpg" class="img-circle"
															style="width: 50px;height: 50px" />
													</div>
												</div>
												<div class="span11">
													<div class="row-fluid">
														<div class="span10">
															<span><strong>评论用户名</strong></span> <br /> <span>啊啊啊啊
																好坑啊，太坑了</span>
														</div>
														<div class="span2">
															<div class="row-fluid">
																<div class="span6">
																	<a id="ansbtn" href="#modal-container-513601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-513601"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">回复评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>
																				<input type="text" name="ans" />
																			</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">回复</button>
																		</div>
																	</div>
																</div>
																<div class="span6">
																	<a id="delbtn" href="#modal-container-513602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-513602"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">删除评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>确定将该评论从我的消息中删除？</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<span><strong>评论我的发布：</strong></span>
															<div class="row-fluid" style="background-color: #ECF5FF">
																<div class="span2">
																	<img alt="100*100" src="img/gbx.jpg"
																		style="width: 100px;height: 100px" />
																</div>
																<div class="span10">
																	房屋名：啊啊啊感动撒 <br /> 价格：5000元/月 <br /> 地区：发生地方撒点 <br />
																	房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
																</div>
															</div>
															<span>6月22日 11:20 </span>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span1">
													<div align="right">
														<img alt="50x50" src="img/gbf.jpg" class="img-circle"
															style="width: 50px;height: 50px" />
													</div>
												</div>
												<div class="span11">
													<div class="row-fluid">
														<div class="span10">
															<span><strong>评论用户名</strong></span> <br /> <span>啊啊啊啊
																好坑啊，太坑了</span>
														</div>
														<div class="span2">
															<div class="row-fluid">
																<div class="span6">
																	<a id="ansbtn" href="#modal-container-513601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-513601"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">回复评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>
																				<input type="text" name="ans" />
																			</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">回复</button>
																		</div>
																	</div>
																</div>
																<div class="span6">
																	<a id="delbtn" href="#modal-container-513602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-513602"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">删除评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>确定将该评论从我的消息中删除？</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<span><strong>评论我的发布：</strong></span>
															<div class="row-fluid" style="background-color: #ECF5FF">
																<div class="span2">
																	<img alt="100*100" src="img/gbx.jpg"
																		style="width: 100px;height: 100px" />
																</div>
																<div class="span10">
																	房屋名：啊啊啊感动撒 <br /> 价格：5000元/月 <br /> 地区：发生地方撒点 <br />
																	房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
																</div>
															</div>
															<span>6月22日 11:20 </span>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span1">
													<div align="right">
														<img alt="50x50" src="img/gbf.jpg" class="img-circle"
															style="width: 50px;height: 50px" />
													</div>
												</div>
												<div class="span11">
													<div class="row-fluid">
														<div class="span10">
															<span><strong>评论用户名</strong></span> <br /> <span>啊啊啊啊
																好坑啊，太坑了</span>
														</div>
														<div class="span2">
															<div class="row-fluid">
																<div class="span6">
																	<a id="ansbtn" href="#modal-container-513601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-513601"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">回复评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>
																				<input type="text" name="ans" />
																			</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">回复</button>
																		</div>
																	</div>
																</div>
																<div class="span6">
																	<a id="delbtn" href="#modal-container-513602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-513602"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">删除评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>确定将该评论从我的消息中删除？</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<span><strong>评论我的发布：</strong></span>
															<div class="row-fluid" style="background-color: #ECF5FF">
																<div class="span2">
																	<img alt="100*100" src="img/gbx.jpg"
																		style="width: 100px;height: 100px" />
																</div>
																<div class="span10">
																	房屋名：啊啊啊感动撒 <br /> 价格：5000元/月 <br /> 地区：发生地方撒点 <br />
																	房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
																</div>
															</div>
															<span>6月22日 11:20 </span>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span1">
													<div align="right">
														<img alt="50x50" src="img/gbf.jpg" class="img-circle"
															style="width: 50px;height: 50px" />
													</div>
												</div>
												<div class="span11">
													<div class="row-fluid">
														<div class="span10">
															<span><strong>评论用户名</strong></span> <br /> <span>啊啊啊啊
																好坑啊，太坑了</span>
														</div>
														<div class="span2">
															<div class="row-fluid">
																<div class="span6">
																	<a id="ansbtn" href="#modal-container-513601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-513601"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">回复评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>
																				<input type="text" name="ans" />
																			</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">回复</button>
																		</div>
																	</div>
																</div>
																<div class="span6">
																	<a id="delbtn" href="#modal-container-513602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-513602"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">删除评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>确定将该评论从我的消息中删除？</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<span><strong>评论我的发布：</strong></span>
															<div class="row-fluid" style="background-color: #ECF5FF">
																<div class="span2">
																	<img alt="100*100" src="img/gbx.jpg"
																		style="width: 100px;height: 100px" />
																</div>
																<div class="span10">
																	房屋名：啊啊啊感动撒 <br /> 价格：5000元/月 <br /> 地区：发生地方撒点 <br />
																	房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
																</div>
															</div>
															<span>6月22日 11:20 </span>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="row-fluid">
												<div class="span1">
													<div align="right">
														<img alt="50x50" src="img/gbf.jpg" class="img-circle"
															style="width: 50px;height: 50px" />
													</div>
												</div>
												<div class="span11">
													<div class="row-fluid">
														<div class="span10">
															<span><strong>评论用户名</strong></span> <br /> <span>啊啊啊啊
																好坑啊，太坑了</span>
														</div>
														<div class="span2">
															<div class="row-fluid">
																<div class="span6">
																	<a id="ansbtn" href="#modal-container-513601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-513601"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">回复评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>
																				<input type="text" name="ans" />
																			</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">回复</button>
																		</div>
																	</div>
																</div>
																<div class="span6">
																	<a id="delbtn" href="#modal-container-513602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-513602"
																		class="modal hide fade" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div class="modal-header">
																			<button type="button" class="close"
																				data-dismiss="modal" aria-hidden="true">×</button>
																			<h3 id="myModalLabel">删除评论</h3>
																		</div>
																		<div class="modal-body">
																			<p>确定将该评论从我的消息中删除？</p>
																		</div>
																		<div class="modal-footer">
																			<button class="btn" data-dismiss="modal"
																				aria-hidden="true">关闭</button>
																			<button class="btn btn-primary">确定</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<span><strong>评论我的发布：</strong></span>
															<div class="row-fluid" style="background-color: #ECF5FF">
																<div class="span2">
																	<img alt="100*100" src="images/house/gbx.jpg"
																		style="width: 100px;height: 100px" />
																</div>
																<div class="span10">
																	房屋名：啊啊啊感动撒 <br /> 价格：5000元/月 <br /> 地区：发生地方撒点 <br />
																	房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
																</div>
															</div>
															<span>6月22日 11:20 </span>
														</div>
													</div>
												</div>
											</div>
											<HR style="border:1 dashed #987cb9" width="100%" color=blue
												SIZE=1>
											<div class="pagination" align="right">
												<ul>
													<li><a href="#">上一页</a></li>
													<li><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">下一页</a></li>
												</ul>
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
	</div>

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>
</body>

</html>