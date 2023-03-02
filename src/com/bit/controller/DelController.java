package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.NoticeDao;

public class DelController extends HttpServlet {
	Logger log=Logger.getLogger("com.bit.controller.DelController");

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(req.getParameter("idx"));
		int num=Integer.parseInt(req.getParameter("idx"));
		NoticeDao dao=new NoticeDao();
		try {
			dao.deleteOne(num);
			resp.sendRedirect("notice.do");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}catch(java.lang.NullPointerException e) {
			e.printStackTrace();
		}
		
		
	}
}








