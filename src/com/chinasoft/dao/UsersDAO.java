package com.chinasoft.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Users;

/**
 	* A data access object (DAO) providing persistence and search support for Users entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.chinasoft.pojo.Users
  * @author MyEclipse Persistence Tools 
 */
public class UsersDAO extends HibernateDaoSupport  {
		 private static final Log log = LogFactory.getLog(UsersDAO.class);
		//property constants
	public static final String _UACCOUNT = "UAccount";
	public static final String _UPWD = "UPwd";
	public static final String _UNAME = "UName";
	public static final String _UGENDER = "UGender";
	public static final String _UHEADER = "UHeader";
	public static final String _UCREDIT = "UCredit";
	public static final String _UTELE = "UTele";
	public static final String _UEMAIL = "UEmail";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Users transientInstance) {
        log.debug("saving Users instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	
	public void update(Users transientInstance) {
		log.debug("updating Users instance");
		try {
			getHibernateTemplate().update(transientInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
    
	public void delete(Users persistentInstance) {
        log.debug("deleting Users instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Users findById( java.lang.Integer id) {
        log.debug("getting Users instance with id: " + id);
        try {
            Users instance = (Users) getHibernateTemplate()
                    .get("com.chinasoft.pojo.Users", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Users instance) {
        log.debug("finding Users instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Users instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Users as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUAccount(Object UAccount
	) {
		return findByProperty(_UACCOUNT, UAccount
		);
	}
	
	public List findByUPwd(Object UPwd
	) {
		return findByProperty(_UPWD, UPwd
		);
	}
	
	public List findByUName(Object UName
	) {
		return findByProperty(_UNAME, UName
		);
	}
	
	public List findByUGender(Object UGender
	) {
		return findByProperty(_UGENDER, UGender
		);
	}
	
	public List findByUHeader(Object UHeader
	) {
		return findByProperty(_UHEADER, UHeader
		);
	}
	
	public List findByUCredit(Object UCredit
	) {
		return findByProperty(_UCREDIT, UCredit
		);
	}
	
	public List findByUTele(Object UTele
	) {
		return findByProperty(_UTELE, UTele
		);
	}
	
	public List findByUEmail(Object UEmail
	) {
		return findByProperty(_UEMAIL, UEmail
		);
	}
	

	public List findAll() {
		log.debug("finding all Users instances");
		try {
			String queryString = "from Users";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Users merge(Users detachedInstance) {
        log.debug("merging Users instance");
        try {
            Users result = (Users) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Users instance) {
        log.debug("attaching dirty Users instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Users instance) {
        log.debug("attaching clean Users instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UsersDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UsersDAO) ctx.getBean("UsersDAO");
	}
}