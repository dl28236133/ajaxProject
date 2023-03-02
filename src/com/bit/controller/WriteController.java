package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.NoticeDao;



public class WriteController extends HttpServlet {
	Logger log=Logger.getGlobal();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher("write.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		HttpSession session = req.getSession();
		
		String id = (String) session.getAttribute("id");
		NoticeDao dao=new NoticeDao();
		try {
			dao.pushList(title,id ,content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("notice.do");
	}
}







