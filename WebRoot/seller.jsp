<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="css/bootstrap-combined.min.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
	
<style>
.button-bottom {
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<iframe src="nav_model/header_nav.jsp" width="100%" height="123px"
		style="border: 0px;" scrolling="no"></iframe>

	<div class="container-fluid" style="margin-top:30px;">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span2">
						<ul class="nav nav-list">
							<li class="nav-header"></li>
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<li class="active"><a href="#">我要出租</a></li>
							<li><a href="#">类别</a></li>
							<li><a href="#">基础信息</a></li>
							<li><a href="#">详细信息</a></li>
							<li><a href="#">其他信息</a></li>
							<li><a href="#">出租房源申请验证</a></li>

							<li class="divider"></li>
							<li><a href="#">帮助</a></li>
						</ul>
					</div>
					<div class="span8">
						<div class="row-fluid">
							<div class="carousel slide" id="carousel-916173">
								<ol class="carousel-indicators">
									<li data-slide-to="0" data-target="#carousel-916173"></li>
									<li data-slide-to="1" data-target="#carousel-916173"
										class="active"></li>
									<li data-slide-to="2" data-target="#carousel-916173"></li>
								</ol>
								<div class="carousel-inner">
									<div class="item">
										<div align="center">
											<img alt="900x400" src="images/solder/sold-1.jpg"
												style="background-size:contain ;" />
										</div>
										<div class="carousel-caption">
											<h4>卖房？</h4>
											<p>NO！我们卖的是生活。</p>
										</div>
									</div>
									<div class="item active">
										<div align="center">
											<img alt="900x400" src="images/solder/sold-2.jpg"
												style="background-size:contain ;" />
										</div>
										<div class="carousel-caption">
											<h4>出租？</h4>
											<p>NO！我们租的是乐趣。</p>
										</div>
									</div>
									<div class="item">
										<div align="center">
											<img alt="900x400" src="images/solder/sold-3.jpg"
												style="background-size:cover ;" />
										</div>
										<div class="carousel-caption">
											<h4>房产？</h4>
											<p>我总是想要选择###。</p>
										</div>
									</div>
								</div>
								<a data-slide="prev" href="#carousel-916173"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#carousel-916173" class="right carousel-control">›</a>
							</div>
							<div class="tabbable" id="tabs-239250">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#panel-801876"
										data-toggle="tab"> <strong><big>我要出租</big></strong>
									</a></li>
									<li><a href="#panel-684998" data-toggle="tab"> <strong><big>我要卖房</big></strong>
									</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-801876">
										<div>
											<br /> <span class="badge" contenteditable="true">1</span><strong><big><big>类别</big></big></strong>
											<br />
											<br /> <span style="color:red;margin-left:30px;">*</span>出租方式：
											<input style="margin-left:50px;" type="radio" name="c"
												value="c1" />整套出租 <input style="margin-left:100px;"
												type="radio" name="c" value="c2" />单间出租
										</div>
										<br />
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">2</span><strong><big><big>基础信息</big></big></strong>
											</p>
											<br /> <span style="color:red;margin-left:30px;">*</span>省份：
											<select style="margin-left:15px;">
												<option>请选择区域</option>
												<option>湖北省</option>
											</select> <span style="color:red;margin-left:203px;">*</span>城市： <select>
												<option>请选择区域</option>
												<option>武汉市</option>
											</select> <br /> <span style="color:red;margin-left:30px;">*</span>区/县：
											<select style="margin-left:12px;">
												<option>请选择区域</option>
												<option>洪山区</option>
											</select> <span style="color:red;margin-left:202px;">*</span>街道： <select>
												<option>请选择区域</option>
												<option>珞南街道</option>
											</select> <br />
											<br /> <span style="color:red;margin-left:30px;">*</span>小区：
											<input style="width: 210px;height: 20px;margin-left:15px;"
												type="text" class="textBox" /> <br /> <span
												style="color:red;margin-left:30px;">*</span>户型： <select
												style="width:100px;height:28px;margin-left:15px;">
												<option>室</option>
												<option>1</option>
												<option>2</option>
											</select> <select style="width:100px;height:28px;">
												<option>厅</option>
												<option>1</option>
												<option>2</option>
											</select> <select style="width:100px;height:28px;">
												<option>卫生间</option>
												<option>有</option>
												<option>无</option>
											</select> <span style="color:red;margin-left:115px;">*</span>平方数： <input
												style="width: 100px;height: 20px;margin-top:10px;margin-left:15px;"
												type="text" class="textBox" /> <span>&nbsp;m²</span> <br />
											<span style="color:red;margin-left:30px;">*</span>楼层： <input
												type="text" placeholder="所在层数"
												style="margin-left: 15px;width: 100px;height: 20px;" /> <input
												type="text" placeholder="总层数"
												style="margin-left:15px;width: 100px;height: 20px;" /> <span
												style="color:red;margin-left:175px;">*</span>装修情况： <select
												style="width:200px;height:28px;">
												<option>未装修</option>
												<option>普通装修</option>
												<option>精装修</option>
											</select><br /> <span style="color:red;margin-left:30px;">*</span>租金：
											<input type="text" placeholder="金额/月"
												style="width:100px;height:20px;margin-left: 15px;" /> <select
												style="width:100px;height:28px;margin-left: 15px;">
												<option>押一付三</option>
												<option>押二付三</option>
												<option>押三付三</option>
												<option>无押金</option>
											</select> <span style="color:red;margin-left:190px;">*</span>朝向： <select
												style="width:100px;height:28px;margin-left: 30px;">
												<option>东</option>
												<option>南</option>
												<option>西</option>
												<option>北</option>
											</select><br />
										</div>
										<br />
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">2</span><strong><big><big>房源个性描述</big></big></strong>
											</p>
											<p>
												<span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input
													style="width: 500px;height: 20px;margin-left:20px;"
													type="text" value="" />
											</p>
											<span style="color:red;margin-left:30px;">*</span><span>详细介绍：</span>
											<textarea style="width: 500px;height: 50px;margin-left：20px;"
												type="text"></textarea>
											<br />
											<br />
											<p style="margin-left:30px;">
												上传图片：<input type="file" name="uploadFile" />
											</p>
										</div>
										<br />
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">3</span><strong><big><big>其他信息</big></big></strong>
											</p>
											<span style="color:red;margin-left:30px;">*</span>邮箱：<input
												type="text" style="margin-left:30px;" /><br /> <span
												style="color:red;margin-left:30px;">*</span>联系人：<input
												type="text" style="margin-left:16px;" /><br /> <span
												style="color:red;margin-left:30px;">*</span>联系电话：<input
												type="text" /><br />
											<br />
										</div>
										<br />
										<div>
											<br />
											<p>
												<strong><big> <span class="badge"
														contenteditable="true">4</span><span style="color:red;">*</span>房源验证申请：
												</big></strong>
											</p>
											<select style="margin-left:30px;">
												<option>申请验证</option>
												<option>不申请验证</option>
											</select>
										</div>
										<br />
										<br />
										<center>
											<div class="container-fluid">
												<div class="row-fluid">
													<div class="span12">
														<button class="btn btn-primary btn-large button-bottom"
															type="button">&nbsp;提交 &nbsp;</button>
													</div>
												</div>
											</div>
										</center>
									</div>
									<div class="tab-pane" id="panel-684998">
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">1</span><strong><big><big>房源基本信息</big></big></strong>
											</p>
											<br /> <span style="color:red;margin-left:30px;">*</span>省份：
											<select style="margin-left:15px;">
												<option>请选择区域</option>
												<option>湖北省</option>
											</select> <span style="color:red;margin-left:203px;">*</span>城市： <select>
												<option>请选择区域</option>
												<option>武汉市</option>
											</select> <br /> <span style="color:red;margin-left:30px;">*</span>区/县：
											<select style="margin-left:12px;">
												<option>请选择区域</option>
												<option>洪山区</option>
											</select> <span style="color:red;margin-left:202px;">*</span>街道： <select>
												<option>请选择区域</option>
												<option>珞南街道</option>
											</select> <br />
											<br /> <span style="color:red;margin-left:30px;">*</span>小区：
											<input style="width: 210px;height: 20px;margin-left:15px;"
												type="text" class="textBox" /> <br /> <span
												style="color:red;margin-left:30px;">*</span>户型： <select
												style="width:100px;height:28px;margin-left:15px;">
												<option>室</option>
												<option>1</option>
												<option>2</option>
											</select> <select style="width:100px;height:28px;">
												<option>厅</option>
												<option>1</option>
												<option>2</option>
											</select> <select style="width:100px;height:28px;">
												<option>卫生间</option>
												<option>有</option>
												<option>无</option>
											</select> <span style="color:red;margin-left:115px;">*</span>平方数： <input
												style="width: 100px;height: 20px;margin-top:10px;margin-left:15px;"
												type="text" class="textBox" /> <span>&nbsp;m²</span> <br />
											<span style="color:red;margin-left:30px;">*</span>楼层： <input
												type="text" placeholder="所在层数"
												style="margin-left: 15px;width: 100px;height: 20px;" /> <input
												type="text" placeholder="总层数"
												style="margin-left:15px;width: 100px;height: 20px;" /> <span
												style="color:red;margin-left:175px;">*</span>装修情况： <select
												style="width:200px;height:28px;">
												<option>未装修</option>
												<option>普通装修</option>
												<option>精装修</option>
											</select><br /> <span style="color:red;margin-left:30px;">*</span>朝向：
											<select style="width:100px;height:28px;margin-left: 15px;">
												<option>东</option>
												<option>南</option>
												<option>西</option>
												<option>北</option>
											</select> <span style="color:red;margin-left:335px;">*</span>总价：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
												type="text" placeholder="金额/万：" /><br />
										</div>
										<br />
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">3</span><strong><big><big>房源个性描述</big></big></strong>
											</p>
											<p>
												<span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input
													style="width: 500px;height: 20px;margin-left:20px;"
													type="text" value="" />
											</p>
											<span style="color:red;margin-left:30px;">*</span><span>详细介绍：</span>
											<textarea style="width: 500px;height: 50px;margin-left：20px;"
												type="text"></textarea>
											<br />
											<br />
											<p style="margin-left:30px;">
												上传图片：<input type="file" name="uploadFile" />
											</p>
										</div>
										<br />
										<div>
											<br />
											<p>
												<span class="badge" contenteditable="true">4</span><strong><big><big>其他信息</big></big></strong>
											</p>
											<span style="color:red;margin-left:30px;">*</span>邮箱：<input
												type="text" style="margin-left:30px;" /><br /> <span
												style="color:red;margin-left:30px;">*</span>联系人：<input
												type="text" style="margin-left:16px;" /><br /> <span
												style="color:red;margin-left:30px;">*</span>联系电话：<input
												type="text" /><br />
											<br />
										</div>
										<br />
										<div>
											<br />
											<p>
												<strong><big> <span class="badge"
														contenteditable="true">5</span><span style="color:red;">*</span>房源验证申请：
												</big></strong>
											</p>
											<select style="margin-left:30px;">
												<option>申请验证</option>
												<option>不申请验证</option>
											</select>
										</div>
										<br />
										<br />
										<center>
											<div class="container-fluid">
												<div class="row-fluid">
													<div class="span12">
														<button class="btn btn-primary btn-large button-bottom"
															type="button">&nbsp;提交 &nbsp;</button>
													</div>
												</div>
											</div>
										</center>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="span2">
						<ul class="nav nav-list">
							<li class="nav-header"></li>
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<li class="active"><a href="#">我要卖房</a></li>
							<li><a href="#">房源基本信息</a></li>
							<li><a href="#">房源个性描述</a></li>
							<li><a href="#">其他信息</a></li>
							<li><a href="#">售卖房源申请验证</a></li>

							<li class="divider"></li>
							<li><a href="#">帮助</a></li>
						</ul>
					</div>
				</div>
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<h4>提示!</h4>
					<strong>警告!</strong> 请注意你的个人隐私安全.
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<!--底部导航-->
	<iframe src="nav_model/footer_nav.jsp" width="100%" height="325px"
		style="border: 0px;" scrolling="no"></iframe>
</html>
</body>