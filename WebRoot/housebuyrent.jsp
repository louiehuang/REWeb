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
<script type="text/javascript">
   function checkSelect(){
        var city_index=window.document.form1.city-select.selectedIndex; 
        if(city_index == 0)
          alert('请选择城市...');
        var county_index=window.document.form1.county-select.selectedIndex; 
        if(county_index == 0)
          alert('请选择区县...');
   }
   
   function initYear(){
      var year = document.getElementById("year-select");
       year.options.add(new Option("年",0));
      for(i=new Date().getFullYear()+20;i>=new Date().getFullYear();i--){
         year.options.add(new Option(i,i));
      }
   }
   
   function setMonth(){
      var month = document.getElementById("month-select");
      var year = document.getElementById("year-select");
      month.innerHTML="";
      month.options.add(new Option("月",0));
      if(year.value == new Date().getFullYear()){
         var index = new Date().getMonth();
         for(i=index+1;i<=12;i++)
           month.options.add(new Option(i,i));
      }else{
         for(i=1;i<=12;i++)
           month.options.add(new Option(i,i));
      }
   }
   
   function setMyDay(){
     var year = document.getElementById("year-select");
     var month = document.getElementById("month-select");
     var day = [31,28,31,30,31,30,31,31,30,31,30,31];
      if(year.selectedIndex%4 == 0 || (year.selectedIndex%400 == 0 && year.selectedIndex%100 == 0) ){
         day = [31,29,31,30,31,30,31,31,30,31,30,31];
      }
      var date =  document.getElementById("day-select");
      date.innerHTML="";
      date.options.add(new Option("日",0));
      for(i=1;i<=day[month.selectedIndex];i++){
            date.options.add(new Option(i,i));
          }
     }
</script>

</head>
<body onload="setup();preselect('湖北省');initYear();">
  <div class="container">
 	<form action="rm!postNewBuyRent" method="post" enctype="multipart/form-data" id="form1" onsubmit="checkSelect()">
		<div class="div1">
					<br />
					<p>
					  <span class="badge" contenteditable="true">1</span><strong><big><big>基础信息</big></big></strong>
					</p>
					<br /> 
						<span style="color: red;margin-left:30px;">*</span>地址：
						<select id="province-select"  style="width: 146px;height:28px;margin-left:28px;" name="houseBuyRent.region.province"><option>请选择省份</option></select>
						<select id="city-select" style="width: 146px;height:28px;" name="houseBuyRent.region.city"><option>请选择城市</option></select>
						<select id="county-select" style="width: 146px;height:28px;" name="houseBuyRent.region.county" ><option>请选择区域</option></select>
						<br />
					    <br />
						<span style="color: red;margin-left:30px;">*</span>期望租金：
				        <input required="" style="width:100px;height: 20px;" type="number" name="houseBuyRent.pirce"  /><span style="margin-left:7px;">元/月</span>
					              <span style="color: red;margin-left:75px;">*</span>期望户型：
				            		<select name="houseBuyRent.houseType.name" style="width: 136px;height:28px;">
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
					                <br />
							      <span style="color:red;margin-left:30px;">*</span>朝向：
								  <select style="width:100px;height:28px;margin-left: 27px;" name="houseBuyRent.orientation">
										<option value="0">东</option>
										<option value="1">南</option>
									    <option value="2">西</option>
										<option value="3">北</option>
									</select>		
									<span style="color:red;margin-left:130px;">*</span>平方数：
									<input required="" style="width: 120px;height: 20px;margin-left:12px;" type="number" name="houseBuyRent.size" />
					              	<br /> 
									<span style="color:red;margin-left:30px;">*</span>楼层：
									<input required="" style="width: 90px;height: 20px;margin-left:25px;" type="number" name="houseBuyRent.houseFloor" />
					              	<span style="color:red;margin-left:128px;">*</span>装修情况：
								    <select style="width:114px;height:28px;" name="houseBuyRent.decoration">
										<option value="0">未装修</option>
										<option value="1">普通装修</option>
									    <option value="2">精装修</option>
									</select>
									<br/><br/>
									<span style="color: red;float:left;margin-left:30px;">*</span>
									  <div style="float:left;">最晚入住时间：</div>
							           <select style="width:80px;height:28px;float:left;" name="year" id="year-select" onchange="setMonth()"></select> 
								       <select style="width:80px;height:28px;float:left;margin-left:10px;" name="month" id="month-select" onchange="setMyDay()"></select> 
							  	       <select style="width:80px;height:28px;float:left;margin-left:10px;" name="day" id="day-select" ></select>
					              </div>
								<br /><br/>
								<div class="div1">
									<br />
									<p>
										<span class="badge" contenteditable="true">2</span><strong><big><big>房源个性描述</big></big></strong>
									</p> 
									<p>
									 <span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input required="" style="width: 500px;height: 20px;margin-left:20px;" type="text" name="houseBuyRent.title" />
								  </p>
								  <span style="color:red;margin-left:30px;">*</span><span >具体要求：</span><textarea name="houseBuyRent.remark" style="width: 500px;height: 50px;margin-left：20px;" type="text" required=""></textarea><br /><br /> 
								</div><br />
								
								<br /><br />
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