package com.chinasoft.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chinasoft.pojo.Advertisement;
import com.chinasoft.pojo.Users;
import com.chinasoft.pojo.Verification;

public class PageMan {

	
	/**
	 * 验证查询列表分页
	 * @param list
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	static public Map<String, Object> cutVeriPage(List<Verification> list, int pageIndex, int pageSize) {		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Verification> newList = new ArrayList<Verification>();
		int pageCount = 1;

		if (list != null) {
			if (list.size() % pageSize == 0) {
				pageCount = list.size() / pageSize;
			} else {
				pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}


		dataMap.put("newList", newList);
		dataMap.put("pageCount", pageCount);
		
		return dataMap;
	}
	
	

	/**
	 * 用户查询列表分页
	 * @param list
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	static public Map<String, Object> cutUserPage(List<Users> list, int pageIndex, int pageSize) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Users> newList = new ArrayList<Users>();
		int pageCount = 1;
		
		if (list != null) {
			if (list.size() % pageSize == 0) {
				pageCount = list.size() / pageSize;
			} else {
				pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}

		dataMap.put("newList", newList);
		dataMap.put("pageCount", pageCount);

		return dataMap;
	}
	
	
	/**
	 * 房屋查询列表分页，3种房屋分页
	 * @param list
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	static public Map<String, Object> cutHousePage(List list, int pageIndex, int pageSize) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List newList = new ArrayList();
		int pageCount = 1;
		

		if (list != null) {
			if (list.size() % pageSize == 0) {
				pageCount = list.size() / pageSize;
			} else {
				pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}

		dataMap.put("newList", newList);
		dataMap.put("pageCount", pageCount);

		return dataMap;
	}
	
	
	
	/**
	 * 广告查询列表分页
	 * @param list 分页前列表
	 * @param pageIndex 分页开始页数
	 * @param pageSize 分页大小
	 * @return HashMap<String, Object>(), 包括:<br/>
	 * 分页后从pageIndex开始的当前页列表newList<br/>
	 * 分页总数目pageCount
	 */
	static public Map<String, Object> cutAdPage(List<Advertisement> list, int pageIndex, int pageSize) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<Advertisement> newList = new ArrayList<Advertisement>();
		int pageCount = 1;

		if (list != null) {
			if (list.size() % pageSize == 0) {
				pageCount = list.size() / pageSize;
			} else {
				pageCount = list.size() / pageSize + 1;
			}

			int start = (pageIndex - 1) * pageSize;
			int end = pageIndex * pageSize;
			if (end > list.size()) {
				end = list.size();
			}

			for (int i = start; i < end; i++) {
				newList.add(list.get(i));
			}
		}

		dataMap.put("newList", newList);
		dataMap.put("pageCount", pageCount);

		return dataMap;
	}

}
