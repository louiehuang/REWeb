<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@
	page import="com.chinasoft.action.*"%>
<%@
 	page import="com.chinasoft.pojo.*"%>
<%@
 	page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- HouseSellSecondhand -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>二手房屋详情</title>
<meta charset="utf-8">

<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">
<link href="css/detail_style.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script type="text/javascript">
	function time() {
		var text = document.getElementById("shuru");
		if (text.value == "") {
			alert("请输入评论内容");
			return false;
		}
		var string = "";
		var time = new Date();
		var year = time.getYear();//获得年、月、日
		year += 1900;
		var month = time.getMonth();
		month++;
		var day = time.getDate();
		var hour = time.getHours(); //获得小时、分钟、秒 
		var minute = time.getMinutes();
		string += year;
		string += "/";
		string += month;
		string += "/";
		string += day;
		string += "   ";
		string += hour;
		string += ":";
		string += minute;
		var date = document.getElementById("date");
		date.value = string;
		return true;
	}
	function error() {
		alert("不好意思 不让举报");
	}
	function cli(self) {
		var c = document.getElementById("hehe");
		c.value = self;
	}
</script>
</head>

<body class="back">
	<%
		if (session.getAttribute("users") != null) {
			System.out.println("普通用户导航");
			Users u = (Users) session.getAttribute("users");
	%>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else if (session.getAttribute("enterpriseUsers") != null) {
			System.out.println("企业用户导航");
	%>
	<iframe id="header_nav" src="nav_model/header_nav_enterprise.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else if (session.getAttribute("adminUsers") != null) {
			System.out.println("管理员导航");
	%>
	<iframe id="header_nav" src="nav_model/header_nav_admin.jsp"
		width="100%" height="45px" style="border: 0px;" scrolling="no"></iframe>
	<%
		} else {
	%>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="120px" style="border: 0px;" scrolling="no"></iframe>
	<%
		}
	%>


	<%
		Users users = (Users) session.getAttribute("users");

		HouseSellSecondhand house = (HouseSellSecondhand) session
				.getAttribute("house");
		Users home = (Users) session.getAttribute("home");
		String s1[];
		String src = house.getPics();
		s1 = src.split(";");
		int num = s1.length;
		int index = 0;
	%>
	<%!int addindex(int index, int num) {
		index++;
		if (index >= num)
			index = 0;
		return index;
	}%>
	<div class="container-fluid mt back">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid back">
					<div class="col-xs-6 span9">
						<div class="row-fluid">
							<div class="span12">
								<h3>${ house.getTitle()}</h3>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<div class="row-fluid">
									<div class="span6">
										<div class="carousel slide" id="carousel-810640">
											<ol class="carousel-indicators">
												<li class="active" data-slide-to="0"
													data-target="#carousel-810640"></li>
												<li data-slide-to="1" data-target="#carousel-810640"></li>
												<li data-slide-to="2" data-target="#carousel-810640"></li>
											</ol>
											<div class="carousel-inner">
												<div class="item active">
													<img alt="" src=<%=s1[index]%> />

												</div>
												<div class="item">
													<img alt="" src=<%=s1[index = addindex(index, num)]%> />
												</div>
												<div class="item">
													<img alt="" src=<%=s1[index = addindex(index, num)]%> />
												</div>

											</div>
											<a data-slide="prev" href="#carousel-810640"
												class="left carousel-control">‹</a> <a data-slide="next"
												href="#carousel-810640" class="right carousel-control">›</a>
										</div>
									</div>
									<div class="span6">
										<div class="line1">
											总价 &nbsp;<span class="prise">￥<em>${ house.getPrice()}万</em></span>

										</div>
										<div class="line3">
											<strong>户型:</strong>${ house.getHouseType().getName()}&nbsp;&nbsp;&nbsp;
											<strong>建筑面积:</strong>${ house.getSize()}㎡&nbsp;&nbsp;&nbsp;
											<strong>装修:</strong>
											<%
												String s = "";
												//s=house.getDecoration().toString();
												if (house.getDecoration() == 1)
													s = "普装";
												else if (house.getDecoration() == 2)
													s = "精装";
												else if (house.getDecoration() == 3)
													s = "豪华";
												else if (house.getDecoration() == 4)
													s = "无装修";
											%>
											<%=s%>
										</div>
										<div class="line3">
											<strong>朝向:</strong>
											<%
												if (house.getOrientation() == 1)
													s = "东";
												else if (house.getOrientation() == 2)
													s = "南";
												else if (house.getOrientation() == 3)
													s = "西";
												else if (house.getOrientation() == 4)
													s = "北";
											%>
											<%=s%>
										</div>
										<div class="line3">
											<strong>楼层：</strong>${ house.getHouseFloor()}
										</div>
										<div class="line3">
											<strong>小区:</strong>${ house.getCommunity()}
										</div>
										<div>
											<span class="tel"> <i></i> ${home.getUTele() }
											</span>
										</div>
										<div>
											<!-- 											${ iscolletion == 1 } -->
											<%
												if (users != null) {
											%>
											<form action="HouseAction!addColletion" method="post">
												<input type="submit" class="btn btn-block btn-warning"
													value=<c:if test="${ iscolletion == 2}"> 
											     	未收藏 
												</c:if>
													<c:if test="${ iscolletion == 1}"> 
											     	已收藏 
												</c:if>
													name="1" /> <input type="hidden" name="comment.HId"
													value=${ house.getHId() } /> <input type="hidden"
													name="comment.CType" value="2" />
											</form>
											<%
												}
											%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 span3 ml">
						<div>
							<div class="fl">
								<img src="images/details/TX.png" />
							</div>
							<div class="f1">
								<h2>${home.getUName() }</h2>
							</div>
						</div>
						<div style="margin-top:50px">
							<p>
								信用等级:<span class="gray">${home.getUCredit() } </span>
							</p>
							<p class="line3">
								邮箱:<span class="gray">${home.getUEmail() }</span>
							</p>
							<p class="line3">
								电话:<span class="gray">${home.getUTele() }</span>
							</p>
						</div>
						<div style="margin-top:30px">
							<p>
								<%
									s = "黄刘胤房产网认证<span class=\"prise\">100% </span>真房源<br />";
									if (house.getHauthenticity() == 0) {
										s = " 该房屋没有经过验证 <br />";
									}
								%>
								<%=s%>
							</p>
							<button class="btn btn-block btn-warning" onclick="error()">举报</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row-fluid mt">
			<div class="span12">
				<div class="tabbable" id="tabs-281283">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-239168" data-toggle="tab">房屋评论</a>
						</li>
						<li><a href="#panel-651808" data-toggle="tab">房屋详情</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-239168">
							<table style="width:80%; margin: 0 auto">${ msg }
							</table>
							<%
								if (users != null) {
							%>
							<form action="HouseAction!addcomment" method="post"
								onsubmit="return time()">
								<input type="text" name="comment.comment" id="shuru" /> <input
									type="hidden" name="comment.cdate" id="date" /> <input
									type="hidden" name="comment.HId" id="HId"
									value=${house.getHId() } /> <input type="hidden"
									name="comment.CType" id="CType" value="2" /> <input
									type="hidden" name="comment.users.UId" id="UId"
									value=${users.getUId() } /> <input type="submit"
									class="btn btn-success" value="评论" name="pl" />
							</form>
							<%
								}
							%>
						</div>
						<div class="tab-pane" id="panel-651808">
							<p>${house.getRemark() }</p>
						</div>
					</div>

				</div>
			</div>
		</div>


		<div>
			<h3>房源图片</h3>
			<div style="text-align:center; magrgin: 0 auto">
				<img src=<%=s1[index = addindex(index, num)]%>
					style="width:40%; height:350px;" style="display:inline;" /> <img
					src=<%=s1[index = addindex(index, num)]%>
					style="width:40%; margin-left: 2%; height:350px;"
					style="display:inline;" /> <img
					src=<%=s1[index = addindex(index, num)]%>
					style="width:40%; margin-top: 20px;height:350px"
					style="display:inline;" /> <img
					src=<%=s1[index = addindex(index, num)]%>
					style="width:40%; margin-top: 20px; margin-left: 2%; height:350px"
					style="display:inline;" />
			</div>
		</div>

		<div class="row-fluid mt">
			<div>
				<h3>小区详情</h3>
			</div>
			<div class="bdup" style="margin-left:40px">
				<div class="line3">
					<p>
						小区名称:&nbsp;&nbsp;${house.getCommunity()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						户型结构:&nbsp;&nbsp;${"平层"}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						物业类型:&nbsp;&nbsp;${"别墅 "}</p>
				</div>
				<div class="line3">
					建筑年代:&nbsp;&nbsp;${"2016"}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					物业公司:&nbsp;&nbsp;${"湖北市黄刘胤物业管理有限公司"}</div>
				<div class="line3">基本配套:${"  煤气/宽带/天然气/暖气/电梯/地铁                            "}
				</div>

			</div>
		</div>
	</div>
	<div style="margin-top: 30px;">
		<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
			style="border: 0px;" scrolling="no"></iframe>
	</div>
</body>

</html>