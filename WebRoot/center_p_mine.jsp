<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/jquery-ui"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script type="text/javascript">
	function checkData1() {
		var result = false;
		var pwd1 = document.getElementById("User_pwd1");
		var rightpwd = "bb";
		if (pwd1.value != rightpwd) {
			alert("密码错误!");
		} else {
			result = true;
			alert("更新成功！");
		}
		return result;
	}

	function checkData2() {
		var result = false;
		var pwd2 = document.getElementById("User_pwd2");
		var pwdn1 = document.getElementById("User_pwd_new");
		var pwdn2 = document.getElementById("Check_pwd_new")
		var rightpwd = "bb";
		if (pwd2.value != rightpwd) {
			alert("原密码输入错误!");
		} else if (pwdn1.value != pwdn2.value) {
			alert("两次新密码输入不匹配！");
		} else {
			result = true;
			alert("修改成功！");
		}
		return result;
	}
</script>
</head>

<body style="background-color:#F8F8F8">
	<iframe src="nav_model/header_nav.jsp" width="100%" height="123px"
		style="border: 0px;" scrolling="no"></iframe>

	<div class="container-fluid"
		style="margin-top:20px; margin-bottom: 50px;">
		<div class="row-fluid">
			<div class="span3">
				<div align="center">
					<img alt="100x100" src="images/header/tx.jpg" class="img-circle"
						style="width: 100px;height: 100px" />
					<p class="dl-horizontal" style="margin-top:20px">
						<span><strong>用户名</strong></span>
					</p>
				</div>
				<div class="list-group" style="margin-top:40px">
					<a class="list-group-item active" href="center_p_mine.jsp">个人中心</a>
					<div class="list-group-item">
						<a href="center_p_mine.jsp">首页</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_mine.jsp">账户设置</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_mine.jsp">消息</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="center_p_bill.jsp">交易中心</a>
					<div class="list-group-item">
						<a hhref="center_p_bill.jsp">我买入的房屋/楼盘</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_bill.jsp">我卖出的房屋/楼盘</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_bill.jsp">我租过的房屋/楼盘</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_bill.jsp">我租出的房屋/楼盘</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="center_p_follow.jsp">关注中心</a>
					<div class="list-group-item">
						<a href="center_p_follow.jsp">我关注的房屋/楼盘</a>
					</div>
				</div>
				<div class="list-group">
					<a class="list-group-item active" href="center_p_houseState.jsp">我的房屋/楼盘</a>
					<div class="list-group-item">
						<a href="center_p_houseState.jsp">已认证</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_houseState.jsp">待认证</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_houseState.jsp">未认证</a>
					</div>
					<div class="list-group-item">
						<a href="center_p_houseState.jsp">不合格</a>
					</div>
				</div>
			</div>
			<div class="span9">
				<div align="right">
					<form class="form-search">
						<input class="input-medium search-query" type="text" />
						<button type="submit" class="btn">搜索</button>
					</form>
				</div>
				<div class="tabbable" id="tabs-711867">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-655240" data-toggle="tab">首页</a>
						</li>
						<li><a href="#panel-392567" data-toggle="tab">账户设置</a></li>
						<li><a href="#panel-987654" data-toggle="tab">消息</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane  active" id="panel-655240">
							<span class="label">我最近关注的房屋</span>
							<ul class="thumbnails" style="margin-top:20px">
								<li class="span4">
									<div class="thumbnail">
										<img alt="300x200" src="images/house/gbx.jpg"
											style="width: 300px;height: 200px" />
										<div class="caption">
											<h3>狗逼鑫的房子</h3>
											<p>真丑啊！</p>
											<p>
												<a class="btn btn-primary" href="#">查看详情</a> <a class="btn"
													href="#">删除</a>
											</p>
										</div>
									</div>
								</li>
								<li class="span4">
									<div class="thumbnail">
										<img alt="300x200" src="images/house/gbf.jpg"
											style="width: 300px;height: 200px" />
										<div class="caption">
											<h3>狗逼肥的房子</h3>
											<p>真好看</p>
											<p>
												<a class="btn btn-primary" href="#">查看详情</a> <a class="btn"
													href="#">删除</a>
											</p>
										</div>
									</div>
								</li>
								<li class="span4">
									<div class="thumbnail">
										<img alt="300x200" src="images/house/lf.jpg"
											style="width: 300px;height: 200px" />
										<div class="caption">
											<h3>连番的房子</h3>
											<p>都是初音！</p>
											<p>
												<a class="btn btn-primary" href="#">查看详情</a> <a class="btn"
													href="#">删除</a>
											</p>
										</div>
									</div>
								</li>
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
											<form class="form-horizontal" method="get"
												action="center_p_mine.jsp">
												<div class="control-group">
													<label class="control-label" for="User_id">帐号</label>
													<div class="controls">
														<input id="User_id" placeholder="User_id" type="text"
															readonly="readonly">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_credit">信用等级</label>
													<div class="controls">
														<input id="User_credit" placeholder="信用等级" type="text"
															readonly="readonly">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_type">用户身份</label>
													<div class="controls">
														<input id="User_type" placeholder="用户身份" type="text"
															readonly="readonly">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_name">用户名</label>
													<div class="controls">
														<input id="User_name" placeholder="请输入新用户名" type="text"
															value="原用户名">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_nender">性别</label>
													<div class="controls">
														<input type="radio" name="User_nender" checked=""
															value="male">男 <input type="radio"
															name="User_nender" value="female">女
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_Email">邮箱</label>
													<div class="controls">
														<input id="User_Email" placeholder="请输入新邮箱" type="text"
															value="原邮箱">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_Tele">电话</label>
													<div class="controls">
														<input id="User_Tele" placeholder="请输入新电话" type="text"
															value="原电话">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_pwd1">密码</label>
													<div class="controls">
														<input id="User_pwd1" name="User_pwd1" placeholder="请输入密码"
															type="password">
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<!-- <label class="checkbox" >
													<input type="checkbox">
													确认修改个人信息 </label> -->
														<input type="submit" class="btn btn-primary"
															onclick="return checkData1()" value="提交修改" />
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
											<form class="form-horizontal" action="center_p_mine.jsp">
												<div class="control-group">
													<label class="control-label" for="User_pwd2">原密码</label>
													<div class="controls">
														<input id="User_pwd2" placeholder="请输入旧密码" type="password">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="User_pwd_new">新密码</label>
													<div class="controls">
														<input id="User_pwd_new" placeholder="请输入新密码"
															type="password">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="Check_pwd_new">确认新密码</label>
													<div class="controls">
														<input id="Check_pwd_new" placeholder="请确认新密码"
															type="password">
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<!-- <label class="checkbox" >
													<input type="checkbox">
													确认修改密码 </label> -->
														<input type="submit" class="btn btn-primary"
															onclick="return checkData2()" value="提交" />
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