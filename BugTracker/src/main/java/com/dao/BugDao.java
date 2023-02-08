package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entitites.Bug;

public class BugDao {
	Connection con;

	public BugDao(Connection con) {
		this.con = con;
		// TODO Auto-generated constructor stub
	}

	public boolean saveBug(Bug bug) {
		boolean f = false;
		 try {
			String s = "insert into bug(bugName, bugDes, bugProj, bugState, bugDate, bugImg, bugUser) values(?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, bug.getName());
			st.setString(2, bug.getDes());
			st.setString(3, bug.getProj());
			st.setInt(4, bug.getStatus());
			st.setString(5, bug.getDate());
			st.setString(6, bug.getMedia());
			st.setString(7, bug.getUser());
			st.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Bug> fetchAllBugs(String user){
		ArrayList<Bug> list = new ArrayList<Bug>();
		 try {
			String s = "select * from bug where bugUser=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, user);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				Bug bug = new Bug();
				bug.setId(set.getInt(1));
				bug.setName(set.getString(2));
				bug.setDes(set.getString(3));
				bug.setProj(set.getString(4));
				bug.setStatus(set.getInt(5));
				bug.setDate(set.getString(6));
				bug.setMedia(set.getString(7));
				bug.setUser(set.getString(8));
				list.add(bug);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public boolean deleteBug(int id) {
		boolean f = false;
		try {
			String s = "delete from bug where idbug=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setInt(1, id);
			st.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Bug> fetchUserProjBug(String user, String proj){
		ArrayList<Bug> list = new ArrayList<Bug>();
		 try {
			String s = "select * from bug where bugUser=? and bugProj=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, user);
			st.setString(2, proj);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				Bug bug = new Bug();
				bug.setId(set.getInt(1));
				bug.setName(set.getString(2));
				bug.setDes(set.getString(3));
				bug.setProj(set.getString(4));
				bug.setStatus(set.getInt(5));
				bug.setDate(set.getString(6));
				bug.setMedia(set.getString(7));
				bug.setUser(set.getString(8));
				list.add(bug);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public Bug fetchSingleBug(int id) {
		Bug bug = null;
		try {
			String s = "select * from bug where idbug=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setInt(1, id);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				bug = new Bug();
				bug.setId(set.getInt(1));
				bug.setName(set.getString(2));
				bug.setDes(set.getString(3));
				bug.setProj(set.getString(4));
				bug.setStatus(set.getInt(5));
				bug.setDate(set.getString(6));
				bug.setMedia(set.getString(7));
				bug.setUser(set.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return bug;
	}
	
	public boolean updateBug(Bug bug) {
		boolean f = false;
		  try {
			String s = "update bug set bugName=?, bugDes=?, bugProj=?, bugState=?, bugDate=? where idbug=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, bug.getName());
			st.setString(2, bug.getDes());
			st.setString(3, bug.getProj());
			st.setInt(4, bug.getStatus());
			st.setString(5, bug.getDate());
			st.setInt(6, bug.getId());
			st.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
}
