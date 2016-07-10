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
	function getLayer7() {
		layer.confirm('确认删除该楼盘的发布？', {
			title : '删除发布',
			btn : [ '确定', '关闭' ]
		//按钮
		}, function() {
			document.getElementById("hiddenbtn7").click();
		}, function() {
			var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
			parent.layer.close(index); //执行关闭
		});
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
	<div class="container-fluid" style="margin-top:20px;margin-bottom: 50px;">
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
					<a class="list-group-item active" href="eh!LoadEnterpirseInfo">我的楼盘</a>
					<div class="list-group-item">
						<a href="eh!LoadEnterpirseInfo">已发布的楼盘</a>
					</div>
				</div>
			</div>
			
			<div class="span9">
				<div class="tabbable" id="tabs-799341">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-732691" data-toggle="tab">我发布的楼盘</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-732691">
							<c:forEach var="house" items="${houseSellEnterpriseList}" >
								<div class="row-fluid" style="background-color: #ECF5FF">
									<div class="span3">
										<img alt="225*150" src="${house.getPics().split(';')[0] }"
											style="width: 225px;height: 150px" />
									</div>
									<div class="span7">
										<strong>${house.getTitle() }</strong><br /> 类型：新楼盘<br /> 
										认证状态：
										<c:choose>
											<c:when test="${house.hauthenticity==1 }">已认证</c:when>
											<c:otherwise>未认证</c:otherwise>
										</c:choose><br /> 
										已卖出：${house.selledNum }户/${house.totalNum }户<br /> 
										物业公司：${house.propertyName }</br>
										停车位：${house.parkingNum }</br>
										管理费：${house.getManaFee() }元/平方米<br />
										绿化率：${house.getGreeningRate()*100 }%<br />
									</div>
									<div class="span2">
										<div class="row-fluid">
											<div class="span12">
												<a class="btn"
													href="<%=basePath %>HouseAction!Info?HId=${house.HId}&&CType=1"
													style="color: #0072E3">查看详情</a>
											</div>
											<%-- <div class="span6">
												<input type="button" value="取消发布" class="btn"
													style="color: #0072E3" onclick="getLayer7()" />
												<form action="eh!deleteHouseSellEnterprise" method="post">
													<input id="hiddenbtn7" type="submit" style="display:none"
														name="delMyHouseSellEnterprise" value="${house.getHId() }" />
												</form>

											</div> --%>
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