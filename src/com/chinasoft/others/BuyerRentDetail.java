package com.chinasoft.others;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.dao.HouseBuyRentDAO;
import com.chinasoft.dao.HouseBuyRentDAO;
import com.chinasoft.pojo.HouseBuyRent;
import com.chinasoft.pojo.HouseBuyRent;
import com.chinasoft.pojo.HouseBuyRent;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseBuyRentService;
import com.chinasoft.service.UsersService;

public class BuyerRentDetail {
  private Users users;
  private HouseBuyRent houseBuyRent;
  public BuyerRentDetail(Users users,HouseBuyRent houseBuyRent){
	  this.users = users;
	  this.houseBuyRent = houseBuyRent;
  }
public Users getUsers() {
	return users;
}
public void setUser(Users users) {
	this.users = users;
}
public HouseBuyRent getHouseBuyRent() {
	return houseBuyRent;
}
public void setHouseBuyRent(HouseBuyRent houseBuyRent) {
	this.houseBuyRent = houseBuyRent;
   }

public static List<BuyerRentDetail> findAll(double Pirce[],int Size[],int HouseFloor,String Addr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRentDAO houseBuyRentDAO = (HouseBuyRentDAO) applicationContext.getBean("HouseBuyRentDAO");
      ArrayList<BuyerRentDetail> list = new ArrayList<BuyerRentDetail>();
	   List<HouseBuyRent>houselist = houseBuyRentDAO.getOptions(Pirce,Size,HouseFloor,Addr);
     for(int i=0;i<houselist.size();i++){
       	Users users = usersService.findById(houselist.get(i).getUId());
     	BuyerRentDetail buyerDetail = new BuyerRentDetail(users,houselist.get(i));
     	list.add(buyerDetail);
     }
	   return list;
}

public static List<BuyerRentDetail> arraySize(HouseBuyRent hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRentDAO houseBuyRequestDAO = (HouseBuyRentDAO) applicationContext.getBean("HouseBuyRentDAO");
ArrayList<BuyerRentDetail> list = new ArrayList<BuyerRentDetail>();
	   List<HouseBuyRent>houselist = houseBuyRequestDAO.arraySize(hsr);
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerRentDetail buyerDetail = new BuyerRentDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}

public static List<BuyerRentDetail> findAll(){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRentDAO houseBuyRequestDAO = (HouseBuyRentDAO) applicationContext.getBean("HouseBuyRentDAO");
ArrayList<BuyerRentDetail> list = new ArrayList<BuyerRentDetail>();
	   List<HouseBuyRent>houselist = houseBuyRequestDAO.findAll();
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerRentDetail buyerDetail = new BuyerRentDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}


public static List<BuyerRentDetail> arrayPirce(HouseBuyRent hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRentDAO houseBuyRequestDAO = (HouseBuyRentDAO) applicationContext.getBean("HouseBuyRentDAO");
ArrayList<BuyerRentDetail> list = new ArrayList<BuyerRentDetail>();
	   List<HouseBuyRent>houselist = houseBuyRequestDAO.arrayFloor(hsr);
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerRentDetail buyerDetail = new BuyerRentDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}


public static List<BuyerRentDetail> arrayFloor(HouseBuyRent hsr){
	   ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml"); 
	   UsersService usersService = (UsersService) applicationContext.getBean("UsersService");
	   HouseBuyRentDAO houseBuyRequestDAO = (HouseBuyRentDAO) applicationContext.getBean("HouseBuyRentDAO");
ArrayList<BuyerRentDetail> list = new ArrayList<BuyerRentDetail>();
	   List<HouseBuyRent>houselist = houseBuyRequestDAO.arrayFloor(hsr);
for(int i=0;i<houselist.size();i++){
	Users users = usersService.findById(houselist.get(i).getUId());
	BuyerRentDetail buyerDetail = new BuyerRentDetail(users,houselist.get(i));
	list.add(buyerDetail);
}
	   return list;
}

}
