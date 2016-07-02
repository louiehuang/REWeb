<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link href="css/bootstrap-combined.min.css" rel="stylesheet"
	media="screen">
<link href="css/detail_style.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<!-- 		<script type="text/javascript" src="js/common/jquery-ui"></script> -->
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>

<script type="text/javascript">
			function pl() {
				var now = document.getElementById("pilu");
				if (now.value.length > 40) {
					alert("评论太长");
					return;
				}
				var sum = document.getElementById("jihe");
				//alert(40-now.value.length);
				var p = 40 - now.value.length;
				if (now.value != "") {
					if (sum.value != "") sum.value += "\n";
					sum.value += now.value;
					//alert(p);
					for (var i = 0; i < p; i++) sum.value += "  ";
					sum.value += "XXXX-XX-XX XX:XX:XX更新";
				}
				sum.rows++;
			}
		</script>
</head>

<body class="back">
	<iframe src="nav_model/header_nav.jsp" width="100%" height="125px"
		style="border: 0px;" scrolling="no"></iframe>

	<div class="container-fluid mt back">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid back">
					<div class="col-xs-6 span9">
						<div class="row-fluid">
							<div class="span12">
								<h3>XXXX房屋具体信息</h3>
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
													<img alt="" src="images/details/内景1.jpg" />

												</div>
												<div class="item">
													<img alt="" src="images/details/内景2.jpg" />

												</div>
												<div class="item">
													<img alt="" src="images/details/内景3.jpg" />
												</div>

											</div>
											<a data-slide="prev" href="#carousel-810640"
												class="left carousel-control">‹</a> <a data-slide="next"
												href="#carousel-810640" class="right carousel-control">›</a>
										</div>
									</div>
									<div class="span6">
										<div class="line1">
											总价 &nbsp;<span class="prise">￥<em>360万</em></span>(35489元/㎡)
											<span class="gray">已被10000人收藏</span>
										</div>
										<div class="line3">
											<strong>户型:</strong>两室一厅&nbsp;&nbsp;&nbsp; <strong>建筑面积:</strong>56㎡&nbsp;&nbsp;&nbsp;
											<strong>装修:</strong>豪华
										</div>
										<div class="line3">
											<strong>朝向:</strong>朝东南
										</div>
										<div class="line3">
											<strong>楼层：</strong>高楼层/50层
										</div>
										<div class="line3">
											<strong>小区:</strong>德玛西亚小区
										</div>
										<div>
											<span class="tel"> <i></i> 10086转1008611
											</span>
										</div>
										<div>
											<input type="button" class="btn btn-block btn-warning"
												value="收藏" name="1" />
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
								<h4>鑫神</h4>
								<p>从业年限: 100年</p>
								<p>带看房量：1亿</p>
							</div>
						</div>
						<div>
							<p>
								好评率&nbsp;<span class="gray">共X条评论</span>
							</p>
							<p class="line3">
								好评: <span class="gray">100%</span>
							</p>
							<p class="line3">
								中评: <span class="gray">0%</span>
							</p>
							<p class="line3">
								差评: <span class="gray">0%</span>
							</p>
						</div>
						<div>
							<p>
								<br />鑫神房产网认证<span class="prise">100%</span>真房源<br />
							</p>
							<a href="#">举报</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row-fluid mt">
			<div class="span12">
				<div class="tabbable" id="tabs-281283">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-239168" data-toggle="tab">房屋详情</a>
						</li>
						<li><a href="#panel-651808" data-toggle="tab">房屋评论</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-239168">
							<p>我是房屋详情</p>
						</div>
						<div class="tab-pane" id="panel-651808">
							<textarea id="jihe" style="width:90%;height:100%" value=""
								disabled="disabled"></textarea>

							<form action="detailsAction!putComment">
								<input type="text" name="comment.comment" id="pilu" />
								<button class="btn btn-success" onclick="pl()">评论</button>
							</form>
							
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="row-fluid mt">
			<h3>房源图片</h3>
			<img src="images/details/外景.jpg" style="width:520px; height:390px;"
				style="display:inline;" /> <img src="images/details/内景1.jpg"
				style="width:520px; height:390px;" style="display:inline;" /> <img
				src="images/details/内景2.jpg" style="width:520px; height:390px;"
				style="display:inline;" /> <img src="images/details/内景3.jpg"
				style="width:520px; height:390px;" style="display:inline;" />
		</div>
		<div class="row-fluid mt">
			<div>
				<h3>小区详情</h3>
			</div>
			<div class="bdup">
				<div class="line3">
					<p>
						小区名称&nbsp;:&nbsp;德玛西亚小区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						户型结构&nbsp;:&nbsp;平层&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						物业类型&nbsp;:&nbsp;别墅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</div>
				<div class="line3">
					建筑年代&nbsp;:&nbsp;2016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					物业公司&nbsp;:&nbsp;湖北市鑫神物业管理有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="line3">
					基本配套&nbsp;:&nbsp;煤气/宽带/天然气/暖气/电梯/地铁&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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