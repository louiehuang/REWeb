package com.chinasoft.action;


import java.util.List;

import com.chinasoft.pojo.Collect;
import com.chinasoft.service.CollectService;

public class CollectAction {
	private CollectService collectService;

	private List<Collect>list;
	
	public CollectService getCollectService() {
		return collectService;
	}

	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}
	
	public List<Collect> getList() {
		return list;
	}

	public void setList(List<Collect> list) {
		this.list = list;
	}
	
}
