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
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script>

	function getLayer11() {
		layer.confirm('确认取消对盖楼盘的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn11").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
	function getLayer12() {
		layer.confirm('确认取消对该二手房的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn12").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
	function getLayer13() {
		layer.confirm('确认取消对该出租房的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn13").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
	function getLayer2() {
		layer.confirm('确认取消对该楼盘的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn2").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
	function getLayer3() {
		layer.confirm('确认取消对该二手房的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn3").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
	function getLayer4() {
		layer.confirm('确认取消对该 出租房的关注？', {
			title : '取消关注',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn4").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
	}
</script>

</head>

<body style="background-color:#F8F8F8">
	<!--iframe导航页面中跳转加上 target="_parent"，使父页面刷新-->
	<% if (session.getAttribute("users") == null) { %>
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
					<img alt="100x100" src=${session.users.UHeader } class="img-circle"
						style="width: 100px;height: 100px" />
					<p class="dl-horizontal" style="margin-top:20px">
						<span><strong>
							 <c:out value="${session.users.UName } " ></c:out> 
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
				<div class="tabbable" id="tabs-397340">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-561588" data-toggle="tab">关注中心</a></li>
						<li><a href="#panel-432681" data-toggle="tab">新楼盘</a></li>
						<li><a href="#panel-432682" data-toggle="tab">二手房</a></li>
						<li><a href="#panel-432683" data-toggle="tab">出租房</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-561588">
							<c:forEach var="house" items="${followAllList}">
								<c:choose>
									<c:when
										test="${house.getClass().toString().equals('class com.chinasoft.pojo.HouseSellEnterprise') }">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${house.getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span6">
												<strong>${house.getTitle() }</strong><br /> 
												类型：新楼盘<br />
												认证状态：
												<c:choose>
													<c:when test="${house.hauthenticity==1 }">该企业已认证，信息真实有效</c:when>
													<c:otherwise>该企业未认证</c:otherwise>
												</c:choose><br/>
												物业公司：${house.propertyName }</br>
												管理费：${house.getManaFee() }元/平方米<br />
												绿化率：${house.getGreeningRate()*100 }%<br />
												开发商：${house.getDeveloperName() }<br />
												 地址：${house.getAddr() }<br />
											</div>
											<div class="span3">
												<div class="row-fluid">
													<div class="span6">
														<a class="btn"
															href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=1"
															style="color: #0072E3">查看详情</a>
													</div>
													<div class="span6">
														<input type="button" value="取消关注" class="btn"
															style="color: #0072E3" onclick="getLayer11()" />
														<form action="cf!deleteFollowHouseSellEnterprise"
															method="post">
															<input id="hiddenbtn11" type="submit"
																style="display:none" name="delFollowHouseSellEnterprise"
																value="${house.getHId() }" />
														</form>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${house.getClass().toString().equals('class com.chinasoft.pojo.HouseSellSecondhand') }">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${house.getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span6">
												<strong>${house.getTitle() }</strong><br />
												类型：二手房<br/>
												认证状态：
												<c:choose>
													<c:when test="${house.hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
													<c:otherwise>该房屋未认证</c:otherwise>
												</c:choose><br/>
												房屋状态：
												<c:choose>
													<c:when test="${house.getHavailability()==1 }">未卖出</c:when>
													<c:otherwise>已卖出</c:otherwise>
												</c:choose><br/>
												小区：${house.getCommunity() } <br />
												价格：${house.getPrice() }万元<br/>
												面积：${house.getSize() }平方米<br/>
											</div>
											<div class="span3">
												<div class="row-fluid">
													<div class="span6">
														<a class="btn"
															href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=2"
															style="color: #0072E3">查看详情</a>
													</div>
													<div class="span6">
														<input type="button" value="取消关注" class="btn"
															style="color: #0072E3" onclick="getLayer12()" />
														<form action="cf!deleteFollowHouseSellSecondhand"
															method="post">
															<input id="hiddenbtn12" type="submit"
																style="display:none" name="delFollowHouseSellSecondhand"
																value="${house.getHId() }" />
														</form>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${house.getClass().toString().equals('class com.chinasoft.pojo.HouseSellRent') }">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${house.getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span6">
												<strong>${house.getTitle() }</strong><br />
												类型：出租房<br/>
												认证状态：
												<c:choose>
													<c:when test="${house.hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
													<c:otherwise>该房屋未认证</c:otherwise>
												</c:choose><br/>
												房屋状态：
												<c:choose>
													<c:when test="${house.getHavailability()==1 }">
														未租出
													</c:when>
													<c:otherwise>
														已租出
													</c:otherwise>
												</c:choose><br/>
												小区：${house.getCommunity() } <br />
												价格：${house.getPrice() }元/月<br/>
												面积：${house.getSize() }平方米<br/>
											</div>
											<div class="span3">
												<div class="row-fluid">
													<div class="span6">
														<a class="btn"
															href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=3"
															style="color: #0072E3">查看详情</a>
													</div>
													<div class="span6">
														<input type="button" value="取消关注" class="btn"
															style="color: #0072E3" onclick="getLayer13()" />
														<form action="cf!deleteFollowHouseSellRent"
															method="post">
															<input id="hiddenbtn13" type="submit"
																style="display:none" name="delFollowHouseSellRent"
																value="${house.getHId() }" />
														</form>
													</div>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
								
								<HR style="border:1 dashed #987cb9" width="100%" color=blue
									SIZE=1></HR>
							</c:forEach>

							<!-- <div class="pagination" align="right">
								<ul>
									<li><a href="#">上一页</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">下一页</a></li>
								</ul>
							</div> -->
						</div>
						<div class="tab-pane" id="panel-432681">
							<c:forEach var="house" items="${followHouseSellEnterpriseList}">
								<div class="row-fluid" style="background-color: #ECF5FF">
									<div class="span3">
										<img alt="225*150" src="${house.getPics().split(';')[0] }"
											style="width: 225px;height: 150px" />
									</div>
									<div class="span6">
										<strong>${house.getTitle() }</strong><br />
										类型：新楼盘<br />
										认证状态：
										<c:choose>
											<c:when test="${house.hauthenticity==1 }">该企业已认证，信息真实有效</c:when>
											<c:otherwise>该企业未认证</c:otherwise>
										</c:choose><br/>
										物业公司：${house.propertyName }</br>
										管理费：${house.getManaFee() }元/平方米<br />
										绿化率：${house.getGreeningRate()*100 }%<br />
										开发商：${house.getDeveloperName() }<br /> 地址：${house.getAddr() }
										<br />
									</div>
									<div class="span3">
										<div class="row-fluid">
											<div class="span6">
												<a class="btn"
													href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=1"
													style="color: #0072E3">查看详情</a>
											</div>
											<div class="span6">
												<input type="button" value="取消关注" class="btn" style="color: #0072E3"
													onclick="getLayer2()" />
												<form action="cf!deleteFollowHouseSellEnterprise"
													method="post">
													<input id="hiddenbtn2" type="submit" style="display:none" 
														name="delFollowHouseSellEnterprise" value="${house.getHId() }"/>
												</form>
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue
									SIZE=1></HR>
							</c:forEach>

							<!-- <div class="pagination" align="right">
								<ul>
									<li><a href="#">上一页</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">下一页</a></li>
								</ul>
							</div> -->
						</div>
						<div class="tab-pane" id="panel-432682">
							<c:forEach var="house" items="${followHouseSellSecondhandList}">
								<div class="row-fluid" style="background-color: #ECF5FF">
									<div class="span3">
										<img alt="225*150" src="${house.getPics().split(';')[0] }"
											style="width: 225px;height: 150px" />
									</div>
									<div class="span6">
										<strong>${house.getTitle() }</strong><br /> 
										类型：二手房<br /> 
										认证状态：
										<c:choose>
											<c:when test="${house.hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
											<c:otherwise>该房屋未认证</c:otherwise>
										</c:choose><br /> 
										房屋状态：
										<c:choose>
											<c:when test="${house.getHavailability()==1 }">
														未卖出
													</c:when>
											<c:otherwise>
														已卖出
													</c:otherwise>
										</c:choose>
										<br /> 小区：${house.getCommunity() } <br />
										价格：${house.getPrice() }万元<br /> 面积：${house.getSize() }平方米<br />
									</div>
									<div class="span3">
										<div class="row-fluid">
											<div class="span6">
												<a class="btn"
													href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=2"
													style="color: #0072E3">查看详情</a>
											</div>
											<div class="span6">
												<input type="button" value="取消关注" class="btn" style="color: #0072E3"
													onclick="getLayer3()" />
												<form action="cf!deleteFollowHouseSellSecondhand"
													method="post">
													<input id="hiddenbtn3" type="submit" style="display:none" 
														name="delFollowHouseSellSecondhand" value="${house.getHId() }"/>
												</form>
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue
									SIZE=1></HR>
							</c:forEach>

							<!-- <div class="pagination" align="right">
								<ul>
									<li><a href="#">上一页</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">下一页</a></li>
								</ul>
							</div> -->
						</div>
						<div class="tab-pane" id="panel-432683">
							<c:forEach var="house" items="${followHouseSellRentList}">
								<div class="row-fluid" style="background-color: #ECF5FF">
									<div class="span3">
										<img alt="225*150" src="${house.getPics().split(';')[0] }"
											style="width: 225px;height: 150px" />
									</div>
									<div class="span6">
										<strong>${house.getTitle() }</strong><br /> 
										类型：出租房<br /> 
										认证状态：
										<c:choose>
											<c:when test="${house.hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
											<c:otherwise>该房屋未认证</c:otherwise>
										</c:choose><br /> 
										房屋状态：
										<c:choose>
											<c:when test="${house.getHavailability()==1 }">未租出</c:when>
											<c:otherwise>已租出</c:otherwise>
										</c:choose>
										<br /> 小区：${house.getCommunity() } <br />
										价格：${house.getPrice() }元/月<br /> 面积：${house.getSize() }平方米<br />
									</div>
									<div class="span3">
										<div class="row-fluid">
											<div class="span6">
												<a class="btn"
													href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=3"
													style="color: #0072E3">查看详情</a>
											</div>
											<div class="span6">
												<input type="button" value="取消关注" class="btn" style="color: #0072E3"
													onclick="getLayer4()" />
												<form action="cf!deleteFollowHouseSellRent"
													method="post">
													<input id="hiddenbtn4" type="submit" style="display:none" 
														name="delFollowHouseSellRent" value="${house.getHId() }"/>
												</form>
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue
									SIZE=1></HR>
							</c:forEach>

							<!-- <div class="pagination" align="right">
								<ul>
									<li><a href="#">上一页</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">下一页</a></li>
								</ul>
							</div> -->
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