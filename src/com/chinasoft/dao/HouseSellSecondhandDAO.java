package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.HouseSellSecondhand;

/**
 * A data access object (DAO) providing persistence and search support for
 * HouseSellSecondhand entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.HouseSellSecondhand
 * @author MyEclipse Persistence Tools
 */
public class HouseSellSecondhandDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(HouseSellSecondhandDAO.class);
	// property constants
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

	public void save(HouseSellSecondhand transientInstance) {
		log.debug("saving HouseSellSecondhand instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HouseSellSecondhand persistentInstance) {
		log.debug("deleting HouseSellSecondhand instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HouseSellSecondhand findById(java.lang.Integer id) {
		log.debug("getting HouseSellSecondhand instance with id: " + id);
		try {
			HouseSellSecondhand instance = (HouseSellSecondhand) getHibernateTemplate()
					.get("com.chinasoft.pojo.HouseSellSecondhand", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HouseSellSecondhand instance) {
		log.debug("finding HouseSellSecondhand instance by example");
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
		log.debug("finding HouseSellSecondhand instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from HouseSellSecondhand as model where model."
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
		log.debug("finding all HouseSellSecondhand instances");
		try {
			String queryString = "from HouseSellSecondhand";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HouseSellSecondhand merge(HouseSellSecondhand detachedInstance) {
		log.debug("merging HouseSellSecondhand instance");
		try {
			HouseSellSecondhand result = (HouseSellSecondhand) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HouseSellSecondhand instance) {
		log.debug("attaching dirty HouseSellSecondhand instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HouseSellSecondhand instance) {
		log.debug("attaching clean HouseSellSecondhand instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HouseSellSecondhandDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (HouseSellSecondhandDAO) ctx.getBean("HouseSellSecondhandDAO");
	}
}