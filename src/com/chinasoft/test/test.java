package com.chinasoft.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.catalina.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.action.HouseSellEnterpriseAction;
import com.chinasoft.action.HouseSellRentAction;
import com.chinasoft.action.IndexAction;
import com.chinasoft.action.JsonAction;
import com.chinasoft.dao.CollectDAO;
import com.chinasoft.dao.UsersDAO;
import com.chinasoft.pojo.Collect;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseType;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.HouseSellRentService;

//JUnit类
public class test {

	@Test
	public void test() {

		// JUnit测试
		System.out.println("测试");

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

//		UsersDAO userDao = (UsersDAO) context.getBean("UsersDAO");
//		CollectDAO collectDao = (CollectDAO) context.getBean("CollectDAO");
//		
//
//		/*级联删除*/
//		try {
//			Users user = userDao.findById(11);
//			System.out.print(user.getUAccount());
//			userDao.delete(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		

		HouseSellRentService houseSellRentService = (HouseSellRentService) context.getBean("HouseSellRentService");
		try{
			List<HouseSellRent> list = houseSellRentService.findAll();
			for(int i = 0; i < list.size(); i++){
				System.out.print(list.get(i).getHId() + ", " + 
				list.get(i).getRegion().getCity() + list.get(i).getRegion().getCounty() 
				+ list.get(i).getHouseType().getName());
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		

		// IndexAction action = (IndexAction) context.getBean("IndexAction");
		// List<HouseSellRent> list = action.Test2();
		// for(int i = 0; i < list.size(); i++)
		// {
		// HouseSellRent temp = list.get(i); //出租信息
		//
		// HouseType houseType = temp.getHouseType(); //房屋类型
		//
		// System.out.print(houseType.getHtypeId() + "	");
		// System.out.println(houseType.getName());
		// }

		// JsonAction action = (JsonAction) context.getBean("JsonAction");
		// Map<String, Object> dataMap = action.json_Test();
		// List<Users> list = new ArrayList<Users>();
		// list = (List<Users>) dataMap.get("list");
		// for(int i = 0; i < list.size(); i++){
		// System.out.println(list.get(i).getUAccount());
		// }
		//
		// System.out.println(dataMap);

		// List<HouseSellEnterprise> list2 = action.Test1();
		// for(int i = 0; i < list2.size(); i++)
		// {
		// HouseSellEnterprise temp = list2.get(i); //新房信息
		//
		// System.out.print(temp.getTitle() + " ");
		// System.out.println(temp.getRegion().getCounty());
		// }

	}

}
