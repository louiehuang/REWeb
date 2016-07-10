package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.HouseSellEnterpriseDAO;
import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseSellEnterprise;

/**
 * 出售企业新房Service
 * 
 * @author hlyin
 * 
 */
public class HouseSellEnterpriseService {
	private HouseSellEnterpriseDAO houseSellEnterpriseDAO;

	public HouseSellEnterpriseDAO getHouseSellEnterpriseDAO() {
		return houseSellEnterpriseDAO;
	}

	public void setHouseSellEnterpriseDAO(
			HouseSellEnterpriseDAO houseSellEnterpriseDAO) {
		this.houseSellEnterpriseDAO = houseSellEnterpriseDAO;
	}

	/**
	 * 获取企业新房的首页显示信息，4条
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<HouseSellEnterprise> getSellNewInfo() {
		return houseSellEnterpriseDAO.findAll().subList(0, 4);
	}
	
	@SuppressWarnings("unchecked")
	public List<HouseSellEnterprise> findAll() {
		return houseSellEnterpriseDAO.findAll();
	}
	
	public HouseSellEnterprise findById(Integer id){
		return houseSellEnterpriseDAO.findById(id);
	}
	
	/**
	 * 鑫神代码
	 * @param HId
	 * @return
	 */
	public HouseSellEnterprise getById(Integer HId)
	{
		return houseSellEnterpriseDAO.findById(HId);
	}
	
	public void delete(HouseSellEnterprise house){
		houseSellEnterpriseDAO.delete(house);
	}
	
	
	
	/*雯神代码开始*/
	/**
	 * 根据收藏表中的HId和CType找到收藏的企业新房
	 * @param id
	 * @return
	 */
	public HouseSellEnterprise getCollectInfo(java.lang.Integer id){
		return houseSellEnterpriseDAO.findById(id);
	}
	
	//根据用户企业用户id查出企业用户所发布的新楼盘
	public List<HouseSellEnterprise> getInfo(EnterpriseUsers enterpriseUsers){
		List<HouseSellEnterprise> list = houseSellEnterpriseDAO.findByProperty("enterpriseUsers.UId", enterpriseUsers.getUId());
		return list;
	}

	//根据新房id查找新房信息
	public HouseSellEnterprise getHouseSellEnterpriseInfo(int HId){
		return houseSellEnterpriseDAO.findById(HId);
	}
	
	//删除企业用户发布的某个楼盘
	public void deleteHouseSellEnterprise(int HId){
		HouseSellEnterprise ans = new HouseSellEnterprise();
		ans = houseSellEnterpriseDAO.findById(HId);
		houseSellEnterpriseDAO.delete(ans);
	}
	/*雯神代码结束*/
	
	
	

}
