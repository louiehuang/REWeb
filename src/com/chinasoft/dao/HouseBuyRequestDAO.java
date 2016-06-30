package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.HouseBuyRequest;

/**
 * A data access object (DAO) providing persistence and search support for
 * HouseBuyRequest entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.HouseBuyRequest
 * @author MyEclipse Persistence Tools
 */
public class HouseBuyRequestDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(HouseBuyRequestDAO.class);
	// property constants
	public static final String _UID = "UId";
	public static final String TITLE = "title";
	public static final String HDATE = "hdate";
	public static final String PIRCE = "pirce";
	public static final String SIZE = "size";
	public static final String HOUSE_FLOOR = "houseFloor";
	public static final String DECORATION = "decoration";
	public static final String ORIENTATION = "orientation";
	public static final String REMARK = "remark";
	public static final String HAVAILABILITY = "havailability";
	public static final String HAUTHENTICITY = "hauthenticity";

	protected void initDao() {
		// do nothing
	}

	public void save(HouseBuyRequest transientInstance) {
		log.debug("saving HouseBuyRequest instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HouseBuyRequest persistentInstance) {
		log.debug("deleting HouseBuyRequest instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HouseBuyRequest findById(java.lang.Integer id) {
		log.debug("getting HouseBuyRequest instance with id: " + id);
		try {
			HouseBuyRequest instance = (HouseBuyRequest) getHibernateTemplate()
					.get("com.chinasoft.pojo.HouseBuyRequest", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HouseBuyRequest instance) {
		log.debug("finding HouseBuyRequest instance by example");
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
		log.debug("finding HouseBuyRequest instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from HouseBuyRequest as model where model."
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

	public List findByHdate(Object hdate) {
		return findByProperty(HDATE, hdate);
	}

	public List findByPirce(Object pirce) {
		return findByProperty(PIRCE, pirce);
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
		log.debug("finding all HouseBuyRequest instances");
		try {
			String queryString = "from HouseBuyRequest";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HouseBuyRequest merge(HouseBuyRequest detachedInstance) {
		log.debug("merging HouseBuyRequest instance");
		try {
			HouseBuyRequest result = (HouseBuyRequest) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HouseBuyRequest instance) {
		log.debug("attaching dirty HouseBuyRequest instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HouseBuyRequest instance) {
		log.debug("attaching clean HouseBuyRequest instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HouseBuyRequestDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (HouseBuyRequestDAO) ctx.getBean("HouseBuyRequestDAO");
	}
}