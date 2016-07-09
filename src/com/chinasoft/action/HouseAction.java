package com.chinasoft.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.catalina.connector.Request;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.chinasoft.pojo.Comment;
import com.chinasoft.pojo.EnterpriseUsers;
import com.chinasoft.pojo.HouseSellEnterprise;
import com.chinasoft.pojo.HouseSellRent;
import com.chinasoft.pojo.HouseSellSecondhand;
import com.chinasoft.pojo.Users;
import com.chinasoft.service.CollectService;
import com.chinasoft.service.CommentService;
import com.chinasoft.service.EnterpriseUsersService;
import com.chinasoft.service.HouseSellEnterpriseService;
import com.chinasoft.service.HouseSellRentService;
import com.chinasoft.service.HouseSellSecondhandService;
import com.chinasoft.service.UsersService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 
 * @author zhangxin
 *
 */
public class HouseAction {
	private CollectService collectService;
	private CommentService commentService;
	private UsersService usersService;
	private HouseSellSecondhandService houseSellSecondhandService;
	private HouseSellEnterpriseService houseSellEnterpriseService;
	private HouseSellRentService houseSellRentService;
	private EnterpriseUsersService enterpriseUsersService;
	private Comment comment;
	private String msg;
	private int iscolletion;
	private int index;

	public String Info()
	{
		String HId = ServletActionContext.getRequest().getParameter("HId");
		String cTypeString  = ServletActionContext.getRequest().getParameter("CType");
		System.out.println("InfoÖ´ÐÐ...");
		
		if(comment == null)
		{
			System.out.println("commentÎª¿Õ");
			comment = new Comment();
		}
		if(HId != null&& cTypeString!=null)
		{
			comment.setHId(Integer.parseInt(HId));
			comment.setCType(Integer.parseInt(cTypeString));
			index = 0;
		}
		if(comment.getCType().equals(1))
		{
			HouseSellEnterprise houseSellEnterprise = houseSellEnterpriseService.getById(comment.getHId());
			ServletActionContext.getRequest().getSession().setAttribute("house", houseSellEnterprise);
			EnterpriseUsers user = enterpriseUsersService.findById(houseSellEnterprise.getEnterpriseUsers().getUId());
			ServletActionContext.getRequest().getSession().setAttribute("home", user);
		}
		else if(comment.getCType().equals(2))
		{
			HouseSellSecondhand houseSellSecondhand = houseSellSecondhandService.getbyId(comment.getHId());
			ServletActionContext.getRequest().getSession().setAttribute("house", houseSellSecondhand);
			Users user = usersService.getUsers(houseSellSecondhand.getUId());
			ServletActionContext.getRequest().getSession().setAttribute("home", user);
			
			System.out.println(houseSellSecondhand.getDecoration());
		}
		else if(comment.getCType().equals(3))
		{
			HouseSellRent houseSellRent = houseSellRentService.getbyid(comment.getHId());
			ServletActionContext.getRequest().getSession().setAttribute("house", houseSellRent);
			Users user = usersService.getUsers(houseSellRent.getUId());
			ServletActionContext.getRequest().getSession().setAttribute("home", user);
		}
		
		System.out.println(comment.getHId()+"   "+comment.getCType());
		
		List list = commentService.commentList(comment.getHId(),comment.getCType());
		msg = "";
		System.out.println(list.size());
		
		int page = (list.size()+9)/10;
		for(int i=index*10;i<list.size()&&i<(index+1)*10;i++)
		{
			Comment com = (Comment)list.get(i);
			msg += "<tr><td>";
			msg += com.getComment()+"</td><td>";
			msg += com.getCdate()+"</td><td>";
			Users users = usersService.getUsers(com.getUsers().getUId());
			msg += users.getUName() +"</td>";
			msg+="</tr>";
		}
		msg += "<tr><td>";
		msg += "<form action=\"HouseAction!Info\" method=\"post\">";
		
		for(int i=0;i<page;i++)
		{
			if(i!=index)
				msg+="<input type=\"submit\" value=\""+(i+1)+"\" onclick=\"cli("+i+")\" />";
			else{
				//msg+=(i+1); //ÐÞ¸Ä
			}
		}
		
		msg+="<input type=\"hidden\" value=\"0\" id=\"hehe\" name=\"index\"/>  </form>";
		msg+="</td></tr>";
		
		System.out.println(index);
		System.out.println(msg);

		HttpSession session = ServletActionContext.getRequest().getSession();
		comment.setUsers((Users) session.getAttribute("users"));
		iscolletion = 0;
		System.out.println(iscolletion);
		if(collectService.getCollect(comment.getUsers(), comment.getHId(), comment.getCType()) == "true")
		{
			iscolletion = 1;
		}
		else 
			iscolletion = 2;
		
		System.out.println(iscolletion);
		
		if(comment.getCType().equals(1))
		{
			return "new";
		}
		else if(comment.getCType().equals(2))
		{
			return "Secondhand";
		}
		else if(comment.getCType().equals(3))
		{
			return "SellRent";
		}
		return "error";
	}
	
	
	public String addcomment()
	{
		if(comment.getComment()=="")
		{
			return Info();
		}
		//System.out.println(HId+" "+CType+" "+commentString+" "+CDate);
		//users = new Users("admin","123","»ÆÁõØ·",1);
		//users.setUId(1);
		//Comment comment = new Comment(users,HId,CType,commentString,CDate);
		
		System.out.println(comment.getHId()+"~~!!!~!~!~"+comment.getUsers().getUId());
		
		commentService.addcomment(comment);
		comment.setComment("");
		return Info();
	}
	public String addColletion()
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		comment.setUsers((Users)session.getAttribute("users"));
		System.out.println(comment.getUsers().getUId()+"hehe");
		System.out.println("haha");
		collectService.clickCollect(comment.getUsers(),comment.getHId(), comment.getCType());
		return Info();
	}
	public String fanye()
	{
		return Info();
	}
	
	
	public EnterpriseUsersService getEnterpriseUsersService() {
		return enterpriseUsersService;
	}
	public void setEnterpriseUsersService(
			EnterpriseUsersService enterpriseUsersService) {
		this.enterpriseUsersService = enterpriseUsersService;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public HouseSellSecondhandService getHouseSellSecondhandService() {
		return houseSellSecondhandService;
	}
	public void setHouseSellSecondhandService(
			HouseSellSecondhandService houseSellSecondhandService) {
		this.houseSellSecondhandService = houseSellSecondhandService;
	}
	public HouseSellEnterpriseService getHouseSellEnterpriseService() {
		return houseSellEnterpriseService;
	}
	public void setHouseSellEnterpriseService(
			HouseSellEnterpriseService houseSellEnterpriseService) {
		this.houseSellEnterpriseService = houseSellEnterpriseService;
	}
	public HouseSellRentService getHouseSellRentService() {
		return houseSellRentService;
	}
	public void setHouseSellRentService(HouseSellRentService houseSellRentService) {
		this.houseSellRentService = houseSellRentService;
	}
	public UsersService getUsersService() {
		return usersService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	public int getIscolletion() {
		return iscolletion;
	}
	public void setIscolletion(int iscolletion) {
		this.iscolletion = iscolletion;
	}
	
	public CollectService getCollectService() {
		return collectService;
	}
	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
}
