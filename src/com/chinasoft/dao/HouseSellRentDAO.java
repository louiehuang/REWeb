package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.HouseSellRent;

/**
 * A data access object (DAO) providing persistence and search support for
 * HouseSellRent entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.HouseSellRent
 * @author MyEclipse Persistence Tools
 */
public class HouseSellRentDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(HouseSellRentDAO.class);
	// property constants
	public static Session session;
	
	public static final String _UID = "UId";
	public static final String TITLE = "title";
	public static final String PICS = "pics";
	public static final String PRICE = "price";
	public static final String SIZE = "size";
	public static final String HOUSE_FLOOR = "houseFloor";
	public static final String DECORATION = "decoration";
	public static final String ORIENTATION = "orientation";
	public static final String COMMUNITY = "community";
	public static final String REMARK = "remark";
	public static final String HAVAILABILITY = "havailability";
	public static final String HAUTHENTICITY = "hauthenticity";

	protected void initDao() {
		// do nothing
	}

	public void save(HouseSellRent transientInstance) {
		log.debug("saving HouseSellRent instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HouseSellRent persistentInstance) {
		log.debug("deleting HouseSellRent instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	//	获取出租表前4条信息
	@SuppressWarnings("unchecked")
	public List<HouseSellRent> getRentInfo(){
		//System.out.println("query");
		session = this.getSession();
		Query query = session.createQuery("from HouseSellRent");
		//query.setFirstResult(0); 
		//query.setMaxResults(num);
		List<HouseSellRent> list = query.list();
		
		//session.close();
		
		return list;
	}

	public HouseSellRent findById(java.lang.Integer id) {
		log.debug("getting HouseSellRent instance with id: " + id);
		try {
			HouseSellRent instance = (HouseSellRent) getHibernateTemplate()
					.get("com.chinasoft.pojo.HouseSellRent", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HouseSellRent instance) {
		log.debug("finding HouseSellRent instance by example");
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
		log.debug("finding HouseSellRent instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from HouseSellRent as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUId(Object UId) {
		return findByProperty(_UID, UId);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByPics(Object pics) {
		return findByProperty(PICS, pics);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findBySize(Object size) {
		return findByProperty(SIZE, size);
	}

	public List findByHouseFloor(Object houseFloor) {
		return findByProperty(HOUSE_FLOOR, houseFloor);
	}

	public List findByDecoration(Object decoration) {
		return findByProperty(DECORATION, decoration);
	}

	public List findByOrientation(Object orientation) {
		return findByProperty(ORIENTATION, orientation);
	}

	public List findByCommunity(Object community) {
		return findByProperty(COMMUNITY, community);
	}

	public List findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findByHavailability(Object havailability) {
		return findByProperty(HAVAILABILITY, havailability);
	}

	public List findByHauthenticity(Object hauthenticity) {
		return findByProperty(HAUTHENTICITY, hauthenticity);
	}

	public List findAll() {
		log.debug("finding all HouseSellRent instances");
		try {
			String queryString = "from HouseSellRent";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HouseSellRent merge(HouseSellRent detachedInstance) {
		log.debug("merging HouseSellRent instance");
		try {
			HouseSellRent result = (HouseSellRent) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HouseSellRent instance) {
		log.debug("attaching dirty HouseSellRent instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HouseSellRent instance) {
		log.debug("attaching clean HouseSellRent instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HouseSellRentDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (HouseSellRentDAO) ctx.getBean("HouseSellRentDAO");
	}
}