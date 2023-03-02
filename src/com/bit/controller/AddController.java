package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.MemberDao;

public class AddController extends HttpServlet {
	Logger log=Logger.getGlobal();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
		String name=req.getParameter("name");
		String tel=req.getParameter("phone");
		log.info("id:"+id+",pw="+pw+",name="+name+"tel="+tel);
		MemberDao dao=new MemberDao();
		try {
			dao.pushList(id, pw, name,tel);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("Main.jsp");
	}
}







