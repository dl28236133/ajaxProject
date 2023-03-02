package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.NoticeDao;
import com.bit.model.NoticeDto;

public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// model
		NoticeDao dao=new NoticeDao();
		try {
			List<NoticeDto> list = dao.getList();
			req.setAttribute("NoticeList", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// view resolver
		RequestDispatcher rd;
		rd=req.getRequestDispatcher("notice.jsp");
		rd.forward(req, resp);
	}
}










