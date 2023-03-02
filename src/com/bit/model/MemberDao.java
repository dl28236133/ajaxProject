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

public class MemberDao {
	
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
	
	public int pushList(String id,String pw, String name, String tel) 
									throws SQLException {
		String sql="insert into member (id,pw,name,tel)";
		sql+=" values (?,?,?,?)";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			System.out.println(id+" "+pw);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			return pstmt.executeUpdate();
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}

}
