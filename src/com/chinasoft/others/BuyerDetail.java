package com.chinasoft.others;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.dao.HouseBuyRequestDAO;
import com.chinasoft.pojo.HouseBuyRequest;
import com.chinasoft.pojo.HouseBuyRequest;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseBuyRequestService;
import com.chinasoft.service.UsersService;

public class BuyerDetail {
  private Users users;
  private HouseBuyRequest houseBuyRequest;
  public BuyerDetail(Users users,HouseBuyRequest houseBuyRequest){
	  this.users = users;
	  this.houseBuyRequest = houseBuyRequest;
  }
public Users getUsers() {
	return users;
}
public void setUser(Users users) {
	this.users = users;
}
public HouseBuyRequest getHouseBuyRequest() {
	return houseBuyRequest;
}
public void setHouseBuyRequest(HouseBuyRequest houseBuyRequest) {
	this.houseBuyRequest = houseBuyRequest;
   }

public static List<BuyerDetail> findAll(double Pirce[],int Size[],int HouseFloor,String Addr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRequestDAO houseBuyRequestDAO = (HouseBuyRequestDAO) applicationContext.getBean("HouseBuyRequestDAO");
      ArrayList<BuyerDetail> list = new ArrayList<BuyerDetail>();
	   List<HouseBuyRequest>houselist = houseBuyRequestDAO.getOptions(Pirce,Size,HouseFloor,Addr);
     for(int i=0;i<houselist.size();i++){
       	Users users = usersService.findById(houselist.get(i).getUId());
     	BuyerDetail buyerDetail = new BuyerDetail(users,houselist.get(i));
     	list.add(buyerDetail);
     }
	   return list;
}

public static List<BuyerDetail> arrayPirce(HouseBuyRequest hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRequestDAO houseBuyRequestDAO = (HouseBuyRequestDAO) applicationContext.getBean("HouseBuyRequestDAO");
   ArrayList<BuyerDetail> list = new ArrayList<BuyerDetail>();
	   List<HouseBuyRequest>houselist = houseBuyRequestDAO.arrayPirce(hsr);
  for(int i=0;i<houselist.size();i++){
    	Users users = usersService.findById(houselist.get(i).getUId());
  	BuyerDetail buyerDetail = new BuyerDetail(users,houselist.get(i));
  	list.add(buyerDetail);
  }
	   return list;
}

public static List<BuyerDetail> arraySize(HouseBuyRequest hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRequestDAO houseBuyRequestDAO = (HouseBuyRequestDAO) applicationContext.getBean("HouseBuyRequestDAO");
ArrayList<BuyerDetail> list = new ArrayList<BuyerDetail>();
	   List<HouseBuyRequest>houselist = houseBuyRequestDAO.arraySize(hsr);
for(int i=0;i<houselist.size();i++){
 	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerDetail buyerDetail = new BuyerDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}

public static List<BuyerDetail> findAll(){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRequestDAO houseBuyRequestDAO = (HouseBuyRequestDAO) applicationContext.getBean("HouseBuyRequestDAO");
ArrayList<BuyerDetail> list = new ArrayList<BuyerDetail>();
	   List<HouseBuyRequest>houselist = houseBuyRequestDAO.findAll();
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerDetail buyerDetail = new BuyerDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}


public static List<BuyerDetail> arrayFloor(HouseBuyRequest hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRequestDAO houseBuyRequestDAO = (HouseBuyRequestDAO) applicationContext.getBean("HouseBuyRequestDAO");
ArrayList<BuyerDetail> list = new ArrayList<BuyerDetail>();
	   List<HouseBuyRequest>houselist = houseBuyRequestDAO.arrayFloor(hsr);
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerDetail buyerDetail = new BuyerDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}

}
