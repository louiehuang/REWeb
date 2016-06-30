package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Colletion;

/**
 * A data access object (DAO) providing persistence and search support for
 * Colletion entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.Colletion
 * @author MyEclipse Persistence Tools
 */
public class ColletionDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ColletionDAO.class);
	// property constants
	public static final String _HID = "HId";
	public static final String _CTYPE = "CType";

	protected void initDao() {
		// do nothing
	}

	public void save(Colletion transientInstance) {
		log.debug("saving Colletion instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Colletion persistentInstance) {
		log.debug("deleting Colletion instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Colletion findById(java.lang.Integer id) {
		log.debug("getting Colletion instance with id: " + id);
		try {
			Colletion instance = (Colletion) getHibernateTemplate().get(
					"com.chinasoft.pojo.Colletion", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Colletion instance) {
		log.debug("finding Colletion instance by example");
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
		log.debug("finding Colletion instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Colletion as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByHId(Object HId) {
		return findByProperty(_HID, HId);
	}

	public List findByCType(Object CType) {
		return findByProperty(_CTYPE, CType);
	}

	public List findAll() {
		log.debug("finding all Colletion instances");
		try {
			String queryString = "from Colletion";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Colletion merge(Colletion detachedInstance) {
		log.debug("merging Colletion instance");
		try {
			Colletion result = (Colletion) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Colletion instance) {
		log.debug("attaching dirty Colletion instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Colletion instance) {
		log.debug("attaching clean Colletion instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ColletionDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ColletionDAO) ctx.getBean("ColletionDAO");
	}
}