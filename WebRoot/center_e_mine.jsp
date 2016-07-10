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
	
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">

<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script type="text/javascript">

	function EnterpriseUserPwdCheck1() {
		//var UPwd = $("#User_pwd1").val();
		//var UPwd = document.getElementById("User_pwd1").value;
		var UPwd = $("#EnterpriseUser_pwd1").attr("value");
		if (UPwd == "") {
			document.getElementById("EnterpriseUserPwdCheck1Span").innerHTML = "";
			document.getElementById("changeEnterpriseInfo-submit").disabled = true;
		} else {
			$
					.ajax({
						url : 'checkEnterprisePwd.action',
						type : 'post',
						dataType : "json",
						data : {
							"UserEnterprisepwd" : UPwd
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data.userEnterprisePwd == "1") {
								document.getElementById("EnterpriseUserPwdCheck1Span").innerHTML = "<font color='red'>密码错误</font>";
								//document.getElementById("register-submit").disabled = true;
							} else if (data.userEnterprisePwd == "0") {
								document.getElementById("EnterpriseUserPwdCheck1Span").innerHTML = "<font color='green'>密码正确</font>";
								document.getElementById("changeEnterpriseInfo-submit").disabled = false;
							}
						}
					});
		}
	}

	function EnterpriseUserPwdCheck2() {
		var UPwd = $("#EnterpriseUser_pwd2").attr("value");
		if (UPwd == "") {
			document.getElementById("EnterpriseUserPwdCheck2Span").innerHTML = "";
			document.getElementById("changeEnterprisePwd-submit").disabled = true;
		} else {
			$
					.ajax({
						url : 'checkPwd.action',
						type : 'post',
						dataType : "json",
						data : {
							"UserEnterprisepwd" : UPwd
						},
						//async : false, //默认为true 异步   
						error : function() {
							alert("error");
						},
						success : function(data) {
							if (data.userPwd == "1") {
								document.getElementById("EnterpriseUserPwdCheck2Span").innerHTML = "<font color='red'>密码错误</font>";
								//document.getElementById("register-submit").disabled = true;
							} else if (data.userPwd == "0") {
								document.getElementById("EnterpriseUserPwdCheck2Span").innerHTML = "<font color='green'>密码正确</font>";
								document.getElementById("changeEnterprisePwd-submit").disabled = false;
							}
						}
					});
		}
	}

	function EnterpriseUserPwdMakeSure() {
		var pwd1 = document.getElementById("EnterpriseUser_pwd_new").value;
		var pwd2 = document.getElementById("EnterpriseCheck_pwd_new").value;
		if (pwd1 == pwd2) {
			document.getElementById("EnterprisePwdCheckSpan").innerHTML = "<font color='green'>两次密码一致</font>";
			document.getElementById("changeEnterprisePwd-submit").disabled = false;
		} else {
			document.getElementById("EnterprisePwdCheckSpan").innerHTML = "<font color='red'>两次密码输入不一致</font>";
			document.getElementById("changeEnterprisePwd-submit").disabled = true;
		}
	}
</script>
</head>

<body style="background-color:#F8F8F8">
	 
	 <!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<% if (session.getAttribute("enterpriseUsers") == null) { %>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="120px" style="border: 0px;" scrolling="no"></iframe>
	<% } else { %>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp" width="100%"
		height="120px" style="border: 0px;" scrolling="no"></iframe>
	<% }%>
	
	<div class="container-fluid"
		style="margin-top:20px; margin-bottom: 50px;">
		<div class="row-fluid">
			<div class="span3">
				<div align="center">
					<img alt="100x100" src=${session.enterpriseUsers.UHeader } class="img-circle"
						style="width: 100px;height: 100px" />
					<p class="dl-horizontal" style="margin-top:20px">
						<span><strong>
							 <c:out value="${session.enterpriseUsers.UName } " ></c:out> 
						</strong></span>
					</p>
				</div>
				<div class="list-group" style="margin-top:40px">
					<a class="list-group-item active" href="ec!LoadEnterpirseInfo">企业中心</a>
					<div class="list-group-item">
						<a href="ec!LoadEnterpirseInfo">首页</a>
					</div>
					<div class="list-group-item">
						<a href="ec!LoadEnterpirseInfo">账户设置</a>
					</div>
					<div class="list-group-item">
						<a href="ec!LoadEnterpirseInfo">消息</a>
					</div>
				</div>
				<!-- <div class="list-group">
					<a class="list-group-item active" href="center_p_bill.jsp">交易中心</a>
					<div class="list-group-item">
						<a href="center_p_bill.jsp">卖出的楼盘</a>
					</div>
				</div> -->
				<div class="list-group">
					<a class="list-group-item active" href="eh!deleteHouseSellEnterprise">我的楼盘</a>
					<div class="list-group-item">
						<a href="eh!deleteHouseSellEnterprise">已发布的楼盘</a>
					</div>
				</div>
			</div>
			<div class="span9">
				<div class="tabbable" id="tabs-711867">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-755240" data-toggle="tab">首页</a>
						</li>
						<li><a href="#panel-792567" data-toggle="tab">账户设置</a></li>
						<li><a href="#panel-787654" data-toggle="tab">消息</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane  active" id="panel-755240">
							<span class="label" style="margin-top:10px">我最近发布的新楼盘</span>
							<ul class="thumbnails" style="margin-top:10px">
								<div class="row-fluid" >
									<c:forEach var="house" items="${houseSellEnterpriseList}" begin="0" end="2">
										<li class="span4">
											<div class="thumbnail">
												<a href="<%=basePath %>details.jsp?${house.HId }">
													<img alt="300x200"
														src="${house.getPics() }"
														style="width: 300px;height: 200px" />
												</a>
												<div class="caption">
													<a href="<%=basePath %>details.jsp?${house.HId }">
														<h4>${house.getTitle() }</h4>
													</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</div>
							</ul>
						</div>
						<div class="tab-pane" id="panel-792567">
							<div class="accordion" id="accordion-726037">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle collapsed" data-toggle="collapse"
											data-parent="#accordion-726037"
											href="#accordion-element-797071">账户信息</a>
									</div>
									<div id="accordion-element-797071"
										class="accordion-body collapse">
										<div class="accordion-inner">
											<form class="form-horizontal" method="post"
												action="ec!LoadEnterpirseInfo">
												<input type="hidden"  id="EnterpriseUser_pwd" value="${session.enterpriseUsers.getUPwd() }"/>
												<div class="control-group">
													<label class="control-label" for="User_account">帐号</label>
													<div class="controls">
														<input id="EnterpriseUser_account" placeholder="${session.enterpriseUsers.UAccount }" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterpriseUser_name">公司名称</label>
													<div class="controls">
														<input id="EnterpriseUser_name" placeholder="${session.enterpriseUsers.UName }" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterpriseUser_type">用户身份</label>
													<div class="controls">
														<input id="EnterpriseUser_type" placeholder="企业用户" type="text"
															readonly="readonly" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterpriseUser_validation">验证状态</label>
													<div class="controls">
														<c:choose>
															<c:when test="${session.enterpriseUsers.UValidation==1 }">
																<input id="EnterpriseUser_validation" placeholder="已验证" type="text"
																	readonly="readonly" />
															</c:when>
															<c:otherwise>
																<input id="EnterpriseUser_validation" placeholder="未验证" type="text"
																	readonly="readonly" />
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterPriseUser_tele">企业电话</label>
													<div class="controls">
														<input name="changeEnterPriseTele" id="EnterPriseUser_tele" placeholder="请输入新电话" type="text"
															value="${session.enterpriseUsers.UTele }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterPriseUser_email">企业邮箱</label>
													<div class="controls">
														<input name="changeEnterPriseEmail" id="EnterPriseUser_email" placeholder="请输入新邮箱" type="text"
															value="${session.enterpriseUsers.Umail }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterPriseUser_addr">地址</label>
													<div class="controls">
														<input name="changeEnterPriseAddr" id="EnterPriseUser_addr" placeholder="请输入新地址" type="text"
															value="${session.enterpriseUsers.UAddr }" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterPriseUser_info">简介</label>
													<div class="controls">
														<input name="changeEnterPriseInfo" id="EnterPriseUser_info" placeholder="请输入新简介" type="text"
															value="${session.enterpriseUsers.UInfo}" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterPriseUser_pwd1">密码</label>
													<div class="controls">
														<input id="EnterPriseUser_pwd1" name="EnterPriseUser_pwd1" placeholder="请输入密码"
															onBlur="EnterpriseUserPwdCheck1()" type="password" />
														<span id="EnterpriseUserPwdCheck1Span"></span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<input type="submit" class="btn btn-primary"
															id="changeEnterpriseInfo-submit" value="提交修改" />
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle collapsed" data-toggle="collapse"
											data-parent="#accordion-726037"
											href="#accordion-element-797773">修改密码</a>
									</div>
									<div id="accordion-element-797773"
										class="accordion-body collapse">
										<div class="accordion-inner">
											<form class="form-horizontal" action="ec!changeEnterprisePwd" method="post">
												<input type="hidden"  id="EnterpriseUser_old_pwd" value="${session.enterpriseUsers.getUPwd() }"/>
												<div class="control-group">
													<label class="control-label" for="EnterpriseUser_pwd2">原密码</label>
													<div class="controls">
														<input id="EnterpriseUser_pwd2" name="EnterpriseUser_pwd2"
															placeholder="请输入旧密码" type="password"
															onBlur="EnterpriseUserPwdCheck2()" /> <span
															id="EnterpriseUserPwdCheck2Span"></span>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterpriseUser_pwd_new">新密码</label>
													<div class="controls">
														<input id="EnterpriseUser_pwd_new"
															name="changeEnterPrisePwd" placeholder="请输入新密码"
															type="password" />
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="EnterpriseCheck_pwd_new">确认新密码</label>
													<div class="controls">
														<input id="EnterpriseCheck_pwd_new" placeholder="请确认新密码"
															type="password"  onkeyup="EnterpriseUserPwdMakeSure()" />
														<span id="EnterprisePwdCheckSpan"></span>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<input type="submit" class="btn btn-primary"
															id="changeEnterprisePwd-submit" value="提交" />
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane" id="panel-787654">
							<div class="accordion" id="accordion-777402">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion-777402"
											href="#accordion-element-764175">系统通知 <span class="badge"
											style="color:lightblue">新通知个数</span>
										</a>
									</div>
									<div id="accordion-element-764175"
										class="accordion-body collapse in">
										<div class="accordion-inner" style="background-color: #ECF5FF">
											<div class="row-fluid">
												<div class="span10">
													<span><strong>您的申请验证房屋XXX已通过验证！</strong></span>
												</div>
												<div class="span2">
													<a id="delbtn" href="#modal-container-713602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-713602" class="modal hide fade"
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
													<a id="delbtn" href="#modal-container-713602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-713602" class="modal hide fade"
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
													<a id="delbtn" href="#modal-container-713602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-713602" class="modal hide fade"
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
													<a id="delbtn" href="#modal-container-713602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-713602" class="modal hide fade"
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
													<a id="delbtn" href="#modal-container-713602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-713602" class="modal hide fade"
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
											data-parent="#accordion-777402"
											href="#accordion-element-769365">评论<span class="badge"
											style="color:lightblue">新评论个数</span></a>
									</div>
									<div id="accordion-element-769365"
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
																	<a id="ansbtn" href="#modal-container-713601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-713601"
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
																	<a id="delbtn" href="#modal-container-713602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-713602"
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
																	<a id="ansbtn" href="#modal-container-713601"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-713601"
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
																	<a id="delbtn" href="#modal-container-713602"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-713602"
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
																	<a id="ansbtn" href="#modal-container-713603"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-713603"
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
																	<a id="delbtn" href="#modal-container-713604"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-713604"
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
																	<a id="ansbtn" href="#modal-container-713605"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-713605"
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
																	<a id="delbtn" href="#modal-container-713605"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-713605"
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
																	<a id="ansbtn" href="#modal-container-713606"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">回复</a>
																	<div id="modal-container-713606"
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
																	<a id="delbtn" href="#modal-container-713607"
																		role="button" class="btn" data-toggle="modal"
																		style="color: #0072E3">删除</a>
																	<div id="modal-container-713607"
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
	 <iframe src="nav_model/footer_nav.html" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>
</body>

</html>