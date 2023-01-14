package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.entities.bugs;

public class bugDao {
 Connection con;
 
 public bugDao(Connection con) {
	 this.con = con;
 }
 
 public boolean saveBug(bugs b) {
	 boolean f = false;
	 
	 try {
		 
		 String s = "insert into bugs(bug_name,proj_name,bug_date,bug_desc,user_email) values(?, ?, ?, ?, ?)";
		 PreparedStatement pstmt = con.prepareStatement(s);
		 pstmt.setString(1, b.getbTitle());
		 pstmt.setString(2, b.getpTitle());
		 pstmt.setString(3, b.getbDate());
		 pstmt.setString(4, b.getbDesc());
		 pstmt.setString(5, b.getuEmail());
		 pstmt.executeUpdate();
		 f=true;
	 }
	 catch (Exception e) {
		// TODO: handle exception
		 e.printStackTrace();
	}
	 
	 return f;
 }
 
 public ArrayList<bugs> getAllBugDetails(String ma){
	 ArrayList<bugs> list = new ArrayList<bugs>();
	 try {
		 String s = "select * from bugs where user_email = ? ";
		 PreparedStatement stmt = con.prepareStatement(s);
		 stmt.setString(1, ma);
		 
	     ResultSet set = stmt.executeQuery();
	     
	     while(set.next()) {
	    	 String bugName = set.getString("bug_name");
	    	 String projName = set.getString("proj_name");
	    	 String bugDate = set.getString("bug_date");
	    	 String bugDesc = set.getString("bug_desc");
	    	 String bugSoln = set.getString("bug_soln");
	    	 int bID = set.getInt("bug_id");
	    	 bugs b = new bugs(bID, bugName, projName, bugDate, bugDesc, bugSoln);
	    	 list.add(b);
	     }
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	return list;
	 
 }
 
 public boolean deleteBugs(String ID) {
	 boolean f = false;
	 
	 try {
		String s = "delete from bugs where bug_id=?";
		PreparedStatement pstmt = con.prepareStatement(s);
		pstmt.setString(1, ID);
		pstmt.executeUpdate();
		f = true;
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	 
	 return f;
 }
}
