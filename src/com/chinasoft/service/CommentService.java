package com.chinasoft.service;

import java.util.ArrayList;
import java.util.List;

import com.chinasoft.dao.CommentDAO;
import com.chinasoft.pojo.Comment;

/**
 * 
 * @author öÎÉñ
 *
 */
public class CommentService {
	private CommentDAO commentDAO;

	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	public List commentList(int HId,int CType)
	{
		//System.out.println("hehe");
		//commentDAO = new CommentDAO();
		List list = this.commentDAO.findByHId(HId);
		//System.out.println("haha");
		List newList = new ArrayList();
		//newList.clear();
		//System.out.println(list.size());
		for(int i=0;i<list.size();i++)
		{
			Comment comment = (Comment) list.get(i);
			//System.out.println(comment.getCType()+"  "+CType);
			if(comment.getCType() == CType)
			{
				newList.add(comment);
			}
		}
		return newList;
	}
	public void addcomment(Comment comment)
	{
		System.out.println("hehe");
		commentDAO.save(comment);
		System.out.println("hehe");
	}
	public void delectcomment(Comment comment)
	{
		commentDAO.delete(comment);
	}
}
