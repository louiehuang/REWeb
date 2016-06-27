package com.hlyin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hlyin.model.Users;
import com.hlyin.service.UsersService;

/**
 * Servlet implementation class UsersAction
 */
@WebServlet("/UsersAction")
public class UsersAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsersAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");

		// 获取隐藏域的值，判断处理类型
		String requestType = request.getParameter("request_type");
		System.out.println(requestType);
		
		if (requestType.equals("Login_Request")) {
			System.out.println("处理登陆");
			handleLoginRequest(request, response);
		} else if (requestType.equals("Register_Request")) {
			System.out.println("处理注册");
			handleRegisterRequest(request, response);
		}

	}

	protected void handleRegisterRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

	}

	protected void handleLoginRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String pwd = request.getParameter("pwd");

		UsersService us = new UsersService();
		Users user = us.isLogin(username, pwd);

		if (user != null) {
			// out.print("<script>alert('登陆成功')</script>");
			// response.sendRedirect("../index.jsp");
			request.getSession().setAttribute("user", user);
			out.print("<script language='JavaScript'>alert('登陆成功');" + "location.href='index.jsp';</script>");
		} else {
			out.print("<script language='JavaScript'>alert('登陆失败');" + "location.href='register.jsp';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
