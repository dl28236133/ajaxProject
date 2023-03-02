package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.NoticeDao;

public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String password = req.getParameter("pw");
		
		NoticeDao dao=new NoticeDao();
		try {
			if( dao.Login(id, password)== 1) {
				HttpSession session = req.getSession();
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				session.setAttribute("login", 1);
				
				resp.sendRedirect("Main.jsp");
			}
			else {
				resp.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
