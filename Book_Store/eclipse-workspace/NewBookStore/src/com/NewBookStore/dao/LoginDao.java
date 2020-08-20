package com.NewBookStore.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class LoginDao {
	
	String sql = "select * from Users where email_id=? and password=?";
	String url = "jdbc:mysql://localhost:3306/Bookstore";
	String userId = "root";
	String pass = "adkh777*";
	
	public boolean check(String email_id,String password)
	{	
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection(url,userId,pass);
		PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
		st.setString(1, email_id);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		if(rs.next())
		{
			return true;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
