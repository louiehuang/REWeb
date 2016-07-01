package com.chinasoft.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.HouseType;

/**
 * A data access object (DAO) providing persistence and search support for
 * HouseType entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.HouseType
 * @author MyEclipse Persistence Tools
 */
public class HouseTypeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(HouseTypeDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String REMARK = "remark";

	protected void initDao() {
		// do nothing
	}

	public void save(HouseType transientInstance) {
		log.debug("saving HouseType instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(HouseType persistentInstance) {
		log.debug("deleting HouseType instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HouseType findById(java.lang.Integer id) {
		log.debug("getting HouseType instance with id: " + id);
		try {
			HouseType instance = (HouseType) getHibernateTemplate().get(
					"com.chinasoft.pojo.HouseType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(HouseType instance) {
		log.debug("finding HouseType instance by example");
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
		log.debug("finding HouseType instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from HouseType as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByRemark(Object remark) {
		return findByProperty(REMARK, remark);
	}

	public List findAll() {
		log.debug("finding all HouseType instances");
		try {
			String queryString = "from HouseType";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public HouseType merge(HouseType detachedInstance) {
		log.debug("merging HouseType instance");
		try {
			HouseType result = (HouseType) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(HouseType instance) {
		log.debug("attaching dirty HouseType instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HouseType instance) {
		log.debug("attaching clean HouseType instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static HouseTypeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (HouseTypeDAO) ctx.getBean("HouseTypeDAO");
	}
}