package com.chinasoft.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import com.chinasoft.others.BuyerDetail;
import com.chinasoft.others.BuyerRentDetail;
import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseBuyRent;
import com.chinasoft.pojo.HouseBuyRequest;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.HouseType;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseBuyRentService;
import com.chinasoft.service.HouseBuyRequestService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.HouseTypeService;
import com.chinasoft.service.RegionService;

public class HouseSellRentAction {
	private RegionService regionService;
	private HouseTypeService houseTypeService;
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private HouseSellEnterprise houseSellEnterprise;
	private HouseBuyRentService houseBuyRentService;
	private List<HouseSellRent> list;
	private HttpSession session;
	private File Image; 
	private String ImageFileName; 
	private String ImageContentType; 
	
	private HouseSellRentService houseSellRentService;
	private HouseSellRent houseSellRent;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellSecondhand houseSellSecondhand;
	private HouseBuyRent houseBuyRent;
	private HouseBuyRequestService houseBuyRequestService;
	private HouseBuyRequest houseBuyRequest;
	private String year,month,day,liveinyear,liveinmonth,liveinday;
    private List<BuyerDetail> houseBuyRequestList; 
	private List<BuyerRentDetail> houseBuyRentList; 
	private String[] mainTypeArray,priceArray,sizeArray,downpaymentArray;
	
	
	public String[] getMainTypeArray() {
		return mainTypeArray;
	}


	public void setMainTypeArray(String[] mainTypeArray) {
		this.mainTypeArray = mainTypeArray;
	}


	public String[] getPriceArray() {
		return priceArray;
	}


	public void setPriceArray(String[] priceArray) {
		this.priceArray = priceArray;
	}


	public String[] getSizeArray() {
		return sizeArray;
	}


	public void setSizeArray(String[] sizeArray) {
		this.sizeArray = sizeArray;
	}


	public String[] getDownpaymentArray() {
		return downpaymentArray;
	}


	public void setDownpaymentArray(String[] downpaymentArray) {
		this.downpaymentArray = downpaymentArray;
	}


	public String getLiveinyear() {
		return liveinyear;
	}


	public HouseBuyRequest getHouseBuyRequest() {
		return houseBuyRequest;
	}


	public void setLiveinyear(String liveinyear) {
		this.liveinyear = liveinyear;
	}


	public String getLiveinmonth() {
		return liveinmonth;
	}


	public void setLiveinmonth(String liveinmonth) {
		this.liveinmonth = liveinmonth;
	}


	public String getLiveinday() {
		return liveinday;
	}


	public void setLiveinday(String liveinday) {
		this.liveinday = liveinday;
	}

	
	public List<BuyerDetail> getHouseBuyRequestList() {
		return houseBuyRequestList;
	}


	public void setHouseBuyRequestList(List<BuyerDetail> houseBuyRequestList) {
		this.houseBuyRequestList = houseBuyRequestList;
	}


	public String getBuyRequestInfo(){
		houseBuyRequestList = BuyerDetail.findAll();
		if (houseBuyRequestList != null) {
			return "buyRequestSuccess";
		} else {
			return "error";
		  }		
		
	}

	public String getBuyRentInfo(){
		houseBuyRentList = BuyerRentDetail.findAll();
		if (houseBuyRentList != null) {
			return "buyRentSuccess";
		} else {
			return "error";
		}		
	}

	
	
	public List<BuyerRentDetail> getHouseBuyRentList() {
		return houseBuyRentList;
	}


	public void setHouseBuyRentList(List<BuyerRentDetail> houseBuyRentList) {
		this.houseBuyRentList = houseBuyRentList;
	}


	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	
	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}

	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}

	public HouseSellEnterprise getHouseSellEnterprise() {
		return houseSellEnterprise;
	}

	public void setHouseSellEnterprise(HouseSellEnterprise houseSellEnterprise) {
		this.houseSellEnterprise = houseSellEnterprise;
	}
	
	

	public HouseBuyRentService getHouseBuyRentService() {
		return houseBuyRentService;
	}

	public void setHouseBuyRentService(HouseBuyRentService houseBuyRentService) {
		this.houseBuyRentService = houseBuyRentService;
	}

	public HouseBuyRent getHouseBuyRent() {
		return houseBuyRent;
	}

	public void setHouseBuyRent(HouseBuyRent houseBuyRent) {
		this.houseBuyRent = houseBuyRent;
	}

	public HouseBuyRequestService getHouseBuyRequestService() {
		return houseBuyRequestService;
	}

	public void setHouseBuyRequestService(
			HouseBuyRequestService houseBuyRequestService) {
		this.houseBuyRequestService = houseBuyRequestService;
	}

	public HouseBuyRequest getBuyerDetail() {
		return houseBuyRequest;
	}

	public void setHouseBuyRequest(HouseBuyRequest houseBuyRequest) {
		this.houseBuyRequest = houseBuyRequest;
	}


	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}

	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}

	public HouseSellSecondhand getHouseSellSecondhand() {
		return houseSellSecondhand;
	}

	public void setHouseSellSecondhand(HouseSellSecondhand houseSellSecondhand) {
		this.houseSellSecondhand = houseSellSecondhand;
	}


	
	public File getImage() {
		return Image;
	}

	public void setImage(File image) {
		Image = image;
	}

	public String getImageFileName() {
		return ImageFileName;
	}

	public void setImageFileName(String imageFileName) {
		ImageFileName = imageFileName;
	}

	public String getImageContentType() {
		return ImageContentType;
	}

	public void setImageContentType(String imageContentType) {
		ImageContentType = imageContentType;
	}

	
	public HouseTypeService getHouseTypeService() {
		return houseTypeService;
	}

	public void setHouseTypeService(HouseTypeService houseTypeService) {
		this.houseTypeService = houseTypeService;
	}

	
	public RegionService getRegionService() {
		return regionService;
	}

	public void setRegionService(RegionService regionService) {
		this.regionService = regionService;
	}

	
	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}

	public void setHouseSellRentService(HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}

	public HouseSellRent getHouseSellRent() {
		return houseSellRent;
	}

	public void setHouseSellRent(HouseSellRent houseSellRent) {
		this.houseSellRent = houseSellRent;
	}

	public List<HouseSellRent> getList() {
		return list;
	}

	public void setList(List<HouseSellRent> list) {
		this.list = list;
	}

	public String getRentInfo() {
		list = houseSellRentService.getRentInfo();
//		list = houseSellRentService.findAll();
		
		if (list != null) {
			return "success";
		} else {
			return "error";
		}
	}
	
	public List<HouseSellRent> Test() {
		return houseSellRentService.getRentInfo();
	}

	
	public String postNewRent(){
		session = ServletActionContext.getRequest().getSession();
		Users users = (Users)session.getAttribute("users");
		if(users!=null){
		    try{
		    	String realpath = ServletActionContext.getServletContext().getRealPath(
						"/upload");
                if (Image != null) {
					File savefile = new File(new File(realpath), ImageFileName);
					if (!savefile.getParentFile().exists()) {
						savefile.getParentFile().mkdirs();
					}
					FileUtils.copyFile(Image, savefile);
					houseSellRent.setPics(savefile.getPath());	
				}else {
					return "uploadempty";
				}
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
			houseSellRent.getRegion().setRegionId(regionService.getRegionId(houseSellRent.getRegion().getProvince(),houseSellRent.getRegion().getCity(), houseSellRent.getRegion().getCounty()));
		    houseSellRent.getHouseType().setHtypeId(houseTypeService.getHTypeId(houseSellRent.getHouseType().getName()));
		    houseSellRent.setUId(users.getUId());
		    houseSellRent.setHavailability(1);
		    houseSellRent.setAddress(houseSellRent.getRegion().getProvince()+houseSellRent.getRegion().getCity()+houseSellRent.getRegion().getCounty());
		    return houseSellRentService.save(houseSellRent);
		} else {
			return "unlog";
		}
	}

	public String postNewSecond(){
		session = ServletActionContext.getRequest().getSession();
		Users users = (Users)session.getAttribute("users");
		if(users!=null){
		    try{
		    	String realpath = ServletActionContext.getServletContext().getRealPath(
						"/upload");
                if (Image != null) {
					File savefile = new File(new File(realpath), ImageFileName);
					if (!savefile.getParentFile().exists()) {
						savefile.getParentFile().mkdirs();
					}
					FileUtils.copyFile(Image, savefile);
					houseSellSecondhand.setPics(savefile.getPath());	
				}
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
			houseSellSecondhand.getRegion().setRegionId(regionService.getRegionId(houseSellSecondhand.getRegion().getProvince(),houseSellSecondhand.getRegion().getCity(), houseSellSecondhand.getRegion().getCounty()));
		    houseSellSecondhand.getHouseType().setHtypeId(houseTypeService.getHTypeId(houseSellSecondhand.getHouseType().getName()));
		    houseSellSecondhand.setUId(users.getUId());
		    houseSellSecondhand.setHavailability(1);
		    houseSellSecondhand.setAddress(houseSellSecondhand.getRegion().getProvince()+houseSellSecondhand.getRegion().getCity()+houseSellSecondhand.getRegion().getCounty());
			return houseSellSecondhandService.save(houseSellSecondhand);
		}	
		return "unlog";
	}
	
	public String postNewEnterprise(){
		session = ServletActionContext.getRequest().getSession();
		EnterpriseUsers enterusers = null;
		if(session.getAttribute("users")==null)
			return "unlog";
		else {
            if(session.getAttribute("type").toString().equals("0"))//个人用户
            	return "person_user";
            enterusers = (EnterpriseUsers)session.getAttribute("users");
		    try{
		    	String realpath = ServletActionContext.getServletContext().getRealPath(
						"/upload");
                if (Image != null) {
					File savefile = new File(new File(realpath), ImageFileName);
					if (!savefile.getParentFile().exists()) {
						savefile.getParentFile().mkdirs();
					}
					FileUtils.copyFile(Image, savefile);
					houseSellEnterprise.setPics(savefile.getPath());	
				}
		    }catch(Exception e){
		    	System.out.println("error pic");
		    	e.printStackTrace();
		    }
			houseSellEnterprise.getRegion().setRegionId(regionService.getRegionId(houseSellEnterprise.getRegion().getProvince(),houseSellEnterprise.getRegion().getCity(), houseSellEnterprise.getRegion().getCounty()));
		    HouseType houseType = new HouseType();
		    houseType.setHtypeId(1);
		    houseType.setName("1��1��");
			houseSellEnterprise.setHouseType(houseType);
		    for(int i=1;i<mainTypeArray.length;i++)
		    	mainTypeArray[0]+=mainTypeArray[i]+";";
		    houseSellEnterprise.setMainType(mainTypeArray[0]);
		    for(int i=1;i<sizeArray.length;i++)
		    	sizeArray[0]+=sizeArray[i]+";";
		    houseSellEnterprise.setSize(sizeArray[0]);
		    for(int i=1;i<priceArray.length;i++)
		    	priceArray[0]+=priceArray[i]+";";
		    houseSellEnterprise.setPrice(priceArray[0]);
		    for(int i=1;i<downpaymentArray.length;i++)
		    	downpaymentArray[0]+=downpaymentArray[i]+";";
		    houseSellEnterprise.setDownpayment(downpaymentArray[0]);
		    houseSellEnterprise.setEnterpriseUsers(enterusers);
		    houseSellEnterprise.setOpeningDate(year+"-"+month+"-"+day);
		    houseSellEnterprise.setFinishDate(liveinyear+"-"+liveinmonth+"-"+liveinday);
		    houseSellEnterprise.setHauthenticity(0);
		    houseSellEnterprise.setAddress(houseSellRent.getRegion().getProvince()+houseSellRent.getRegion().getCity()+houseSellRent.getRegion().getCounty());
			 return houseSellEnterpriseService.save(houseSellEnterprise);
		} 
	}
	
	public String postNewBuy(){
		session = ServletActionContext.getRequest().getSession();
		Users users = (Users)session.getAttribute("users");
		if(users!=null){
			houseBuyRequest.getRegion().setRegionId(regionService.getRegionId(houseBuyRequest.getRegion().getProvince(),houseBuyRequest.getRegion().getCity(), houseBuyRequest.getRegion().getCounty()));
		    houseBuyRequest.getHouseType().setHtypeId(houseTypeService.getHTypeId(houseBuyRequest.getHouseType().getName()));
		    houseBuyRequest.setUId(users.getUId());
		    houseBuyRequest.setHavailability(1);
		    houseBuyRequest.setHauthenticity(1);
            houseBuyRequest.setHdate(getYear()+"-"+getMonth()+"-"+getDay());//买家发布的信息应该没有这个属�?		    houseBuyRequest.setAddress(houseBuyRequest.getRegion().getProvince()+houseBuyRequest.getRegion().getCity()+houseBuyRequest.getRegion().getCounty());
			return  houseBuyRequestService.save(houseBuyRequest);
		} else {
			return "unlog";
		}
	}
	
	public String postNewBuyRent(){
		session = ServletActionContext.getRequest().getSession();
		Users users = (Users)session.getAttribute("users");
		if(users!=null){
			houseBuyRent.getRegion().setRegionId(regionService.getRegionId(houseBuyRent.getRegion().getProvince(),houseBuyRent.getRegion().getCity(), houseBuyRent.getRegion().getCounty()));
		    houseBuyRent.getHouseType().setHtypeId(houseTypeService.getHTypeId(houseBuyRent.getHouseType().getName()));
		    houseBuyRent.setUId(users.getUId());
		    houseBuyRent.setHavailability(1);
		    houseBuyRent.setHauthenticity(1);
	        houseBuyRent.setHDate(getYear()+"-"+getMonth()+"-"+getDay());//买家发布的信息应该没有这个属�?	        houseBuyRent.setAddress(houseBuyRent.getRegion().getProvince()+houseBuyRent.getRegion().getCity()+houseBuyRent.getRegion().getCounty());
			  return  houseBuyRentService.save(houseBuyRent);
		} else {
			return "unlog";
		}
	}
	
	
	
	public void closeLayer(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		  PrintWriter out = response.getWriter();
		  out.write("<script type='text/javascript' charset='UTF-8' >alert('send success!');parent.location.reload();</script>");
		}catch(Exception e){
		   e.printStackTrace();
	   }
	}

	public void closeLayerandRequest(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		  PrintWriter out = response.getWriter();
		  out.write("<script type='text/javascript' charset='UTF-8' >alert('send success!');var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); </script>");
		  getBuyRequestInfo();
		  out.write("<script type='text/javascript'>parent.location.reload();</script>");
		}catch(Exception e){
		   e.printStackTrace();
	   }
	}

	public void closeLayerandRent(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		  PrintWriter out = response.getWriter();
		  out.write("<script type='text/javascript' charset='UTF-8' >alert('send success!');var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); </script>");
		  getBuyRentInfo();
		  out.write("<script type='text/javascript'>parent.location.reload();</script>");
		}catch(Exception e){
		   e.printStackTrace();
	   }
	}

	public void promptError(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
		  PrintWriter out = response.getWriter();
		  out.write("<script type='text/javascript' charset='UTF-8' >alert('send error!');var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index); </script>");
		  out.write("<script type='text/javascript'>parent.location.reload();</script>");
		}catch(Exception e){
		   e.printStackTrace();
	   }
	}
	
}





