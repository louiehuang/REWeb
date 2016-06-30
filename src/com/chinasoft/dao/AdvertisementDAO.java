package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Advertisement;

/**
 * A data access object (DAO) providing persistence and search support for
 * Advertisement entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.Advertisement
 * @author MyEclipse Persistence Tools
 */
public class AdvertisementDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(AdvertisementDAO.class);
	// property constants
	public static final String _UID = "UId";
	public static final String _UTYPE = "UType";
	public static final String AD_CONTENT = "adContent";
	public static final String AD_COST = "adCost";
	public static final String AD_DATE = "adDate";

	protected void initDao() {
		// do nothing
	}

	public void save(Advertisement transientInstance) {
		log.debug("saving Advertisement instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Advertisement persistentInstance) {
		log.debug("deleting Advertisement instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Advertisement findById(java.lang.Integer id) {
		log.debug("getting Advertisement instance with id: " + id);
		try {
			Advertisement instance = (Advertisement) getHibernateTemplate()
					.get("com.chinasoft.pojo.Advertisement", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Advertisement instance) {
		log.debug("finding Advertisement instance by example");
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
		log.debug("finding Advertisement instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Advertisement as model where model."
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

	public List findByUType(Object UType) {
		return findByProperty(_UTYPE, UType);
	}

	public List findByAdContent(Object adContent) {
		return findByProperty(AD_CONTENT, adContent);
	}

	public List findByAdCost(Object adCost) {
		return findByProperty(AD_COST, adCost);
	}

	public List findByAdDate(Object adDate) {
		return findByProperty(AD_DATE, adDate);
	}

	public List findAll() {
		log.debug("finding all Advertisement instances");
		try {
			String queryString = "from Advertisement";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Advertisement merge(Advertisement detachedInstance) {
		log.debug("merging Advertisement instance");
		try {
			Advertisement result = (Advertisement) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Advertisement instance) {
		log.debug("attaching dirty Advertisement instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Advertisement instance) {
		log.debug("attaching clean Advertisement instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AdvertisementDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (AdvertisementDAO) ctx.getBean("AdvertisementDAO");
	}
}