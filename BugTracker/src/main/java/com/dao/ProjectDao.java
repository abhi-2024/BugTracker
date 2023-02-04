package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entitites.Project;

public class ProjectDao {
	Connection con;

	public ProjectDao(Connection con) {
		this.con = con;
		// TODO Auto-generated constructor stub
	}
	
	public boolean saveProject(Project proj) {
		boolean f = false;
		 try {
			String s = "insert into project(projectName, projectDesc, projectState, projectType, projectDate, user) values(?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, proj.getPname());
			stmt.setString(2, proj.getPdesc());
			stmt.setString(3, proj.getPstate());
			stmt.setString(4, proj.getPtype());
			stmt.setString(5, proj.getPdate());
			stmt.setString(6, proj.getPuser());
			stmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public ArrayList<Project> fetchAllProject(String user){
		ArrayList<Project> list = new ArrayList<Project>();
		 try {
			String s = "select * from project where user=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setString(1, user);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				int id = set.getInt("idproject");
				String pt = set.getString("projectName");
				String pd = set.getString("projectDesc");
				String ps = set.getString("projectState");
				String pty = set.getString("projectType");
				String pda = set.getString("projectDate");
				String us = set.getString("user");
				Project proj = new Project( id, pt, pd, ps, pty, pda, us);
				list.add(proj);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
	
	public Project singleProject(int id) {
		Project proj = null;
		 try {
			String s = "select * from project where idproject=?";
			PreparedStatement stmt = con.prepareStatement(s);
			stmt.setInt(1, id);
			ResultSet set = stmt.executeQuery();
			while(set.next()) {
				proj=new Project();
				proj.setId(set.getInt("idproject"));
				proj.setPname(set.getString("projectName"));
				proj.setPdesc(set.getString("projectDesc"));
				proj.setPstate(set.getString("projectState"));
				proj.setPtype(set.getString("projectType"));
				proj.setPdate(set.getString("projectDate"));
				proj.setPuser(set.getString("user"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return proj;
	}
	
	public boolean updateProject(Project proj) {
		boolean f = false;
		 try {
			String s = "update project set projectName=?, projectDesc=?, projectState=?, projectType=?, projectDate=? where idproject=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setString(1, proj.getPname());
			st.setString(2, proj.getPdesc());
			st.setString(3, proj.getPstate());
			st.setString(4, proj.getPtype());
			st.setString(5, proj.getPdate());
			st.setInt(6, proj.getId());
			st.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}
	
	public boolean deleteProject(int id) {
		boolean f = false;
		try {
			String s = "delete from project where idproject=?";
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
}
