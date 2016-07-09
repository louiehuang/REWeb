package com.chinasoft.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinasoft.pojo.Complain;

/**
 	* A data access object (DAO) providing persistence and search support for Complain entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.chinasoft.pojo.Complain
  * @author MyEclipse Persistence Tools 
 */
public class ComplainDAO extends HibernateDaoSupport  {
		 private static final Log log = LogFactory.getLog(ComplainDAO.class);
		//property constants
	public static final String _HID = "HId";
	public static final String HTYPE = "htype";
	public static final String CONTENT = "content";
	public static final String CDATE = "cdate";
	public static final String PDATE = "pdate";
	public static final String CSTATUS = "cstatus";
	public static final String CRES = "cres";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Complain transientInstance) {
        log.debug("saving Complain instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Complain persistentInstance) {
        log.debug("deleting Complain instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Complain findById( java.lang.Integer id) {
        log.debug("getting Complain instance with id: " + id);
        try {
            Complain instance = (Complain) getHibernateTemplate()
                    .get("com.chinasoft.pojo.Complain", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Complain instance) {
        log.debug("finding Complain instance by example");
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
      log.debug("finding Complain instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Complain as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByHId(Object HId
	) {
		return findByProperty(_HID, HId
		);
	}
	
	public List findByHtype(Object htype
	) {
		return findByProperty(HTYPE, htype
		);
	}
	
	public List findByContent(Object content
	) {
		return findByProperty(CONTENT, content
		);
	}
	
	public List findByCdate(Object cdate
	) {
		return findByProperty(CDATE, cdate
		);
	}
	
	public List findByPdate(Object pdate
	) {
		return findByProperty(PDATE, pdate
		);
	}
	
	public List findByCstatus(Object cstatus
	) {
		return findByProperty(CSTATUS, cstatus
		);
	}
	
	public List findByCres(Object cres
	) {
		return findByProperty(CRES, cres
		);
	}
	

	public List findAll() {
		log.debug("finding all Complain instances");
		try {
			String queryString = "from Complain";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Complain merge(Complain detachedInstance) {
        log.debug("merging Complain instance");
        try {
            Complain result = (Complain) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Complain instance) {
        log.debug("attaching dirty Complain instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Complain instance) {
        log.debug("attaching clean Complain instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ComplainDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ComplainDAO) ctx.getBean("ComplainDAO");
	}
}