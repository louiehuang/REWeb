<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link src="css/a.css"></link>
<link href="css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/common/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="js/common/bootstrap.min.js"></script>
<script type="text/javascript" src="js/admin/geo.js"></script>
<script type="text/javascript">
   function checkSelect(){
        var city_index=window.document.form1.city-select.selectedIndex; 
        if(city_index == 0)
          alert('请选择城市...');
        var county_index=window.document.form1.county-select.selectedIndex; 
        if(county_index == 0)
          alert('请选择区县...');
   }
   
</script>

</head>
<body onload="setup();preselect('湖北省');">
 	<form action="rm!postNewSecond" method="post" enctype="multipart/form-data" id="form1" onsubmit="checkSelect()">
	    <div class="container">
			<div >
			<br />
			<p><span class="badge" contenteditable="true">1</span><strong><big><big>房源基本信息</big></big></strong>
			</p><br /> 
				<span style="color: red;margin-left:30px;">*</span>地址：
					<select id="province-select" style="width: 146px;height:28px;margin-left:15px;" name="houseSellSecondhand.region.province"><option>请选择省份</option></select>
					<select id="city-select" style="width: 146px;height:28px;" name="houseSellSecondhand.region.city"><option>请选择城市</option></select>
					<select id="county-select" style="width: 146px;height:28px;" name="houseSellSecondhand.region.county"  ><option>请选择区域</option></select>
				<br />
				<span style="color:red;margin-left:30px;">*</span>小区：
				   <input  required=""  style="width: 210px;height: 20px;margin-left:15px;" type="text" class="textBox" name="houseSellSecondhand.community"/>
				   <br />
				   <span style="color:red;margin-left:30px;">*</span>户型：
				   <select style="width:135px;height:28px;margin-left:15px;" name="houseSellSecondhand.houseType.name" > 
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
									<input required=""  name="houseSellSecondhand.size" type="number" style="width: 100px;height: 20px;margin-top:10px;margin-left:16px;" type="text" class="textBox" />
									<span>m²</span>
									<br /> 
									<span style="color:red;margin-left:30px;">*</span>楼层：
									<input required=""  name="houseSellSecondhand.houseFloor" type="number" placeholder="所在层数" style="margin-left: 15px;width: 120px;height: 20px;"/>
									<span style="color:red;margin-left:166px;">*</span>装修情况：
								    <select style="width:120px;height:28px;" name="houseSellSecondhand.decoration">
										<option value="0">未装修</option>
										<option value="1">普通装修</option>
									    <option value="2">精装修</option>
									</select>
									<br/>
								<span style="color:red;margin-left:30px;">*</span>朝向：
								  <select required="" style="width:100px;height:28px;margin-left: 15px;" name="houseSellSecondhand.orientation">
										<option value="0">东</option>
										<option value="1">南</option>
									    <option value="2">西</option>
										<option value="3">北</option>
									</select>
									<span style="color:red;margin-left:205px;">*</span>总价：
								   <input required=""  type="number" style="width:120px;height:20px;margin:0 20px;" name="houseSellSecondhand.price" />
								   <span>万元</span>    
									</div><br />
								<div>
									<br />
									<p>
										<span class="badge" contenteditable="true">3</span><strong><big><big>房源个性描述</big></big></strong>
									</p> 
									<p>
									 <span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input required=""  style="width: 500px;height: 20px;margin-left:40px;" type="text" value="" name="houseSellSecondhand.title"/>
								  </p>
								  <span style="color:red;margin-left:30px;">*</span><span >详细介绍：</span><textarea required=""  style="width: 500px;height: 50px; margin-left:20px;" type="text" name="houseSellSecondhand.remark"></textarea><br /><br /> 
									<p style="margin-left:30px;">上传图片：<input required=""  type="file" name="Image" /></p>
								</div><br />
								
									<br /><p><strong><big> 
										<span class="badge" contenteditable="true">4</span><span style="color:red;">*</span>房源验证申请：</big></strong></p>
										<select style="margin-left:30px;" name="houseSellSecondhand.hauthenticity">  
											<option value="1">
												申请验证
											</option > 
											<option value="0">
												不申请验证
											</option>
										</select>
								</div><br /><br />
								<center>
								<div class="container-fluid">
	                             <div class="row-fluid">
		                         <div class="span12">
			                     <input class="btn btn-primary btn-large button-bottom" type="submit" value="提交"/>
		                         </div>
	                             </div>
                                 </div>
								</center>
							</div>
						</form>
							
</body>
</html>