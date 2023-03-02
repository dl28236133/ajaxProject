package com.bit.Json;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.NoticeDao;
import com.bit.model.NoticeDto;

public class JsonController  extends HttpServlet{

      @Override
      protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         NoticeDao dao = new NoticeDao();
         resp.setContentType("application/json");
         resp.setCharacterEncoding("utf-8");
         PrintWriter out = resp.getWriter();
         try {
            out.println("{\"notice\":[");
            List<NoticeDto> list = dao.getList();
            for(int i =0 ; i<list.size();i++) {
            	NoticeDto bean = list.get(i);
            	
               if(i!=0)out.print(",");
               out.println
               ("{\"num\":"+bean.getNum()
               +",\"id\":\""+bean.getId()
               +"\",\"sub\":\""+bean.getSub()
               +"\",\"hiredate\":\""+bean.getHiredate()
               +"\",\"content\":\""+bean.getContent()
               +"\",\"cnt\":"+bean.getCnt()+"}");               
            }
            out.println("]}");
            
         } catch (SQLException e) {
			e.printStackTrace();
		}
         finally {
            if(out!=null)out.close();
         }
      
      }
}