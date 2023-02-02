package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entitites.User;

public class UserDao {

	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String s = "insert into user(userFName, userLName, userProf, userEmail, userPass, userAdd) values(?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, user.getFname());
			stmt.setString(2, user.getLname());
			stmt.setString(3, user.getProfession());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPass());
			stmt.setString(6, user.getAdd());
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public User loginUser(String email, String pass) {
		User user = null;
		 try {
			String s = "select * from user where userEmail=? and userPass=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, email);
			stmt.setString(2, pass);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				user = new User();
				user.setFname(set.getString("userFName"));
				user.setLname(set.getString("userLName"));
				user.setProfession(set.getString("userProf"));
				user.setEmail(set.getString("userEmail"));
				user.setPass(set.getString("userPass"));
				user.setAdd(set.getString("userAdd"));
				user.setId(set.getInt("iduser"));
				user.setRdate(set.getTimestamp("userReg"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return user;
	}
}
