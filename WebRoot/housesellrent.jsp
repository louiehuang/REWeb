<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link src="css/a.css"></link>
<link href="css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="js/admin/geo.js"></script>


</head>
<body onload="setup();preselect('湖北省');">
  <div class="container">
 	<form action="rm!postNewRent" method="post" enctype="multipart/form-data" id="form1" >
		<div class="div1">
					<br />
					<p>
					  <span class="badge" contenteditable="true">1</span><strong><big><big>基础信息</big></big></strong>
					</p>
					<br /> 
						<span style="color: red;margin-left:30px;">*</span>地址：
						<select id="province-select"  style="width: 146px;height:28px;margin-left:15px;" name="houseSellRent.region.province"><option>请选择省份</option></select>
						<select id="city-select" style="width: 146px;height:28px;" name="houseSellRent.region.city"><option>请选择城市</option></select>
						<select id="county-select" style="width: 146px;height:28px;" name="houseSellRent.region.county" ><option>请选择区域</option></select>
						<br />
						<span style="color:red;margin-left:30px;">*</span>小区：
						<input required="" style="width: 210px;height: 20px;margin-left:15px;" type="text" class="textBox" name="houseSellRent.community" />
						<br />
						<span style="color:red;margin-left:30px;">*</span>户型：
						  <select style="width:100px;height:28px;margin-left:15px;" name="houseSellRent.houseType.name" > 
										<option value="1室0厅" >
											1室0厅
										</option> 
										<option value="1室1厅" >
											1室1厅
										</option>
										<option value="2室1厅" >
											2室1厅
										</option> 
										<option value="3室1厅">
											3室1厅
										</option>
										<option value="3室2厅">
											3室2厅
										</option>
									</select> 
									
									<span style="color:red;margin-left:166px;">*</span>平方数：
									<input required=""  name="houseSellRent.size" type="number" style="width: 100px;height: 20px;margin-top:10px;margin-left:10px;" class="textBox" />
									<span>m²</span>
									<br /> 
									<span style="color:red;margin-left:30px;">*</span>楼层：
									<input required=""  name="houseSellRent.houseFloor" type="number" placeholder="所在层数" style="margin-left: 15px;width: 120px;height: 20px;"/>
									<span style="color:red;margin-left:130px;">*</span>装修情况：
								    <select style="width:120px;height:28px;" name="houseSellRent.decoration">
										<option value="0">未装修</option>
										<option value="1">普通装修</option>
									    <option value="2">精装修</option>
									</select>
									<br/>
								<span style="color:red;margin-left:30px;">*</span>租金：
								   <input required=""  type="number" style="width:120px;height:20px;margin:0 15px;" name="houseSellRent.price" />
								<span>元/月</span>    
								<span style="color:red;margin-left:80px;">*</span>朝向：
								  <select style="width:100px;height:28px;margin-left: 27px;" name="houseSellRent.orientation">
										<option value="0">东</option>
										<option value="1">南</option>
									    <option value="2">西</option>
										<option value="3">北</option>
									</select><br />
								</div><br />
								<div class="div1">
									<br />
									<p>
										<span class="badge" contenteditable="true">2</span><strong><big><big>房源个性描述</big></big></strong>
									</p> 
									<p>
									 <span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input required="" style="width: 500px;height: 20px;margin-left:20px;" type="text" name="houseSellRent.title" />
								  </p>
								  <span style="color:red;margin-left:30px;">*</span><span >详细介绍：</span><textarea name="houseSellRent.remark" style="width: 500px;height: 50px;margin-left：20px;" type="text" required=""></textarea><br /><br /> 
									<p style="margin-left:30px;">上传图片：<input type="file" name="Image" required=""/></p>
								</div><br />
								
								<div class="div1">
									<br /><p><strong><big> 
										<span class="badge" contenteditable="true">3</span><span style="color:red;">*</span>房源验证申请：</big></strong></p>
										<select style="margin-left:30px;" name="houseSellRent.hauthenticity">  
											<option value="1">
												申请验证
											</option> 
											<option value="0">
												不申请验证
											</option>
										</select>
								</div><br /><br />
								<center>
								<div class="container-fluid">
	                             <div class="row-fluid">
		                         <div class="span12">
			                     <input type="submit" class="btn btn-primary btn-large button-bottom"  value="提交"/>
		                         </div>
	                             </div>
                                 </div>
								</center>
								</form>
							</div>
</body>
</html>