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
</head>

<body style="background-color:#F8F8F8">
	<iframe src="nav_model/header_nav.jsp" width="100%" height="125px"
		style="border: 0px;" scrolling="no"></iframe>
	<div class="container-fluid" style="margin-top:20px">
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
				<div class="tabbable" id="tabs-397399">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-561598" data-toggle="tab">我的房屋/楼盘</a></li>
						<li><a href="#panel-432691" data-toggle="tab">已认证</a></li>
						<li><a href="#panel-432692" data-toggle="tab">待认证</a></li>
						<li><a href="#panel-432693" data-toggle="tab">未认证</a></li>
						<li><a href="#panel-432694" data-toggle="tab">不合格</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-561598">
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>

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
						<div class="tab-pane" id="panel-432691">
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：已认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432692">
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：待认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432693">
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：未认证 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432694">
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
							<div class="row-fluid">
								<div class="span12">
									<div class="row-fluid" style="background-color: #ECF5FF">
										<div class="span3">
											<img alt="100*100" src="images/house/gbx.jpg"
												style="width: 200px;height: 200px" />
										</div>
										<div class="span8">
											房屋编号：456789876 <br /> 房屋名：吼吼哈嘿 <br /> 状态：不合格 <br />
											价格：5000元/月 <br /> 地区：发生地方撒点 <br /> 户型：3室1厅 <br /> 面积：343平方米 <br />
											房屋简介：aaadfadfasdfasfadsfdsafffaafa <br />
										</div>
										<div class="span1">
											<div class="row-fluid">
												<div class="span12">
													<a id="delbtn" href="#modal-container-513602" role="button"
														class="btn" data-toggle="modal" style="color: #0072E3">删除</a>
													<div id="modal-container-513602" class="modal hide fade"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">×</button>
															<h3 id="myModalLabel">删除发布</h3>
														</div>
														<div class="modal-body">
															<p>确定删除该发布？</p>
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
								</div>
							</div>
							<HR style="border:1 dashed #987cb9" width="100%" color=blue
								SIZE=1></HR>
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
	<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>
</body>

</html>