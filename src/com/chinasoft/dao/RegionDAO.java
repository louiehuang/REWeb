package com.chinasoft.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Region;

/**
 * A data access object (DAO) providing persistence and search support for
 * Region entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.Region
 * @author MyEclipse Persistence Tools
 */
public class RegionDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(RegionDAO.class);
	// property constants
	public static final String PROVINCE = "province";
	public static final String CITY = "city";
	public static final String COUNTY = "county";

	protected void initDao() {
		// do nothing
	}

	public void save(Region transientInstance) {
		log.debug("saving Region instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Region persistentInstance) {
		log.debug("deleting Region instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Region findById(java.lang.Integer id) {
		log.debug("getting Region instance with id: " + id);
		try {
			Region instance = (Region) getHibernateTemplate().get(
					"com.chinasoft.pojo.Region", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Region instance) {
		log.debug("finding Region instance by example");
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
		log.debug("finding Region instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Region as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProvince(Object province) {
		return findByProperty(PROVINCE, province);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByCounty(Object county) {
		return findByProperty(COUNTY, county);
	}

	public List findAll() {
		log.debug("finding all Region instances");
		try {
			String queryString = "from Region";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Region merge(Region detachedInstance) {
		log.debug("merging Region instance");
		try {
			Region result = (Region) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Region instance) {
		log.debug("attaching dirty Region instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Region instance) {
		log.debug("attaching clean Region instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RegionDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RegionDAO) ctx.getBean("RegionDAO");
	}
}