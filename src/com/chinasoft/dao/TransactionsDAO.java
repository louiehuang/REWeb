package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Transactions;

/**
 * A data access object (DAO) providing persistence and search support for
 * Transactions entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.Transactions
 * @author MyEclipse Persistence Tools
 */
public class TransactionsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TransactionsDAO.class);
	// property constants
	public static final String USELL_ID = "usellId";
	public static final String UBUY_ID = "ubuyId";
	public static final String TRANS_TYPE = "transType";
	public static final String _HID = "HId";
	public static final String TRANS_DATE = "transDate";

	protected void initDao() {
		// do nothing
	}

	public void save(Transactions transientInstance) {
		log.debug("saving Transactions instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Transactions persistentInstance) {
		log.debug("deleting Transactions instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Transactions findById(java.lang.Integer id) {
		log.debug("getting Transactions instance with id: " + id);
		try {
			Transactions instance = (Transactions) getHibernateTemplate().get(
					"com.chinasoft.pojo.Transactions", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Transactions instance) {
		log.debug("finding Transactions instance by example");
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
		log.debug("finding Transactions instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Transactions as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsellId(Object usellId) {
		return findByProperty(USELL_ID, usellId);
	}

	public List findByUbuyId(Object ubuyId) {
		return findByProperty(UBUY_ID, ubuyId);
	}

	public List findByTransType(Object transType) {
		return findByProperty(TRANS_TYPE, transType);
	}

	public List findByHId(Object HId) {
		return findByProperty(_HID, HId);
	}

	public List findByTransDate(Object transDate) {
		return findByProperty(TRANS_DATE, transDate);
	}

	public List findAll() {
		log.debug("finding all Transactions instances");
		try {
			String queryString = "from Transactions";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Transactions merge(Transactions detachedInstance) {
		log.debug("merging Transactions instance");
		try {
			Transactions result = (Transactions) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Transactions instance) {
		log.debug("attaching dirty Transactions instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Transactions instance) {
		log.debug("attaching clean Transactions instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TransactionsDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (TransactionsDAO) ctx.getBean("TransactionsDAO");
	}
}