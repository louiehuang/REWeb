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
				<div class="tabbable" id="tabs-397399">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-561578" data-toggle="tab">我买入的新房</a></li>
						<li><a href="#panel-432671" data-toggle="tab">我买入的二手房</a></li>
						<li><a href="#panel-432672" data-toggle="tab">我租过的房屋</a></li>
						<li><a href="#panel-432673" data-toggle="tab">我卖出的二手房</a></li>
						<li><a href="#panel-432674" data-toggle="tab">我租出的房屋</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-561578">
							<c:forEach var="bill" items="${houseSellEnterpriseBillBuyList}"> 
								<div>
									<span><strong>交易日期：</strong></span>
									<span>${bill.getTransactions().getTransDate() }</span> <br />
									<span><strong>交易类型：</strong></span> <span>买入新房</span><br />
									<span><strong>卖方：</strong></span><span>${bill.getuSellEnterpriseUsers().getUName() }</span> <br />
								</div>
								<div class="row-fluid">
									<div class="span12">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${bill.getHouseSellEnterprise().getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span9">
												<strong>${bill.getHouseSellEnterprise().getTitle() }</strong><br /> 类型：新楼盘<br />
												认证状态：
												<c:choose>
													<c:when test="${bill.getHouseSellEnterprise().hauthenticity==1 }">该企业已认证，信息真实有效</c:when>
													<c:otherwise>该企业未认证</c:otherwise>
												</c:choose>
												<br /> 物业公司：${bill.getHouseSellEnterprise().propertyName }</br>
												管理费：${bill.getHouseSellEnterprise().getManaFee() }元/平方米<br />
												绿化率：${bill.getHouseSellEnterprise().getGreeningRate()*100 }%<br />
												开发商：${bill.getHouseSellEnterprise().getDeveloperName() }<br /> 地址：${bill.getHouseSellEnterprise().getAddr() } <br />
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432671">
							<c:forEach var="bill" items="${houseSellSecondhandBillBuyList}"> 
								<div>
									<span><strong>交易日期：</strong></span>
									<span>${bill.getTransactions().getTransDate() }</span> <br />
									<span><strong>交易类型：</strong></span> <span>买入二手房</span><br />
									<span><strong>卖方：</strong></span><span>${bill.getuSellUsers().getUName() }</span> <br />
								</div>
								<div class="row-fluid">
									<div class="span12">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${bill.getHouseSellSecondhand().getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span9">
												<strong>${bill.getHouseSellSecondhand().getTitle() }</strong><br /> 类型：二手房<br />
												认证状态：
												<c:choose>
													<c:when test="${bill.getHouseSellSecondhand().hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
													<c:otherwise>该房屋未认证</c:otherwise>
												</c:choose> 
												<br /> 小区：${bill.getHouseSellSecondhand().getCommunity() }
												<br /> 价格：${bill.getHouseSellSecondhand().getPrice() }万元<br /> 面积：${bill.getHouseSellSecondhand().getSize() }平方米<br />
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432672">
							<c:forEach var="bill" items="${houseSellRentBillBuyList}"> 
								<div>
									<span><strong>交易日期：</strong></span>
									<span>${bill.getTransactions().getTransDate() }</span> <br />
									<span><strong>交易类型：</strong></span> <span>租入房屋</span><br />
									<span><strong>房东：</strong></span><span>${bill.getuSellUsers().getUName() }</span> <br />
								</div>
								<div class="row-fluid">
									<div class="span12">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${bill.getHouseSellRent().getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span9">
												<strong>${bill.getHouseSellRent().getTitle() }</strong><br /> 类型：出租房<br />
												认证状态：
												<c:choose>
													<c:when test="${bill.getHouseSellRent().hauthenticity==1 }">该房屋已认证，信息真实有效</c:when>
													<c:otherwise>该房屋未认证</c:otherwise>
												</c:choose>
												<br /> 小区：${bill.getHouseSellRent().getCommunity() }
												<br /> 价格：${bill.getHouseSellRent().getPrice() }元/月<br /> 面积：${bill.getHouseSellRent().getSize() }平方米<br />
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432673">
							<c:forEach var="bill" items="${houseSellSecondhandBillSellList}"> 
								<div>
									<span><strong>交易日期：</strong></span>
									<span>${bill.getTransactions().getTransDate() }</span> <br />
									<span><strong>交易类型：</strong></span> <span>卖出二手房</span><br />
									<span><strong>买方：</strong></span><span>${bill.getuBuyUsers().getUName() }</span> <br />
								</div>
								<div class="row-fluid">
									<div class="span12">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${bill.getHouseSellSecondhand().getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span9">
												<strong>${bill.getHouseSellSecondhand().getTitle() }</strong><br /> 类型：二手房<br />
												认证状态：
												<c:choose>
													<c:when test="${bill.getHouseSellSecondhand().hauthenticity==1 }">已认证</c:when>
													<c:otherwise>未认证</c:otherwise>
												</c:choose>
												<br /> 小区：${bill.getHouseSellSecondhand().getCommunity() }
												<br /> 价格：${bill.getHouseSellSecondhand().getPrice() }万元<br /> 面积：${bill.getHouseSellSecondhand().getSize() }平方米<br />
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue SIZE=1></HR>
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
						<div class="tab-pane" id="panel-432674">
							<c:forEach var="bill" items="${houseSellRentBillSellList}"> 
								<div>
									<span><strong>交易日期：</strong></span>
									<span>${bill.getTransactions().getTransDate() }</span> <br />
									<span><strong>交易类型：</strong></span> <span>租出房屋</span><br />
									<span><strong>房客：</strong></span><span>${bill.getuBuyUsers().getUName() }</span> <br />
								</div>
								<div class="row-fluid">
									<div class="span12">
										<div class="row-fluid" style="background-color: #ECF5FF">
											<div class="span3">
												<img alt="225*150" src="${bill.getHouseSellRent().getPics().split(';')[0] }"
													style="width: 225px;height: 150px" />
											</div>
											<div class="span9">
												<strong>${bill.getHouseSellRent().getTitle() }</strong><br /> 类型：出租房<br />
												认证状态：
												<c:choose>
													<c:when test="${bill.getHouseSellRent().hauthenticity==1 }">已认证</c:when>
													<c:otherwise>未认证</c:otherwise>
												</c:choose>
												<br /> 小区：${bill.getHouseSellRent().getCommunity() }
												<br /> 价格：${bill.getHouseSellRent().getPrice() }元/月<br /> 面积：${bill.getHouseSellRent().getSize() }平方米<br />
											</div>
										</div>
									</div>
								</div>
								<HR style="border:1 dashed #987cb9" width="100%" color=blue SIZE=1></HR>
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