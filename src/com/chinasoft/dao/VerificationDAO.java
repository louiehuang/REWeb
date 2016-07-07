package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Verification;

/**
 * A data access object (DAO) providing persistence and search support for
 * Verification entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.Verification
 * @author MyEclipse Persistence Tools
 */
public class VerificationDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(VerificationDAO.class);
	// property constants
	public static final String _HID = "HId";
	public static final String HTYPE = "htype";
	public static final String CONTENT = "content";
	public static final String VDATE = "vdate";
	public static final String PDATE = "pdate";
	public static final String VSTATUS = "vstatus";
	public static final String VRES = "vres";

	protected void initDao() {
		// do nothing
	}

	public void save(Verification transientInstance) {
		log.debug("saving Verification instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void update(Verification transientInstance) {
		log.debug("updating Verification instance");
		try {
			getHibernateTemplate().update(transientInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	
	public void delete(Verification persistentInstance) {
		log.debug("deleting Verification instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Verification findById(java.lang.Integer id) {
		log.debug("getting Verification instance with id: " + id);
		try {
			Verification instance = (Verification) getHibernateTemplate().get(
					"com.chinasoft.pojo.Verification", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Verification instance) {
		log.debug("finding Verification instance by example");
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
		log.debug("finding Verification instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Verification as model where model."
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

	public List findByHtype(Object htype) {
		return findByProperty(HTYPE, htype);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByVdate(Object vdate) {
		return findByProperty(VDATE, vdate);
	}

	public List findByPdate(Object pdate) {
		return findByProperty(PDATE, pdate);
	}

	public List findByVstatus(Object vstatus) {
		return findByProperty(VSTATUS, vstatus);
	}

	public List findByVres(Object vres) {
		return findByProperty(VRES, vres);
	}

	public List findAll() {
		log.debug("finding all Verification instances");
		try {
			String queryString = "from Verification";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Verification merge(Verification detachedInstance) {
		log.debug("merging Verification instance");
		try {
			Verification result = (Verification) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Verification instance) {
		log.debug("attaching dirty Verification instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Verification instance) {
		log.debug("attaching clean Verification instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static VerificationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (VerificationDAO) ctx.getBean("VerificationDAO");
	}
}