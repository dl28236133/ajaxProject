package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NoticeDao {
	
	java.util.logging.Logger log=Logger.getGlobal();
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getConnection() {
		String url="jdbc:mysql://localhost:3306/lecture";
		String user=System.getenv("MYSQL_USER");
		String password=System.getenv("MYSQL_PW");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(conn==null || conn.isClosed())
			conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int deleteOne(int num) throws SQLException {
		String sql="delete from notice where num=?";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result=pstmt.executeUpdate();
			return result;
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public int editOne(String sub,int num,String id,int cnt,String content) throws SQLException {
		String sql="update notice set sub=?,id=?,cnt=?,content=?,hiredate=now() where num=?";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sub);
			pstmt.setString(2, id);
			pstmt.setInt(3, cnt);
			pstmt.setString(4, content);
			pstmt.setInt(5,num);
			int result=pstmt.executeUpdate();
			return result;
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public NoticeDto getOne(int num) throws SQLException {
		
		String sql="select * from notice where num=?";
		NoticeDto bean=new NoticeDto();
		try {
			getConnection();
			String sql1="update notice SET cnt = cnt+1 where num=?";
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setId(rs.getString("id"));
				bean.setHiredate(rs.getDate("hiredate"));
				bean.setCnt(rs.getInt("cnt"));
				bean.setContent(rs.getString("content"));
			
			}
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	public int pushList(String title,String id, String content) 
									throws SQLException {
		String sql="insert into Notice (num,id,sub,content,cnt)";
		sql+=" values (0,?,?,?,0)";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			return pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

	public int Login(String id, String pw) throws SQLException {
		if( id == "" || id == null)return 0;
		String sql="select pw from member where id = ?";
		List<NoticeDto> list=null;
		list=new ArrayList<NoticeDto>();
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
					
				}
				else
					return 0; // 비밀번호 불일치 
			}
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
			}
		}
		return 0;
		
	}
	
	
	public List<NoticeDto> getList() throws SQLException{
		String sql="select * from notice order by num desc";
		List<NoticeDto> list=null;
		list=new ArrayList<NoticeDto>();
		try {
			getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				NoticeDto bean=new NoticeDto();
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setId(rs.getString("id"));
				bean.setHiredate(rs.getDate("hiredate"));
				bean.setContent(rs.getString("content"));
				bean.setCnt(rs.getInt("cnt"));
				
				list.add(bean);
			}
		} finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}
}
