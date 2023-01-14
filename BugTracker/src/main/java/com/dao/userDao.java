package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.entities.User;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

public class userDao {
    
	private Connection con;
	
	public userDao(Connection con) {
		this.con = con;
	}
	
	//save user
  
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String s = "insert into user(name,email,password)  values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(s);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			
			pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User getUserDetails(String email, String password) {
		User user = null;
		
		try {
			String s = "select * from user where email=? and password=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			stmt.setString(2, password);
			
			ResultSet set = stmt.executeQuery();
			
			if(set.next()) {
				user = new User();
				
				user.setName(set.getString("name"));
				user.setPassword(set.getString("password"));
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setrDate(set.getString("rDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

 
    public  boolean updateUser(User use) {
    	boolean f = false;
    	 try {
			String s = "update user set name=?, email=?, password=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(s);
			pstmt.setString(1, use.getName());
			pstmt.setString(2, use.getEmail());
			pstmt.setString(3, use.getPassword());
			pstmt.setInt(4, use.getId());
			
			pstmt.executeUpdate();
			
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return f;
     }
    }