<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/a.css" />
<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

</head>
<body>
	<% if (session.getAttribute("users") == null) { %>
	<iframe id="header_nav" src="nav_model/header_nav.jsp" width="100%"
		height="123px" style="border: 0px;" scrolling="no"></iframe>
	<% } else { %>
	<iframe id="header_nav" src="nav_model/header_nav_after.jsp"
		width="100%" height="120px" style="border: 0px;" scrolling="no"></iframe>
	<% }%>


	<div class="container-fluid" style="margin-top:30px;">

		<div class="row-fluid">
			<div class="span2"></div>
			<div class="span8">
				<div class="carousel slide" id="carousel-841293">
					<ol class="carousel-indicators">
						<li class="" data-slide-to="0" data-target="#carousel-841293"></li>
						<li data-slide-to="1" data-target="#carousel-841293"
							class="active"></li>
						<li data-slide-to="2" data-target="#carousel-841293" class=""></li>
					</ol>
					<div class="carousel-inner">
						<div class="item  active" align="center">
							<img alt="" src="images/buyer/buyer-2.jpg">
							<div class="carousel-caption">
								<div style="color:#fff">您需要的应有尽有</div>
							</div>
						</div>
						<div class="item" align="center">
							<img alt="" src="images/buyer/buyer-3.jpg">
							<div class="carousel-caption">
								<div style="color:#fff">再也不用在报纸中缝找出租信息了！</div>
							</div>
						</div>
						<div class="item" align="center">
							<img alt="" src="images/buyer/buyer-1.jpg">
							<div class="carousel-caption">
								<div style="color:#fff">房源丰富还能收获高性价比~</div>
							</div>
						</div>
					</div>
					<a data-slide="prev" href="#carousel-841293"
						class="left carousel-control">‹</a> <a data-slide="next"
						href="#carousel-841293" class="right carousel-control">›</a>
				</div>


				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#panel-819374">求租</a>
					</li>
					<li><a data-toggle="tab" href="#panel-927154">求购</a></li>
				</ul>
				<div class="tab-content ">
					<div class=" tab-pane active container-padding" id="panel-819374">
						<div class="text-left container">
							<div class="div1">
								<strong> <span class="badge badge-info">1</span> 基础信息
								</strong> <br /> <br />
								<h style="color: red;">*</h>
								求租地段： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select><option>请选择区域</option></select>
								<select><option>请选择商圈</option></select> <br /> <br />
								<h style="color: red;">*</h>
								租金：
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<select><option>请选择租金</option></select> <select><option>期望厅室</option></select>
								<br /> <br />
								<h style="color: red;float:left;">*</h>
								<div style="float:left;">最晚入住时间：</div>
								<select style="width:60px;height:28px;float:left;"><option>年</option></select>
								<select
									style="width:60px;height:28px;float:left;margin-left:10px;"><option>月</option></select>
								<select
									style="width:60px;height:28px;float:left;margin-left:10px;"><option>日</option></select>
							</div>
							<br /> <br /> <br />
							<div class="div1">
								<br /> <br /> <strong><span class="badge badge-info">2</span>
									补充信息</strong>
							</div>
							<div class="div1">
								<br />
								<h style="color: red;">*</h>
								标题： <input type="text"
									style="margin-left: 52px;width:200px;height:25px;" /> <br />
								<h style="color: red;">*</h>
								补充说明：
								<textarea style="width: 450px;height: 50px;margin-left: 25px"></textarea>
							</div>
							<div class="div1"></div>
							<br />
							<div class="div1">
								<br /> <br /> <strong><span class="badge badge-info">3</span>
									其他信息</strong>
							</div>
							<div class="div1">
								<br />
								<h style="color: red;">*</h>
								联系人： <input type="text"
									style="margin-left: 44px;width:200px;height:28px;" /> <input
									name="c1" type="checkbox" style="margin-left: 20px;" /> 经纪人 <br />
								<h style="color: red;">*</h>
								联系电话：<input type="text"
									style="margin-left: 35px;width:200px;height:28px;" />
							</div>
						</div>
						<button class="btn btn-primary btn-large my-btn" type="button">提交</button>
					</div>


					<div class="tab-pane container-padding" id="panel-927154">
						<div class="text-left container">
							<div class="div1">
								<strong> <span class="badge badge-info">1</span> 基础信息
								</strong> <br /> <br />
								<h style="color: red;">*</h>
								求购地段： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select><option>请选择区域</option></select>
								<select><option>请选择商圈</option></select> <br /> <br />
								<h style="color: red;">*</h>
								期望价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select><option>请选择期望价格范围</option></select>
								<select><option>期望厅室</option></select> <br /> <br />
								<h style="color: red;float:left;">*</h>
								<div style="float:left;">最晚入住时间：</div>
								<select style="width:60px;height:28px;float:left;"><option>年</option></select>
								<select
									style="width:60px;height:28px;float:left;margin-left:10px;"><option>月</option></select>
								<select
									style="width:60px;height:28px;float:left;margin-left:10px;"><option>日</option></select>
							</div>
							<div class="div1">
								<br /> <br /> <strong><span class="badge badge-info">2</span>
									补充信息</strong>
							</div>
							<div class="div1">
								<br />
								<h style="color: red;">*</h>
								标题： <input type="text"
									style="margin-left: 52px;width:200px;height:25px;" /> <br />
								<h style="color: red;">*</h>
								补充说明：
								<textarea style="width: 450px;height: 50px;margin-left: 25px"></textarea>
							</div>
							<div class="div1"></div>
							<br />
							<div class="div1">
								<br /> <br /> <strong><span class="badge badge-info">3</span>
									其他信息</strong>
							</div>
							<div class="div1">
								<br />
								<h style="color: red;">*</h>
								联系人： <input type="text"
									style="margin-left: 44px;width:200px;height:28px;" /> <input
									name="c1" type="checkbox" style="margin-left: 20px;" /> 经纪人 <br />
								<h style="color: red;">*</h>
								联系电话：<input type="text"
									style="margin-left: 35px;width:200px;height:28px;" />
							</div>
						</div>
						<center>
							<div class="container-fluid">
								<div class="row-fluid">
									<div class="span12">
										<button class="btn btn-primary btn-large my-btn" type="button">&nbsp;提交
											&nbsp;</button>
									</div>
								</div>
							</div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>
</html>