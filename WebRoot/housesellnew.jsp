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

function addNewRow (){
	//在元素内部追加内容
    $("#new_house_container").append( "<div style='margin-top: 10px;padding:6px;margin-left:5px;'> "+
    "<select name='mainTypeArray' style='width: 100px;height: 30px;' ><option value='1室0厅'>1室0厅</option><option value='1室1厅'>1室1厅</option><option value='2室1厅' >2室1厅</option><option value='3室1厅'>3室1厅</option><option value='3室2厅'>3室2厅</option></select>"+
    "<input name='sizeArray' style='width: 60px;height: 20px;margin-left: 102px;display: inline;' type='number' required='' />&nbsp;&nbsp;m²"+
    "<input name='priceArray' style='width: 60px;height: 20px;margin-left: 105px;display: inline;' type='text' type='number' required=''/>&nbsp;&nbsp;元/m²"+
    "<input name='downpaymentArray' style='width: 60px;height: 20px;margin-left: 75px;display: inline;' type='text' type='number' required=''/>&nbsp;&nbsp;万</div>");

}
</script>
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
      var livein_year = document.getElementById("liveinyear-select");
       year.options.add(new Option("年",0));
       livein_year.add(new Option("年",0));
      for(i=new Date().getFullYear()+20;i>=new Date().getFullYear();i--){
         year.options.add(new Option(i,i));
         livein_year.options.add(new Option(i,i));
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
   
   function setLiveinMonth(){
      var month = document.getElementById("liveinmonth-select");
      var year = document.getElementById("liveinyear-select");
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
   
   function setDay(){
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
     
      function setLiveinDay(){
     var year = document.getElementById("liveinyear-select");
     var month = document.getElementById("liveinmonth-select");
     var day = [31,28,31,30,31,30,31,31,30,31,30,31];
      if(year.selectedIndex%4 == 0 || (year.selectedIndex%400 == 0 && year.selectedIndex%100 == 0) ){
         day = [31,29,31,30,31,30,31,31,30,31,30,31];
      }
      var date =  document.getElementById("liveinday-select");
      date.innerHTML="";
      date.options.add(new Option("日",0));
      for(i=1;i<=day[month.selectedIndex];i++){
            date.options.add(new Option(i,i));
          }
     }
</script>

</head>
<body onload="setup();preselect('湖北省');initYear();">
   <form action="rm!postNewEnterprise" method="post">
      <div class="container">
         <div class="div1">
             <br />
              <p><span class="badge" >1</span><strong><big><big>基础信息</big></big></strong></p>
              <br />
              <span style="color: red;margin-left:30px;">*</span>楼盘地址：
              <select id="province-select" style="width: 146px;height:28px;" name="houseSellEnterprise.region.province"><option>请选择省份</option></select>
              <select id="city-select" style="width: 146px;height:28px;" name="houseSellEnterprise.region.city"><option>请选择城市</option></select>
              <select id="county-select" style="width: 146px;height:28px;" name="houseSellEnterprise.region.county"><option>请选择区域</option></select>
              <br />
              <input required="" style="width: 210px;margin-left:110px;" type="text" class="textBox" name="houseSellEnterprise.addr" placeholder="请填写详细地址" />
              <br />
              <span style="color:red;margin-left:30px;">*</span>楼盘名称：
              <input required="" style="width: 210px;" type="text" class="textBox" name="houseSellEnterprise.buildingName" />
              <br />
              <span style="color:red;margin-left:30px;">*</span>开发商：
              <input required="" style="width: 130px;margin-left:15px;" type="text" name="houseSellEnterprise.developerName"  class="textBox" />
              <span style="color:red;margin-left:161px;">*</span>物业公司：
              <input required="" style="width: 120px;" type="text" name="houseSellEnterprise.propertyName"  class="textBox" />
              <br/>
              <p>
                <span style="color: red;margin-left: 30px;">*</span>建筑面积：<input type="number" required="" name="houseSellEnterprise.builtupArea"  style="width: 80px;height: 20px;margin-left:5px;" type="text" /><span style="margin-left:10px;">平方米</span>
                <span style="color: red;margin-left:160px;">*</span>占地面积：<input type="number" required="" name="houseSellEnterprise.langArea" style="width: 80px;height: 20px;margin-left:5px;" type="text" /><span style="margin-left:10px;">平方米</span>
              </p>


                                    <div>
                                    <span style="color:red;margin-left:30px;float:left;margin-top:5px;">*</span><span style="float:left;margin-top:5px;">开盘时间：</span>
                                    <select style="width:70px;height:28px;float:left;margin-left:5px;" id="year-select" onchange="setMonth()" name="year"></select>
                                    <select style="width:70px;height:28px;float:left;margin-left:8px;" id="month-select" onchange="setDay()" name="month"></select>
                                    <select style="width:70px;height:28px;float:left;margin-left:8px;" id="day-select" name="day"></select>
                                     </div>

                                    <div>
                                    <span style="color:red;margin-left:30px;float:left;margin-top:5px;margin-left:80px;">*</span><span style="float:left;margin-top:5px;">入住时间：</span>
                                    <select style="width:70px;height:28px;float:left;margin-left:5px;" id="liveinyear-select" onchange="setLiveinMonth()" name="liveinyear"></select>
                                    <select style="width:70px;height:28px;float:left;margin-left:8px;" id="liveinmonth-select" onchange="setLiveinDay()" name="liveinmonth"></select>
                                    <select style="width:70px;height:28px;float:left;margin-left:8px;" id="liveinday-select" name="liveinday"></select>
                                    </div>
                                     <br />
                                    <br/>
                                    <span style="color:red;margin-left:30px;">*</span>数量信息：
                                    <input  name="houseSellEnterprise.sellednum" required="" style="width: 100px;height: 20px;"  type="number"/>
                                    <input  name="houseSellEnterprise.totalnum" required="" style="margin-left:15px;width: 100px;height: 20px;" type="number"/>
                                  </div><br />
                                <div class="div1">
                                    <br />
                                    <p>
                                        <span class="badge" >2</span><strong><big><big>房源个性描述</big></big></strong>
                                    </p>
                                    <p>
                                     <span style="color:red;margin-left:30px;">*</span>规划户数：<input required=""  style="width: 50px;height: 20px;margin-left:10px;"  name="houseSellEnterprise.planningNum" type="number" /><span style="margin-left:10px;">户</span>
                                     <span style="color: red;margin-left:200px;">*</span>停车位：<input required="" style="width: 50px;height: 20px;margin-left: 10px;"  name="houseSellEnterprise.parkingNum" type="number"/><span style="margin-left:10px;">个</span>
                                  </p>
                                  <p>
                                      <span style="color: red;margin-left: 30px;">*</span>管理费：<input style="width: 80px;height: 20px;margin-left:20px;" required=""  name="houseSellEnterprise.manaFee" type="number"/><span style="margin-left:10px;">元/平米每年</span>
                                      <span style="color: red;margin-left:115px;">*</span>绿化率：<input style="width: 50px;height: 20px;margin-left: 10px;" required=""  name="houseSellEnterprise.greeningRate" type="number"/><span style="margin-left:10px;">%</span>
                                  </p>
                                  <p>
									 <span style="color:red;margin-left:30px;">*</span>标题：&nbsp;&nbsp;&nbsp;<input required="" style="width: 500px;height: 20px;margin-left:20px;" type="text" name="houseSellEnterprise.title" />
								  </p>
                                  <span style="color:red;margin-left:30px;">*</span><span >详细介绍：</span><textarea style="width: 500px;height: 50px;margin-left：20px;" type="text" required="" name="houseSellEnterprise.remark"></textarea><br /><br />
                                    <p style="margin-left:30px;">上传图片：<input type="file" name="uploadFile" name="Image" required=""/></p>
                                </div><br />
                                <div class="div1">
                                    <br />
                                    <p><span class="badge" >3</span><strong><big><big>详细信息</big></big></strong></p>
                                    <div style="width: auto;height: auto;padding: 18px;">
                                        <div>
                                            <h4 style="display: inline;margin-right: 150px;" >主要户型</h4>
                                            <h4 style="display: inline;margin-right: 150px;" >面积</h4>
                                            <h4 style="display: inline;margin-right: 150px;" >价格</h4>
                                            <h4 style="display: inline;" >首付</h4>
                                        </div>
                                    </div>  
                                        <div id="new_house_container" >
                                          <div style="margin-top: 10px;margin-left:10px;"> 
                                              <select name="maintypeArray" style="width: 100px;height: 30px;" >
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
                                              <input name="sizeArray" style="width: 60px;height: 20px;margin-left: 100px;display: inline;" required="" type="number"/>&nbsp;&nbsp;m²
                                              <input name="priceArray"style="width: 60px;height: 20px;margin-left: 100px;display: inline;" required="" type="number"/>&nbsp;&nbsp;元/m²
                                              <input name="downpaymentArray" style="width: 60px;height: 20px;margin-left: 70px;display: inline;"  required="" type="number"/>&nbsp;&nbsp;万
                                          </div>
                                        </div>  
                                        <center style="margin-bottom:50px;">
                                          <input type="button" value="+" id="add_new"  class="btn btn-primary " onclick="addNewRow()" />
                                        </center>
                                    
                                  </div>
                                  </div>
                                <center>
                                <div class="container-fluid">
                                   <div class="row-fluid">
                                     <div class="span12">
                                        <input type="submit" class="btn btn-primary btn-large button-bottom"  value="提交"/>
                                     </div>
                                   </div>
                                 </div>
                                </center>
                          </div>
                       </form>
</body>
</html>