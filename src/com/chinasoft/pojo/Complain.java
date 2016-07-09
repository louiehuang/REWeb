package com.chinasoft.pojo;



/**
 * Complain entity. @author MyEclipse Persistence Tools
 */

public class Complain  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Users users;
     private Integer HId;
     private Integer htype;
     private String content;
     private String cdate;
     private String pdate;
     private Integer cstatus;
     private Integer cres;


    // Constructors

    /** default constructor */
    public Complain() {
    }

    
    /** full constructor */
    public Complain(Users users, Integer HId, Integer htype, String content, String cdate, String pdate, Integer cstatus, Integer cres) {
        this.users = users;
        this.HId = HId;
        this.htype = htype;
        this.content = content;
        this.cdate = cdate;
        this.pdate = pdate;
        this.cstatus = cstatus;
        this.cres = cres;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }

    public Integer getHId() {
        return this.HId;
    }
    
    public void setHId(Integer HId) {
        this.HId = HId;
    }

    public Integer getHtype() {
        return this.htype;
    }
    
    public void setHtype(Integer htype) {
        this.htype = htype;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public String getCdate() {
        return this.cdate;
    }
    
    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    public String getPdate() {
        return this.pdate;
    }
    
    public void setPdate(String pdate) {
        this.pdate = pdate;
    }

    public Integer getCstatus() {
        return this.cstatus;
    }
    
    public void setCstatus(Integer cstatus) {
        this.cstatus = cstatus;
    }

    public Integer getCres() {
        return this.cres;
    }
    
    public void setCres(Integer cres) {
        this.cres = cres;
    }
   








}