package com.chinasoft.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chinasoft.action.HouseSellEnterpriseAction;
import com.chinasoft.action.HouseSellRentAction;
import com.chinasoft.action.IndexAction;
import com.chinasoft.action.JsonAction;
import com.chinasoft.dao.UsersDAO;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseType;
import com.chinasoft.pojo.Users;

//JUnit��
public class test {

	@Test
	public void test() {
		// fail("Not yet implemented");

		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		UsersDAO userDao = (UsersDAO) context.getBean("UsersDao");

		// JUnit����
		// //������ҳ������Ϣ���
		System.out.println("����");

		String listStr = "{\"�û�ID\":\"1\",\"�û��˺�\":\"test\"}]";


		// IndexAction action = (IndexAction) context.getBean("IndexAction");
		// List<HouseSellRent> list = action.Test2();
		// for(int i = 0; i < list.size(); i++)
		// {
		// HouseSellRent temp = list.get(i); //������Ϣ
		//
		// HouseType houseType = temp.getHouseType(); //��������
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
		// HouseSellEnterprise temp = list2.get(i); //�·���Ϣ
		//
		// System.out.print(temp.getTitle() + " ");
		// System.out.println(temp.getRegion().getCounty());
		// }

	}

}
