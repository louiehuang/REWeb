package com.chinasoft.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.action.HouseSellEnterpriseAction;
import com.chinasoft.action.HouseSellRentAction;
import com.chinasoft.action.IndexAction;
import com.chinasoft.action.JsonAction;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseType;
import com.chinasoft.pojo.Users;


//JUnit类
public class test {

	@Test
	public void test() {
		//fail("Not yet implemented");
		
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		
		//JUnit测试
//		//测试首页出租信息输出
		System.out.println("测试");
		
		
		
		
		
		
		
		
//		IndexAction action = (IndexAction) context.getBean("IndexAction");
//		List<HouseSellRent> list = action.Test2();			
//		for(int i = 0; i < list.size(); i++)
//		{
//			HouseSellRent temp = list.get(i); //出租信息
//			
//			HouseType houseType = temp.getHouseType(); //房屋类型
//			
//			System.out.print(houseType.getHtypeId() + "	");
//			System.out.println(houseType.getName());	
//		}
		

//		JsonAction action = (JsonAction) context.getBean("JsonAction");
//		Map<String, Object> dataMap = action.json_Test();
//		List<Users> list = new ArrayList<Users>();
//		list = (List<Users>) dataMap.get("list");
//		for(int i = 0; i < list.size(); i++){
//			System.out.println(list.get(i).getUAccount());
//		}
//		
//		System.out.println(dataMap);

		
		
//		List<HouseSellEnterprise> list2 = action.Test1();	
//		for(int i = 0; i < list2.size(); i++)
//		{
//			HouseSellEnterprise temp = list2.get(i); //新房信息
//			
//			System.out.print(temp.getTitle() + " ");
//			System.out.println(temp.getRegion().getCounty());	
//		}
		
		
	}

}
