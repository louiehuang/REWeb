package com.chinasoft.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.EnterpriseUsers;

/**
 * A data access object (DAO) providing persistence and search support for
 * EnterpriseUsers entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.chinasoft.pojo.EnterpriseUsers
 * @author MyEclipse Persistence Tools
 */
public class EnterpriseUsersDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(EnterpriseUsersDAO.class);
	// property constants
	public static final String _UACCOUNT = "UAccount";
	public static final String _UPWD = "UPwd";
	public static final String _UNAME = "UName";
	public static final String _UINFO = "UInfo";
	public static final String _UHEADER = "UHeader";
	public static final String _UADDR = "UAddr";
	public static final String _UVALIDATION = "UValidation";
	public static final String _UTELE = "UTele";
	public static final String _UEMAIL = "UEmail";

	protected void initDao() {
		// do nothing
	}

	public void save(EnterpriseUsers transientInstance) {
		log.debug("saving EnterpriseUsers instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(EnterpriseUsers persistentInstance) {
		log.debug("deleting EnterpriseUsers instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EnterpriseUsers findById(java.lang.Integer id) {
		log.debug("getting EnterpriseUsers instance with id: " + id);
		try {
			EnterpriseUsers instance = (EnterpriseUsers) getHibernateTemplate()
					.get("com.chinasoft.pojo.EnterpriseUsers", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(EnterpriseUsers instance) {
		log.debug("finding EnterpriseUsers instance by example");
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
		log.debug("finding EnterpriseUsers instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from EnterpriseUsers as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUAccount(Object UAccount) {
		return findByProperty(_UACCOUNT, UAccount);
	}

	public List findByUPwd(Object UPwd) {
		return findByProperty(_UPWD, UPwd);
	}

	public List findByUName(Object UName) {
		return findByProperty(_UNAME, UName);
	}

	public List findByUInfo(Object UInfo) {
		return findByProperty(_UINFO, UInfo);
	}

	public List findByUHeader(Object UHeader) {
		return findByProperty(_UHEADER, UHeader);
	}

	public List findByUAddr(Object UAddr) {
		return findByProperty(_UADDR, UAddr);
	}

	public List findByUValidation(Object UValidation) {
		return findByProperty(_UVALIDATION, UValidation);
	}

	public List findByUTele(Object UTele) {
		return findByProperty(_UTELE, UTele);
	}

	public List findByUEmail(Object UEmail) {
		return findByProperty(_UEMAIL, UEmail);
	}

	public List findAll() {
		log.debug("finding all EnterpriseUsers instances");
		try {
			String queryString = "from EnterpriseUsers";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public EnterpriseUsers merge(EnterpriseUsers detachedInstance) {
		log.debug("merging EnterpriseUsers instance");
		try {
			EnterpriseUsers result = (EnterpriseUsers) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(EnterpriseUsers instance) {
		log.debug("attaching dirty EnterpriseUsers instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(EnterpriseUsers instance) {
		log.debug("attaching clean EnterpriseUsers instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static EnterpriseUsersDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (EnterpriseUsersDAO) ctx.getBean("EnterpriseUsersDAO");
	}
}