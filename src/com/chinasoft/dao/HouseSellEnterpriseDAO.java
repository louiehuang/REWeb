package com.chinasoft.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;

/**
 * A data access object (DAO) providing persistence and search support for
 * HouseSellEnterprise entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.HouseSellEnterprise
 * @author MyEclipse Persistence Tools
 */
public class HouseSellEnterpriseDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(HouseSellEnterpriseDAO.class);
	public static Session session;
	
	// property constants
	public static final String TITLE = "title";
	public static final String PICS = "pics";
	public static final String TOTAL_NUM = "totalNum";
	public static final String SELLED_NUM = "selledNum";
	public static final String ADDR = "addr";
	public static final String OPENING_DATE = "openingDate";
	public static final String FINISH_DATE = "finishDate";
	public static final String PRICE = "price";
	public static final String DOWNPAYMENT = "downpayment";
	public static final String MAIN_TYPE = "mainType";
	public static final String SIZE = "size";
	public static final String BUILDING_NAME = "buildingName";
	public static final String DEVELOPER_NAME = "developerName";
	public static final String PLANNING_NUM = "planningNum";
	public static final String PARKING_NUM = "parkingNum";
	public static final String MANA_FEE = "manaFee";
	public static final String PROPERTY_NAME = "propertyName";
	public static final String GREENING_RATE = "greeningRate";
	public static final String BUILTUP_AREA = "builtupArea";
	public static final String LANG_AREA = "langArea";
	public static final String HAUTHENTICITY = "hauthenticity";
	public static final String REMARK = "remark";

	protected void initDao() {
		// do nothing
	}

	public void save(HouseSellEnterprise transientInstance) {
		log.debug("saving HouseSellEnterprise instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HouseSellEnterprise persistentInstance) {
		log.debug("deleting HouseSellEnterprise instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	
//	//	获取企业新房表
//	@SuppressWarnings("unchecked")
//	public List<HouseSellEnterprise> getSellNewInfo(){
//		session = this.getSession();
//		Query query = session.createQuery("from HouseSellEnterprise");
//		//query.setFirstResult(0); 
//		//query.setMaxResults(num);
//		List<HouseSellEnterprise> list = query.list();
//		//session.close();
//		return list;
//	}
	

	public HouseSellEnterprise findById(java.lang.Integer id) {
		log.debug("getting HouseSellEnterprise instance with id: " + id);
		try {
			HouseSellEnterprise instance = (HouseSellEnterprise) getHibernateTemplate()
					.get("com.chinasoft.pojo.HouseSellEnterprise", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HouseSellEnterprise instance) {
		log.debug("finding HouseSellEnterprise instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding HouseSellEnterprise instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from HouseSellEnterprise as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByPics(Object pics) {
		return findByProperty(PICS, pics);
	}

	public List findByTotalNum(Object totalNum) {
		return findByProperty(TOTAL_NUM, totalNum);
	}

	public List findBySelledNum(Object selledNum) {
		return findByProperty(SELLED_NUM, selledNum);
	}

	public List findByAddr(Object addr) {
		return findByProperty(ADDR, addr);
	}

	public List findByOpeningDate(Object openingDate) {
		return findByProperty(OPENING_DATE, openingDate);
	}

	public List findByFinishDate(Object finishDate) {
		return findByProperty(FINISH_DATE, finishDate);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByDownpayment(Object downpayment) {
		return findByProperty(DOWNPAYMENT, downpayment);
	}

	public List findByMainType(Object mainType) {
		return findByProperty(MAIN_TYPE, mainType);
	}

	public List findBySize(Object size) {
		return findByProperty(SIZE, size);
	}

	public List findByBuildingName(Object buildingName) {
		return findByProperty(BUILDING_NAME, buildingName);
	}

	public List findByDeveloperName(Object developerName) {
		return findByProperty(DEVELOPER_NAME, developerName);
	}

	public List findByPlanningNum(Object planningNum) {
		return findByProperty(PLANNING_NUM, planningNum);
	}

	public List findByParkingNum(Object parkingNum) {
		return findByProperty(PARKING_NUM, parkingNum);
	}

	public List findByManaFee(Object manaFee) {
		return findByProperty(MANA_FEE, manaFee);
	}

	public List findByPropertyName(Object propertyName) {
		return findByProperty(PROPERTY_NAME, propertyName);
	}

	public List findByGreeningRate(Object greeningRate) {
		return findByProperty(GREENING_RATE, greeningRate);
	}

	public List findByBuiltupArea(Object builtupArea) {
		return findByProperty(BUILTUP_AREA, builtupArea);
	}

	public List findByLangArea(Object langArea) {
		return findByProperty(LANG_AREA, langArea);
	}

	public List findByHauthenticity(Object hauthenticity) {
		return findByProperty(HAUTHENTICITY, hauthenticity);
	}

	public List findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all HouseSellEnterprise instances");
		try {
			String queryString = "from HouseSellEnterprise";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HouseSellEnterprise merge(HouseSellEnterprise detachedInstance) {
		log.debug("merging HouseSellEnterprise instance");
		try {
			HouseSellEnterprise result = (HouseSellEnterprise) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HouseSellEnterprise instance) {
		log.debug("attaching dirty HouseSellEnterprise instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HouseSellEnterprise instance) {
		log.debug("attaching clean HouseSellEnterprise instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HouseSellEnterpriseDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (HouseSellEnterpriseDAO) ctx.getBean("HouseSellEnterpriseDAO");
	}
	
 public  List<HouseSellEnterprise> getOptions(double[] price,int[] size,String Addr,String type){
		 
		 //最先进行type匹配
		 //比较面积以后
		 List<HouseSellEnterprise> listP =new ArrayList<HouseSellEnterprise>();	
		 //都比较以后
		List<HouseSellEnterprise> reList = new ArrayList<HouseSellEnterprise>();	
		 //比较Type和地址以后
		 List<HouseSellEnterprise> list = new ArrayList<HouseSellEnterprise>();
		 //只知道Addr得时候
		 List <HouseSellEnterprise> listT = new ArrayList<HouseSellEnterprise>();
		 String  queryString = "from HouseSellEnterprise as model where address = '" + Addr+"'";
			listT = getHibernateTemplate().find(queryString);
		 //若有匹配的Type进行比较面积
			int ps_2=0;
			for(int q = 0 ; q<listT.size();q++){
				String getType = listT.get(q).getMainType();
				String[] getType_1 = getType.split(";");
				for(int s=0;s<getType_1.length;s++){
					if(type.equals(getType_1[s])){
						ps_2+=1;
						list.add(ps_2, listT.get(q));
					}
				}
			}
		 
			//添加到已经匹配完type,size,addr后追加到getP的动态变量
				int ps=0;	
				for(int j = 0 ; j< list.size() ; j++){
					String a =list.get(j).getSize();
					int flag = 0;
					//size切分
					String[] b=a.split(";");
					//	查询是否期中有个值是在区域里面  面积
					for(int t=0;t<b.length;t++){
						if((Integer.parseInt( b[t]) <= size[1]) && (Integer.parseInt(b[t]) >= size[0])){
							flag=1;
						}else{
								flag=0;
							}
						if(flag == 1){
						 ps+=1;
						 listP.add(ps, list.get(j));;
					 }
				 } 
			 }
				//比较type Addr size以后比较价格
				int ps_1=0;
				// 有了面积以后  比较价格是否在这个区域
				for(int i = 0 ; i< listP.size() ; i++){
				 String a_1;
				 int flag_1 = 0;
				 a_1 = listP.get(i).getPrice();
				 String[] b_1=a_1.split(";");
				
				 //查询是否期中有个值是在区域里面  价格
				 for(int t=0;t<b_1.length;t++){
					 if((Double.parseDouble(b_1[t])<= price[1]) && (Double.parseDouble(b_1[t]) >= price[0])){
						 flag_1=1;
					 }else{
						 flag_1=0;
					 }
					 if(flag_1 == 1){
						 ps+=1;
						 reList.add(ps_1, listP.get(i));
					 }
				 } 
			 }
				return reList;
		}
		 	 

	//重写方法2
	public List<HouseSellEnterprise> arrayPrice(HouseSellEnterprise hse){
		
		log.debug("finding all HouseSellEnterprise instances order by ");
		try {
			String queryString = "from HouseSellEnterprise order by Price ASC";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	
}

	//重写方法3
	public List<HouseSellEnterprise> arraySize(HouseSellEnterprise hse){
		
		log.debug("finding all HouseSellEnterprise instances order by ");
		try {
			String queryString = "from HouseSellEnterprise order by Size DESC";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
     }
	
}